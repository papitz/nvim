local lsp_signature = require("lsp_signature")

lsp_signature.setup({
	floating_window_above_cur_line = true,
	floating_window = true,
	hint_enable = false, -- enables a type hint
	always_trigger = true,
	doc_lines = 0,
	max_height = 4,
	max_width = 60,
})
