-- remap function
local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- function for normal mode
local function nmap(shortcut, command)
	map("n", shortcut, command)
end

-- function for insert mode
local function imap(shortcut, command)
	map("i", shortcut, command)
end

-- function for visual mode
local function vmap(shortcut, command)
	map("v", shortcut, command)
end

-- map leader to space
vim.g.mapleader = " "

-- map semicolon to colon because we are lazy
nmap(";", ":")
vmap(";", ":")

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
nmap("<leader>m", "<Plug>MarkdownPreview")

-- map spelling
nmap("<F8>", ":setlocal spell spelllang=de,en <return>")
nmap("<F9>", ":set nospell <return>")

-- ctrl l to correct the last spelling mistake
imap("<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- open Lazygit window
nmap("<silent>", "<leader>g :LazyGit<CR>")

-- swap parameters around
nmap("<leader>sw", ":ISwap<CR>")

-- switch between the last two files with bs
nmap("<BS>", "<C-^>")

-- vimtex mappings
nmap("<leader>tt", ":VimtexCompile<CR>")
nmap("<leader>tv", ":VimtexView<CR>")
nmap("<leader>tc", ":VimtexTocToggle<CR>")
nmap("<leader>te", ":VimtexErrors<CR>")

-- Telescope mappings
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope search_history<cr>")
nmap("<leader>fc", "<cmd>Telescope command_history<cr>")
nmap("<leader>fq", "<cmd>Telescope quickfix<cr>")
nmap("<leader>fr", "<cmd>Telescope registers<cr>")
nmap("<leader>fs", "<cmd>Telescope spell_suggest<cr>")
nmap("<leader>fo", "<cmd>Telescope oldfiles<cr>")
nmap("<leader>fm", "<cmd>Telescope marks<cr>")

-- Dashboard mappings
nmap("<leader>fn", "<cmd>DashboardNewFile<cr>")

-- Comment mappings
nmap("<leader>c<leader>", ":CommentToggle<CR>")
vmap("<leader>c<leader>", ":CommentToggle<CR>")

-- NvimTree Toggle
nmap("<C-b>", ":NvimTreeToggle<CR>")

-- LSP Mappings
nmap("gD", ":lua vim.lsp.buf.declaration()<CR>")
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("<c-q>", ":lua vim.lsp.buf.hover()<CR>")
nmap("gi", ":lua vim.lsp.buf.implementation()<CR>")
nmap("<C-a>", ":lua vim.lsp.buf.signature_help()<CR>")
nmap("<leader>D", ":lua vim.lsp.buf.type_definition()<CR>")
nmap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
nmap("[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
nmap("]d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
nmap("<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<CR>")

-- ToggleTerm
map("n", "<C-t>", ":ToggleTerm dir=%:p:h<CR>")
map("t", "<C-t>", ":ToggleTerm dir=%:p:h<CR>")
map("n", "v:count1 <C-t>", ":v:count1" .. '"ToggleTerm"<CR>')
map("v", "v:count1 <C-t>", ":v:count1" .. '"ToggleTerm"<CR>')
function _G.set_terminal_keymaps()
	map("t", "<leader><esc>", "<C-\\><C-n>")
	map("t", "<A-h>", "<c-\\><c-n><c-w>h")
	map("t", "<A-j>", "<c-\\><c-n><c-w>j")
	map("t", "<A-k>", "<c-\\><c-n><c-w>k")
	map("t", "<A-l>", "<c-\\><c-n><c-w>l")

	map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
	map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
	map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
	map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Code formatter.
nmap("<leader>fr", ":Neoformat<CR>")

-- Dap debugger
nmap("<leader>br", ':lua require("dap").toggle_breakpoint()<CR>')
nmap("<leader>co", ':lua require("dap").continue()<CR>')
nmap("<leader>so", ':lua require("dap").step_over()<CR>')
nmap("<leader>si", ':lua require("dap").step_into()<CR>')
nmap("<leader>re", ':lua require("dap").repl.open()<CR>')
nmap("<leader>re", ':lua require("dap").repl.open()<CR>')
nmap("<leader>dt", ':lua require("dapui").toggle()<CR>')

-- Session saving and loading
nmap("<Leader>ss", ":<C-u>SessionSave<CR>")
nmap("<Leader>sl", ":<C-u>SessionLoad<CR>")

--open Lazygit window
nmap("<leader>g", ":LazyGit<CR>")
