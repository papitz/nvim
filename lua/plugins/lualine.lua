local present, lualine = pcall(require, "lualine")
if not present then
	return
end

local lualine_style = 4

local lualine_styles = {
	{
		{ left = " ", right = " " },
		{ left = "│", right = "│" },
	},
	{
		{ left = " ", right = "" },
		{ left = " ", right = " " },
	},
	{
		{ left = "", right = "" },
		{ left = " ", right = " " },
	},
	{
		{ left = "", right = "" },
		{ left = "", right = "" },
	},
	{
		{ left = "", right = "" },
		{ left = " ", right = " " },
	},
}

lualine.setup({
	options = {
		theme = "auto",
		disabled_filetypes = {
			"toggleterm",
			"NvimTree",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dap-repl",
		},
		section_separators = lualine_styles[lualine_style][1],
		component_separators = lualine_styles[lualine_style][2],
	},
	extensions = { "fugitive" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
