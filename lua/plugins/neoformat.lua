--  FIX: Use a new formatter, this one does not get upgraded as much
return {
    "sbdchd/neoformat",
    cmd = "Neoformat",
    config = function()
        -- Enable alignment
        vim.g.neoformat_basic_format_align = 0

        -- Enable tab to spaces conversion
        vim.g.neoformat_basic_format_retab = 1

        -- Enable trimmming of trailing whitespace
        vim.g.neoformat_basic_format_trim = 1

        -- run all formatters
        vim.g.neoformat_run_all_formatters = 1

        vim.g.neoformat_enabled_cs = {"csharpier"}
        vim.g.neoformat_enabled_javascript = {"prettierd", "eslint_d"}
        vim.g.neoformat_enabled_typescript = {"prettierd", "eslint_d"}

        require("util").nmap("<leader>fr", ":Neoformat<CR>")
    end
}
