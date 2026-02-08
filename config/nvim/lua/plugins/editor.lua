return {
  -- Surround text objects
  {
    'echasnovski/mini.surround',
    version = false,
    opts = {},
  },

  -- Auto-close brackets
  {
    'echasnovski/mini.pairs',
    version = false,
    event = 'InsertEnter',
    opts = {},
  },

  -- Auto-detect indentation
  {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPre',
    opts = {},
  },

  -- Visual undo history tree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle Undotree' },
    },
  },

  -- Project-wide diagnostics panel
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer Diagnostics (Trouble)' },
    },
    opts = {},
  },

  -- Render markdown inline (headings, bullets, code blocks)
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  -- Toggleable LSP docs side panel
  {
    'amrbashir/nvim-docs-view',
    cmd = 'DocsViewToggle',
    keys = {
      { '<leader>k', '<cmd>DocsViewToggle<CR>', desc = 'Toggle Docs Panel' },
    },
    opts = {
      position = 'right',
      width = 60,
    },
  },
}
