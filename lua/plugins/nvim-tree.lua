local present, nvimtree = pcall(require, "nvim-tree")
if not present then
	return
end
local tree_cb = require("nvim-tree.config").nvim_tree_callback

nvimtree.setup({
	open_on_tab = false,
	update_cwd = false,
	renderer = {
		indent_markers = {
			enable = true,
		},
		highlight_git = false,
		highlight_opened_files = "name", --Value can be `"none"`, `"icon"`, `"name"` or `"all"
		add_trailing = false,
	},
	hijack_directories = {
		enable = false,
		auto_open = false,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = true,
		custom = { "node_modules", ".git", ".cache", "__pycache__" },
	},
	view = {
		width = "15%",
		side = "left",
		-- TODO: Fix after this is properly merged
		mappings = {
			list = {
				{ key = "<S-h>", action = ":call ResizeLeft(3)<CR>" },
				{ key = "<C-h>", action = "toggle_dotfiles" },
				{ key = { "<CR>", "l", "<2-LeftMouse>" }, action = "edit" },
				{ key = "o", action = "system_open" },
				{ key = "E", action = "vsplit" },
				{ key = "s", action = "split" },
				{ key = "yy", action = "copy" },
				{ key = "c", action = "copy_name" },
				{ key = "h", action = "close_node" },
				{ key = "<BS>", action = "dir_up" },
			},
		},
	},
	git = {
		enable = true,
		ignore = true, -- set to false if you want to see gitignored files in tree. Ignored can be toggled with I
		timeout = 500,
	},
})
