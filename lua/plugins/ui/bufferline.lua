return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  keys = {
    {
      '<leader>x',
      function()
        if vim.bo.filetype == 'neo-tree' then return end
        local bufs = vim.fn.getbufinfo { buflisted = 1 }
        if #bufs > 1 then vim.cmd 'BufferLineCyclePrev' end
        vim.cmd 'bdelete #'
      end,
      desc = 'Close buffer',
    },
    { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
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
      tab_selected = { fg = '#333333', bg = '#EB8A8F' },
      tab = { fg = '#6c7086' },
      duplicate_selected = { fg = '#333333', bg = '#EB8A8F' },
      modified_selected = { fg = '#333333', bg = '#EB8A8F' },
      separator_selected = { fg = '#EB8A8F', bg = '#EB8A8F' },
      separator_visible = { fg = '#6c7086' },
      separator = { fg = '#6c7086' },

      indicator_selected = { fg = '#EB8A8F', bg = '#EB8A8F' },
    },
    options = {
      diagnostics_update_in_insert = false,
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
