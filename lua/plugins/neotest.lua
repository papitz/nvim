return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-plenary', 'sidlatau/neotest-dart',
    'antoinemadec/FixCursorHold.nvim'
  },
  event = 'VeryLazy',
  keys = {
    {
      '<leader>Tt',
      function() require('neotest').run.run() end,
      desc = 'Run nearest test'
    }, {
      '<leader>Tf',
      function() require('neotest').run.run(vim.fn.expand('%')) end,
      desc = 'Run current file'
    }, {
      '<leader>Td',
      function() require('neotest').run.run({strategy = 'dap'}) end,
      desc = 'Run tests with dap strategy'
    }, {
      '<leader>Ts',
      function() require('neotest').run.stop() end,
      desc = 'Stop nearest test'
    }, {
      '<leader>Ta',
      function() require('neotest').run.attach() end,
      desc = 'Attach to nearest test'
    }, {
      '<leader>Tu',
      function() require('neotest').summary.toggle() end,
      desc = 'Open Test summary'
    }, {
      '<leader>Tw',
      function() require('neotest').watch.toggle(vim.fn.expand('%')) end,
      desc = 'Toggle watching current file'
    }, {
      '<leader>To',
      function() require('neotest').output.open() end,
      desc = 'Open output window for nearest test'
    }, {
      '<leader>TO',
      function() require('neotest').output_panel.toggle() end,
      desc = 'Toggle output panel'
    }, {
      '<leader>Tc',
      function() require('neotest').output_panel.clear() end,
      desc = 'Clear output panel'
    }, {
      '[n',
      function() require('neotest').jump.prev({status = 'failed'}) end,
      desc = 'Go to prev failed test'
    }, {
      ']n',
      function() require('neotest').jump.prev({status = 'failed'}) end,
      desc = 'Go to next failed test'
    }

  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-dart' {command = 'flutter'}, require 'neotest-plenary'
      },
      output = {open_on_run = false},
      discovery = {enabled = false},
      diagnostic = {enabled = true},
      floating = {
        border = 'rounded',
        max_height = 0.8,
        max_width = 0.8,
        options = {}
      },
      quickfix = {enabled = false},
      state = {enabled = true}
    }
  end
}
