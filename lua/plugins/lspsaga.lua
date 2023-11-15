local saga = require("lspsaga")

saga.setup({
    code_action = {keys = {quit = "<ESC>", exec = "<CR>"}},
    lightbulb = {
        enable = true,
        sign = true,
        enable_in_insert = true,
        sign_priority = 20,
        virtual_text = false
    },
    finder = {
        keys = {
            shuttle = 'L',
            toggle_or_open = '<CR>',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = {'q', '<ESC>'},
            close = '<ESC>'
        },
        default = 'def+ref+imp'
    },
    ui = {
        -- currently only round theme
        theme = "round",
        -- this option only work in neovim 0.9
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = "rounded",
        winblend = 0,
        expand = " ",
        collapse = " ",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        kind = {}
    },
    --  TODO: This is a cool feature but slows down vim massively. Try again after some time (now 20.04.23)
    symbol_in_winbar = {
        enable = false,
        separator = " ",
        ignore_patterns = {},
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true
    }
})
