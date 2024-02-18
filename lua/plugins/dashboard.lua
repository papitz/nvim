-- Disable statusline and cursorline in dashboard.
-- vim.cmd('autocmd BufEnter * if &ft is "dashboard" | set laststatus=0 | else | set laststatus=2 | endif')
-- vim.cmd('autocmd BufEnter * if &ft is "dashboard" | set nocursorline | endif')
require('util').nmap('<leader>fn', '<cmd>DashboardNewFile<cr>')

return {
  'glepnir/dashboard-nvim',
  opts = {

    config = {
      theme = 'hyper',
      header = {
        '██╗    ██╗██╗    ██╗ ██████╗████████╗██╗   ██╗██╗███╗   ███╗',
        '██║    ██║██║    ██║██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║',
        '██║ █╗ ██║██║ █╗ ██║██║        ██║   ██║   ██║██║██╔████╔██║',
        '██║███╗██║██║███╗██║██║        ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║',
        '╚███╔███╔╝╚███╔███╔╝╚██████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║',
        ' ╚══╝╚══╝  ╚══╝╚══╝  ╚═════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝',
        '                                                            '
      }
    }
  }
}
