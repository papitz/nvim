local disable_copilot = false
if disable_copilot then
	return {}
end
return {
	{ 'AndreM222/copilot-lualine' },
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require('copilot').setup({
				suggestion = {
					enabled = true,
					-- This controls if copilot is triggered on input
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = '<C-l>',
						accept_word = false,
						accept_line = false,
						next = '<M-]>',
						prev = '<M-[>',
						dismiss = '<C-]>',
					},
				},
				filetypes = {
					yaml = true,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					tex = false,
					['.'] = false,
				},
			})
		end,
	},
	{
		'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
		opts = {
			show_help = 'yes', -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = 'yes', -- Disable extra information (e.g: system prompt) in the response.
			-- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
			prompts = {
				Explain = 'Please explain how the following code works.',
				Review = 'Please review the following code and provide suggestions for improvement.',
				Tests = 'Please explain how the selected code works, then generate unit tests for it.',
				Refactor = 'Please refactor the following code to improve its clarity and readability.',
				FixCode = 'Please fix the following code to make it work as intended.',
				BetterNamings = 'Please provide better names for the following variables and functions.',
				Documentation = 'Please provide documentation for the following code.',
				SwaggerApiDocs = 'Please provide documentation for the following API using Swagger.',
				SwaggerJsDocs = 'Please write JSDoc for the following API using Swagger.',
			},
		},
		event = 'VeryLazy',
		keys = {
			{
				'<leader>ce',
				'<cmd>CopilotChatExplain<cr>',
				desc = 'CopilotChat - Explain code',
				mode = 'x',
			},
			{
				'<leader>ct',
				-- '<cmd>CopilotChatTests<cr>',
				'ggVG:CopilotChatVisual Generate Tests for this code. Try to test every part of the code. Make a complete test suite and not a simplified version of it.<CR>',
				desc = 'CopilotChat - Generate tests',
			},
			{
				'<leader>co',
				function()
					require('CopilotChat').toggle()
				end,
				desc = 'CopilotChat - Toggle chat window',
				mode = 'n',
			},
      {
        '<leader>cr',
        function()
          require('CopilotChat').reset()
        end,
        desc = 'CopilotChat - Reset chat window',
        mode = 'n',
      },
			{
				'<leader>cr',
				'<cmd>CopilotChatReview<cr>',
				desc = 'CopilotChat - Review code',
				mode = 'x',
			},
			{
				'<leader>cR',
				'<cmd>CopilotChatRefactor<cr>',
				desc = 'CopilotChat - Refactor code',
				mode = 'x',
			},
			{
				'<leader>cf',
				'<cmd>CopilotChatFixCode<cr>',
				desc = 'CopilotChat - Fix code',
				mode = 'x',
			},
			{
				'<leader>cdd',
				'<cmd>CopilotChatDocumentation<cr>',
				desc = 'CopilotChat - Write documentation',
				mode = 'x',
			},
			{
				'<leader>cds',
				'<cmd>CopilotChatSwaggerApiDocs<cr>',
				desc = 'CopilotChat - Write swagger api documentation',
				mode = 'x',
			},
			{
				'<leader>cdj',
				'<cmd>CopilotChatSwaggerJsDocs<cr>',
				desc = 'CopilotChat - Write swagger js documentation',
				mode = 'x',
			},
			{ '<leader>cc', ':CopilotChat ', desc = 'CopilotChat - Open Chat window' },
      { '<leader>cc', ':CopilotChat ', mode = 'x', desc = 'CopilotChat - Open Chat window' },
		},
	},
}
