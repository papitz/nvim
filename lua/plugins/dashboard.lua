local db = require("dashboard")

db.setup({
	config = {
		theme = "hyper",
		header = {
			"██╗    ██╗██╗    ██╗ ██████╗████████╗██╗   ██╗██╗███╗   ███╗",
			"██║    ██║██║    ██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║",
			"██║ █╗ ██║██║ █╗ ██║██║        ██║   ██║   ██║██║██╔████╔██║",
			"██║███╗██║██║███╗██║██║        ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
			"╚███╔███╔╝╚███╔███╔╝╚██████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
			" ╚══╝╚══╝  ╚══╝╚══╝  ╚═════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
			"                                                            ",
		},
		-- shortcut = {
		-- 	{ icon = "  ", desc = "Find File                 ", key = "SPC f f", action = "Telescope find_files" },
		-- 	{ icon = "  ", desc = "Recents                   ", key = "SPC f o", action = "Telescope oldfiles" },
		-- 	{ icon = "  ", desc = "Find Word                 ", key = "SPC f g", action = "Telescope live_grep" },
		-- 	{ icon = "洛 ", desc = "New File                  ", key = "SPC f n", action = "DashboardNewFile" },
		-- 	{ icon = "  ", desc = "Bookmarks                 ", key = "SPC f m", action = "Telescope marks" },
		-- 	{ icon = "⌨  ", desc = "Keymaps                   ", key = "SPC f k", action = "Telescope keymaps" },
		-- 	{ icon = "  ", desc = "Load Last Session         ", key = "SPC s l", action = "SessionLoad" },
		-- },
	},
})

-- Disable statusline and cursorline in dashboard.
-- vim.cmd('autocmd BufEnter * if &ft is "dashboard" | set laststatus=0 | else | set laststatus=2 | endif')
-- vim.cmd('autocmd BufEnter * if &ft is "dashboard" | set nocursorline | endif')
