return {
	{ 'tpope/vim-bundler' },
	{
		'tpope/vim-rails',
		ft = { 'ruby' },
		keys = {
			{ '<leader>A', ':A<CR>', desc = 'Go to alternative file', silent = true },
			{ '<leader>R', ':R<CR>', desc = 'Go to related file', silent = true },
		},
	},
}
