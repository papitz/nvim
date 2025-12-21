HOME = vim.fn.expand('~')

return {
	'obsidian-nvim/obsidian.nvim',
	lazy = true,
	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
	event = {
		'BufReadPre ' .. HOME .. '/quatro/notes/**.md',
		'BufReadPre ' .. HOME .. '/Notes/**.md',
		'BufReadPre ' .. HOME .. '/Projects/EFGH/wiki/**.md',
	},
	dependencies = {
		-- Required.
		'nvim-lua/plenary.nvim',
		-- 'hrsh7th/nvim-cmp',
		-- Optional, for search and quick-switch functionality.
		'nvim-telescope/telescope.nvim',
	},
	keys = {
		{
			'<leader>ot',
			desc = 'Obsidian today',
			'<cmd>Obsidian today<cr>',
			silent = true,
		},
    {
      '<leader>oy',
      desc = 'Obsidian yesterday',
      '<cmd>Obsidian yesterday<cr>',
      silent = true,
    },
    {
      '<leader>on',
      desc = 'Obsidian new',
      '<cmd>Obsidian new<cr>',
      silent = true,
    },
    {
      '<leader>oi',
      desc = 'Obsidian paste_img',
      '<cmd>Obsidian paste image<cr>',
      silent = true,
    },
	},
	config = function()
		vim.opt.conceallevel = 2
		require('obsidian').setup({
			legacy_commands = false,
			templates = {
				folder = 'templates',
				date_format = '%Y-%m-%d-%a',
				time_format = '%H:%M',
			},
			checkbox = {
				enabled = true,
				create_new = true,
				order = { ' ', 'x', '!', '>', '~' },
			},
			note_id_func = function(title)
				local lowercased_text = string.lower(title)

				-- 2. Replace all sequences of spaces, hyphens, and most punctuation/symbols
				-- with a single underscore.
				-- Pattern: [^%w]+ means "one or more characters that are NOT alphanumeric"
				local cleaned_text = string.gsub(lowercased_text, '[%s%-%,%.:;!?@#$%%^&*(%)]+', '_')

				-- 3. Replace multiple underscores in a row with a single underscore.
				local single_underscore_text = string.gsub(cleaned_text, '__+', '_')

				-- 4. Clean up the ends (remove leading/trailing underscores)
				local final_title = single_underscore_text:match('^_*([a-z0-9_].*[a-z0-9_])_*$')

				-- 5. Return the cleaned text, or an empty string if it was all non-alphanumeric.
				if final_title == nil then
					-- Handle cases where the input was empty or only non-alphanumeric characters
					-- that were reduced to a single underscore or nothing.
					return single_underscore_text:match('[a-z0-9]+') or title
				end

				return final_title
			end,
			workspaces = {
				{ name = 'qs-notes', path = HOME .. '/quatro/notes' },
				{ name = 'notes', path = HOME .. '/Notes' },
				{ name = 'wiki', path = HOME .. '/Projects/EFGH/wiki' },
			},
			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = 'daily',
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = '%Y-%m-%d',
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = '%B %-d, %Y',
				-- Optional, default tags to add to each new daily note created.
				default_tags = { 'daily-notes' },
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = 'daily.md',
			},
			completion = {
				nvim_cmp = false,
				blink = true,
				min_chars = 2,
			},
		})
	end,
}
