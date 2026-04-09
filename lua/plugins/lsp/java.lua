-- nvim-jdtls: Java LSP via jdtls
-- Only loads for Java files. jdtls must be installed via Mason (:MasonInstall jdtls).
---@module 'lazy'
---@type LazySpec
return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  config = function()
    require('jdtls').start_or_attach {
      cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls' },
      root_dir = vim.fs.dirname(
        vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]
      ),
    }
  end,
}
