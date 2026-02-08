return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<CR>', desc = 'Navigate left (vim/tmux)' },
      { '<C-j>', '<cmd>TmuxNavigateDown<CR>', desc = 'Navigate down (vim/tmux)' },
      { '<C-k>', '<cmd>TmuxNavigateUp<CR>', desc = 'Navigate up (vim/tmux)' },
      { '<C-l>', '<cmd>TmuxNavigateRight<CR>', desc = 'Navigate right (vim/tmux)' },
    },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      { 's', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Flash' },
      { 'S', function() require('flash').treesitter() end, mode = { 'n', 'x', 'o' }, desc = 'Flash Treesitter' },
      { 'r', function() require('flash').remote() end, mode = 'o', desc = 'Remote Flash' },
      { '<c-s>', function() require('flash').toggle() end, mode = 'c', desc = 'Toggle Flash Search' },
    },
    opts = {},
  },
}
