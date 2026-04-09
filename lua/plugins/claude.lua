local disable = true
if disable then
  return {}
end
return {
	'coder/claudecode.nvim',
	dependencies = { 'folke/snacks.nvim' },
	config = true,
	keys = {
		{ '<leader>a', nil, desc = 'AI/Claude Code' },
		{ '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
		{ '<c-.>', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude', mode = { 'n', 'x', 't' } },
		{ '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
		{ '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
		{ '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
		{ '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
		{ '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
		{ '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
		{
			'<leader>af',
			'<cmd>ClaudeCodeTreeAdd<cr>',
			desc = 'Add file',
			ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
		},
		-- Diff management
		{ '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
		{ '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
	},
	opts = {
		diff_opts = {
			auto_close_on_accept = true,
			vertical_split = true,
			open_in_current_tab = false,
			keep_terminal_focus = false, -- If true, moves focus back to terminal after diff opens (including floating terminals)
		},
		keys = {
			claude_hide = {
				'<c-.>',
				function(self)
					self:hide()
				end,
				mode = 't',
				desc = 'Hide',
			},
		},
	},
}
