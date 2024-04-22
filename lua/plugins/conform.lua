return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			-- Conform will run multiple formatters sequentially
			python = { 'black' },
			dart = { 'dart_format' },
			-- Use a sub-list to run only the first available formatter
			javascript = { { 'prettierd', 'prettier' }, 'eslint_d' },
			typescript = { { 'prettierd', 'prettier' }, 'eslint_d' },
			bash = { 'shfmt' },
		},
	},
	keys = {
		-- Use the same keybinding as Neoformat
		{
			'<leader>fr',
			function()
				require('conform').format()
			end,
			desc = 'Format the current buffer',
		},
	},
}
