return {
  {
    'rcarriga/nvim-dap-ui',
    -- stylua: ignore
    event = 'VeryLazy',
    keys = {
      {
        '<leader>du',
        function() require('dapui').toggle({}) end,
        desc = 'Open DAP UI'
      }, {
        '<leader>de',
        function() require('dapui').eval() end,
        desc = 'Eval',
        mode = {'n', 'v'}
      }
    },
    opts = {},
    config = function(_, opts)
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup(opts)
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close({})
      end
    end
  }, {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = 'mason.nvim',
    event = 'VeryLazy',
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {
        --
        function(config)
          -- all sources with no handler get passed here
          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
        dart = function(config)
          config.adapters = {
            type = 'executable',
            -- As of this writing, this functionality is open for review in https://github.com/flutter/flutter/pull/91802
            command = 'flutter',
            args = {'debug_adapter'}
          }
          config.configurations = {
            {
              type = 'dart',
              request = 'launch',
              name = 'Launch flutter',
              -- windows don't really have a standard install path
              -- best effort guess is the instructed install path from:
              -- https://docs.flutter.dev/get-started/install/windows
              dartSdkPath = '/opt/flutter' .. '/bin/cache/dart-sdk/',
              flutterSdkPath = '/opt/flutter',
              program = function()
                return vim.lsp.buf.list_workspace_folders()[1] ..
                           '/lib/main.dart'
              end,
              cwd = function()
                return vim.lsp.buf.list_workspace_folders()[1]
              end
            }
          }
          require('mason-nvim-dap').default_setup(config)
        end
        -- python = function(config)
        --     config.adapters = {
        --         type = "executable",
        --         command = "/usr/bin/python3",
        --         args = {"-m", "debugpy.adapter"}
        --     }
        --     require('mason-nvim-dap').default_setup(config) -- don't forget this!
        -- end
      },

      ensure_installed = {}
    }
  }, {'theHamsta/nvim-dap-virtual-text', opts = {}, event = 'VeryLazy'}, {
    'mfussenegger/nvim-dap',
    -- dependencies = "rcarriga/nvim-dap-ui",
    opts = {},
    event = 'VeryLazy',
    keys = {
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = 'Breakpoint Condition'
      }, {
        '<leader>db',
        function() require('dap').toggle_breakpoint() end,
        desc = 'Toggle Breakpoint'
      },
      {
        '<leader>dc',
        function() require('dap').continue() end,
        desc = 'Continue'
      }, {
        '<leader>dC',
        function() require('dap').run_to_cursor() end,
        desc = 'Run to Cursor'
      }, {
        '<leader>dg',
        function() require('dap').goto_() end,
        desc = 'Go to line (no execute)'
      },
      {
        '<leader>di',
        function() require('dap').step_into() end,
        desc = 'Step Into'
      }, {'<leader>dj', function() require('dap').down() end, desc = 'Down'},
      {'<leader>dk', function() require('dap').up() end, desc = 'Up'},
      {
        '<leader>dl',
        function() require('dap').run_last() end,
        desc = 'Run Last'
      },
      {
        '<leader>do',
        function() require('dap').step_out() end,
        desc = 'Step Out'
      },
      {
        '<leader>dO',
        function() require('dap').step_over() end,
        desc = 'Step Over'
      }, {'<leader>dp', function() require('dap').pause() end, desc = 'Pause'},
      {
        '<leader>dr',
        function() require('dap').repl.toggle() end,
        desc = 'Toggle REPL'
      },
      {'<leader>ds', function() require('dap').session() end, desc = 'Session'},
      {
        '<leader>dt',
        function() require('dap').terminate() end,
        desc = 'Terminate'
      }, {
        '<leader>dw',
        function() require('dap.ui.widgets').hover() end,
        desc = 'Widgets'
      }
    },
    config = function(_, opts)
      vim.fn.sign_define('DapBreakpoint',
                         {text = '●', texthl = '', linehl = '', numhl = ''})
      vim.api
          .nvim_set_hl(0, 'DapStoppedLine', {default = true, link = 'Visual'})
      require('dapui').setup(opts)
    end
  }
}
