return {
  'vuki656/package-info.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  ft = 'json',
  keys = {
    { '<leader>ns', function() require('package-info').show() end, desc = 'Show package versions' },
    { '<leader>nu', function() require('package-info').update() end, desc = 'Update package' },
    { '<leader>ni', function() require('package-info').install() end, desc = 'Install package' },
  },
  opts = {},
}
