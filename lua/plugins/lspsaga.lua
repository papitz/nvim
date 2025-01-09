local util = require('util')
local map = util.map
local vmap = util.vmap
local nmap = util.nmap

-- Lspsaga Mappings
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
nmap('gh', '<cmd>Lspsaga finder<CR>')

-- Code action
nmap('<A-CR>', '<cmd>Lspsaga code_action<CR>')
vmap('<A-CR>', '<cmd>Lspsaga code_action<CR>')

-- Rename
nmap('<leader>rn', '<cmd>Lspsaga rename<CR>')

-- Definition preview
nmap('gD', '<cmd>Lspsaga peek_definition<CR>')

-- Jump to definition
nmap('gd', '<cmd>Lspsaga goto_definition<CR>')

-- Show line diagnostics
nmap('<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- Show cursor diagnostic
nmap('Q', '<cmd>Lspsaga show_cursor_diagnostics<CR>')

-- Diagnsotic jump can use `<c-o>` to jump back
nmap(']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
nmap('[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')

-- Hover Doc
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>')

-- Show diagnostics
map('n', '<leader>e', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
return {
  'glepnir/lspsaga.nvim',
  cmd = 'Lspsaga',
  opts = {
    code_action = {keys = {quit = '<ESC>', exec = '<CR>'}},
    lightbulb = {
      enable = true,
      sign = true,
      enable_in_insert = true,
      sign_priority = 20,
      virtual_text = false
    },
    finder = {
      keys = {
        shuttle = 'L',
        toggle_or_open = '<CR>',
        vsplit = 's',
        split = 'i',
        tabe = 't',
        tabnew = 'r',
        quit = {'q', '<ESC>'},
        close = '<ESC>'
      },
      default = 'def+ref+imp'
    },
    ui = {
      -- currently only round theme
      theme = 'round',
      -- this option only work in neovim 0.9
      title = true,
      -- border type can be single,double,rounded,solid,shadow.
      border = 'rounded',
      winblend = 0,
      expand = ' ',
      collapse = ' ',
      preview = ' ',
      code_action = '💡',
      diagnostic = '🐞',
      incoming = ' ',
      outgoing = ' ',
      kind = {}
    },
    --  TODO: This is a cool feature but slows down vim massively. Try again after some time (now 20.04.23)
    symbol_in_winbar = {
      enable = false,
      separator = ' ',
      ignore_patterns = {},
      hide_keyword = true,
      show_file = true,
      folder_level = 2,
      respect_root = false,
      color_mode = true
    }
  }
}
