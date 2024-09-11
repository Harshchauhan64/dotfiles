-- Load core configurations
require('options')
require('keymaps')

-- Load plugin manager and plugins
require('config.lazy')

-- Load plugin-specific configurations
require('plugins.misc')
require('plugins.gutterline')
require('plugins.dashboard')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.filetree')
require('plugins.gitsigns')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.format')
