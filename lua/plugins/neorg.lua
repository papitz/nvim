require('util').map('n', '<Leader>Ni', ':Neorg inject-metadata<CR>')

return {
  {
    'nvim-neorg/neorg',
    ft = 'norg',
    dependencies = 'nvim-lua/plenary.nvim',
    -- build = ":Neorg sync-parsers",
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.export'] = {},
        ['core.export.markdown'] = {},
        ['core.norg.concealer'] = {},
        ['core.norg.completion'] = {config = {engine = 'nvim-cmp'}},
        ['core.norg.dirman'] = {
          config = {
            workspaces = {
              work = '~/notes/work',
              home = '~/notes/home',
              uni = '~/notes/uni'
            }
          }
        }
      }
    }
  }, {'jbyuki/venn.nvim', ft = 'norg'} -- Drawing Venn Diagramms in Neorg
}
