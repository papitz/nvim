-- count the depth of a path
local function countSlashes(str)
	local _, count = string.gsub(str, '/', '')
	return count
end

local dartTestPath = function(path)
	local testPath = string.gsub(path, '/lib/', '/test/')
	testPath = string.gsub(testPath, '.dart', '_test.dart')
	local libSubPath = path:match('(lib/.+/[^/]+)')
	local depth = countSlashes(libSubPath)
	local relativeOriginPath = string.rep('../', depth) .. libSubPath
	return testPath, relativeOriginPath
end

local function writeToTestFile(finalTestPath, relativeOriginPath, content)
  content = content or ('void main() {\n\n}')
  local dirPath = string.match(finalTestPath, '(.*/)')
  print(dirPath)
  os.execute('mkdir -p ' .. dirPath)
  local file = io.open(finalTestPath, 'w')
  if file then
    file:write('// Test for ' .. relativeOriginPath .. '\n' .. content)
    file:close()
    vim.api.nvim_command('edit ' .. finalTestPath)
  else
    print('Failed to create test file: ' .. finalTestPath)
  end
end

local generateTestWithcopilot = function(filePath, relativeOriginPath)
	local copilot = require('CopilotChat')
	local select = require('CopilotChat.select')
  local delim = "```"
  local start_delim = delim .. ".-\n"
  local pattern = start_delim .. "(.-)" .. delim
	copilot.config.callback = function(response)
    local code_in_response = string.match(response, pattern)
    writeToTestFile(filePath, relativeOriginPath, code_in_response)
    copilot.config.callback = nil
	end
	copilot.ask(
		'Generate tests for this code. Try to test every part of the code. Make a complete test suite and not a simplified version of it. Fill out every test you write rather than just giving me templates I have to fill out. If possible do the tests without Mockito. If it is needed, explicetly write the code to Mock the classes as well.',
		{ selection = select.buffer }
	)
end


-- Create test file and open as new buffer
local function makeTestFile(useCopilot)
	useCopilot = useCopilot or false
	local filetype = vim.bo.filetype
	local filePath = vim.fn.expand('%:p')
	local fileTypeHandlers = {
		['dart'] = dartTestPath,
		-- Add more file types as needed
	}
	local handler = fileTypeHandlers[filetype]

	if handler then
		local finalTestPath, relativeOriginPath = handler(filePath)
		local file = io.open(finalTestPath, 'r')
		if file then
			print('Test file already exists: ' .. finalTestPath)
			file:close()
			vim.api.nvim_command('edit ' .. finalTestPath)
			return
		else
			if useCopilot then
				generateTestWithcopilot(finalTestPath, relativeOriginPath)
				return
      else
        writeToTestFile(finalTestPath, relativeOriginPath)
			end
		end
	else
		print('No handler for filetype: ' .. filetype)
	end
end

local function makeTestFileWithCopilot()
	makeTestFile(true)
end


return {
	'nvim-neotest/neotest',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'nvim-neotest/neotest-plenary',
		'sidlatau/neotest-dart',
		'antoinemadec/FixCursorHold.nvim',
		'nvim-neotest/nvim-nio',
	},
	event = 'VeryLazy',
	keys = {
		{
			'<leader>tt',
			function()
				require('neotest').run.run()
			end,
			desc = 'Run nearest test',
		},
		{
			'<leader>tf',
			function()
				require('neotest').run.run(vim.fn.expand('%'))
			end,
			desc = 'Run current file',
		},
		{ '<leader>tm', makeTestFile, desc = 'Create Test file' },
    { '<leader>tM', makeTestFileWithCopilot, desc = 'Create Test file and Test with CopilotChat' },
		{
			'<leader>td',
			function()
				require('neotest').run.run({ strategy = 'dap' })
			end,
			desc = 'Run tests with dap strategy',
		},
		{
			'<leader>ts',
			function()
				require('neotest').run.stop()
			end,
			desc = 'Stop nearest test',
		},
		{
			'<leader>ta',
			function()
				require('neotest').run.attach()
			end,
			desc = 'Attach to nearest test',
		},
		{
			'<leader>tu',
			function()
				require('neotest').summary.toggle()
			end,
			desc = 'Open Test summary',
		},
		{
			'<leader>tw',
			function()
				require('neotest').watch.toggle(vim.fn.expand('%'))
			end,
			desc = 'Toggle watching current file',
		},
		{
			'<leader>to',
			function()
				require('neotest').output.open()
			end,
			desc = 'Open output window for nearest test',
		},
		{
			'<leader>tO',
			function()
				require('neotest').output_panel.toggle()
			end,
			desc = 'Toggle output panel',
		},
		{
			'<leader>tc',
			function()
				require('neotest').output_panel.clear()
			end,
			desc = 'Clear output panel',
		},
		{
			'[n',
			function()
				require('neotest').jump.prev({ status = 'failed' })
			end,
			desc = 'Go to prev failed test',
		},
		{
			']n',
			function()
				require('neotest').jump.prev({ status = 'failed' })
			end,
			desc = 'Go to next failed test',
		},
	},
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-dart')({ command = 'flutter' }),
				require('neotest-plenary'),
			},
			output = { open_on_run = false },
			discovery = { enabled = false },
			diagnostic = { enabled = true },
			floating = {
				border = 'rounded',
				max_height = 0.8,
				max_width = 0.8,
				options = {},
			},
			quickfix = { enabled = false },
			state = { enabled = true },
		})
	end,
}
