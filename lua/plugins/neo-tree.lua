local neo_tree_disable = true
if neo_tree_disable then return {} end

require('util').nmap('<C-b>', ':Neotree dir=./ toggle position=left <CR>')

-- vim.cmd(
--     "autocmd! FileType dashboard nnoremap <buffer> <silent> <C-b> :Neotree dir=./ toggle position=float <CR>")

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim'
  },
  opts = {
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    default_component_configs = {
      container = {enable_character_fade = true},
      indent = {
        indent_size = 2,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = '│',
        last_indent_marker = '└',
        highlight = 'NeoTreeIndentMarker',
        -- expander config, needed for nesting files
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander'
      },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = '*',
        highlight = 'NeoTreeFileIcon'
      },
      modified = {symbol = '[+]', highlight = 'NeoTreeModified'},
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = 'NeoTreeFileName'
      },
      git_status = {
        symbols = {
          -- Change type
          added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = '✖', -- this can only be used in the git_status source
          renamed = '', -- this can only be used in the git_status source
          -- Status type
          untracked = '',
          ignored = '',
          unstaged = '',
          staged = '',
          conflict = ''
        }
      }
    },
    window = {
      position = 'left',
      -- width = "15%",
      width = function()
        return math.max(math.floor(0.15 * vim.api.nvim_win_get_width(0)), 30)
      end,
      -- width = 45,
      mapping_options = {noremap = true, nowait = true},
      mappings = {
        ['<space>'] = {
          'toggle_node',
          nowait = false -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ['<2-LeftMouse>'] = 'open',
        ['<cr>'] = 'open',
        ['l'] = 'open',
        ['<esc>'] = 'revert_preview',
        ['P'] = {'toggle_preview', config = {use_float = true}},
        ['S'] = 'split_with_window_picker',
        ['E'] = 'vsplit_with_window_picker',
        ['t'] = 'open_tabnew',
        ['L'] = 'open_with_window_picker',
        ['C'] = 'close_node',
        ['h'] = 'close_node',
        ['z'] = 'close_all_nodes',
        -- ["Z"] = "expand_all_nodes",
        ['a'] = {
          'add',
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = 'none' -- "none", "relative", "absolute"
          }
        },
        ['A'] = {
          'add_directory',
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = 'none' -- "none", "relative", "absolute"
          }
        },
        ['d'] = 'delete',
        ['r'] = 'rename',
        ['y'] = 'copy_to_clipboard',
        ['x'] = 'cut_to_clipboard',
        ['p'] = 'paste_from_clipboard',
        ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
        ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ['q'] = 'close_window',
        ['R'] = 'refresh',
        ['?'] = 'show_help',
        ['<'] = 'prev_source',
        ['>'] = 'next_source'
      }
    },
    nesting_rules = {},
    filesystem = {
      bind_to_cwd = true,
      cwd_target = {sidebar = 'global'},
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = true,
        hide_gitignored = true,
        show_hidden_count = false,
        hide_by_name = {'node_modules', '.git', '.cache', '__pycache__'}
      },
      follow_current_file = {enabled = true}, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      group_empty_dirs = false, -- when true, empty folders will be grouped together
      -- in whatever position is specified in window.position
      -- "open_current",  -- netrw disabled, opening a directory opens within the
      -- window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
      use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
      -- instead of relying on nvim autocmd events.
      window = {
        mappings = {
          ['<bs>'] = 'navigate_up',
          ['.'] = 'set_root',
          ['<c-h>'] = 'toggle_hidden',
          ['/'] = 'fuzzy_finder',
          ['D'] = 'fuzzy_finder_directory',
          ['f'] = 'filter_on_submit',
          ['<c-x>'] = 'clear_filter',
          ['[g'] = 'prev_git_modified',
          [']g'] = 'next_git_modified'
        }
      }
    },
    buffers = {
      bind_to_cwd = true,
      follow_current_file = {enabled = true}, -- This will find and focus the file in the active buffer every
      -- time the current file is changed while the tree is open.
      group_empty_dirs = true, -- when true, empty folders will be grouped together
      show_unloaded = true,
      window = {
        mappings = {
          ['bd'] = 'buffer_delete',
          ['<bs>'] = 'navigate_up',
          ['.'] = 'set_root'
        }
      }
    },
    git_status = {
      window = {
        position = 'float',
        mappings = {
          ['A'] = 'git_add_all',
          ['gu'] = 'git_unstage_file',
          ['ga'] = 'git_add_file',
          ['gr'] = 'git_revert_file',
          ['gc'] = 'git_commit',
          ['gp'] = 'git_push',
          ['gg'] = 'git_commit_and_push'
        }
      }
    }
  },
  config = function(_, opts)
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]);
    require('neo-tree').setup(opts)
  end
}
