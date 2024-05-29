-- count the depth of a path
local function countSlashes(str)
	local _, count = string.gsub(str, '/', '')
	return count
end

local dartTestPath = function(path)
	local testPath = string.gsub(path, 'lib/', 'test/')
	testPath = string.gsub(testPath, '.dart', '_test.dart')
	local libSubPath = path:match('(lib/.+/[^/]+)')
	local depth = countSlashes(libSubPath)
	local relativeOriginPath = string.rep('../', depth) .. libSubPath
	return testPath, relativeOriginPath
end

-- Create test file and open as new buffer
local function makeTestFile()
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
			local dirPath = string.match(finalTestPath, '(.*/)')
			print(dirPath)
			os.execute('mkdir -p ' .. dirPath)
			file = io.open(finalTestPath, 'w')
			if file then
				file:write('// Test for ' .. relativeOriginPath .. '\nvoid main() {\n\n}')
				file:close()
				vim.api.nvim_command('edit ' .. finalTestPath)
			else
				print('Failed to create test file: ' .. finalTestPath)
			end
		end
	else
		print('No handler for filetype: ' .. filetype)
	end
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
			'<leader>Tt',
			function()
				require('neotest').run.run()
			end,
			desc = 'Run nearest test',
		},
		{
			'<leader>Tf',
			function()
				require('neotest').run.run(vim.fn.expand('%'))
			end,
			desc = 'Run current file',
		},
		{ '<leader>Tm', makeTestFile, desc = 'Create Test file' },
		{
			'<leader>Td',
			function()
				require('neotest').run.run({ strategy = 'dap' })
			end,
			desc = 'Run tests with dap strategy',
		},
		{
			'<leader>Ts',
			function()
				require('neotest').run.stop()
			end,
			desc = 'Stop nearest test',
		},
		{
			'<leader>Ta',
			function()
				require('neotest').run.attach()
			end,
			desc = 'Attach to nearest test',
		},
		{
			'<leader>Tu',
			function()
				require('neotest').summary.toggle()
			end,
			desc = 'Open Test summary',
		},
		{
			'<leader>Tw',
			function()
				require('neotest').watch.toggle(vim.fn.expand('%'))
			end,
			desc = 'Toggle watching current file',
		},
		{
			'<leader>To',
			function()
				require('neotest').output.open()
			end,
			desc = 'Open output window for nearest test',
		},
		{
			'<leader>TO',
			function()
				require('neotest').output_panel.toggle()
			end,
			desc = 'Toggle output panel',
		},
		{
			'<leader>Tc',
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
