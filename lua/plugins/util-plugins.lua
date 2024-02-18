require('util').nmap('<leader>sw', ':ISwap<CR>')

return {
  'lewis6991/impatient.nvim', 's1n7ax/nvim-window-picker',
  {'mizlan/iswap.nvim', cmd = 'ISwap'}, 'nvim-lua/plenary.nvim',
  'RishabhRD/popfix', {
    'hood/popui.nvim',
    config = function() vim.ui.select = require('popui.ui-overrider') end
  }
}
