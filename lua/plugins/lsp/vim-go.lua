-- Plugin: fatih/vim-go
-- WARNING: vim-go conflicts with gopls (both handle formatting/build for Go).
-- Since gopls is configured with gofumpt + staticcheck in lsp.lua,
-- vim-go is redundant. Consider removing this file.
-- If you keep it, at minimum set: vim.g.vim_go_def_mapping_enabled = 0
-- and vim.g.vim_go_fmt_autosave = 0 to avoid double-formatting.
return {
  'fatih/vim-go',
  event = 'VeryLazy',
  init = function()
    -- Disable vim-go features that overlap with gopls/conform
    vim.g.vim_go_def_mapping_enabled = 0
    vim.g.vim_go_fmt_autosave = 0
    vim.g.vim_go_gopls_enabled = 0
  end,
}
