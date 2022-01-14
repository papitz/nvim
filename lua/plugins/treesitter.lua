local present, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

nvim_treesitter.setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
		disable = { "latex" },
	},
	matchup = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- also highlight html tags
	},
})

vim.cmd([[
autocmd BufEnter * set foldmethod=expr
autocmd BufEnter * set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
]])
