HOME = vim.fn.expand('~')
return {
	'obsidian-nvim/obsidian.nvim',
	lazy = true,
	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
	event = { 'BufReadPre ' .. HOME .. '/Notes/**.md', 'BufReadPre ' .. HOME .. '/Projects/EFGH/wiki/**.md' },
	dependencies = {
		-- Required.
		'nvim-lua/plenary.nvim',
		-- 'hrsh7th/nvim-cmp',
		-- Optional, for search and quick-switch functionality.
		'nvim-telescope/telescope.nvim',
	},
	-- opts = {
	-- 	workspaces = {
	-- 		{ name = 'notes', path = HOME .. '/Notes' },
	-- 		{ name = 'wiki', path = HOME .. '/Projects/EFGH/wiki' },
	-- 	},
	-- },
	config = function()
		vim.opt.conceallevel = 2
		require('obsidian').setup({
			workspaces = {
				{ name = 'notes', path = HOME .. '/Notes' },
				{ name = 'wiki', path = HOME .. '/Projects/EFGH/wiki' },
			},
      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
      }
		})
	end,
}
