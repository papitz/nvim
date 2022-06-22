local db = require("dashboard")

db.hide_statusline = true

db.custom_header = {
	"██╗    ██╗██╗    ██╗ ██████╗████████╗██╗   ██╗██╗███╗   ███╗",
	"██║    ██║██║    ██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║",
	"██║ █╗ ██║██║ █╗ ██║██║        ██║   ██║   ██║██║██╔████╔██║",
	"██║███╗██║██║███╗██║██║        ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
	"╚███╔███╔╝╚███╔███╔╝╚██████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
	" ╚══╝╚══╝  ╚══╝╚══╝  ╚═════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"                                                            ",
}
db.custom_center = {
	{ icon = "  ", desc = "Find File                 ", shortcut = "SPC f f", action = "Telescope find_files" },
	{ icon = "  ", desc = "Recents                   ", shortcut = "SPC f o", action = "Telescope oldfiles" },
	{ icon = "  ", desc = "Find Word                 ", shortcut = "SPC f g", action = "Telescope live_grep" },
	{ icon = "洛 ", desc = "New File                  ", shortcut = "SPC f n", action = "DashboardNewFile" },
	{ icon = "  ", desc = "Bookmarks                 ", shortcut = "SPC f m", action = "Telescope marks" },
	{ icon = "⌨  ", desc = "Keymaps                   ", shortcut = "SPC f k", action = "Telescope Keymaps" },
	{ icon = "  ", desc = "Load Last Session         ", shortcut = "SPC s l", action = "SessionLoad" },
}

-- Disable statusline and cursorline in dashboard.
vim.cmd('autocmd BufEnter * if &ft is "dashboard" | set laststatus=0 | else | set laststatus=2 | endif')
vim.cmd('autocmd BufEnter * if &ft is "dashboard" | set nocursorline | endif')
