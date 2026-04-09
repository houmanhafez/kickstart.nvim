---@module 'lazy'
---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    local parsers = {
      'bash', 'c', 'diff', 'go', 'gomod', 'gowork',
      'html', 'java', 'lua', 'luadoc',
      'markdown', 'markdown_inline',
      'python', 'query', 'typescript', 'vim', 'vimdoc',
    }
    require('nvim-treesitter').install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end
        if not vim.treesitter.language.add(language) then return end
        vim.treesitter.start(buf, language)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
