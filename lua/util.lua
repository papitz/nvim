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

        local parentDirectory = currentDirectory:match("(.*)[/\\][^/\\]+")
        -- Stop if we reach the /home directory
        if not parentDirectory or parentDirectory == currentDirectory then
            break
        end

        currentDirectory = parentDirectory
    end

    return startingDirectory -- Return startingDirectory if no .git directory is found
end

return M
