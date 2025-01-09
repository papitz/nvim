return {
	{
		'lervag/vimtex',
		ft = 'tex',
		keys = {
			{ '<leader>tt', ':VimtexCompile<CR>', ft = 'tex', { noremap = true, silent = true } },
			{ '<leader>tv', ':VimtexView<CR>', ft = 'tex', { noremap = true, silent = true } },
			{ '<leader>tc', ':VimtexTocToggle<CR>', ft = 'tex', { noremap = true, silent = true } },
			{ '<leader>ts', ':VimtexStatus<CR>', ft = 'tex', { noremap = true, silent = true } },
			{ '<leader>te', ':VimtexErrors<CR>', ft = 'tex', { noremap = true, silent = true } }, -- opens the quickfix window where the errors are hidden
      { '<leader>ti', 'o\\item ', ft = 'tex', { noremap = true, silent = true } },
      { '<leader>td', 'diDRAFT<ESC>o/DRAFT<ESC>k<ESC>p<ESC>', ft = 'tex', mode = 'v', { noremap = true, silent = true }, },
		},
		config = function()
			if vim.loop.os_uname().sysname == 'Darwin' then
				vim.g.vimtex_view_method = 'skim'
				vim.g.vimtex_view_skim_sync = 1
			else
				vim.g.vimtex_view_method = 'zathura'
			end
			vim.g.vimtex_view_general_viewer = 'zathura'
			vim.cmd("let g:vimtex_toc_config = {'layer_status': {'label':0, 'include':0}, 'show_help':0}")
			vim.g.tex_flavor = 'latex'
			vim.g.vimtex_quickfix_enabled = 1
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_quickfix_open_on_warning = 0
			vim.g.vimtex_compiler_silent = 0
			vim.opt.conceallevel = 1
			vim.g.vimtex_complete_enabled = 0
			vim.g.tex_conceal = 'abdmg'
		end,
	},
	-- { 'barreiroleo/ltex-extra.nvim'},
}
