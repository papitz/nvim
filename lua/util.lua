--  TODO: Put this together with the other util file
local M = {}
function M.findGitDirectory(startingDirectory)
  local currentDirectory = startingDirectory

  while true do
    local gitPath = currentDirectory .. '/.git'
    local file = io.open(gitPath, 'r')

    if file then
      io.close(file)
      return currentDirectory
    end

    local parentDirectory = currentDirectory:match('(.*)[/\\][^/\\]+')
    -- Stop if we reach the /home directory
    if not parentDirectory or parentDirectory == currentDirectory then break end

    currentDirectory = parentDirectory
  end

  return startingDirectory -- Return startingDirectory if no .git directory is found
end

function M.map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, {noremap = true, silent = true})
end

-- function for normal mode
function M.nmap(shortcut, command) M.map('n', shortcut, command) end

-- function for insert mode
function M.imap(shortcut, command) M.map('i', shortcut, command) end

-- function for visual mode
function M.vmap(shortcut, command) M.map('v', shortcut, command) end

return M
