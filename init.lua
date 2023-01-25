vim.opt.encoding = 'utf-8'

-- modules
--
require('core.plugins')
require('core.plugin_config')
require('helper')

-- global settings
--
-- set terminal title to filename
vim.opt.title = true

-- enable scrolling and mouse-clicks
vim.opt.mouse = 'a'
vim.opt.autoread = true
vim.opt.cursorline = true
vim.opt.lazyredraw = false

-- open splits always right
vim.opt.splitright = true

-- set dark background
vim.opt.background = dark

-- show line numbers
vim.opt.number = true

-- syntax highlighting on
vim.syntax = 'on'

-- tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- leader key settings
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- 100 chars border
vim.opt.colorcolumn = '100'

-- search settings
vim.opt.showmatch = true

-- copy settings
vim.opt.clipboard = 'unnamedplus'

vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-- auto cmd setup
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.go' },
  command = [[lua go_org_imports()]],
})

-- wildignore certain dirs
local ignore_dir_paths = {
  'vendor/**',
  'log/**',
  'swap/**',
  'tmp/**',
  'node_modules/**',
}

for _, dir in pairs(ignore_dir_paths) do
  vim.opt.wildignore:append(dir)
end

-- key mappings
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
