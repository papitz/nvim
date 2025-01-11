return {
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	keys = {
		{
			'<leader>u',
			function()
				require('lsp_lines').toggle()
			end,
			desc = 'Show LSP lines',
		},
		{
			'<leader>q',
			function()
        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
			end,
			desc = 'Show LSP line for current line',
		},
	},
	config = function()
		require('lsp_lines').setup()
		vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
	end,
}
