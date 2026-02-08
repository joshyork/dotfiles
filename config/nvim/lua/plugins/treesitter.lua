return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()

    -- Install parsers
    local install = require('nvim-treesitter.install')
    install.prefer_git = false

    -- Ensure these parsers are installed
    local parsers = {
      'typescript',
      'tsx',
      'javascript',
      'json',
      'jsonc',
      'html',
      'css',
      'markdown',
      'markdown_inline',
      'lua',
      'vim',
      'vimdoc',
      'bash',
      'yaml',
      'toml',
      'diff',
      'regex',
    }

    -- Use vim.treesitter built-in highlighting (enabled by default in nvim 0.11+)
    -- Just ensure parsers are installed
    for _, parser in ipairs(parsers) do
      pcall(function()
        if not pcall(vim.treesitter.language.inspect, parser) then
          install.ensure_installed(parser)
        end
      end)
    end
  end,
}
