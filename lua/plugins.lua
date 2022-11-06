local use = require("packer").use

return require("packer").startup({
	function()
		-- packer itself
		use({ "wbthomason/packer.nvim" })

		-- color scheme
		use({ "navarasu/onedark.nvim" })

		-- File explorer tree.
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = {
				"NvimTreeOpen",
				"NvimTreeFocus",
				"NvimTreeToggle",
			},
			config = function()
				require("plugins/nvim-tree")
			end,
		})

		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("plugins/neo-tree")
			end,
		})

		-- Window Picker
		use({
			"s1n7ax/nvim-window-picker",
			tag = "v1.*",
			config = function()
				require("window-picker").setup()
			end,
		})

		-- Bufferline.
		use({
			"akinsho/nvim-bufferline.lua",
			after = "nvim-web-devicons",
			config = function()
				require("plugins/bufferline")
			end,
		})

		-- Statusline.
		use({
			"nvim-lualine/lualine.nvim",
			-- after = "nvim-gps",
			after = "nvim-bufferline.lua",
			config = function()
				require("plugins/lualine")
			end,
		})

		-- a rainbow bracket extension for treesitter
		use({
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
		})

		use({
			"nvim-treesitter/nvim-treesitter-context",
			after = "nvim-treesitter",
		})

		-- TreeSitter.
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = "BufEnter",
			cmd = {
				"TSInstall",
				"TSInstallSync",
				"TSBufEnable",
				"TSBufToggle",
				"TSEnableAll",
				"TSInstallFromGrammer",
				"TSToggleAll",
				"TSUpdate",
				"TSUpdateSync",
			},
			config = function()
				require("plugins/treesitter")
			end,
		})

		-- Colorizer (for highlighting color codes).
		use({
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = function()
				require("plugins/colorize")
				vim.cmd("ColorizerAttachToBuffer")
			end,
		})

		-- Startup screen.
		use({
			"glepnir/dashboard-nvim",
			config = function()
				require("plugins/dashboard")
			end,
		})

		-- Fuzzy finder and its requirments.
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-telescope/telescope.nvim" })

		-- LSP, LSPInstaller and snippets
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		})

		-- LSP GPS (show context in statusline) comment in to enable
		-- use({
		-- 	"SmiteshP/nvim-navic",
		-- 	requires = "neovim/nvim-lspconfig",
		-- 	config = function()
		-- 		require("plugins/navic")
		-- 	end,
		-- })

		use({
			"glepnir/lspsaga.nvim",
			config = function()
				require("plugins/lspsaga")
			end,
		})
		use({ "rafamadriz/friendly-snippets" })
		use({ "Neevash/awesome-flutter-snippets" })
		use({
			"hrsh7th/nvim-cmp",
			requires = {
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
		})
		use({
			"L3MON4D3/LuaSnip",
			after = "nvim-cmp",
			config = function()
				require("plugins/snippets")
			end,
		})
		use({
			"saadparwaiz1/cmp_luasnip",
			after = "LuaSnip",
		})

		-- Vim Lua LSP
		use({ "folke/neodev.nvim" })

		-- LSP signature.
		use({
			"ray-x/lsp_signature.nvim",
			config = function()
				require("plugins/lsp_signature")
			end,
		})

		-- VsCode like pictograms for lsp.
		use({ "onsails/lspkind-nvim" })

		-- popup menu
		use({ "RishabhRD/popfix" })
		use({
			"hood/popui.nvim",
			after = "popfix",
			config = function()
				vim.ui.select = require("popui.ui-overrider")
			end,
		})

		-- Debugger -- TODO: take care of this when we need it for the first time
		-- use({ "mfussenegger/nvim-dap" })
		-- use({
		-- 	"Pocco81/DAPInstall.nvim",
		-- 	config = function()
		-- 		require("plugins/dap")
		-- 	end,
		-- })
		-- use({
		-- 	"rcarriga/nvim-dap-ui",
		-- 	config = function()
		-- 		require("plugins/dap")
		-- 	end,
		-- })

		-- This plugin adds indentation guides to all lines (including empty lines).
		use({
			"lukas-reineke/indent-blankline.nvim",
			-- event = "BufRead",
			after = "nvim-treesitter",
			config = function()
				require("plugins/indent-blankline")
			end,
		})

		-- Code formatter.
		use({
			"sbdchd/neoformat",
			cmd = "Neoformat",
			setup = function()
				require("plugins/neoformat")
			end,
		})

		-- Icons.
		use({
			"kyazdani42/nvim-web-devicons",
			event = "BufEnter",
		})

		-- Terminal.
		use({
			"akinsho/nvim-toggleterm.lua",
			cmd = "ToggleTerm",
			config = function()
				require("plugins/toggleterm")
			end,
		})

		-- Git support for nvim.
		use({
			"tpope/vim-fugitive",
		})

		-- Git signs.
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function()
				require("plugins/gitsigns")
			end,
		})

		-- Auto closes.
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})

		-- This is for html and it can autorename too!
		use({
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
		})

		-- todo-comments is a lua plugin for Neovim to highlight and search for
		-- todo comments like TODO, HACK, BUG in code base.
		use({
			"folke/todo-comments.nvim",
			event = "BufEnter",
			config = function()
				require("plugins/todo-comments")
			end,
		})

		-- WhichKey is a lua plugin that displays a popup with possible
		-- key bindings of the command you started typing.
		use({
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
		})

		-- Neovim plugin to comment text in and out.
		-- Supports commenting out the current line, a visual selection and a motion.
		use({
			"terrortylor/nvim-comment",
			cmd = "CommentToggle",
			config = function()
				require("nvim_comment").setup()
			end,
		})

		-- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text. Like if/else etc.
		use({ "andymass/vim-matchup" })

		-- plugin to surround selections with things like brackets
		use({ "tpope/vim-surround" })

		-- git client
		use({ "kdheepak/lazygit.nvim" })

		-- fast movement
		use({
			"ggandor/leap.nvim",
			config = function()
				require("leap").set_default_keymaps()
			end,
		})

		-- swap parameters around
		use({
			"mizlan/iswap.nvim",
			after = "nvim-treesitter",
		})

		-- markdown preview in browser
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && yarn install",
		})

		-- auto generate doc strings
		use({
			"kkoomen/vim-doge",
			run = function()
				vim.fn["doge#install"]()
			end,
		})

		-- notifications
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("plugins/notify")
			end,
		})

		-- faster filetype recognition
		use({ "nathom/filetype.nvim" })

		-- flutter developement
		use({
			"akinsho/flutter-tools.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("plugins/flutter-tools")
			end,
		})

		-- latex plugin
		use({
			"lervag/vimtex",
		})

		-- Import settings of plugins or start plugins.
		require("plugins.vimtex")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
