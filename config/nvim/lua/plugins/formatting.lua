return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = function()
    -- Use dprint if the project has a dprint config, otherwise prettier
    local function ts_formatter()
      local has_dprint = vim.fs.find('dprint.json', {
        upward = true,
        path = vim.api.nvim_buf_get_name(0),
        type = 'file',
      })
      if #has_dprint > 0 then
        return { 'eslint_d', 'dprint' }
      end
      return { 'eslint_d', 'prettier' }
    end

    return {
      formatters_by_ft = {
        typescript = ts_formatter,
        typescriptreact = ts_formatter,
        javascript = ts_formatter,
        javascriptreact = ts_formatter,
        json = ts_formatter,
        jsonc = ts_formatter,
        html = { 'prettier' },
        css = { 'prettier' },
        markdown = { 'prettier' },
        yaml = { 'prettier' },
        lua = { 'stylua' },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
    }
  end,
}
