local nmap = require('util').nmap

local function project_live_grep()
  require('telescope.builtin').live_grep({
    search_dirs = {require('util').findGitDirectory(vim.loop.cwd())}
  })
end

local telescope_prefix = '<leader>f'
nmap(telescope_prefix .. 'f', '<cmd>Telescope find_files<cr>')
nmap(telescope_prefix .. 'p', '<cmd>Telescope git_files<cr>')
-- Grep local to cwd
nmap(telescope_prefix .. 'i', '<cmd>Telescope live_grep<cr>')
-- Grep in project
nmap(telescope_prefix .. 'g', project_live_grep)
nmap(telescope_prefix .. 'b', '<cmd>Telescope buffers<cr>')
nmap(telescope_prefix .. 'h', '<cmd>Telescope search_history<cr>')
nmap(telescope_prefix .. 'c', '<cmd>Telescope command_history<cr>')
nmap(telescope_prefix .. 'q', '<cmd>Telescope quickfix<cr>')
nmap(telescope_prefix .. 'R', '<cmd>Telescope registers<cr>')
nmap(telescope_prefix .. 's', '<cmd>Telescope spell_suggest<cr>')
nmap(telescope_prefix .. 'o', '<cmd>Telescope oldfiles<cr>')
nmap(telescope_prefix .. 'm', '<cmd>Telescope marks<cr>')
nmap(telescope_prefix .. 'k', '<cmd>Telescope keymaps<cr>')
nmap(telescope_prefix .. 'l', '<cmd>Telescope lsp_references <cr>')

return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  opts = {
    defaults = {path_display = {'truncate'}},
    pickers = {
      buffers = {
        show_all_buffers = true,
        sort_lastused = true,
        previewer = true,
        mappings = {
          i = {['<c-d>'] = 'delete_buffer'},
          n = {['dd'] = 'delete_buffer'}
        }
      }
    }
  }
}
