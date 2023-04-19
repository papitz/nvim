local saga = require("lspsaga")

saga.setup({
	code_action = {
		keys = {
			quit = "<ESC>",
			exec = "<CR>",
		},
	},
	lightbulb = {
		enable = true,
		sign = true,
		enable_in_insert = true,
		sign_priority = 20,
		virtual_text = false,
	},
	finder = {
        keys = {
          jump_to = 'L',
          expand_or_jump = '<CR>',
          vsplit = 's',
          split = 'i',
          tabe = 't',
          tabnew = 'r',
          quit = { 'q', '<ESC>' },
          close_in_preview = '<ESC>',
        },
	},
	ui = {
		-- currently only round theme
		theme = "round",
		-- this option only work in neovim 0.9
		title = true,
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			normal_bg = "#282c34",
			--title background color
			title_bg = "#98c379",
			red = "#e06c75",
			magenta = "#c678dd",
			orange = "#d19a66",
			yellow = "#e5c07b",
			green = "#98c379",
			cyan = "#56b6c2",
			blue = "#61afef",
			purple = "#c678dd",
			white = "#abb2bf",
			black = "#282c34",
		},
		kind = {},
	},
})
