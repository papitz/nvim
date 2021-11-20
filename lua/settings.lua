-- Defining alias for vim.opt.
local opt = vim.opt
HOME = os.getenv("HOME")

opt.undodir = HOME .. "/.config/nvim/undodir" -- set undotree file directory
opt.undofile = true -- set undotree to save to file
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true -- set line number
opt.wrap = true -- set no soft wrap
opt.linebreak = true -- only break at words
opt.list = false -- so softwrapping works
opt.tabstop = 4
opt.softtabstop = 4 -- set tab size
opt.shiftwidth = 4 -- affect amount of indentation
opt.expandtab = true -- set that tab will insert softabstop amount of space characters
opt.mouse = "a" -- enable clicking with the mouse
opt.writebackup = false -- set to never save backup
opt.swapfile = false -- set no swap file
opt.backup = false -- set no backup file
opt.breakindent = true -- set every wrapped line will continue visually indented
opt.smartindent = true -- set smart indentation
opt.ignorecase = true --set search to case insensitive
opt.smartcase = true -- set to be case sensitive when there is capital letter, this needs set incsearch to work
opt.incsearch = true -- for smartcase
opt.hidden = true -- so multiple buffers can be open
opt.updatetime = 250 -- update faster for autocompletion
opt.showmode = false -- set that vim mode is hidden, to incorporate for lightline plugin
opt.signcolumn = "yes" -- set the line numbers on a even width

-- splits open below an to the right
opt.splitbelow = true
opt.splitright = true

-- set the german dictionary
vim.cmd("set dictionary+=/usr/share/dict/german")

--true color support
opt.termguicolors = true

-- Setting time that Neovim wait after each keystroke.
-- opt.ttimeoutlen = 20
opt.timeoutlen = 500

-- Setting up autocomplete menu.
opt.completeopt = "menuone,noselect"

-- Auto open nvim-tree when writing (nvim .) in command line
-- and auto open Dashboard when nothing given as argument.
vim.cmd([[
if index(argv(), ".") >= 0
  autocmd VimEnter * NvimTreeToggle
  bd1
elseif len(argv()) == 0
  autocmd VimEnter * Dashboard
endif
]])

-- open vim on cwd of file
vim.cmd("autocmd BufEnter * silent! lcd %:p:h")
