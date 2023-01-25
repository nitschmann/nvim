require('telescope').setup{
  file_ignore_patterns = {
    'vendor/',
    'log/',
    'swap/',
    'tmp/',
    'node_modules/',
  },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
-- TODO: check if these mappings are really needed
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
