return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'none',
        includeCompletionsForModuleExports = true, -- auto imports
        importModuleSpecifierPreference = 'non-relative',
      },
    },
  },
}
