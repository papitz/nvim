local present, cmp = pcall(require, "cmp")
if not present then return end
local lspkind = require("lspkind")
local types = require("cmp.types")
local str = require("cmp.utils.str")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end

cmp.setup({
    window = {
        completion = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
            scrollbar = true
        },
        documentation = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
            scrollbar = true
        }
    },
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end
    },
    formatting = {
        -- format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                -- Get the full snippet (and only keep first line)
                local word = entry:get_insert_text()
                if entry.completion_item.insertTextFormat ==
                    types.lsp.InsertTextFormat.Snippet then
                    word = vim.lsp.util.parse_snippet(word)
                end
                word = str.oneline(word)

                -- concatenates the string
                -- local max = 50
                -- if string.len(word) >= max then
                -- 	local before = string.sub(word, 1, math.floor((max - 3) / 2))
                -- 	word = before .. "..."
                -- end

                if entry.completion_item.insertTextFormat ==
                    types.lsp.InsertTextFormat.Snippet and
                    string.sub(vim_item.abbr, -1, -1) == "~" then
                    word = word .. "~"
                end
                vim_item.abbr = word

                return vim_item
            end
        })
    },
    mapping = {
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
        ["<C-e>"] = cmp.mapping(cmp.mapping.close()),
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false
        })),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item()
                -- elseif require("luasnip").expand_or_jumpable() then
                -- 	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
                -- elseif require("luasnip").jumpable(-1) then
                -- 	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end),
        ["<C-J>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-expand-or-jump", true, true,
                                    true), "")
            else
                fallback()
            end
        end),
        ["<C-K>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                    "<Plug>luasnip-jump-prev", true, true, true),
                                "")
            else
                fallback()
            end
        end)
    },
    sources = {
        {name = "luasnip"}, {name = "buffer"}, {name = "path"},
        {name = "nvim_lsp"}, {name = "calc"}, {name = "nvim_lua"}
    }
})
