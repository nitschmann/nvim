-- all language servers to be used. list could be found under https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local language_servers = {
  'clangd',
  'cssls',
  'dockerls',
  'gopls',
  'graphql',
  'html',
  'jsonls',
  'tsserver',
  'sumneko_lua',
  'marksman',
  'pylsp',
  'solargraph',
  'sqls',
  'taplo',
  'tsserver',
  'vuels',
  'yamlls',
}

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = language_servers
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

  -- format file correctly
  -- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  --   pattern = { '*' },
  --   callback = function()
  --     vim.lsp.buf.format({ async = true })
  --   end,
  -- })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in pairs(language_servers) do
  require('lspconfig')[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
