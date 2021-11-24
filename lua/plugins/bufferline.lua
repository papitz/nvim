local present, bufferline = pcall(require, "bufferline")
if not present then
	return
end

bufferline.setup({
	options = {
		numbers = function(opts)
			return string.format("%s", opts.id)
		end,
		diagnostics = "nvim_lsp",
		show_close_icon = false,
		separator_style = "slant", -- "thick" "thin"
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				padding = 1,
				text_align = "left",
			},
		},
		sort_by = "directory", -- 'id' | 'extension' | 'relative_directory'
	},
})
