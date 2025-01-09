require('util').nmap('<leader>b', ':Rest run<CR>')
return {
  'rest-nvim/rest.nvim',
  dependencies = {{'nvim-lua/plenary.nvim'}},
  ft = {'http'},
  config = function()
    require('rest-nvim').setup({highlight = {enabled = false, timeout = 150}})
  end
}
