require("luasnip/loaders/from_vscode").lazy_load()
-- command to open snippet file
vim.cmd([[
function SnippetsEdit()
let tmp_ft = &filetype
:e ~/.config/nvim/lua/plugins/snippets.lua
call search(tmp_ft . " = {")
execute "normal! z\<cr>"
endfunction
command! SnippetsEdit call SnippetsEdit()
]])
vim.cmd("autocmd BufWritePost */snippets.lua :source $MYVIMRC")
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
ls.snippets = {
	--[[
snippets go here like this:
<LANGUAGE> = {
snip({
trig = "TRIGGER",
namr = "NAME",
dscr = "DESCRIPTION",
}, {
text("TEXT HERE")
})
}
]]
	all = {
		snip({
			trig = "todo",
			name = "TODO_comment",
			dscr = "Add a TODO comment",
		}, {
			-- get the comment string of the buffer you are in and add a space to it
			func(function()
				return vim.api.nvim_buf_get_option(0, "commentstring"):match("^(.*)%%s") .. " "
			end, {}),
			text(" TODO: "),
			insert(0, "YOU REALLY NEED TO DO THIS"),
			func(function()
				local _, rightComment = vim.api.nvim_buf_get_option(0, "commentstring"):match("^(.*)%%s(.*)")
				return rightComment
			end, {}),
		}),
	},
	markdown = {
		-- snippet to wrap selection in link. Press <TAB> on selection first
		snip({
			trig = "link",
			name = "markdown link",
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
	lua = {
		snip({
			trig = "snip",
			name = "snippet",
			dscr = "Snippet to create snippets",
		}, {
			text({
				"snip({",
				'    trig = "',
			}),
			insert(1, "TRIGGER"),
			text({
				'",',
				'    name = "',
			}),
			insert(2, "NAME"),
			text({
				'",',
				'    dscr = "',
			}),
			insert(3, "DESCRIPTION"),
			text({
				'",',
				"}, {",
				"",
			}),
			insert(0, "SNIPPET LOGIC HERE"),
			text({
				"",
				"}),",
			}),
		}),
	},
	tex = {
		snip({
			trig = "rarrow",
			name = "Right arrow",
			dscr = "add a right arrow thats wrapped in $",
		}, {
			text({ "$\\rightarrow$" }),
		}),
		snip({
			trig = "glq",
			name = "'",
			dscr = "German left single quotes",
		}, {
			text("\\glq{}"),
		}),
		snip({
			trig = "grq",
			name = "'",
			dscr = "German right single quotes",
		}, {
			text("\\grq{}"),
		}),
		snip({
			trig = "glqq",
			name = '"',
			dscr = "German left double quotes",
		}, {
			text("\\glqq{}"),
		}),
		snip({
			trig = "grqq",
			name = '"',
			dscr = "German right double quotes",
		}, {
			text("\\grqq{}"),
		}),
		snip({
			trig = "q",
			name = "'TEXT HERE'",
			dscr = "German single quote environment",
		}, {
			text("\\glq{}"),
			insert(0, "Text here"),
			text("\\grq{}"),
		}),
		snip({
			trig = "qq",
			name = '"TEXT HERE"',
			dscr = "German double quote environment",
		}, {
			text("\\glqq{}"),
			insert(0, "Text here"),
			text("\\grqq{}"),
		}),
		snip({
			trig = "fn",
			name = "footnote",
			dscr = "\\footnote{}",
		}, {
			text("\\footnote{"),
			insert(0),
			text("}"),
		}),
	},
}
