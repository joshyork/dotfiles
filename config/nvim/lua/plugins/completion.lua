return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = 'make install_jsregexp',
    },
  },
  version = '*',
  opts = {
    keymap = {
      preset = 'default',
      ['<C-y>'] = { 'select_and_accept' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    snippets = {
      preset = 'luasnip',
    },
    signature = {
      enabled = true,
    },
  },
}
