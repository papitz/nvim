-- Defining alias for vim.opt.
local opt = vim.opt
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd
HOME = os.getenv("HOME")

opt.undodir = HOME .. "/.config/nvim/undodir" -- set undotree file directory
opt.undofile = true -- set undotree to save to file
opt.number = true -- enable line numbers
opt.numberwidth = 2 -- set the width of the numbers
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
opt.ignorecase = true -- set search to case insensitive
opt.smartcase = true -- set to be case sensitive when there is capital letter, this needs set incsearch to work
opt.incsearch = true -- for smartcase
opt.hidden = true -- so multiple buffers can be open
opt.updatetime = 250 -- update faster for autocompletion
opt.showmode = false -- set that vim mode is hidden, to incorporate for lightline plugin
opt.signcolumn = "yes" -- set the line numbers on a even width
opt.textwidth = 150 -- sets the number of characters in one line
opt.virtualedit = "onemore" -- allow the cursor to move past the last char on the line

-- splits open below an to the right
opt.splitbelow = true
opt.splitright = true

-- set foldmethod to treesitter

opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldtext =
--     [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
local function get_custom_foldtxt_suffix(foldstart)
    local fold_suffix_str = string.format(" [%s lines] %s",
                                          vim.v.foldend - foldstart + 1,
                                          vim.trim(
                                              vim.api
                                                  .nvim_buf_get_lines(0, vim.v
                                                                          .foldend -
                                                                          1,
                                                                      vim.v
                                                                          .foldend,
                                                                      false)[1]))

    return {fold_suffix_str, "Folded"}
end

local function get_custom_foldtext(foldtxt_suffix, foldstart)
    local line =
        vim.api.nvim_buf_get_lines(0, foldstart - 1, foldstart, false)[1]

    return {{line, "Normal"}, foldtxt_suffix}
end

_G.get_foldtext = function()
    local foldstart = vim.v.foldstart
    local ts_foldtxt = vim.treesitter.foldtext()
    local foldtxt_suffix = get_custom_foldtxt_suffix(foldstart)

    if type(ts_foldtxt) == "string" then
        return get_custom_foldtext(foldtxt_suffix, foldstart)
    else
        table.insert(ts_foldtxt, foldtxt_suffix)
        return ts_foldtxt
    end
end
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "v:lua.get_foldtext()"

opt.foldnestmax = 3
opt.foldminlines = 1
-- disable folding until the first fold command is used
opt.foldenable = false

-- set the german dictionary
vim.cmd("set dictionary+=/usr/share/dict/german")

-- true color support
opt.termguicolors = true

-- Setting time that Neovim wait after each keystroke.
-- opt.ttimeoutlen = 20
opt.timeoutlen = 500

-- Setting up autocomplete menu.
opt.completeopt = "menuone,noselect"

-- -- Auto open nvim-tree when writing (nvim .) in command line
-- -- and auto open Dashboard when nothing given as argument.
-- vim.cmd([[
-- if index(argv(), ".") >= 0
--   autocmd VimEnter * NvimTreeToggle
--   bd1
-- elseif len(argv()) == 0
--   autocmd VimEnter * Dashboard
-- endif
-- ]])

-- open vim on cwd of file
vim.cmd("autocmd BufEnter * silent! lcd %:p:h")

---Highlight yanked text

au("TextYankPost", {
    group = ag("yank_highlight", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({higroup = "IncSearch", timeout = 300})
    end
})

vim.cmd([[
if exists("g:neovide")
    inoremap <D-v> <esc>"+pA
    inoremap <D-v> <esc>"+pA
    nnoremap <c-CR> <cmd>Lspsaga code_action<CR>
    set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h14
    let g:neovide_hide_mouse_when_typing = v:false
    let g:neovide_input_use_logo = v:true
    let g:neovide_cursor_trail_size = 0.1
    let g:neovide_input_macos_alt_is_meta=v:false
endif
]])

-- Run Neoformat on save
-- vim.cmd([[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * Neoformat
-- augroup END
-- ]])
