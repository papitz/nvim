return {
	{
		'GCBallesteros/jupytext.nvim',
		config = true,
		-- Depending on your nvim distro or config you may need to make the loading not lazy
		lazy = false,
	},
	{
		'GCBallesteros/NotebookNavigator.nvim',
		keys = {
			{
				']h',
				function()
					require('notebook-navigator').move_cell('d')
				end,
        silent = true,
			},
			{
				'[h',
				function()
					require('notebook-navigator').move_cell('u')
				end,
        silent = true,
			},
			{
				'<leader>rr',
				function()
					require('notebook-navigator').run_cell()
				end,
				desc = 'Run the cell',
        silent = true,
			},
			{
				'<leader>rg',
				function()
					require('notebook-navigator').run_and_move()
				end,
				desc = 'Run the cell and go to next',
        silent = true,
			},
			{
				'<leader>rb',
				function()
					require('notebook-navigator').add_cell_below()
				end,
				desc = 'Add a cell below',
        silent = true,
			},
			{
				'<leader>ra',
				function()
					require('notebook-navigator').add_cell_above()
				end,
				desc = 'Add a cell above',
        silent = true,
			},
			{
				'<leader>rs',
				function()
					require('notebook-navigator').split_cell()
				end,
				desc = 'Split the cell',
        silent = true,
			},
			{
				'<leader>rR',
				function()
					require('notebook-navigator').run_all_cells()
				end,
				desc = 'Run all cells',
        silent = true,
			},
			{
				'<leader>rB',
				function()
					require('notebook-navigator').run_cells_below()
				end,
				desc = 'Run all cells below',
        silent = true,
			},
		},
		dependencies = {
			'echasnovski/mini.comment',
			'benlubas/molten-nvim', -- alternative repl provider
			-- 'anuvyklack/hydra.nvim',
		},
		-- event = 'VeryLazy',
    ft = { 'python', 'jupyter' },
		config = function()
			local nn = require('notebook-navigator')
			nn.setup({
				-- activate_hydra_keys = '<leader>rh',
				repl_provider = 'molten',
				--  FIXME: Hydra is not working
				-- activate_hydra_keys = '<leader>rh',
				-- -- If `true` a hint panel will be shown when the hydra head is active. If `false`
				-- -- you get a minimalistic hint on the command line.
				-- show_hydra_hint = true,
				-- -- Mappings while the hydra head is active.
				-- -- Any of the mappings can be set to "nil", the string! Not the value! to unamp it
				-- hydra_keys = {
				-- 	comment = 'c',
				-- 	run = 'X',
				-- 	run_and_move = 'x',
				-- 	move_up = 'k',
				-- 	move_down = 'j',
				-- 	add_cell_before = 'a',
				-- 	add_cell_after = 'b',
				-- },
			})
		end,
	},
	{
		'echasnovski/mini.hipatterns',
		-- event = 'VeryLazy',
    ft = { 'python', 'jupyter' },
		dependencies = { 'GCBallesteros/NotebookNavigator.nvim' },
		opts = function()
			local nn = require('notebook-navigator')

			local opts = { highlighters = { cells = nn.minihipatterns_spec } }
			return opts
		end,
	},
	{
		'echasnovski/mini.ai',
		-- event = 'VeryLazy',
    ft = { 'python', 'jupyter' },
		dependencies = { 'GCBallesteros/NotebookNavigator.nvim' },
		opts = function()
			local nn = require('notebook-navigator')

			local opts = { custom_textobjects = { h = nn.miniai_spec } }
			return opts
		end,
	},
	{
		'benlubas/molten-nvim',
		version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
		build = ':UpdateRemotePlugins',
    ft = { 'python', 'jupyter' },
		-- dependencies = { '3rd/image.nvim' },
		init = function()
			vim.g.python3_host_prog = vim.fn.expand('~/.virtualenvs/nvim/bin/python3')
			vim.g.molten_output_virt_lines = true
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_virt_text_output = false
			-- 	vim.g.molten_image_provider = 'image.nvim'
		end,
		keys = {
			{
				'<leader>ri',
				function()
					local venv = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX')
					if venv ~= nil then
						venv = string.match(venv, '/.+/(.+)')
						vim.cmd(('MoltenInit %s'):format(venv))
					else
						vim.cmd('MoltenInit python3')
					end
				end,
				desc = 'Init Molten with venv',
        silent = true,
			},
			{
				'<leader>rx',
				':MoltenRestart<CR>',
				desc = 'Restart Molten Kernel',
        silent = true,
			},
			{
				'<leader>re',
				':noautocmd MoltenEnterOutput<CR>',
				desc = 'Restart Molten Kernel',
        silent = true,
			},
			{
				'<leader>rh',
				':MoltenHideOutput<CR>',
				desc = 'Hide Molten Output',
        silent = true,
			},
			{
				'<leader>ro',
				':MoltenShowOutput<CR>',
				desc = 'Show Molten Output',
        silent = true,
			},
			{
				'<leader>rd',
				':MoltenDelete<CR>',
				desc = 'Delete Molten Output',
        silent = true,
			},
			{
				'<leader>rD',
				':MoltenDelete !<CR>',
				desc = 'Delete Molten Output (all)',
        silent = true,
			},
		},
	},
	-- {
	-- 	'3rd/image.nvim',
	-- 	build = false,
	-- 	version = '1.1.0',
	-- 	event = 'VeryLazy',
	-- 	opts = {
	-- 		backend = 'ueberzug',
	-- 		processor = 'magick_cli',
	-- 		max_width = 100, -- tweak to preference
	-- 		max_height = 12, -- ^
	-- 		max_height_window_percentage = math.huge, -- this is necessary for a good experience
	-- 		max_width_window_percentage = math.huge,
	-- 		window_overlap_clear_enabled = true,
	-- 	},
	-- },
}
