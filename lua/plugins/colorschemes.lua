return {
    {"navarasu/onedark.nvim", lazy = false, priority = 1000},
    {"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}}, {
        "epwalsh/obsidian.nvim",
        lazy = true,
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
        event = {"BufReadPre " .. vim.fn.expand("~") .. "/notes/**.md"},
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim", -- Optional, for completion.
            "hrsh7th/nvim-cmp",

            -- Optional, for search and quick-switch functionality.
            "nvim-telescope/telescope.nvim"
        },
        config = function() require("plugins/obsidian") end
    }
}
