return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  keys = {
    { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    { '<leader>x', '<cmd>bdelete<CR>', desc = 'Close buffer' },
  },
  opts = {
    highlights = {
      buffer_selected = {
        bold = true,
        italic = false,
        fg = '#333333',
        bg = '#EB8A8F',
      },
      buffer_visible = {
        fg = '#6c7086',
      },
      buffer = {
        fg = '#6c7086',
      },
    },
    options = {
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(_, _, diag)
        local icons = { error = ' ', warning = ' ', hint = ' ', info = ' ' }
        local ret = (diag.error and icons.error .. diag.error .. ' ' or '') .. (diag.warning and icons.warning .. diag.warning or '')
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Explorer',
          highlight = 'Directory',
          text_align = 'center',
        },
      },
      separator_style = 'thick',
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
    },
  },
}
