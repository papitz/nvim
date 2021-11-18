local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜ ",
            server_uninstalled = "✗"
        }
    }
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- configure language servers here
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == 'sumneko_lua' then
        -- lua language server config
        local sumneko_binary_path = "/home/paul/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server"
        local sumneko_root_path = "/home/paul/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux"
        local luadev = require("lua-dev").setup({
            lspconfig = {
                cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"},
                capabilities = capabilities
            }
        })
        server:setup(luadev)
    else
        server:setup({opts, capabilities})
    end
end)
