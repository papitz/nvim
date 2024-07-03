return {
  -- {"navarasu/onedark.nvim", lazy = false, priority = 1000}, 
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {

      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = 'dark', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = 'day', -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = {italic = true},
        keywords = {italic = true},
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        floats = 'dark' -- style for floating windows
      },
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
      plugins = {
        auto = true,
      }

    }
  }
  -- {
  --     "epwalsh/obsidian.nvim",
  --     lazy = true,
  --     -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  --     event = {"BufReadPre " .. vim.fn.expand("~") .. "/notes/**.md"},
  --     dependencies = {
  --         -- Required.
  --         "nvim-lua/plenary.nvim", -- Optional, for completion.
  --         "hrsh7th/nvim-cmp",
  --
  --         -- Optional, for search and quick-switch functionality.
  --         "nvim-telescope/telescope.nvim"
  --     },
  --     config = function() require("plugins/obsidian") end
  -- }
}

-- 
-- })
