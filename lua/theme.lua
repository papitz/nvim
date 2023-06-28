-- hide lines at the end of the buffer
vim.opt.fillchars = {eob = " "}

require("onedark").setup({ -- styles: dark, darker, cool, deep, warm and warmer.
    style = "darker"
})
require("onedark").load()

-- Add icons for lsp diagnostics sings

local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌵 ",
    Info = " "
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
