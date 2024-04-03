for i = 1, 9 do
  require('util').nmap('<leader>' .. i,
                       function() require('grapple').select({index = i}) end)
end
return {
  'cbochs/grapple.nvim',
  dependencies = {'nvim-lua/plenary.nvim'},
  keys = {
    {
      '<leader>!',
      function() require('grapple').toggle() end,
      desc = 'Toggle Grapple'
    }, {
      '<leader><Tab>',
      function() require('grapple').cycle_forward() end,
      desc = 'Cycle Forward to next Grapple'
    }, {
      '<leader><S-Tab>',
      function() require('grapple').cycle_backward() end,
      desc = 'Cycle Forward to next Grapple'
    }, {
      '<leader>f<Tab>',
      function() require('grapple').toggle_tags() end,
      desc = 'Toggle Grapple Tags View'
    }
  }
}
