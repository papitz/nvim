return {
  'iamcco/markdown-preview.nvim',
  ft = 'markdown',
  build = 'cd app && yarn install',
  config = function()
    require('util').nmap('<leader>m', ':MarkdownPreviewToggle<CR>')

    -- vim.cmd([[
    --       function OpenMarkdownPreview (url)
    --         execute "silent ! firefox --new-window " . a:url
    --       endfunction
    --       let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    --     ]])
  end
}
