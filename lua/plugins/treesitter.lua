return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    -- Get the commentstring based on ts context
    'JoosepAlviste/nvim-ts-context-commentstring'
    -- Big slowdown
    -- "nvim-treesitter/nvim-treesitter-context"
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = 'all', -- one of "all", or a list of languages
    sync_install = false,
    auto_install = false,
    modules = {},
    ignore_install = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {'markdown', 'eruby.yaml'},
      disable = {'latex', 'eruby.yaml'}
    },
    matchup = {enable = true},
    indent = {enable = true, disable = {'dart', 'ruby', 'json'}},
    autotag = {enable = true},
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>'
      }
    }
  },
  config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end
}
