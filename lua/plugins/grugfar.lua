return {
	'MagicDuck/grug-far.nvim',
	keys = {
		{
			'<leader>GG',
			'<cmd>GrugFar<CR>',
			desc = 'Search and replace',
		},
		{
			'<leader>Gf',
			function()
				require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })
			end,
			desc = 'Search and Replace in current file',
		},
    {
      '<leader>GG',
      function()
        require('grug-far').with_visual_selection()
      end,
      mode = {'v'},
      desc = 'Search and Replace with current selection',
    },
    {
      '<leader>Gf',
      function()
        require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })
      end,
      mode = {'v'},
      desc = 'Search and Replace with current selection in file',
    },
	},
	-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
	-- additional lazy config to defer loading is not really needed...
	config = function()
		-- optional setup call to override plugin options
		-- alternatively you can set options with vim.g.grug_far = { ... }
		require('grug-far').setup({
			-- options, see Configuration section below
			-- there are no required options atm
		})
	end,
}
