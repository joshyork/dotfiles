return {
  'goolord/alpha-nvim',
  lazy = false,
  priority = 900,
  config = function()
    local alpha = require('alpha')
    -- Load banner based on cwd
    local function load_banner()
      local cwd = vim.fn.getcwd()
      local banner_dir = vim.fn.stdpath('config') .. '/banners'

      -- Map directories to banner files
      local banners = {
        [vim.fn.expand('~/code/splunk/spur')] = 'spur.txt',
      }

      local banner_file = banners[cwd] or 'default.txt'
      local path = banner_dir .. '/' .. banner_file

      local lines = {}
      local f = io.open(path, 'r')
      if f then
        for line in f:lines() do
          table.insert(lines, line)
        end
        f:close()
      end
      return lines
    end

    alpha.setup({
      layout = {
        { type = 'padding', val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) / 2) - 5 }) },
        { type = 'text', val = load_banner(), opts = { position = 'center', hl = 'AlphaHeader' } },
      },
      opts = { noautocmd = true },
    })

    -- Show alpha when opening a directory
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = vim.schedule_wrap(function()
        local buf = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname == '' or vim.fn.isdirectory(bufname) == 1 then
          vim.cmd('enew')
          require('alpha').start(false)
        end
      end),
    })
  end,
}
