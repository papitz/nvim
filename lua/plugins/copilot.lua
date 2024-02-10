-- vim.keymap.set('i', '<C-h>', 'copilot#Accept("\\<CR>")',
--                {expr = true, replace_keycodes = false})
-- vim.g.copilot_no_tab_map = true
-- return {"github/copilot.vim"}
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                -- This controls if copilot is triggered on input
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<M-l>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>"
                }
            },
            filetypes = {
                yaml = false,
                markdown = false,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = true
            }
        })
    end
}
