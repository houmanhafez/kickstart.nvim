-- store.nvim — plugin browser
-- NOTE: keybind changed from <leader>s to <leader>ps to avoid conflict
--       with the <leader>s = [S]earch which-key group.
---@module 'lazy'
---@type LazySpec
return {
  'alex-popov-tech/store.nvim',
  dependencies = { 'OXY2DEV/markview.nvim' },
  cmd = 'Store',
  keys = {
    { '<leader>ps', '<cmd>Store<cr>', desc = 'Open [P]lugin [S]tore' },
  },
  opts = {},
}
