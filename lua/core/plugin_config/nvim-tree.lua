vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
  open_on_setup = true,
  view = {
    side = 'right',
    preserve_window_proportions = true,
    float = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
}

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
