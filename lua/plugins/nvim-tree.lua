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
		mappings = {
			list = {
				{ key = "<S-h>", cb = ":call ResizeLeft(3)<CR>" },
				{ key = "<C-h>", cb = tree_cb("toggle_dotfiles") },
				{ key = { "<CR>", "l", "<2-LeftMouse>" }, cb = tree_cb("edit") },
				{ key = "o", cb = tree_cb("system_open") },
				{ key = "E", cb = tree_cb("vsplit") },
				{ key = "s", cb = tree_cb("split") },
				{ key = "yy", cb = tree_cb("copy") },
				{ key = "c", cb = tree_cb("copy_name") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "<BS>", cb = tree_cb("dir_up") },
			},
		},
	},
	git = {
		enable = true,
		ignore = true, -- set to false if you want to see gitignored files in tree. Ignored can be toggled with I
		timeout = 500,
	},
})
