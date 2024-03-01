return {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  opts = {
        window = {
          width = 0.9,
          height = 1
        }
  },
  keys = {{'<leader>z', mode = {'n'}, '<cmd>ZenMode<cr>', desc = 'Open ZenMode'}}
}
