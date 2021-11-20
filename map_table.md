
#### remap function
| Key | Function |
|-----|----------|

#### function for normal mode
| Key | Function |
|-----|----------|

#### function for insert mode
| Key | Function |
|-----|----------|

#### function for visual mode
| Key | Function |
|-----|----------|

#### map leader to space
| Key | Function |
|-----|----------|

#### map semicolon to colon because we are lazy
| Key | Function |
|-----|----------|

#### Panel switching
| Key | Function |
|-----|----------|
| \<leader\>h | :wincmd h\<CR\> | 
| \<leader\>j | :wincmd j\<CR\> | 
| \<leader\>k | :wincmd k\<CR\> | 
| \<leader\>l | :wincmd l\<CR\> | 
| \<leader\>H | :wincmd H\<CR\> | 
| \<leader\>J | :wincmd J\<CR\> | 
| \<leader\>K | :wincmd K\<CR\> | 
| \<leader\>L | :wincmd L\<CR\> | 

#### buffer switching
| Key | Function |
|-----|----------|
| gb | :BufferLinePick\<CR\> | 

#### Split resizing
| Key | Function |
|-----|----------|
| \<C-Right\> | \<C-w\>\> | 
| \<C-Left\> | \<C-w\>\< | 
| \<C-Up\> | \<C-w\>+ | 
| \<C-Down\> | \<C-w\>- | 

#### remove seach highlighting
| Key | Function |
|-----|----------|
| \<leader\>n | :noh\<CR\> | 

#### Split panel
| Key | Function |
|-----|----------|
| \<leader\>v | \<C-w\>v | 
| \<leader\>ws | \<C-w\>s | 

#### close panels
| Key | Function |
|-----|----------|
| \<leader\>x | \<C-w\>c | 

#### Line moving
| Key | Function |
|-----|----------|
| \<C-j\> | :m .+1\<CR\>== | 
| \<C-k\> | :m .-2\<CR\>== | 
| \<C-j\> | \<ESC\>:m .+1\<CR\>==gi | 
| \<C-k\> | \<ESC\>:m .-2\<CR\>==gi | 
| \<C-j\> | :m '\>+1\<CR\>gv=gv | 
| \<C-k\> | :m '\<-2\<CR\>gv=gv | 

#### Remap for yanking into clipboard
| Key | Function |
|-----|----------|

#### in visual mode
| Key | Function |
|-----|----------|

#### paste with correct indent
| Key | Function |
|-----|----------|
| p | ]p | 

#### fix indentaion
| Key | Function |
|-----|----------|
| \<leader\>i | gg=G\<C-o\> | 

#### navigate quickfix
| Key | Function |
|-----|----------|
| \<leader\>\<leader\>j | :cn\<CR\> | 
| \<leader\>\<leader\>k | :cp\<CR\> | 
| \<leader\>\<leader\>q | :copen\<CR\> | 
| \<leader\>\<leader\>l | :.cc\<CR\> | 

#### Markdown Preview control
| Key | Function |
|-----|----------|
| \<leader\>m | :MarkdownPreview\<CR\> | 

#### map spelling
| Key | Function |
|-----|----------|
| \<F8\> | :setlocal spell spelllang=de,en \<return\> | 
| \<F9\> | :set nospell \<return\> | 

#### ctrl l to correct the last spelling mistake
| Key | Function |
|-----|----------|
| \<C-l\> | \<c-g\>u\<Esc\>[s1z=`]a\<c-g\>u | 

#### open Lazygit window
| Key | Function |
|-----|----------|
| \<silent\> | \<leader\>g :LazyGit\<CR\> | 

#### swap parameters around
| Key | Function |
|-----|----------|
| \<leader\>sw | :ISwap\<CR\> | 

#### switch between the last two files with bs
| Key | Function |
|-----|----------|
| \<BS\> | \<C-^\> | 

#### vimtex mappings
| Key | Function |
|-----|----------|
| \<leader\>tt | :VimtexCompile\<CR\> | 
| \<leader\>tv | :VimtexView\<CR\> | 
| \<leader\>tc | :VimtexTocToggle\<CR\> | 
| \<leader\>te | :VimtexErrors\<CR\> | 

#### Telescope mappings
| Key | Function |
|-----|----------|
| \<leader\>ff | \<cmd\>Telescope find_files\<cr\> | 
| \<leader\>fg | \<cmd\>Telescope live_grep\<cr\> | 
| \<leader\>fb | \<cmd\>Telescope buffers\<cr\> | 
| \<leader\>fh | \<cmd\>Telescope search_history\<cr\> | 
| \<leader\>fc | \<cmd\>Telescope command_history\<cr\> | 
| \<leader\>fq | \<cmd\>Telescope quickfix\<cr\> | 
| \<leader\>fr | \<cmd\>Telescope registers\<cr\> | 
| \<leader\>fs | \<cmd\>Telescope spell_suggest\<cr\> | 
| \<leader\>fo | \<cmd\>Telescope oldfiles\<cr\> | 
| \<leader\>fm | \<cmd\>Telescope marks\<cr\> | 

#### Dashboard mappings
| Key | Function |
|-----|----------|
| \<leader\>fn | \<cmd\>DashboardNewFile\<cr\> | 

#### Comment mappings
| Key | Function |
|-----|----------|
| \<leader\>c\<leader\> | :CommentToggle\<CR\> | 
| \<leader\>c\<leader\> | :CommentToggle\<CR\> | 

#### NvimTree Toggle
| Key | Function |
|-----|----------|
| \<C-b\> | :NvimTreeToggle\<CR\> | 

#### LSP Mappings
| Key | Function |
|-----|----------|
| gD | :lua vim.lsp.buf.declaration()\<CR\> | 
| gd | :lua vim.lsp.buf.definition()\<CR\> | 
| \<c-q\> | :lua vim.lsp.buf.hover()\<CR\> | 
| gi | :lua vim.lsp.buf.implementation()\<CR\> | 
| \<C-a\> | :lua vim.lsp.buf.signature_help()\<CR\> | 
| \<leader\>D | :lua vim.lsp.buf.type_definition()\<CR\> | 
| \<leader\>rn | :lua vim.lsp.buf.rename()\<CR\> | 
| \<leader\>ca | :lua vim.lsp.buf.code_action()\<CR\> | 
| gr | :lua vim.lsp.buf.references()\<CR\> | 
| \<leader\>e | :lua vim.lsp.diagnostic.show_line_diagnostics()\<CR\> | 
| [d | :lua vim.lsp.diagnostic.goto_prev()\<CR\> | 
| ]d | :lua vim.lsp.diagnostic.goto_next()\<CR\> | 
| \<leader\>q | :lua vim.lsp.diagnostic.set_loclist()\<CR\> | 

#### ToggleTerm
| Key | Function |
|-----|----------|

#### Code formatter.
| Key | Function |
|-----|----------|
| \<leader\>fr | :Neoformat\<CR\> | 

#### Dap debugger
| Key | Function |
|-----|----------|
| \<leader\>br | :lua require('dap').toggle_breakpoint()\<CR\> | 
| \<leader\>co | :lua require('dap').continue()\<CR\> | 
| \<leader\>so | :lua require('dap').step_over()\<CR\> | 
| \<leader\>si | :lua require('dap').step_into()\<CR\> | 
| \<leader\>re | :lua require('dap').repl.open()\<CR\> | 
| \<leader\>re | :lua require('dap').repl.open()\<CR\> | 

#### Session saving and loading
| Key | Function |
|-----|----------|
| \<Leader\>ss | :\<C-u\>SessionSave\<CR\> | 
| \<Leader\>sl | :\<C-u\>SessionLoad\<CR\> | 

#### open Lazygit window
| Key | Function |
|-----|----------|
| \<leader\>g | :LazyGit\<CR\> | 
