-- remap function
local function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, {noremap = true, silent = true})
end

-- function for normal mode
local function nmap(shortcut, command) map("n", shortcut, command) end

-- function for insert mode
local function imap(shortcut, command) map("i", shortcut, command) end

-- function for visual mode
local function vmap(shortcut, command) map("v", shortcut, command) end

-- map leader to space
vim.g.mapleader = " "

-- map esc in normal mode to write and delete highlighting
nmap("<esc>", ":w<CR>:noh<CR>")

-- map semicolon to colon because we are lazy
vim.api.nvim_set_keymap("n", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("v", ";", ":", {noremap = true})

-- Better horizontal navigations
nmap("H", "^")
nmap("L", "$")

-- Panel switching
nmap("<leader>h", ":wincmd h<CR>")
nmap("<leader>j", ":wincmd j<CR>")
nmap("<leader>k", ":wincmd k<CR>")
nmap("<leader>l", ":wincmd l<CR>")
nmap("<leader>H", ":wincmd H<CR>")
nmap("<leader>J", ":wincmd J<CR>")
nmap("<leader>K", ":wincmd K<CR>")
nmap("<leader>L", ":wincmd L<CR>")

-- buffer switching
nmap("gb", ":BufferLinePick<CR>")
nmap("<leader>bx", ":BufferLinePickClose<CR>")

-- Split resizing
nmap("<C-Right>", "<C-w>>")
nmap("<C-Left>", "<C-w><")
nmap("<C-Up>", "<C-w>+")
nmap("<C-Down>", "<C-w>-")

-- remove seach highlighting
nmap("<leader>n", ":noh<CR>")

-- Split panel
nmap("<leader>v", "<C-w>v")
nmap("<leader>ws", "<C-w>s")

-- close panels
nmap("<leader>x", "<C-w>c")

-- Line moving
---- Normal mode
nmap("<C-j>", ":m .+1<CR>==")
nmap("<C-k>", ":m .-2<CR>==")
---- Insert mode
imap("<C-j>", "<ESC>:m .+1<CR>==gi")
imap("<C-k>", "<ESC>:m .-2<CR>==gi")
---- Visual mode
vmap("<C-j>", ":m '>+1<CR>gv=gv")
vmap("<C-k>", ":m '<-2<CR>gv=gv")

-- Remap for yanking into clipboard
nmap("<leader>y", '"+y')
nmap("<leader>p", '"+p')
-- in visual mode
vmap("<leader>y", '"+y')
vmap("<leader>p", '"+p')

-- paste with correct indent
nmap("p", "]p")

-- fix indentaion
nmap("<leader>i", "gg=G<C-o>")

-- navigate quickfix
nmap("<leader><leader>j", ":cn<CR>")
nmap("<leader><leader>k", ":cp<CR>")
nmap("<leader><leader>q", ":copen<CR>")
nmap("<leader><leader>l", ":.cc<CR>")

-- Markdown Preview control
nmap("<leader>m", ":MarkdownPreviewToggle<CR>")

-- map spelling
nmap("<F8>", ":setlocal spell spelllang=de,en <return>")
nmap("<F9>", ":set nospell <return>")

-- ctrl l to correct the last spelling mistake
imap("<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- open Lazygit window
nmap("<leader>g", ":LazyGit<CR>")

-- swap parameters around
nmap("<leader>sw", ":ISwap<CR>")

-- switch between the last two files with bs
nmap("<BS>", "<C-^>")

-- vimtex mappings
nmap("<leader>tt", ":VimtexCompile<CR>")
nmap("<leader>tv", ":VimtexView<CR>")
nmap("<leader>tc", ":VimtexTocToggle<CR>")
nmap("<leader>ts", ":VimtexStatus<CR>")
nmap("<leader>te", ":VimtexErros<CR>") -- opens the quickfix window where the errors are hidden

-- Telescope mappings
-- Function to use live grep project wide
local function project_live_grep()
require('telescope.builtin').live_grep({
    search_dirs = {require('util').findGitDirectory(vim.uv.cwd())}
})
end
local telescope_prefix = "<leader>f"
nmap(telescope_prefix .. "f", "<cmd>Telescope find_files<cr>")
nmap(telescope_prefix .. "p", "<cmd>Telescope git_files<cr>")
-- Grep local to cwd
nmap(telescope_prefix .. "i", "<cmd>Telescope live_grep<cr>")
-- Grep in project
nmap(telescope_prefix .. "g", project_live_grep)
nmap(telescope_prefix .. "b", "<cmd>Telescope buffers<cr>")
nmap(telescope_prefix .. "h", "<cmd>Telescope search_history<cr>")
nmap(telescope_prefix .. "c", "<cmd>Telescope command_history<cr>")
nmap(telescope_prefix .. "q", "<cmd>Telescope quickfix<cr>")
nmap(telescope_prefix .. "r", "<cmd>Telescope registers<cr>")
nmap(telescope_prefix .. "s", "<cmd>Telescope spell_suggest<cr>")
nmap(telescope_prefix .. "o", "<cmd>Telescope oldfiles<cr>")
nmap(telescope_prefix .. "m", "<cmd>Telescope marks<cr>")
nmap(telescope_prefix .. "k", "<cmd>Telescope keymaps<cr>")
nmap(telescope_prefix .. "l", "<cmd>Telescope lsp_references <cr>")

-- Dashboard mappings
nmap("<leader>fn", "<cmd>DashboardNewFile<cr>")

-- Comment mappings
nmap("<leader>c<leader>", ":CommentToggle<CR>")
vmap("<leader>c<leader>", ":CommentToggle<CR>")

-- NvimTree Toggle
-- nmap("<C-b>", ":NvimTreeToggle<CR>")
nmap("<C-b>", ":Neotree dir=./ toggle position=left <CR>")
vim.cmd(
    "autocmd! FileType dashboard nnoremap <buffer> <silent> <C-b> :Neotree dir=./ toggle position=float <CR>")

-- LSP Mappings
-- nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("<c-q>", ":lua vim.lsp.buf.hover()<CR>")
nmap("gi", ":lua vim.lsp.buf.implementation()<CR>")
-- nmap("<C-a>", ":lua vim.lsp.buf.signature_help()<CR>")
nmap("<leader>D", ":lua vim.lsp.buf.type_definition()<CR>")
-- nmap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("gE", ":lua vim.diagnostic.goto_prev()<CR>")
nmap("ge", ":lua vim.diagnostic.goto_next()<CR>")
nmap("<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>")
-- nmap("<A-CR>", ":lua vim.lsp.buf.code_action()<CR>")
-- nmap("<A-CR>", ":CodeActionMenu <CR>")

-- Lspsaga Mappings
-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
nmap("gh", "<cmd>Lspsaga finder<CR>")

-- Code action
nmap("<A-CR>", "<cmd>Lspsaga code_action<CR>")
vmap("<A-CR>", "<cmd><C-U>Lspsaga range_code_action<CR>")

-- Rename
nmap("<leader>rn", "<cmd>Lspsaga rename<CR>")

-- Definition preview
nmap("gD", "<cmd>Lspsaga peek_definition<CR>")

-- Jump to definition
nmap("gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show line diagnostics
nmap("<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostic
nmap("Q", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnsotic jump can use `<c-o>` to jump back
nmap("]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
nmap("[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

-- Obsidian Mappings
local obsidian_prefix = "<leader>o"
nmap(obsidian_prefix .. "o", ":ObsidianOpen<CR>")
nmap(obsidian_prefix .. "s", ":ObsidianSearch<CR>")
nmap(obsidian_prefix .. "t", ":ObsidianTemplate<CR>")
nmap(obsidian_prefix .. "b", ":ObsidianBacklinks<CR>")
nmap(obsidian_prefix .. "n", ":ObsidianNew<CR>")
-- override the 'gf' keymap to utilize Obsidian's search functionality.
vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, {noremap = false, expr = true})

-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Show diagnostics
map("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Flutter Developement
local flutter_prefix = "<leader>F"
nmap(flutter_prefix .. "a", "<cmd>FlutterRun<CR>")
nmap(flutter_prefix .. "e", "<cmd>FlutterEmulators<CR>")
nmap(flutter_prefix .. "q", "<cmd>FlutterQuit<CR>")
nmap(flutter_prefix .. "r", "<cmd>FlutterReload<CR>")
nmap(flutter_prefix .. "R", "<cmd>FlutterRestart<CR>")
nmap(flutter_prefix .. "D", "<cmd>FlutterVisualDebug<CR>")
nmap(flutter_prefix .. "F", "<cmd>FlutterCopyProfilerUrl<CR>")
-- ToggleTerm
map("n", "<C-t>", ":ToggleTerm dir=%:p:h<CR>")
map("t", "<C-t>", ":ToggleTerm dir=%:p:h<CR>")
map("n", "v:count1 <C-t>", ":v:count1" .. '"ToggleTerm"<CR>')
map("v", "v:count1 <C-t>", ":v:count1" .. '"ToggleTerm"<CR>')
function _G.set_terminal_keymaps()
    map("t", "<leader><esc>", "<C-\\><C-n>")
    map("t", "<C-t>", "<C-\\><C-n>:ToggleTerm dir=%:p:h<CR>")
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Code formatter.
nmap("<leader>fr", ":Neoformat<CR>")

-- Dap debugger
-- nmap("<leader>br", ":lua require('dap').toggle_breakpoint()<CR>")
-- nmap("<leader>co", ":lua require('dap').continue()<CR>")
-- nmap("<leader>so", ":lua require('dap').step_over()<CR>")
-- nmap("<leader>si", ":lua require('dap').step_into()<CR>")
-- nmap("<leader>re", ":lua require('dap').repl.open()<CR>")
-- nmap("<leader>re", ":lua require('dap').repl.open()<CR>")
-- nmap("<c-x>", ':lua require("dapui").toggle()<CR>')

-- Session saving and loading
nmap("<Leader>ss", ":<C-u>SessionSave<CR>")
nmap("<Leader>sl", ":<C-u>SessionLoad<CR>")

-- Edit the snippet files
nmap("<Leader>se", ":SnippetsEdit<CR>")

-- shortcut to write and close all buffers
nmap("ZA", ":wqa<CR>")

-- searching with leap
nmap("<Leader>a", "<Plug>(leap-forward)")
nmap("<Leader>A", "<Plug>(leap-backward)")

-- spell suggest
-- nmap("\\s", "a<C-X><C-S>")

-- clear all notifications
nmap("<Leader><Leader>x", ":lua require('notify').dismiss()<cr>")

-- toggle virtual text
function Virtual_text_toggle()
    vim.diagnostic.config({
        virtual_text = not vim.diagnostic.config().virtual_text
    })
    print("Virtual Text " ..
              (vim.diagnostic.config().virtual_text and "enabled" or "disabled"))
end
vim.cmd([[ command! VirtualTextToggle lua Virtual_text_toggle()]])
nmap("<Leader>u", ":VirtualTextToggle<CR>")

-- Compile and run code
map("n", "<F7>", ":CompileAndRun<CR>")
map("i", "<F7>", "<ESC>:CompileAndRun<CR>")

-- Neorg maps
map("n", "<Leader>Ni", ":Neorg inject-metadata<CR>")

-- Doge
nmap("<leader>d", ":DogeGenerate<CR>")
-- grapple.nvim
nmap("<leader>!", require("grapple").toggle)
nmap("<leader><Tab>", require("grapple").cycle_forward)
nmap("<leader><S-Tab>", require("grapple").cycle_forward)
nmap("<leader>G", function() require("grapple").popup_tags() end)

for i = 1, 9 do
    nmap("<leader>" .. i, function() require("grapple").select({key = i}) end)
end
