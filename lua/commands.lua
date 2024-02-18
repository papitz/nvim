-- update all of the plugins, nvim and our config
function _G.update_wwctvim()
  -- os.execute("yay -S neovim-git --noconfirm") --  TODO: check how this can work
  os.execute('cd ' .. HOME .. '/.config/nvim')
  os.execute('git pull')
  vim.cmd(':PackerSync')
  print(
      'Successful! Restart vim and update nvim from a terminal by running \'yay -S neovim-git')
end

vim.cmd('command! UpdateWWCTVIM lua update_wwctvim()')

-- run corresponding command in a Terminal
local fmt = string.format

local term_wrapper = function(command, file)
  vim.cmd('new | resize 10')
  vim.cmd('term ' .. fmt(command, file))
  vim.cmd(
      'setl nobuflisted nornu nonu nocursorline scrolloff=0 signcolumn=no laststatus=0')
  vim.cmd('silent! file CompileAndRun')
  vim.cmd('startinsert')
  vim.cmd('au WinLeave * set laststatus=2')
end

local commands = {
  c = 'make && %s',
  cpp = 'g++ %s && ./a.out',
  javascript = 'node %s',
  lua = 'lua %s',
  python = 'python3 %s',
  ruby = 'ruby %s'
}

_G.compile_and_run = function()
  local filetype = vim.bo.filetype
  local cmd = commands[filetype]
  if cmd then
    term_wrapper(cmd, vim.fn.expand('%'))
  else
    vim.notify(fmt('Filetype "%s" is not supported yet', filetype),
               vim.log.levels.INFO)
  end
end

vim.cmd('command! CompileAndRun lua compile_and_run()')
