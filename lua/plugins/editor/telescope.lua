---@module 'lazy'
---@type LazySpec
return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function() return vim.fn.executable 'make' == 1 end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local map = function(keys, func, desc, mode)
      vim.keymap.set(mode or 'n', keys, func, { desc = desc })
    end

    map('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
    map('<leader>sk', builtin.keymaps, '[S]earch [K]eymaps')
    map('<leader>sf', builtin.find_files, '[S]earch [F]iles')
    map('<leader>ss', builtin.builtin, '[S]earch [S]elect Telescope')
    map('<leader>sw', builtin.grep_string, '[S]earch current [W]ord', { 'n', 'v' })
    map('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
    map('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
    map('<leader>sr', builtin.resume, '[S]earch [R]esume')
    map('<leader>s.', builtin.oldfiles, '[S]earch Recent Files')
    map('<leader>sc', builtin.commands, '[S]earch [C]ommands')
    map('<leader>sn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, '[S]earch [N]eovim files')
    map('<leader><leader>', builtin.buffers, '[ ] Find existing buffers')

    map('<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
    end, '[/] Fuzzily search in current buffer')

    map('<leader>s/', function()
      builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
    end, '[S]earch [/] in Open Files')

    -- LSP-aware pickers — registered on attach so they're buffer-local
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf
        local bmap = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = buf, desc = desc })
        end
        bmap('grr', builtin.lsp_references, '[G]oto [R]eferences')
        bmap('gri', builtin.lsp_implementations, '[G]oto [I]mplementation')
        bmap('grd', builtin.lsp_definitions, '[G]oto [D]efinition')
        bmap('gO', builtin.lsp_document_symbols, 'Open Document Symbols')
        bmap('gW', builtin.lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
        bmap('grt', builtin.lsp_type_definitions, '[G]oto [T]ype Definition')
      end,
    })
  end,
}
