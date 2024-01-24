local plugins = {


    -- Debugger -- TODO: take care of this when we need it for the first time


    -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text. Like if/else etc.

    -- plugin to surround selections with things like brackets
    -- {
    --     "ggandor/leap.nvim",
    --     config = function() require("leap").set_default_keymaps() end
    -- }, -- swap parameters around
    -- auto generate doc strings

    -- notifications

    -- flutter developement
    
    -- {"lewis6991/satellite.nvim"}

    -- Import settings of plugins or start plugins.
    --     require("plugins.vimtex")
    -- end,
    -- config = {
    --     display = {
    --         open_fn = function()
    --             return require("packer.util").float({ border = "single" },
    --         end,
    --     },
    -- },
}

local opts = {}

require("lazy").setup(plugins, opts)
--  TODO: This is the line we need to get plugin specs
require("lazy").setup("pluginsNew")
