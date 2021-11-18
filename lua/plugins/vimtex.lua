vim.cmd("let g:vimtex_toc_config = {'layer_status': {'label':0, 'include':0}, 'show_help':0}")
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel=1
vim.g.tex_conceal = 'abdmg'
vim.cmd(
    [[autocmd Filetype tex setl spell spelllang=de,en
    autocmd Filetype tex setl updatetime=250]]
)
