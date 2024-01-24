require('util').nmap("<leader>d", ":DogeGenerate<CR>")

return {"kkoomen/vim-doge", build = function() vim.fn["doge#install"]() end}
