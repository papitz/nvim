return {
    "lewis6991/impatient.nvim", "s1n7ax/nvim-window-picker",
    "nvim-lua/plenary.nvim", "RishabhRD/popfix", {
        "hood/popui.nvim",
        config = function() vim.ui.select = require("popui.ui-overrider") end
    }
}
