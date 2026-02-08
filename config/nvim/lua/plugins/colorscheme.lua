return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('tokyonight-storm')
    end,
  },
  { 'projekt0n/github-nvim-theme', lazy = false },
  { 'folke/tokyonight.nvim', lazy = false },
}
