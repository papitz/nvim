return {
	'nvim-neotest/neotest',
	--  TODO: Remove once this is fixed: https://github.com/nvim-neotest/neotest/issues/531
	commit = '52fca6717ef972113ddd6ca223e30ad0abb2800c',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'nvim-neotest/neotest-plenary',
		'sidlatau/neotest-dart',
		'nvim-neotest/neotest-python',
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
				if vim.filetype == 'dart' then
					local Job = require('plenary.job')
					local flutter_project_root = require('util').findGitDirectory(vim.loop.cwd())
					vim.fn.chdir(flutter_project_root)
					vim.notify('Running all tests with coverage')

					--  TODO: Just works for flutter
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
				else
					vim.notify('For now just flutter is supported')
					return
				end
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
		{ '<leader>tm', require('utils.test').makeTestFile, desc = 'Create Test file' },
		{
			'<leader>tM',
			require('utils.test').makeTestFileWithCopilot,
			desc = 'Create Test file and Test with CopilotChat',
		},
		{
			'<leader>tM',
			require('utils.test').generateTestsForSelection,
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
				require('neotest-minitest')({
					-- custom_test_method_names = { 'should' },
				}),
				require('neotest-python'),
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
