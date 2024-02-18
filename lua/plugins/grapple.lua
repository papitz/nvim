for i = 1, 9 do
  require('util').nmap('<leader>' .. i,
                       function() require('grapple').select({key = i}) end)
end
return {
  'cbochs/grapple.nvim',
  dependencies = {'nvim-lua/plenary.nvim'},
  config = function()
    local nmap = require('util').nmap
    nmap('<leader>!', require('grapple').toggle)
    nmap('<leader><Tab>', require('grapple').cycle_forward)
    nmap('<leader><S-Tab>', require('grapple').cycle_forward)
    nmap('<leader>Gp', function() require('grapple').popup_tags() end)
  end
}
