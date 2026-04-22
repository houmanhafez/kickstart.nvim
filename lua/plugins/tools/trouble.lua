return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Diagnostics' },
    { '<leader>xb', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer diagnostics' },
    { '<leader>xs', '<cmd>Trouble symbols toggle<CR>', desc = 'Symbols' },
    { '<leader>xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Location list' },
    { '<leader>xq', '<cmd>Trouble qflist toggle<CR>', desc = 'Quickfix' },
  },
  opts = {
    modes = {
      diagnostics = {
        win = { position = 'right', size = 60 },
      },
    },
  },
}
