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

vim.g.indent_blankline_char = indent_blankline_styles[indent_blankline_style]

-- Disable indent-blankline on these pages.
vim.g.indent_blankline_filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lsp-installer",
    "lspinfo",
}
vim.g.indent_blankline_buftype_exclude = { "terminal" }
vim.g.indent_blankline_context_patterns = {
    'class',
    'function',
    'method',
    '^if',
    '^case',
    '^while',
    '^for'
}
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
