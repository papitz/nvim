--  TODO: Add better ruby support for named parameters
return {
	'danymat/neogen',
	config = true,
	keys = {
		{
			'<leader>gn',
			function()
				require('neogen').generate()
			end,
			desc = 'Generate documentation',
		},
	},
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
