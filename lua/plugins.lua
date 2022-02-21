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

		-- Bufferline.
		use({
			"akinsho/nvim-bufferline.lua",
			after = "nvim-web-devicons",
			config = function()
				require("plugins/bufferline")
			end,
		})

		-- show in which scope you are in the statusline
		-- use({
		-- 	"SmiteshP/nvim-gps",
		-- 	after = "nvim-bufferline.lua",
		-- 	requires = "nvim-treesitter/nvim-treesitter",
		-- 	config = function()
		-- 		require("nvim-gps").setup()
		-- 	end,
		-- })

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
			cmd = {
				"Dashboard",
				"DashboardChangeColorscheme",
				"DashboardFindFile",
				"DashboardFindHistory",
				"DashboardFindWord",
				"DashboardNewFile",
				"DashboardJumpMarks",
				"SessionLoad",
				"SessionSave",
			},
			setup = function()
				require("plugins/dashboard")
			end,
		})

		-- Fuzzy finder and it requirments.
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-telescope/telescope.nvim" })

		-- LSP, LSPInstaller and snippets
		use({ "neovim/nvim-lspconfig" })
		use({ "williamboman/nvim-lsp-installer" })
		use({
			"rafamadriz/friendly-snippets",
		})
		use({
			"hrsh7th/nvim-cmp",
			after = "friendly-snippets",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
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
		use({
			"hrsh7th/cmp-buffer",
			after = "cmp_luasnip",
		})
		use({
			"hrsh7th/cmp-path",
			after = "cmp-buffer",
		})
		use({
			"hrsh7th/cmp-nvim-lua",
			after = "cmp-nvim-lsp",
		})

		-- Vim Lua LSP
		use({ "folke/lua-dev.nvim" })

		-- LSP signature.
		use({ "ray-x/lsp_signature.nvim" })

		-- VsCode like pictograms for lsp.
		use({ "onsails/lspkind-nvim" })

		-- -- pretty code action menu
		-- require("packer").use({
		-- 	"weilbith/nvim-code-action-menu",
		-- 	cmd = "CodeActionMenu",
		-- })
		use("RishabhRD/popfix")
		use({
			"hood/popui.nvim",
			after = "popfix",
			config = function()
				vim.ui.select = require("popui.ui-overrider")
			end,
		})

		-- Debugger
		use({ "mfussenegger/nvim-dap" })
		use({
			"Pocco81/DAPInstall.nvim",
			config = function()
				require("plugins/dap")
			end,
		})
		use({
			"rcarriga/nvim-dap-ui",
			config = function()
				require("plugins/dap")
			end,
		})

		-- This plugin adds indentation guides to all lines (including empty lines).
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			setup = function()
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
