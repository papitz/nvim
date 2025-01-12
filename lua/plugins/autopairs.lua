return {
	{ 'windwp/nvim-autopairs', config = true, event = 'InsertEnter' }, -- This is for html and it can autorename too!
	{
		'windwp/nvim-ts-autotag',
		opts = {
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
		},
	},
	{ 'andymass/vim-matchup' },
}
