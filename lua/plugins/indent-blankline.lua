return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'VeryLazy',
  opts = function()
    local indent_blankline_style = 1
    local indent_blankline_styles = {'│', '¦', '┆', '▏', '⎸', '|'}

    return {
      indent = {char = indent_blankline_styles[indent_blankline_style]},
      -- context_patterns = {
      --     "class", "function", "method", "^if", "^case", "^while", "^use", "^for"
      -- },

      --  TODO: This needs some working but might be picked up by the colorscheme
      scope = {enabled = true, show_start = false, show_end = false},
      whitespace = {remove_blankline_trail = true},
      -- show_first_indent_level = false,
      exclude = {
        buftypes = {
          'help', 'terminal', 'dashboard', 'packer', 'mason', 'lspinfo', 'norg'
        },
        filetypes = {'dashboard'}
      }
    }
  end
}
