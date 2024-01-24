require('util').nmap("<leader>d", ":DogeGenerate<CR>")

return {"kkoomen/vim-doge", cmd = "DogeGenerate", build = function() vim.fn["doge#install"]() end}
