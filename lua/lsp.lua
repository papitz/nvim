local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓ ",
			server_pending = "➜ ",
			server_uninstalled = "✗ ",
		},
	},
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- configure language servers here
lsp_installer.on_server_ready(function(server)
	local opts = {}
	if server.name == "sumneko_lua" then
		-- lua language server config
		local sumneko_binary_path = HOME
			.. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server"
		local sumneko_root_path = HOME .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux"
		local luadev = require("lua-dev").setup({
			lspconfig = {
				cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
				capabilities = capabilities,
			},
		})
		server:setup(luadev)
	else
		server:setup({ opts, capabilities })
	end
	vim.cmd([[ do User LspAttachBuffers ]])
end)

-- show the diagnostic description when the cursor is placed on the error
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil,{focusable=false,scope="cursor"})]])
