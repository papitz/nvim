-- hide lines at the end of the buffer
vim.opt.fillchars = { eob = " " }

vim.g.onedark_style = "dark"     -- styles: dark, darker, cool, deep, warm and warmer.
vim.cmd("colorscheme onedark")


-- Add icons for lsp diagnostics sings
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
