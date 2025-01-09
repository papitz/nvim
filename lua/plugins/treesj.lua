return {
	'Wansmer/treesj',
	keys = {
		{
			'<leader>fs',
			function()
				require('treesj').toggle()
			end,
			desc = 'Toggle splitting or joining a treesitter node',
		},
	},
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	-- config = function()
	--   require('treesj').setup({--[[ your config ]]})
	-- end,
}
