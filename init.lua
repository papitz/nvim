vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field
-- sourcing config files.
require('settings')
require('maps')
require('lazyinit')
require('commands')
require('theme')
