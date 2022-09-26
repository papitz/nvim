local saga = require("lspsaga")

saga.init_lsp_saga({
	finder_action_keys = {
		open = "<CR>",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
	code_action_lightbulb = {
		enable = true,
		sign = true,
		enable_in_insert = true,
		sign_priority = 20,
		virtual_text = false,
	},
	code_action_keys = {
		quit = "<ESC>",
		exec = "<CR>",
	},
})
