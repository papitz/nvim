require('util').nmap('<leader>Gd', ':DogeGenerate<CR>')
-- vim.cmd([[
-- filetype plugin on
-- ]])

--  FIXME: This does not work currently
--  Might be time to replace this with copilot
return {
  'kkoomen/vim-doge',
  cmd = 'DogeGenerate',
  build = function() vim.fn['doge#install']() end
}
