return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('typescript-tools').setup {
      settings = {
        tsserver_file_preferences = {
          includeCompletionsForModuleExports = true,
          importModuleSpecifierPreference = 'non-relative',
          includeAutomaticOptionalChainCompletions = true,
        },
      },
      on_attach = function(_, bufnr)
        vim.keymap.set('n', '<leader>oi', '<cmd>TSToolsAddMissingImports<CR>', { buffer = bufnr, desc = 'Add missing imports' })
        vim.keymap.set('n', '<leader>ou', '<cmd>TSToolsRemoveUnusedImports<CR>', { buffer = bufnr, desc = 'Remove unused imports' })
        vim.keymap.set('n', '<leader>oo', '<cmd>TSToolsOrganizeImports<CR>', { buffer = bufnr, desc = 'Organize imports' })
      end,
    }
  end,
}
