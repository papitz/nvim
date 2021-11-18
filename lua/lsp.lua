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
lsp_installer.on_server_ready(function(server)
    local opts = {settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    -- if server.name == 'sumneko_lua' then
    --     opts = {settings = {
    --         Lua = {
    --             runtime = {
    --                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
    --                 version = 'LuaJIT',
    --                 -- Setup your lua path
    --                 path = runtime_path,
    --             },
    --             diagnostics = {
    --                 -- Get the language server to recognize the `vim` global
    --                 globals = {'vim'},
    --             },
    --             workspace = {
    --                 -- Make the server aware of Neovim runtime files
    --                 library = vim.api.nvim_get_runtime_file("", true),
    --             },
    --             -- Do not send telemetry data containing a randomized but unique identifier
    --             telemetry = {
    --                 enable = false,
    --             },
    --         },
    --     },
    -- }
    -- end
server:setup {
    opts,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
vim.cmd [[ do User LspAttachBuffers ]]
end)
