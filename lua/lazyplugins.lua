local plugins = {
	-- quicker lua loading
	{ "lewis6991/impatient.nvim" },

	-- color scheme
	{ "navarasu/onedark.nvim", lazy = false, priority = 1000 },

	-- File explorer tree.
	{
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeOpen", "NvimTreeFocus", "NvimTreeToggle" },
		config = function()
			require("plugins/nvim-tree")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins/neo-tree")
		end,
	},

	-- Window Picker
	{
		"s1n7ax/nvim-window-picker",
		-- tag = "v1.*",
		config = function()
			require("window-picker").setup()
		end,
	},

	-- Bufferline.
	{
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("plugins/bufferline")
		end,
	},

	{ "WhoIsSethDaniel/lualine-lsp-progress.nvim" },
	-- Statusline.
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins/lualine")
		end,
	},

	-- a rainbow bracket extension for treesitter
	{ "p00f/nvim-ts-rainbow" },

	-- neorg
	{
		"nvim-neorg/neorg",
		ft = "norg",
		dependencies = "nvim-lua/plenary.nvim",
		-- build = ":Neorg sync-parsers",
		config = function()
			require("plugins/neorg")
		end,
	},

	-- Drawing Venn Diagramms in Neorg
	{ "jbyuki/venn.nvim", ft = "norg" },

	{
		"anuvyklack/hydra.nvim",
		config = function()
			require("plugins/hydra")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
	},

	-- TreeSitter.
	{
		"nvim-treesitter/nvim-treesitter",
		-- build = ":TSUpdate",
		config = function()
			require("plugins/treesitter")
		end,
	},

	-- Colorizer (for highlighting color codes).
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("plugins/colorize")
			vim.cmd("ColorizerAttachToBuffer")
		end,
	},

	-- Startup screen.
	{
		"glepnir/dashboard-nvim",
		config = function()
			require("plugins/dashboard")
		end,
	},

	-- Fuzzy finder and its requirments.
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },

	-- LSP, LSPInstaller and snippets
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	-- LSP GPS (show context in statusline) comment in to enable
	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		require("plugins/navic")
	-- 	end,
	-- },

	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("plugins/lspsaga")
		end,
	},
	{ "rafamadriz/friendly-snippets" },
	{ "Neevash/awesome-flutter-snippets" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
		},
		config = function()
			require("plugins/cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugins/snippets")
		end,
	},
	{ "saadparwaiz1/cmp_luasnip" },

	-- Vim Lua LSP
	{ "folke/neodev.nvim" },

	-- LSP signature.
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("plugins/lsp_signature")
		end,
	},

	-- VsCode like pictograms for lsp.
	{ "onsails/lspkind-nvim" },

	-- popup menu
	{ "RishabhRD/popfix" },
	{
		"hood/popui.nvim",
		config = function()
			vim.ui.select = require("popui.ui-overrider")
		end,
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
		-- event = "BufRead",
		config = function()
			require("plugins/indent-blankline")
		end,
	},

	-- Code formatter.
	{
		"sbdchd/neoformat",
		cmd = "Neoformat",
		config = function()
			require("plugins/neoformat")
		end,
	},

	-- Icons.
	{ "kyazdani42/nvim-web-devicons", event = "BufEnter" },

	-- Terminal.
	{
		"akinsho/nvim-toggleterm.lua",
		cmd = "ToggleTerm",
		config = function()
			require("plugins/toggleterm")
		end,
	},

	-- Git support for nvim.
	{ "tpope/vim-fugitive" },

	-- Git signs.
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins/gitsigns")
		end,
	},

	-- Auto closes.
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- This is for html and it can autorename too!
	{ "windwp/nvim-ts-autotag" },

	-- todo-comments is a lua plugin for Neovim to highlight and search for
	-- todo comments like TODO, HACK, BUG in code base.
	{
		"folke/todo-comments.nvim",
		event = "BufEnter",
		config = function()
			require("plugins/todo-comments")
		end,
	},

	-- WhichKey is a lua plugin that displays a popup with possible
	-- key bindings of the command you started typing.
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				icons = {
					breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					separator = "➜ ", -- symbol used between a key and it's label
					group = "+", -- symbol prepended to a group
				},
			})
		end,
	},

	-- Neovim plugin to comment text in and out.
	-- Supports commenting out the current line, a visual selection and a motion.
	{
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup()
		end,
	},

	-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text. Like if/else etc.
	{ "andymass/vim-matchup" },

	-- plugin to surround selections with things like brackets
	{ "tpope/vim-surround" },

	-- git client
	{ "kdheepak/lazygit.nvim" },

	-- fast movement
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	},

	-- swap parameters around
	{ "mizlan/iswap.nvim" },

	-- markdown preview in browser
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = "cd app && yarn install",
	},

	-- auto generate doc strings
	{
		"kkoomen/vim-doge",
		build = function()
			vim.fn["doge#install"]()
		end,
	},

	-- notifications
	{
		"rcarriga/nvim-notify",
		config = function()
			require("plugins/notify")
		end,
	},


	-- flutter developement
	{
		"akinsho/flutter-tools.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		-- ft = "dart",
		config = function()
			require("plugins/flutter-tools")
		end,
	},

	-- jumping between files on a project basis
	{ "cbochs/grapple.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- latex plugin
	{ "lervag/vimtex", ft = "tex" },
	{ "barreiroleo/ltex-extra.nvim" },

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