return {
	'saghen/blink.cmp',
	enabled = true,
	-- optional: provides snippets for the snippet source
	-- dependencies = { 'rafamadriz/friendly-snippets', { 'L3MON4D3/LuaSnip', version = 'v2.*' } },
	dependencies = { 'rafamadriz/friendly-snippets', 'moyiz/blink-emoji.nvim' },

	-- use a release tag to download pre-built binaries
	version = '*',
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		-- keymap = { preset = 'default' },

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono',
		},
		completion = {
			menu = { draw = { treesitter = { 'lsp' } } },
			-- menu = { border = 'single' },
			-- menu = {
			-- 	draw = {
			-- 		components = {
			-- 			kind_icon = {
			-- 				ellipsis = false,
			-- 				text = function(ctx)
			-- 					local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
			-- 					return kind_icon
			-- 				end,
			-- 				-- Optionally, you may also use the highlights from mini.icons
			-- 				highlight = function(ctx)
			-- 					local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
			-- 					return hl
			-- 				end,
			-- 			},
			-- 		},
			-- 	},
			-- },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = { border = 'single' },
			},
			list = { selection = { preselect = false, auto_insert = true } },
		},
		--  TODO: Lets see how this goes
		signature = { enabled = true, window = { border = 'single' } },

		--  TODO: Does not work yet :(
		snippets = { preset = 'luasnip' },
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
			cmdline = {},
			providers = {
        lsp = { score_offset = 30 },
        path = { score_offset = 20 },
        snippets = { score_offset = 15 },
				buffer = { score_offset = -10 },
				emoji = {
					module = 'blink-emoji',
					name = 'Emoji',
					score_offset = -50,
					opts = { insert = true },
				},
			},
		},
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = 'none',

			['<S-Tab>'] = { 'select_prev', 'fallback' },
			['<Tab>'] = { 'select_next', 'fallback' },
			['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
			['<C-e>'] = { 'hide', 'fallback' },
			['<CR>'] = { 'accept', 'fallback' },

			['<C-p>'] = { 'select_prev', 'fallback' },
			['<C-n>'] = { 'select_next', 'fallback' },

			['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

			['<C-j>'] = { 'snippet_forward', 'fallback' },
			['<C-k>'] = { 'snippet_backward', 'fallback' },
		},
	},
	opts_extend = { 'sources.default' },
}
