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

local rubyTestPath = function(path)
  local testPath = string.gsub(path, '/app/', '/test/')
  testPath = string.gsub(testPath, '.rb', '_test.rb')
  local appSubPath = path:match('(app/.+/[^/]+)')
  local depth = countSlashes(appSubPath)
  local relativeOriginPath = string.rep('../', depth) .. appSubPath
  return testPath, relativeOriginPath
end

local dartContent = [[
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TODO', () {
    test('TODO', () {
      // TODO: Implement tests      
    });
  });
}
```

If needed use FakeFirestore. If mocks are needed use Mockito and the @GenerateNiceMocks annotation. Remember to add the import for the generated mock file. Please use the empty() constructor to generate objects',
]]

local rubyContent = [[
require 'test_helper'

class TODO < ActiveSupport::TestCase
  test 'TODO' do
  end
end
]]

local fileTypeContent = {
	['dart'] = dartContent,
  ['ruby'] = rubyContent,
}

local fileTypeHandlers = {
	['dart'] = dartTestPath,
  ['ruby'] = rubyTestPath,
}

local function writeToTestFile(finalTestPath, relativeOriginPath, imports, content)
	-- If we dont have any content or imports we can still at least generate the file
	content = content or ''
	imports = imports or ''
	content = imports .. content
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

local function get_last_match(str, pattern)
	local last_match = nil
	for match in string.gmatch(str, pattern) do
		last_match = match
	end
	return last_match
end

local function concat_all_matches(str, pattern)
	local matches = {}
	for match in string.gmatch(str, pattern) do
		table.insert(matches, match)
	end
	return table.concat(matches, '\n')
end

-- This should get the proposed content that we use for static generation
local generateTestWithCopilot = function(content, callback, selection)
	local copilot = require('CopilotChat')
	copilot.config.callback = function(response)
		local delim = '```'
		local start_delim = delim .. '.-\n'
		local pattern = start_delim .. '(.-)' .. delim
		local code_in_response = concat_all_matches(response, pattern)
		callback(code_in_response)
		copilot.config.callback = nil
	end
	copilot.ask(
		'Generate tests for this code. Try to test every part of the code. Make a complete test suite and not a simplified version of it. Fill out every test you write rather than just giving me templates I have to fill out. If possible do the tests without Mocking. If it is needed, explicetly write the code to Mock the classes as well. Leave out imports. The code you give as test code should have this structure: '
			.. content,
		{ selection = selection }
	)
end

local createNewTestFileCopilot = function(filePath, relativeOriginPath, content)
	local select = require('CopilotChat.select')
	local file_callback = function(code_in_response)
		writeToTestFile(filePath, relativeOriginPath, code_in_response)
	end

	generateTestWithCopilot(content, file_callback, select.buffer)
end

-- Create test file and open as new buffer
local function makeTestFile(useCopilot)
	useCopilot = useCopilot or false
	local filetype = vim.bo.filetype
	local filePath = vim.fn.expand('%:p')
	local handler = fileTypeHandlers[filetype]
	local content = fileTypeContent[filetype]

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
				createNewTestFileCopilot(finalTestPath, relativeOriginPath, content)
				return
			else
				writeToTestFile(finalTestPath, relativeOriginPath, content)
			end
		end
	else
		print('No handler for filetype: ' .. filetype)
	end
end

local function generateTestsForSelection()
	local filetype = vim.bo.filetype
	local content = fileTypeContent[filetype]
	local select = require('CopilotChat.select')
	local copyCodeCallback = function(code_in_response)
		vim.fn.setreg('"', code_in_response)
		vim.notify('Code copied to clipboard')
	end
	generateTestWithCopilot(content, copyCodeCallback, select.visual)
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
		'olimorris/neotest-rspec',
    'zidhuss/neotest-minitest',
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
			'<leader>tA',
			function()
				local Job = require('plenary.job')
				local flutter_project_root = require('util').findGitDirectory(vim.loop.cwd())
				vim.fn.chdir(flutter_project_root)
				vim.notify('Running all tests with coverage')

				Job:new({
					command = 'flutter',
					args = { 'test', '--coverage', '--concurrency=4' },
					cwd = flutter_project_root,
					on_exit = function(j, return_val)
						if return_val == 0 then
							vim.notify('All tests passed')
						else
							vim.notify('Some tests failed')
						end
					end,
				}):start()
			end,
			desc = 'Run all tests with coverage',
		},

		{
			'<leader>tf',
			function()
				require('neotest').run.run(vim.fn.expand('%'))
			end,
			desc = 'Run current file',
		},
		--  FIXME: Does not find tests yet
		{
			'<leader>ta',
			function()
				require('neotest').run.run({
					require('util').findGitDirectory(vim.loop.cwd()) .. 'test/',
					suite = true,
					extra_args = { '--coverage' },
				})
			end,
			desc = 'Run all tests',
		},
		{ '<leader>tm', makeTestFile, desc = 'Create Test file' },
		{ '<leader>tM', makeTestFileWithCopilot, desc = 'Create Test file and Test with CopilotChat' },
		{
			'<leader>tM',
			generateTestsForSelection,
			desc = 'Create Test with CopilotChat for selected code',
			mode = 'x',
		},
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
				require('neotest').jump.next({ status = 'failed' })
			end,
			desc = 'Go to next failed test',
		},
	},
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-dart')({
					command = 'flutter test --coverage',
					useLsp = true,
					custom_test_method_names = { 'Glados' },
				}),
				require('neotest-plenary'),
        require('neotest-rspec'),
        require('neotest-minitest')({
          custom_test_method_names = { 'should' },
        }),

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
