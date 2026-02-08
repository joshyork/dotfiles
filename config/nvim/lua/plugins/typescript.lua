return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  opts = {
    settings = {
      -- Separate diagnostic codes that are reported as hints
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'none',
        includeCompletionsForModuleExports = true,
        quotePreference = 'auto',
      },
      -- Complete function calls with signature
      complete_function_calls = true,
    },
    on_attach = function(_, bufnr)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'TS: ' .. desc })
      end

      map('<leader>co', '<cmd>TSToolsOrganizeImports<CR>', 'Organize imports')
      map('<leader>cs', '<cmd>TSToolsSortImports<CR>', 'Sort imports')
      map('<leader>cu', '<cmd>TSToolsRemoveUnusedImports<CR>', 'Remove unused imports')
      map('<leader>cd', '<cmd>TSToolsRemoveUnused<CR>', 'Remove unused statements')
      map('<leader>cf', '<cmd>TSToolsFixAll<CR>', 'Fix all')
      map('<leader>ci', '<cmd>TSToolsAddMissingImports<CR>', 'Add missing imports')
    end,
  },
}
