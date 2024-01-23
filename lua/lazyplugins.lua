local plugins = {

    {"glepnir/lspsaga.nvim", config = function() require("plugins/lspsaga") end},
    {"rafamadriz/friendly-snippets"}, {"Neevash/awesome-flutter-snippets"}, {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets",
            "L3MON4D3/LuaSnip", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc"
        },
        config = function() require("plugins/cmp") end
    }, {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function() require("plugins/snippets") end
    }, {"saadparwaiz1/cmp_luasnip"}, -- Vim Lua LSP
    {}, -- LSP signature.
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     config = function() require("plugins/lsp_signature") end
    -- }, -- VsCode like pictograms for lsp.
    {"onsails/lspkind-nvim"}, -- popup menu
    {"RishabhRD/popfix"}, {
        "hood/popui.nvim",
        config = function() vim.ui.select = require("popui.ui-overrider") end
    },

    -- Debugger -- TODO: take care of this when we need it for the first time
    -- { "mfussenegger/nvim-dap" },
    -- {
    -- 	"Pocco81/DAPInstall.nvim",
    -- 	config = function()
    -- 		require("plugins/dap")
    -- 	end,
    -- },
    -- {
    -- 	"rcarriga/nvim-dap-ui",
    -- 	config = function()
    -- 		require("plugins/dap")
    -- 	end,
    -- },

    -- This plugin adds indentation guides to all lines (including empty lines).
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        -- event = "BufRead",
        config = function() require("plugins/indent-blankline") end
    }, -- Code formatter.
    {
        "sbdchd/neoformat",
        cmd = "Neoformat",
        config = function() require("plugins/neoformat") end
    }, {
        "akinsho/nvim-toggleterm.lua",
        cmd = "ToggleTerm",
        config = function() require("plugins/toggleterm") end
    }, -- Git support for nvim.
    {"tpope/vim-fugitive"}, -- Git signs.
    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function() require("plugins/gitsigns") end
    }, -- Auto closes.
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }, -- This is for html and it can autorename too!
    {"windwp/nvim-ts-autotag"},

    -- todo-comments is a lua plugin for Neovim to highlight and search for
    -- todo comments like TODO, HACK, BUG in code base.
    {
        "folke/todo-comments.nvim",
        event = "BufEnter",
        config = function() require("plugins/todo-comments") end
    }, -- WhichKey is a lua plugin that displays a popup with possible
    -- key bindings of the command you started typing.
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                icons = {
                    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                    separator = "➜ ", -- symbol used between a key and it's label
                    group = "+" -- symbol prepended to a group
                }
            })
        end
    }, -- Neovim plugin to comment text in and out.
    -- Supports commenting out the current line, a visual selection and a motion.
    {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function() require("nvim_comment").setup() end
    },

    -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text. Like if/else etc.
    {"andymass/vim-matchup"},

    -- plugin to surround selections with things like brackets
    {"tpope/vim-surround"}, -- git client
    {"kdheepak/lazygit.nvim"}, -- fast movement
    -- {
    --     "ggandor/leap.nvim",
    --     config = function() require("leap").set_default_keymaps() end
    -- }, -- swap parameters around
    {"mizlan/iswap.nvim"}, -- markdown preview in browser
    -- auto generate doc strings
    {"kkoomen/vim-doge", build = function() vim.fn["doge#install"]() end},

    -- notifications
    {"rcarriga/nvim-notify", config = function() require("plugins/notify") end},

    -- flutter developement
    {"reisub0/hot-reload.vim"},
    {
        "akinsho/flutter-tools.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        -- ft = "dart",
        config = function() require("plugins/flutter-tools") end
    }, -- jumping between files on a project basis
    {"cbochs/grapple.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {"lervag/vimtex", ft = "tex"}, {"barreiroleo/ltex-extra.nvim"},
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        config = function() require("plugins/noice") end,
        dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        -- stylua: ignore
        keys = {
            {
                "<leader>a",
                mode = {"n", "x", "o"},
                function() require("flash").jump() end,
                desc = "Flash"
            }, {
                "<leader>A",
                mode = {"n", "x", "o"},
                function() require("flash").treesitter() end,
                desc = "Flash Treesitter"
            }
        }
    }
    -- {"lewis6991/satellite.nvim"}

    -- Import settings of plugins or start plugins.
    --     require("plugins.vimtex")
    -- end,
    -- config = {
    --     display = {
    --         open_fn = function()
    --             return require("packer.util").float({ border = "single" },
    --         end,
    --     },
    -- },
}

local opts = {}

require("lazy").setup(plugins, opts)
--  TODO: This is the line we need to get plugin specs
require("lazy").setup("pluginsNew")
require("plugins.vimtex")
