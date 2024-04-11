-- Defining alias for vim.opt.
local opt = vim.opt_local
HOME = os.getenv("HOME")
opt.tabstop = 2
opt.softtabstop = 2 -- set tab size
opt.shiftwidth = 2 -- affect amount of indentation
