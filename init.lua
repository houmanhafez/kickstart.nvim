vim.env.XDG_CACHE_HOME = os.getenv 'HOME' .. '/.nvim'

-- [[ Globals ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Options ]]
vim.o.number = true
vim.o.fillchars = 'eob: '
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.wrap = false
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- Sync clipboard after UiEnter to avoid startup-time penalty
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- [[ Keymaps ]]
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>write<CR>', { desc = 'Save file' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result (centered)' })

-- Window navigation (CTRL and Alt variants for terminal compat)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })
vim.keymap.set('n', '<M-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<M-l>', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<M-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<M-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

-- Split resize
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +2<CR>', { desc = 'Decrease split width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -2<CR>', { desc = 'Increase split width' })

-- Misc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>tt', '<cmd>10split | terminal<CR>', { desc = 'Open terminal' })

vim.keymap.set('i', '<C-f>', '<Esc>la', { desc = 'Move out of pair' })
-- [[ Diagnostics ]]
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,
  virtual_lines = false,
  jump = { float = true },
}

-- [[ Autocmds ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- [[ Transparent background ]]
local transparent_groups = { 'Normal', 'NormalFloat', 'CursorLine', 'CursorColumn', 'ColorColumn', 'SignColumn', 'LineNr', 'EndOfBuffer' }
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('transparent-bg', { clear = true }),
  callback = function()
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = 'none' })
    end
    vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'IblScope', { fg = '#555555' })
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2a2a3d' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffffff', bold = true })
  end,
})

-- [[ neotree stupid ]]
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'neo-tree',
  callback = function() vim.cmd 'wincmd L' end,
})

-- [[ lazy.nvim bootstrap ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugin setup ]]
require('lazy').setup({
  { import = 'plugins' },
  { import = 'plugins.editor' },
  { import = 'plugins.lsp' },
  { import = 'plugins.ui' },
  { import = 'plugins.tools' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
