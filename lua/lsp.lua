local ok, mason = pcall(require, "mason")
if not ok then
	return
end

mason.setup({
	max_concurrent_installers = 10,
	-- log_level = vim.log.levels.TRACE,
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜ ",
			package_uninstalled = "✗",
		},
	},
})

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local util = require("lspconfig.util")
local cmp_lsp = require("cmp_nvim_lsp")

---@param opts table|nil
local function create_capabilities(opts)
	local default_opts = {
		with_snippet_support = true,
	}
	opts = opts or default_opts
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = opts.with_snippet_support
	if opts.with_snippet_support then
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		}
	end
	return cmp_lsp.update_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
	if config.on_attach then
		config.on_attach = util.add_hook_after(config.on_attach, require("wb.lsp.on-attach"))
	else
		config.on_attach = require("wb.lsp.on-attach")
	end
	config.capabilities = create_capabilities()
end)

require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua" },
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({})
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup(require("neodev").setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "P" },
					},
				},
			},
		}))
	end,
	["ltex"] = function()
		local filetype = vim.bo.filetype
		local language = (filetype == "tex") and "de-DE" or "en-US"
		lspconfig.ltex.setup({
			settings = {
				ltex = {
					language = language,
				},
			},
		})
	end,
	["eslint"] = function()
		lspconfig.eslin.setup({
			settings = {
				format = {
					enable = true,
				},
			},
		})
	end,
})

-- disable virtual text in Latex documents FIX for overfull hbox madness
vim.cmd(
	[[autocmd Filetype tex lua vim.g.diagnostic_virtual_text = false; vim.diagnostic.config({ virtual_text = vim.g.diagnostic_virtual_text })]]
)
-- show the diagnostic description when the cursor is placed on the error
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil,{focusable=false,scope="cursor"})]])
vim.cmd([[autocmd CursorHold * Lspsaga show_cursor_diagnostics]])
