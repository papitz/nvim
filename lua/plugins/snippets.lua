HOME = os.getenv("HOME")
require("luasnip/loaders/from_vscode").lazy_load()

-- load snippets from the ~/.config/nvim/snippets/ directory for the corresponding language
require("luasnip/loaders/from_snipmate").lazy_load({
    path = {HOME .. "/.config/nvim/snippets"}
})

-- command to open the snippet file that belongs to the language you are editing
vim.cmd([[
function SnippetsEdit()
    execute ":e ~/.config/nvim/snippets/" . &filetype . ".snippets"
endfunction
command! SnippetsEdit call SnippetsEdit()
]])

local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.setup({
    store_selection_keys = "<Tab>",
    region_check_events = "CursorMoved",
    delete_check_events = "TextChanged"
})

ls.add_snippets("all", {
    snip({trig = "todo", name = "TODO_comment", dscr = "Add a TODO comment"}, {
        -- get the comment string of the buffer you are in and add a space to it
        func(function()
            return vim.api.nvim_buf_get_option(0, "commentstring"):match(
                       "^(.*)%%s")
        end, {}), text(" TODO: "), insert(0, "YOU REALLY NEED TO DO THIS"),
        func(function()
            local _, rightComment = vim.api.nvim_buf_get_option(0,
                                                                "commentstring"):match(
                                        "^(.*)%%s(.*)")
            return rightComment
        end, {})
    })
})
