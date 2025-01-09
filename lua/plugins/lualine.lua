local lualine_style = 4

local lualine_styles = {
	{ { left = ' ', right = ' ' }, { left = '│', right = '│' } },
	{ { left = ' ', right = '' }, { left = ' ', right = ' ' } },
	{ { left = '', right = '' }, { left = ' ', right = ' ' } },
	{ { left = '', right = '' }, { left = '', right = '' } },
	{ { left = '', right = '' }, { left = ' ', right = ' ' } },
}

--  TODO: Check if these work

return {
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'linrongbin16/lsp-progress.nvim',
			'cbochs/grapple.nvim',
		},
		opts = function()
			require('lsp-progress').setup({})
			local function lsp_progress()
				return require('lsp-progress').progress()
			end

			return {
				options = {
					theme = 'auto',
          globalstatus = true,
					disabled_filetypes = {
            -- Not needed when using globalstatus
						-- 'toggleterm',
						-- 'NvimTree',
						-- 'neo-tree',
						-- 'dapui_scopes',
						-- 'dapui_breakpoints',
						-- 'dapui_stacks',
						-- 'dapui_watches',
						-- 'dap-repl',
					},
					section_separators = lualine_styles[lualine_style][1],
					component_separators = lualine_styles[lualine_style][2],
				},
				extensions = { 'fugitive' },
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff' },
					-- lualine_c = {lsp_progress},
					lualine_c = { lsp_progress, 'copilot' },
					lualine_x = {
						{
							function()
								return require('noice').api.status.mode.get()
							end,
							cond = function()
								return package.loaded['noice'] and require('noice').api.status.mode.has()
							end,
							color = { fg = '#ff9e64' },
						},
						'encoding',
						{ 'filetype', icon = { align = 'left' } },
					},
					lualine_y = { 'progress', 'location' },
					lualine_z = { { require('grapple').statusline, cond = require('grapple').exists }, 'filename' },
					-- lualine_z = {'filename'}
				},
				inactive_sections = {
					-- lualine_a = {},
					-- lualine_b = {},
					-- lualine_c = {},
					-- lualine_x = { { require('grapple').statusline, cond = require('grapple').exists }, 'filename' },
					-- lualine_y = {},
					-- lualine_z = {},
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          -- lualine_c = {lsp_progress},
          lualine_c = { lsp_progress, 'copilot' },
          lualine_x = {
            {
              function()
                return require('noice').api.status.mode.get()
              end,
              cond = function()
                return package.loaded['noice'] and require('noice').api.status.mode.has()
              end,
              color = { fg = '#ff9e64' },
            },
            'encoding',
            { 'filetype', icon = { align = 'left' } },
          },
          lualine_y = { 'progress', 'location' },
          lualine_z = { { require('grapple').statusline, cond = require('grapple').exists }, 'filename' },
          -- lualine_z = {'filename'}
				},
			}
		end,
	},
}
