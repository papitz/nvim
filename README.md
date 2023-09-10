<!DOCTYPE html>
<html lang="de">
<body>
<div class="flex-container">
  <a href="https://github.com/papitz/nvim/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/papitz/nvim?color=important&style=flat-square" alt="License">
  </a>
  <a>
    <img src="https://img.shields.io/github/repo-size/papitz/nvim?style=flat-square" alt="Repo size">
  </a>
  <a href="https://github.com/papitz/nvim/issues">
    <img src="https://img.shields.io/github/issues/papitz/nvim?color=ff0000&style=flat-square" alt="Open issues">
  </a>
  <a href="https://github.com/papitz/nvim/pulse">
    <img src="https://img.shields.io/github/last-commit/papitz/nvim?color=blueviolet&style=flat-square" alt="Last commit">
  </a>
</div>
<h1>WWCTVim</h1>

![image](https://user-images.githubusercontent.com/45036971/142732331-5f8d67f6-c7f5-4556-af4f-22c6ad55f6be.png)

## General

This is an nvim config that we use for coding. It uses the neovim nightly and is tested on arch. A lot of the configuration is based on [artart222/CodeArt](https://github.com/artart222/CodeArt)

## Installation

1. clone this repo and `cd` into it

2. run 
```
bash install.sh
```

### initial configuration
After Installation run
```
:Lazy
```
See there if any packages need updating.
## Setup
### Language Server

-to install a language server run `:LspInstall <LANGUAGE>`

### Formatter
Install the formatter you wish to use. For more info which formatters are supported check [sbdchd/neoformat](https://github.com/sbdchd/neoformat)

## Plugins
These are the used plugins:
 - DAPInstall.nvim
 - LuaSnip
 - cmp-buffer
 - cmp-nvim-lsp
 - cmp-nvim-lua
 - cmp-path
 - cmp_luasnip
 - dashboard-nvim
 - friendly-snippets
 - gitsigns.nvim
 - indent-blankline.nvim
 - iswap.nvim
 - lazygit.nvim
 - lsp_signature.nvim
 - lspkind-nvim
 - lua-dev.nvim
 - lualine.nvim
 - markdown-preview.nvim
 - neoformat
 - nvim-autopairs
 - nvim-bufferline.lua
 - nvim-cmp
 - nvim-colorizer.lua
 - nvim-comment
 - nvim-dap
 - nvim-dap-ui
 - nvim-lsp-installer
 - nvim-lspconfig
 - nvim-toggleterm.lua
 - nvim-tree.lua
 - nvim-treesitter
 - nvim-ts-autotag
 - nvim-ts-rainbow
 - nvim-web-devicons
 - onedark.nvim
 - packer.nvim
 - plenary.nvim
 - telescope.nvim
 - todo-comments.nvim
 - vim-doge
 - vim-fugitive
 - vim-matchup
 - vim-surround
 - vimtex
 - which-key.nvim

## Keymaps
Look [here](https://vim.rtorr.com/) for standard vim keymaps\
Leader is mapped to \<space\>

#### Panel switching
| Key         | Function        |
|-------------|-----------------|
| \<leader\>h | :wincmd h\<CR\> | 
| \<leader\>j | :wincmd j\<CR\> | 
| \<leader\>k | :wincmd k\<CR\> | 
| \<leader\>l | :wincmd l\<CR\> | 
| \<leader\>H | :wincmd H\<CR\> | 
| \<leader\>J | :wincmd J\<CR\> | 
| \<leader\>K | :wincmd K\<CR\> | 
| \<leader\>L | :wincmd L\<CR\> | 

#### buffer switching
| Key | Function              |
|-----|-----------------------|
| gb  | :BufferLinePick\<CR\> | 

#### Split resizing
| Key         | Function  |
|-------------|-----------|
| \<C-Right\> | \<C-w\>\> | 
| \<C-Left\>  | \<C-w\>\< | 
| \<C-Up\>    | \<C-w\>+  | 
| \<C-Down\>  | \<C-w\>-  | 

#### remove seach highlighting
| Key         | Function   |
|-------------|------------|
| \<leader\>n | :noh\<CR\> | 

#### Split panel
| Key          | Function |
|--------------|----------|
| \<leader\>v  | \<C-w\>v | 
| \<leader\>ws | \<C-w\>s | 

#### close panels
| Key         | Function |
|-------------|----------|
| \<leader\>x | \<C-w\>c | 

#### Line moving
| Key     | Function                |
|---------|-------------------------|
| \<C-j\> | :m .+1\<CR\>==          | 
| \<C-k\> | :m .-2\<CR\>==          | 
| \<C-j\> | \<ESC\>:m .+1\<CR\>==gi | 
| \<C-k\> | \<ESC\>:m .-2\<CR\>==gi | 
| \<C-j\> | :m '\>+1\<CR\>gv=gv     | 
| \<C-k\> | :m '\<-2\<CR\>gv=gv     | 

#### Remap for yanking into clipboard
| Key | Function |
|-----|----------|

#### in visual mode
| Key | Function |
|-----|----------|

#### paste with correct indent
| Key | Function |
|-----|----------|
| p   | ]p       | 

#### fix indentaion
| Key         | Function    |
|-------------|-------------|
| \<leader\>i | gg=G\<C-o\> | 

#### navigate quickfix
| Key                   | Function     |
|-----------------------|--------------|
| \<leader\>\<leader\>j | :cn\<CR\>    | 
| \<leader\>\<leader\>k | :cp\<CR\>    | 
| \<leader\>\<leader\>q | :copen\<CR\> | 
| \<leader\>\<leader\>l | :.cc\<CR\>   | 

#### Markdown Preview control
| Key         | Function               |
|-------------|------------------------|
| \<leader\>m | :MarkdownPreview\<CR\> | 

#### map spelling
| Key    | Function                                   |
|--------|--------------------------------------------|
| \<F8\> | :setlocal spell spelllang=de,en \<return\> | 
| \<F9\> | :set nospell \<return\>                    | 

#### ctrl l to correct the last spelling mistake
| Key     | Function                         |
|---------|----------------------------------|
| \<C-l\> | \<c-g\>u\<Esc\>[s1z=\`]a\<c-g\>u | 

#### open Lazygit window
| Key        | Function                   |
|------------|----------------------------|
| \<silent\> | \<leader\>g :LazyGit\<CR\> | 

#### swap parameters around
| Key          | Function     |
|--------------|--------------|
| \<leader\>sw | :ISwap\<CR\> | 

#### switch between the last two files with bs
| Key    | Function |
|--------|----------|
| \<BS\> | \<C-^\>  | 

#### vimtex mappings
| Key          | Function               |
|--------------|------------------------|
| \<leader\>tt | :VimtexCompile\<CR\>   | 
| \<leader\>tv | :VimtexView\<CR\>      | 
| \<leader\>tc | :VimtexTocToggle\<CR\> | 
| \<leader\>te | :VimtexErrors\<CR\>    | 

#### Telescope mappings
| Key          | Function                               |
|--------------|----------------------------------------|
| \<leader\>ff | \<cmd\>Telescope find_files\<cr\>      | 
| \<leader\>fg | \<cmd\>Telescope live_grep\<cr\>       | 
| \<leader\>fb | \<cmd\>Telescope buffers\<cr\>         | 
| \<leader\>fh | \<cmd\>Telescope search_history\<cr\>  | 
| \<leader\>fc | \<cmd\>Telescope command_history\<cr\> | 
| \<leader\>fq | \<cmd\>Telescope quickfix\<cr\>        | 
| \<leader\>fr | \<cmd\>Telescope registers\<cr\>       | 
| \<leader\>fs | \<cmd\>Telescope spell_suggest\<cr\>   | 
| \<leader\>fo | \<cmd\>Telescope oldfiles\<cr\>        | 
| \<leader\>fm | \<cmd\>Telescope marks\<cr\>           | 

#### Dashboard mappings
| Key          | Function                      |
|--------------|-------------------------------|
| \<leader\>fn | \<cmd\>DashboardNewFile\<cr\> | 

#### Comment mappings
| Key                   | Function             |
|-----------------------|----------------------|
| \<leader\>c\<leader\> | :CommentToggle\<CR\> | 
| \<leader\>c\<leader\> | :CommentToggle\<CR\> | 

#### NvimTree Toggle
| Key     | Function              |
|---------|-----------------------|
| \<C-b\> | :NvimTreeToggle\<CR\> | 

#### LSP Mappings
| Key          | Function                                              |
|--------------|-------------------------------------------------------|
| gD           | :lua vim.lsp.buf.declaration()\<CR\>                  | 
| gd           | :lua vim.lsp.buf.definition()\<CR\>                   | 
| \<c-q\>      | :lua vim.lsp.buf.hover()\<CR\>                        | 
| gi           | :lua vim.lsp.buf.implementation()\<CR\>               | 
| \<C-a\>      | :lua vim.lsp.buf.signature_help()\<CR\>               | 
| \<leader\>D  | :lua vim.lsp.buf.type_definition()\<CR\>              | 
| \<leader\>rn | :lua vim.lsp.buf.rename()\<CR\>                       | 
| \<leader\>ca | :lua vim.lsp.buf.code_action()\<CR\>                  | 
| gr           | :lua vim.lsp.buf.references()\<CR\>                   | 
| \<leader\>e  | :lua vim.lsp.diagnostic.show_line_diagnostics()\<CR\> | 
| [d           | :lua vim.lsp.diagnostic.goto_prev()\<CR\>             | 
| ]d           | :lua vim.lsp.diagnostic.goto_next()\<CR\>             | 
| \<leader\>q  | :lua vim.lsp.diagnostic.set_loclist()\<CR\>           | 

#### ToggleTerm
| Key     | Function          |
|---------|-------------------|
| \<C-t\> | :ToggleTerm\<CR\> | 

#### Code formatter.
| Key          | Function         |
|--------------|------------------|
| \<leader\>fr | :Neoformat\<CR\> | 

#### Dap debugger
| Key          | Function                                      |
|--------------|-----------------------------------------------|
| \<leader\>br | :lua require('dap').toggle_breakpoint()\<CR\> | 
| \<leader\>co | :lua require('dap').continue()\<CR\>          | 
| \<leader\>so | :lua require('dap').step_over()\<CR\>         | 
| \<leader\>si | :lua require('dap').step_into()\<CR\>         | 
| \<leader\>re | :lua require('dap').repl.open()\<CR\>         | 
| \<leader\>re | :lua require('dap').repl.open()\<CR\>         | 

#### Session saving and loading
| Key          | Function                  |
|--------------|---------------------------|
| \<Leader\>ss | :\<C-u\>SessionSave\<CR\> | 
| \<Leader\>sl | :\<C-u\>SessionLoad\<CR\> | 

</body>
</html>
