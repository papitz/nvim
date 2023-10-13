local ok, mason = pcall(require, "mason")
if not ok then return end

mason.setup({
    max_concurrent_installers = 10,
    -- log_level = vim.log.levels.TRACE,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜ ",
            package_uninstalled = "✗"
        }
    }
})
-- Nvim specific stuff
require("neodev").setup({})

local deps_ok, lspconfig, util, cmp_lsp = pcall(function()
    return require("lspconfig"), require("lspconfig.util"),
           require("cmp_nvim_lsp")
end)
if not deps_ok then return end

local capabilities
do
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = {
        textDocument = {
            completion = {completionItem = {snippetSupport = true}},
            codeAction = {
                resolveSupport = {
                    properties = vim.list_extend(
                        default_capabilities.textDocument.codeAction
                            .resolveSupport.properties,
                        {"documentation", "detail", "additionalTextEdits"})
                }
            }
        }
    }
end

util.default_config = vim.tbl_deep_extend("force", util.default_config, {
    capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol
                                           .make_client_capabilities(),
                                       cmp_lsp.default_capabilities(capabilities))
})

require("mason-lspconfig").setup({ensure_installed = {"lua_ls"}})
-- require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
    function(server_name) lspconfig[server_name].setup({}) end,
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            settings = {Lua = {diagnostics = {globals = {"P"}}}}
        })
    end,
    --  TODO: Check why this breaks ls help windows
    ["ltex"] = function()
        lspconfig.ltex.setup({
            on_attach = function(client, bufnr)
                require("ltex_extra").setup({
                    load_langs = {"de-DE", "en-US"}, -- table <string> : languages for which dictionaries will be loaded
                    init_check = true, -- boolean : whether to load dictionaries on startup
                    path = nil, -- string : path to store dictionaries. Relative path uses current working directory
                    log_level = "none" -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
                })
            end,
            -- settings = {ltex = {language = "de-DE"}}
            settings = {ltex = {language = "en-US"}}
        })
    end,
    ["eslint"] = function()
        lspconfig.eslint.setup({settings = {format = true}})
    end
})

-- disable virtual text in Latex documents FIX for overfull hbox madness
vim.cmd(
    [[autocmd Filetype tex lua vim.g.diagnostic_virtual_text = false; vim.diagnostic.config({ virtual_text = vim.g.diagnostic_virtual_text })]])
-- show the diagnostic description when the cursor is placed on the error
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil,{focusable=false,scope="cursor"})]])
-- vim.cmd([[autocmd CursorHold * Lspsaga show_cursor_diagnostics]])
local signs = {
    Error = " ",
    Warning = " ",
    Hint = "󰌵 ",
    Information = " "
}
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end
