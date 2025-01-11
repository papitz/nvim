local nmap = require('util').nmap
local flutter_prefix = '<leader>F'
nmap(flutter_prefix .. 'a', '<cmd>FlutterRun<CR>')
nmap(flutter_prefix .. 'A', '<cmd>FlutterRun --dart-define-from-file=.env.json<CR>')
nmap(flutter_prefix .. 'e', '<cmd>FlutterEmulators<CR>')
nmap(flutter_prefix .. 'q', '<cmd>FlutterQuit<CR>')
nmap(flutter_prefix .. 'r', '<cmd>FlutterReload<CR>')
nmap(flutter_prefix .. 'R', '<cmd>FlutterRestart<CR>')
nmap(flutter_prefix .. 'D', '<cmd>FlutterVisualDebug<CR>')
nmap(flutter_prefix .. 'F', '<cmd>FlutterCopyProfilerUrl<CR>')
nmap(flutter_prefix .. 'c', '<cmd>FlutterLogClear<CR>')

return {
  'akinsho/flutter-tools.nvim',
  ft = 'dart',
  dependencies = 'nvim-lua/plenary.nvim',
  opts = function()

    return {
      ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = 'rounded'
        -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
        -- please note that this option is eventually going to be deprecated and users will need to
        -- depend on plugins like `nvim-notify` instead.
      },
      decorations = {
        statusline = {
          -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
          -- this will show the current version of the flutter app from the pubspec.yaml file
          app_version = false,
          -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
          -- this will show the currently running device if an application was started with a specific
          -- device
          device = false
        }
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = false,
        run_via_dap = false -- use dap instead of a plenary job to run flutter apps
      },
      flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
      fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
      widget_guides = {enabled = true},
      closing_tags = {
        highlight = 'NonText', -- highlight for the closing tag
        prefix = '>', -- character to use for close tag e.g. > Widget
        enabled = true -- set to false to disable
      },
      dev_log = {
        enabled = true,
        open_cmd = '10new' -- command to use to open the log buffer
      },
      dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = true -- Automatically opens devtools in the browser
      },
      outline = {
        open_cmd = '30vnew', -- command to use to open the outline buffer
        auto_open = false -- if true this will open the outline automatically when it is first populated
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          foreground = false, -- highlight the foreground
          -- virtual_text = true, -- show the highlight using virtual text
          -- virtual_text_str = '■' -- the virtual text character to highlight
          virtual_text = false, -- show the highlight using virtual text
        },
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
          showTodos = false,
          completeFunctionCalls = true,
          analysisExcludedFolders = {'/usr/lib/flutter/packages/'},
          renameFilesWithClasses = 'always', -- "always"
          enableSnippets = true
        }
      }
    }
  end
}
