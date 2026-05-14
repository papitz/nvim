return {
	'stevearc/conform.nvim',
	opts = {
		formatters = {
			kulala = {
				command = 'kulala-fmt',
				args = { '$FILENAME', '--in-request-vars', '--separate-logical-blocks' },
				stdin = false,
			},
			xmlformatter = {
				command = 'xmlformat',
				args = { '--indent', '4', '--disable-inlineformatting', '--selfclose', '--preserve-attributes', '-'  },
			},
		},
		formatters_by_ft = {
			lua = { 'stylua' },
			-- Conform will run multiple formatters sequentially
			python = { 'ruff', 'black' },
			dart = { 'dart_format' },
			javascript = { 'prettierd', 'eslint_d' },
			typescript = { 'prettierd', 'eslint_d' },
			markdown = { 'prettierd' },
			json = { 'prettierd' },
			bash = { 'shfmt' },
			sh = { 'shfmt' },
			sql = { 'sqlfmt' },
			tex = { 'latexindent' },
			go = { 'gofumpt', 'goimports' },
			ruby = { 'rufo', 'rubocop' },
			rust = { 'rustfmt' },
			php = { 'php_cs_fixer' },
			http = { 'kulala' },
			yaml = { 'prettierd' },
			eruby = { 'erb_format' },
			xml = { 'xmlformatter' },
			toml = { 'tombi' },
		},
	},
	keys = {
		-- Use the same keybinding as Neoformat
		{
			'<leader>fr',
			function()
				require('conform').format({ async = true, timeout = 500, lsp_format = 'fallback' })
			end,
			desc = 'Format the current buffer',
		},
	},
}
