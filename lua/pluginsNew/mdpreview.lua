return {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && yarn install",
    config = function()
        vim.cmd([[
          function OpenMarkdownPreview (url)
            execute "silent ! firefox --new-window " . a:url
          endfunction
          let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]])
    end
}
