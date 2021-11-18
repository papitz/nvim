local g = vim.g
local fn = vim.fn

g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

g.dashboard_custom_section = {
    a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
    c = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
    d = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
    e = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
    f = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
    g = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" }
}

-- Disable statusline and cursorline in dashboard.
vim.cmd("autocmd BufEnter * if &ft is \"dashboard\" | set laststatus=0 | else | set laststatus=2 | endif")
vim.cmd("autocmd BufEnter * if &ft is \"dashboard\" | set nocursorline | endif")
