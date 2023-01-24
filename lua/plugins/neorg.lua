require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {},
		["core.norg.concealer"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
					uni = "~/notes/uni",
				},
			},
		},
	},
})
