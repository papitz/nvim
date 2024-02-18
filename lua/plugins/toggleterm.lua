local map = require('util').map

-- ToggleTerm
map('n', '<C-t>', ':ToggleTerm dir=%:p:h<CR>')
map('t', '<C-t>', ':ToggleTerm dir=%:p:h<CR>')
map('n', 'v:count1 <C-t>', ':v:count1' .. '"ToggleTerm"<CR>')
map('v', 'v:count1 <C-t>', ':v:count1' .. '"ToggleTerm"<CR>')
function _G.set_terminal_keymaps()
  map('t', '<leader><esc>', '<C-\\><C-n>')
  map('t', '<C-t>', '<C-\\><C-n>:ToggleTerm dir=%:p:h<CR>')
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

return {
  'akinsho/nvim-toggleterm.lua',
  cmd = 'ToggleTerm',
  opts = {
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true, -- close the terminal window when the process exits
    float_opts = {
      border = 'curved',
      width = 120,
      height = 40,
      winblend = 3,
      highlights = {border = 'Normal', background = 'Normal'}

    }
  }
}
