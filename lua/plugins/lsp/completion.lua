---@module 'lazy'
---@type LazySpec
return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
        return 'make install_jsregexp'
      end)(),
      opts = {},
    },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'cancel', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      ghost_text = { enabled = false },
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = { default = { 'lsp', 'path', 'snippets' } },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
