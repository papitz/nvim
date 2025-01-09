-- return {
-- 	'garymjr/nvim-snippets',
-- 	dependencies = {
-- 		'rafamadriz/friendly-snippets',
-- 	},
-- 	opts = {
-- 		friendly_snippets = true,
-- 	},
-- 	keys = {
-- 		{
-- 			'<C-j>',
-- 			function()
-- 				if vim.snippet.active({ direction = 1 }) then
-- 					vim.schedule(function()
-- 						vim.snippet.jump(1)
-- 					end)
-- 					return
-- 				end
-- 				return '<Tab>'
-- 			end,
-- 			expr = true,
-- 			silent = true,
-- 			mode = 'i',
-- 		},
-- 		{
-- 			'<C-j>',
-- 			function()
-- 				vim.schedule(function()
-- 					vim.snippet.jump(1)
-- 				end)
-- 			end,
-- 			expr = true,
-- 			silent = true,
-- 			mode = 's',
-- 		},
-- 		{
-- 			'<C-k>',
-- 			function()
-- 				if vim.snippet.active({ direction = -1 }) then
-- 					vim.schedule(function()
-- 						vim.snippet.jump(-1)
-- 					end)
-- 					return
-- 				end
-- 				return '<S-Tab>'
-- 			end,
-- 			expr = true,
-- 			silent = true,
-- 			mode = { 'i', 's' },
-- 		},
-- 	},
-- }
-- FIXME: Latex bricks for some reason with snippets
return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  event = 'InsertEnter',
  dependencies = {
    'Neevash/awesome-flutter-snippets',
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end
    }
  },
  config = function()
    local nmap = require('util').nmap

    HOME = os.getenv('HOME')
    -- load snippets from the ~/.config/nvim/snippets/ directory for the corresponding language
    require('luasnip/loaders/from_snipmate').lazy_load({
      path = {HOME .. '/.config/nvim/snippets'}
    })

    -- command to open the snippet file that belongs to the language you are editing
    vim.cmd([[
            function SnippetsEdit()
                execute ":e ~/.config/nvim/snippets/" . &filetype . ".snippets"
            endfunction
            command! SnippetsEdit call SnippetsEdit()
        ]])
    nmap('<Leader>se', ':SnippetsEdit<CR>')

    local ls = require('luasnip')
    -- some shorthands...
    local snip = ls.snippet
    local text = ls.text_node
    local insert = ls.insert_node
    local func = ls.function_node

    ls.config.setup({
      store_selection_keys = '<Tab>',
      region_check_events = 'CursorMoved',
      delete_check_events = 'TextChanged'
    })

    ls.add_snippets('all', {
      snip({trig = 'todo', name = 'TODO_comment', dscr = 'Add a TODO comment'},
           {
        -- get the comment string of the buffer you are in and add a space to it
        func(function()
          return vim.api.nvim_get_option_value('commentstring',
                                               {scope = 'local'}):match(
                     '^(.*)%%s')
        end, {}), text(' TODO: '), insert(0, 'YOU REALLY NEED TO DO THIS'),
        func(function()
          local _, rightComment = vim.api.nvim_get_option_value('commentstring',
                                                                {
            scope = 'local'
          }):match('^(.*)%%s(.*)')
          return rightComment
        end, {})
      }),
      snip({trig = 'fix', name = 'FIXME_comment', dscr = 'Add a FIXME comment'},
           {
        -- get the comment string of the buffer you are in and add a space to it
        func(function()
          return vim.api.nvim_get_option_value('commentstring',
                                               {scope = 'local'}):match(
                     '^(.*)%%s')
        end, {}), text(' FIXME: '), insert(0, 'THIS NEEDS TO BE FIXED'),
        func(function()
          local _, rightComment = vim.api.nvim_get_option_value('commentstring',
                                                                {
            scope = 'local'
          }):match('^(.*)%%s(.*)')
          return rightComment
        end, {})
      })
    })
  end
}
