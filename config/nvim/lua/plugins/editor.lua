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

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPost',
    opts = {
      indent = { char = '│' },
      scope = { enabled = true },
    },
  },

  -- Quick file pinning and jumping
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon add file' })
      vim.keymap.set('n', '<leader>m', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon menu' })
      vim.keymap.set('n', '<C-1>', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
      vim.keymap.set('n', '<C-2>', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
      vim.keymap.set('n', '<C-3>', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
      vim.keymap.set('n', '<C-4>', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })
    end,
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
