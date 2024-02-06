return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
        {
            "<leader>a",
            mode = {"n", "x", "o"},
            function() require("flash").jump() end,
            desc = "Flash"
        }, {
            "<leader>A",
            mode = {"n", "x", "o"},
            function() require("flash").treesitter() end,
            desc = "Flash Treesitter"
        }
    }
}
