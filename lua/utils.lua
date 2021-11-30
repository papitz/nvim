-- update all of the plugins, nvim and our config
function _G.update_wwctvim()
	-- os.execute("yay -S neovim-git --noconfirm") --  TODO: check how this can work
	os.execute("cd " .. HOME .. "/.config/nvim")
	os.execute("git pull")
	vim.cmd(":PackerSync")
	print("Successful! Restart vim and update nvim from a terminal by running 'yay -S neovim-git")
end

vim.cmd("command! UpdateWWCTVIM lua update_wwctvim()")
