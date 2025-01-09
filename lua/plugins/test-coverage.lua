return {
	'andythigpen/nvim-coverage',
	dependecies = 'nvim-lua/plenary.nvim',
	keys = {
		{
			'<leader>tC',
			desc = 'Load coverage report',
			function()
				-- only for dart files
				if vim.bo.filetype == 'dart' then
					local project_root = require('util').findGitDirectory(vim.loop.cwd())
					if not project_root then
						print('No git directory found')
						return
					end
					local coverage_report = project_root .. '/coverage/lcov.info'
					require('coverage').load_lcov(coverage_report, true)
				else
          print('defaulting to preset file loaction')
					require('coverage').load(true)
				end
			end,
			silent = true,
		},
		{
			'<leader>tR',
			desc = 'Show coverage report',
			function()
				require('coverage').summary()
			end,
			silent = true,
		},
		{
			'<leader>tT',
			desc = 'Toggle coverage report',
			function()
				require('coverage').toggle()
			end,
			silent = true,
		},
	},
	config = function()
		require('coverage').setup({
			commands = true,
      auto_reload = true,
		})
	end,
}
