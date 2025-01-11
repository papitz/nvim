return {
	'stevearc/conform.nvim',
	opts = {
		formatters = {
			kulala = {
				command = 'kulala-fmt',
				args = { '$FILENAME', '--in-request-vars', '--separate-logical-blocks' },
				stdin = false,
			},
		},
		formatters_by_ft = {
			lua = { 'stylua' },
			-- Conform will run multiple formatters sequentially
			python = { 'black' },
			dart = { 'dart_format' },
			-- Use a sub-list to run only the first available formatter
			javascript = { { 'prettierd', 'prettier' }, 'eslint_d' },
			typescript = { { 'prettierd', 'prettier' }, 'eslint_d' },
			markdown = { 'prettierd' },
			json = { 'prettierd' },
			bash = { 'shfmt' },
			sh = { 'shfmt' },
			tex = { 'latexindent' },
			go = { 'gofumpt', 'goimports' },
			ruby = { 'rufo', 'rubocop' },
			rust = { 'rustfmt' },
			php = { 'php_cs_fixer' },
			http = { 'kulala' },
      yaml = { 'prettierd' },
      eruby = { 'erb_format' },
		},
	},
	keys = {
		-- Use the same keybinding as Neoformat
		{
			'<leader>fr',
			function()
				require('conform').format({ async = true, timeout = 500 })
			end,
			desc = 'Format the current buffer',
		},
	},
}
