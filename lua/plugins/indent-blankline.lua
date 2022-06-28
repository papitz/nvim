-- indent-blankline character.
local indent_blankline_style = 1

local indent_blankline_styles = {
	"│",
	"¦",
	"┆",
	"▏",
	"⎸",
	"|",
}

require("indent_blankline").setup({
	blankline_char = indent_blankline_styles[indent_blankline_style],
	context_patterns = {
		"class",
		"function",
		"method",
		"^if",
		"^case",
		"^while",
		"^use",
		"^for",
	},
	buftype_exclude = { "terminal" },
	show_current_context = true,
	show_current_context_start = false,
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	filetype_exclude = {
		"help",
		"terminal",
		"dashboard",
		"packer",
		"lsp-installer",
		"lspinfo",
	},
})
