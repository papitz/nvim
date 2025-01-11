return {
	'hrsh7th/nvim-cmp',
  enabled = true,
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-calc',
		'onsails/lspkind-nvim',
	},
	opts = function()
		local cmp = require('cmp')
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
		end

		return {
			-- comment in if you want a border around the completion window
			-- window = {
			--     completion = {
			--         border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
			--         scrollbar = true
			--     },
			--     documentation = {
			--         border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
			--         scrollbar = true
			--     }
			-- },
			formatting = {
				-- format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
				format = require('lspkind').cmp_format({ with_text = true, maxwidth = 50 }),
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
					-- 	vim.snippet.expand(args.body)
				end,
			},
			mapping = {
				['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
				['<C-e>'] = cmp.mapping(cmp.mapping.close()),
				['<CR>'] = cmp.mapping(cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = false,
				})),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() and has_words_before() then
            print('selecting')
						cmp.select_next_item()

						-- elseif require("luasnip").expand_or_jumpable() then
						-- 	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
					else
						fallback()
					end
				end),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
						-- elseif require("luasnip").jumpable(-1) then
						-- 	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
					else
						fallback()
					end
				end),
				['<C-J>'] = cmp.mapping(function(fallback)
					if require('luasnip').jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
					else
						fallback()
					end
				end),
				['<C-K>'] = cmp.mapping(function(fallback)
					if require('luasnip').jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
					else
						fallback()
					end
				end),
			},
			sources = {
				{ name = 'luasnip' },
				-- { name = 'snippets' },
				{ name = 'path' },
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'calc' },
				{ name = 'nvim_lua' },
			},
		}
	end,
}
