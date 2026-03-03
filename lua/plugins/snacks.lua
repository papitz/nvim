-- lazy.nvim
return {
	'folke/snacks.nvim',
	---@type snacks.Config
	opts = {
		picker = {
			ui_select = true,
			-- your picker configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		styles = {
			lazygit = {},
		},
	},
}
