return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  event = 'VeryLazy',
  keys = {
    { '<leader>ec', '<cmd>Neotree toggle<CR>', desc = 'Toggle explorer' },
  },
  opts = {
    hijack_netrw_behavior = 'open_current',
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = { 'node_modules', '.git' },
      },
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      width = 'fit_content',
      mappings = {
        ['<space>'] = 'none', -- don't conflict with leader
      },
    },
    default_component_configs = {
      file_size = { enabled = false },
      type = { enabled = false },
      last_modified = { enabled = false },
      created = { enabled = false },
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
      },
      git_status = {
        symbols = {
          added = '',
          modified = '',
          deleted = '✖',
          renamed = '󰁕',
          untracked = '',
          ignored = '',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
    },
  },
}
