return {
  -- Which-key: shows pending keybinds
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>h', group = 'Git [H]unk' },
      },
    },
  },

  -- Statusline
  {
    'echasnovski/mini.statusline',
    version = false,
    config = function()
      require('mini.statusline').setup({
        use_icons = true,
        content = {
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')

            return MiniStatusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineDevinfo', strings = { cwd } },
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { location } },
            })
          end,
        },
      })
    end,
  },

  -- Icons
  {
    'echasnovski/mini.icons',
    version = false,
    opts = {},
  },

  -- Scrollbar with diagnostics, search, and git indicators
  {
    'petertriho/nvim-scrollbar',
    event = 'BufReadPost',
    dependencies = { 'lewis6991/gitsigns.nvim' },
    config = function()
      require('scrollbar').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },

  -- Todo comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
