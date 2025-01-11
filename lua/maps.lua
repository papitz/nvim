local util = require('util')
local map = util.map
local imap = util.imap
local vmap = util.vmap
local nmap = util.nmap

-- map leader to space
vim.g.mapleader = ' '

-- map esc in normal mode to write and delete highlighting
-- nmap('<esc>', '<esc>:w<CR>:noh<CR>')
nmap('<esc>', '<esc>:w<CR>')

-- map semicolon to colon because we are lazy
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('v', ';', ':', { noremap = true })

-- Better horizontal navigations
nmap('H', '^')
nmap('L', '$')

-- Panel switching
nmap('<leader>h', ':wincmd h<CR>')
nmap('<leader>j', ':wincmd j<CR>')
nmap('<leader>k', ':wincmd k<CR>')
nmap('<leader>l', ':wincmd l<CR>')
nmap('<leader>H', ':wincmd H<CR>')
nmap('<leader>J', ':wincmd J<CR>')
nmap('<leader>K', ':wincmd K<CR>')
nmap('<leader>L', ':wincmd L<CR>')

-- Split resizing
nmap('<C-Right>', '<C-w>>')
nmap('<C-Left>', '<C-w><')
nmap('<C-Up>', '<C-w>+')
nmap('<C-Down>', '<C-w>-')

-- remove search highlighting
nmap('<leader>n', ':noh<CR>')

-- Split panel
nmap('<leader>v', '<C-w>v')
nmap('<leader>V', '<C-w>s')

-- close panels
nmap('<leader>x', '<C-w>c')

-- Line moving
---- Normal mode
nmap('<C-j>', ':m .+1<CR>==')
nmap('<C-k>', ':m .-2<CR>==')
---- Insert mode
imap('<C-j>', '<ESC>:m .+1<CR>==gi')
imap('<C-k>', '<ESC>:m .-2<CR>==gi')
---- Visual mode
vmap('<C-j>', ":m '>+1<CR>gv=gv")
vmap('<C-k>', ":m '<-2<CR>gv=gv")

-- Remap for yanking into clipboard
nmap('<leader>y', '"+y')
nmap('<leader>p', '"+p')
-- in visual mode
vmap('<leader>y', '"+y')
vmap('<leader>p', '"+p')

-- paste with correct indent
nmap('p', ']p')

-- fix indentation
nmap('<leader>ii', 'gg=G<C-o>')

-- navigate quickfix
nmap('<leader><leader>j', ':cn<CR>')
nmap('<leader><leader>k', ':cp<CR>')
nmap('<leader><leader>q', ':copen<CR>')
nmap('<leader><leader>l', ':.cc<CR>')

-- map spelling
nmap('<F8>', ':setlocal spell spelllang=de,en <return>')
nmap('<F9>', ':set nospell <return>')

-- ctrl l to correct the last spelling mistake
-- imap("<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- switch between the last two files with bs
nmap('<BS>', '<C-^>')

-- LSP Mappings
nmap('<c-q>', ':lua vim.lsp.buf.hover()<CR>')
nmap('gi', ':lua vim.lsp.buf.implementation()<CR>')
nmap('<leader>D', ':lua vim.lsp.buf.type_definition()<CR>')
nmap('gr', ':lua vim.lsp.buf.references()<CR>')
nmap('gE', ':lua vim.diagnostic.goto_prev()<CR>')
nmap('ge', ':lua vim.diagnostic.goto_next()<CR>')
-- nmap('<leader>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>')

-- Session saving and loading
nmap('<Leader>ss', ':<C-u>SessionSave<CR>')
nmap('<Leader>sl', ':<C-u>SessionLoad<CR>')

-- shortcut to write and close all buffers
nmap('ZA', ':wqa<CR>')

-- tab navigation
nmap('[t', ':tabprevious<CR>')
nmap(']t', ':tabnext<CR>')
nmap('<leader>tn', ':tabnew<CR>')
nmap('<leader>tx', ':tabclose<CR>')

-- commenting
vim.keymap.set('n', '<leader>c<leader>', 'gcc', { remap = true, silent = true, desc = 'Comment line' })
vim.keymap.set('v', '<leader>c<leader>', 'gc', { remap = true, silent = true, desc = 'Comment selection' })

-- toggle virtual text
-- function Virtual_text_toggle()
-- 	vim.diagnostic.config({
-- 		virtual_text = not vim.diagnostic.config().virtual_text,
-- 	})
-- 	print('Virtual Text ' .. (vim.diagnostic.config().virtual_text and 'enabled' or 'disabled'))
-- end
-- vim.cmd([[ command! VirtualTextToggle lua Virtual_text_toggle()]])
-- nmap('<Leader>u', ':VirtualTextToggle<CR>')

-- Compile and run code
map('n', '<F7>', ':CompileAndRun<CR>')
map('i', '<F7>', '<ESC>:CompileAndRun<CR>')

-- Map the function to <leader>r in visual mode
vim.keymap.set('v', '<leader>s', 'y:%s/<C-r>"//g<Left><Left>', { noremap = true, desc = 'Open replace' })
