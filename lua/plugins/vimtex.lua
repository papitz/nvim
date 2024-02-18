return {
  {
    'lervag/vimtex',
    ft = 'tex',
    config = function()

      if vim.loop.os_uname().sysname == 'Darwin' then
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_skim_sync = 1
      else
        vim.g.vimtex_view_method = 'zathura'
      end
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.cmd(
          'let g:vimtex_toc_config = {\'layer_status\': {\'label\':0, \'include\':0}, \'show_help\':0}')
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_quickfix_mode = 2
      vim.g.vimtex_quickfix_open_on_waning = 0
      vim.g.vimtex_compiler_silent = 0
      vim.opt.conceallevel = 1
      vim.g.vimtex_complete_enabled = 0
      vim.g.tex_conceal = 'abdmg'
      vim.cmd([[autocmd Filetype tex setl spell spelllang=de,en
                autocmd Filetype tex setl updatetime=250]])

      local nmap = require('util').nmap
      nmap('<leader>tt', ':VimtexCompile<CR>')
      nmap('<leader>tv', ':VimtexView<CR>')
      nmap('<leader>tc', ':VimtexTocToggle<CR>')
      nmap('<leader>ts', ':VimtexStatus<CR>')
      nmap('<leader>te', ':VimtexErros<CR>') -- opens the quickfix window where the errors are hidden
    end
  }, {'barreiroleo/ltex-extra.nvim', ft = 'tex'}
}
