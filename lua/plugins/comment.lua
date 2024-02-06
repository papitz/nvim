require('util').nmap("<leader>c<leader>", ":CommentToggle<CR>")
require('util').vmap("<leader>c<leader>", ":CommentToggle<CR>")

return {
    "terrortylor/nvim-comment",
    cmd = 'CommentToggle',
    config = function() require('nvim_comment').setup() end
}
