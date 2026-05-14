-- disable virtual text in Latex documents FIX for overfull hbox madness
vim.cmd(
	[[autocmd Filetype tex lua vim.g.diagnostic_virtual_text = false; vim.diagnostic.config({ virtual_text = vim.g.diagnostic_virtual_text })]]
)
-- show the diagnostic description when the cursor is placed on the error
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil,{focusable=false,scope="cursor"})]])
-- vim.cmd([[autocmd CursorHold * Lspsaga show_cursor_diagnostics]])
-- TODO: Check if this breaks
-- local signs = {
--     Error = " ",
--     Warning = " ",
--     Hint = "󰌵 ",
--     Information = " "
-- }
-- for type, icon in pairs(signs) do
--     local hl = "LspDiagnosticsSign" .. type
--     vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
-- end

return {
	{
		'williamboman/mason.nvim',
		init = function(_)
			local pylsp = require('mason-registry').get_package('python-lsp-server')
			pylsp:on('install:success', function()
				local function mason_package_path(package)
					local path = vim.fn.resolve(vim.fn.stdpath('data') .. '/mason/packages/' .. package)
					return path
				end

				local path = mason_package_path('python-lsp-server')
				local command = path .. '/venv/bin/pip'
				local args = {
					'install',
					'-U',
					'pylsp-rope',
					'python-lsp-black',
					'python-lsp-isort',
					'pyls-memestra',
					'pylsp-mypy',
				}

				require('plenary.job')
					:new({
						command = command,
						args = args,
						cwd = path,
					})
					:start()
			end)
		end,
		opts = {
			max_concurrent_installers = 10,
			-- log_level = vim.log.levels.TRACE,
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜ ',
					package_uninstalled = '✗',
				},
			},
		},
	},
	{
		{
			'folke/lazydev.nvim',
			ft = 'lua', -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
				},
			},
		},
		{ 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings
		-- { -- optional completion source for require statements and module annotations
		-- 	'hrsh7th/nvim-cmp',
		-- 	opts = function(_, opts)
		-- 		opts.sources = opts.sources or {}
		-- 		table.insert(opts.sources, {
		-- 			name = 'lazydev',
		-- 			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
		-- 		})
		-- 	end,
		-- },
	},
	{
		'pmizio/typescript-tools.nvim',
		ft = { 'javascript', 'typescript' },
		opts = {},
		dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'saghen/blink.cmp',
			-- TODO: Check if we might need this
			-- , "hrsh7th/nvim-cmp"
		},
		config = function()
			vim.diagnostic.config({ virtual_text = false, severity_sort = true })
			-- local deps_ok, lspconfig, util, cmp_lsp = pcall(function()
			-- 	return require('lspconfig'), require('lspconfig.util'), require('cmp_nvim_lsp')
			-- end)
			-- if not deps_ok then
			-- 	return
			-- end
			local deps_ok, lspconfig, util, blink = pcall(function()
				return require('lspconfig'), require('lspconfig.util'), require('blink.cmp')
			end)
			if not deps_ok then
				return
			end

			local capabilities
			do
				local default_capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities = {
					textDocument = {
						completion = { completionItem = { snippetSupport = true } },
						codeAction = {
							resolveSupport = {
								properties = vim.list_extend(
									default_capabilities.textDocument.codeAction.resolveSupport.properties,
									{ 'documentation', 'detail', 'additionalTextEdits' }
								),
							},
						},
					},
				}
			end

			util.default_config = vim.tbl_deep_extend('force', util.default_config, {
				capabilities = vim.tbl_deep_extend(
					'force',
					vim.lsp.protocol.make_client_capabilities(),
					-- capabilities
					require('blink.cmp').get_lsp_capabilities(capabilities)
					-- cmp_lsp.default_capabilities(capabilities)
				),
			})

			local vue_language_server_path = vim.fn.expand('$MASON/packages')
				.. '/vue-language-server'
				.. '/node_modules/@vue/language-server'
			local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
			local vue_plugin = {
				name = '@vue/typescript-plugin',
				location = vue_language_server_path,
				languages = { 'vue' },
				configNamespace = 'typescript',
			}
			local vtsls_config = {
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = tsserver_filetypes,
			}

			-- If you are on most recent `nvim-lspconfig`
			local vue_ls_config = {}
			vim.lsp.config('vtsls', vtsls_config)
			vim.lsp.config('vue_ls', vue_ls_config)
			vim.lsp.enable({ 'vtsls', 'vue_ls' })

			vim.lsp.config('pylsp', {
				settings = {
					pylsp = {
						plugins = {
							-- formatter options
							black = { enabled = true },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							-- linter options
							pylint = { enabled = false, executable = 'pylint' },
							pyflakes = { enabled = false },
							pycodestyle = { enabled = true, maxLineLength = 100 },
							rope_autoimport = { enabled = true },
							rope_completions = { enabled = true },
							-- type checker
							pylsp_mypy = { enabled = false },
							pylsp_ruff = { enabled = false },
							-- auto-completion options
							jedi_completion = { fuzzy = true },
							-- import sorting
							pyls_isort = { enabled = true },
						},
					},
				},
			})

			local docs_path = os.getenv('TRYTON_DOCS_PATH') or ''
			vim.lsp.config('lemminx', {
				settings = {
					xml = {
						fileAssociations = {
							{
								pattern = '**/view/*_form.xml',
								systemId = docs_path .. '/schemas/tryton-view.xsd',
							},
							{
								pattern = '**/view/*_list.xml',
								systemId = docs_path .. '/schemas/tryton-view.xsd',
							},
							{
								pattern = '**/view/*_graph.xml',
								systemId = docs_path .. '/schemas/tryton-graph.xsd',
							},
							{
								pattern = '**/view/*_board.xml',
								systemId = docs_path .. '/schemas/tryton-board.xsd',
							},
							{
								pattern = '**/view/*_calendar.xml',
								systemId = docs_path .. '/schemas/tryton-calendar.xsd',
							},
							{
								pattern = '**/modules/**/*.xml',
								systemId = docs_path .. '/schemas/tryton-data.xsd',
							},
						},
					},
				},
			})

			require('mason-lspconfig').setup({ ensure_installed = { 'lua_ls' }, automatic_enable = true })
		end,
	},
}
