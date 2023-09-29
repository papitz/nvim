-- indent-blankline character.
local indent_blankline_style = 1

local indent_blankline_styles = {"│", "¦", "┆", "▏", "⎸", "|"}

local ibl = require("ibl")
ibl.setup {
    indent = {char = indent_blankline_styles[indent_blankline_style]},
    context_patterns = {
        "class", "function", "method", "^if", "^case", "^while", "^use", "^for"
    },
    --  TODO: This needs some working but might be picked up by the colorscheme
    scope = {enabled = true, show_start = false, show_end = false},
    whitespace = {remove_blankline_trail = true},
    -- show_first_indent_level = false,
    exclude = {
        buftypes = {
            "help", "terminal", "dashboard", "packer", "mason", "lspinfo",
            "norg"
        }
    }
}
