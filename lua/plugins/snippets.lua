require("luasnip/loaders/from_vscode").lazy_load()
-- command to open snippet file
vim.cmd([[
    function SnippetsEdit()
        let tmp_ft = &filetype
        :e ~/.config/nvim/lua/plugins/snippets.lua
        call search(tmp_ft)
        execute "normal! z\<cr>"
    endfunction
    command! SnippetsEdit call SnippetsEdit()
]])
-- vim.cmd("command SnippetsEdit let tmp_ft = &filetype | :e ~/.config/nvim/lua/plugins/snippets.lua | ")
local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.setup({ store_selection_keys = "<Tab>" }) -- TODO: check if this works
-- get the commentstring of the current buffer
ls.snippets = {
	all = {
		-- snippets go here
		-- TODO: add a todo snippet for all languages
		snip({
			trig = "todo",
			namr = "TODO_comment",
			dscr = "Create a TODO comment",
		}, {
			-- get the comment string of the buffer you are in and add a space to it
			func(function()
				return vim.api.nvim_buf_get_option(0, "commentstring"):match("^(.*)%%s") .. " "
			end, {}),
			text("TODO: "),
			insert(0, "YOU REALLY NEED TO DO THIS"),
		}),
	},
	markdown = {
		-- snippet to wrap selection in link. Press <TAB> on selection first
		snip({
			trig = "link",
			namr = "markdown_link",
			dscr = "Create markdown link [txt](url)",
		}, {
			text("["),
			insert(1),
			text("]("),
			func(function(_, snippet)
				return snippet.env.TM_SELECTED_TEXT[1] or {}
			end, {}),
			text(")"),
			insert(0),
		}),
	},
}
