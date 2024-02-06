require('util').nmap("<leader>Gd", ":DogeGenerate<CR>")

return {"kkoomen/vim-doge", cmd = "DogeGenerate", build = function() vim.fn["doge#install"]() end}
