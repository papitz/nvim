return {
	{
		'echasnovski/mini.icons',
		opts = {},
		lazy = true,
		specs = {
			{ 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
		},
		init = function()
			package.preload['nvim-web-devicons'] = function()
				require('mini.icons').mock_nvim_web_devicons()
				return package.loaded['nvim-web-devicons']
			end
		end,
	},
  -- Automatically set root directory for projects
	{
		'echasnovski/mini.misc',
		config = function()
			require('mini.misc').setup()
      MiniMisc.setup_auto_root()
		end,
	},
}
