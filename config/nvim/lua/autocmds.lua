-- Autocommands

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Auto-reload files changed externally (e.g., Claude Code, git)
autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  group = augroup('auto-reload', { clear = true }),
  command = 'silent! checktime',
})

-- Highlight on yank
autocmd('TextYankPost', {
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remove trailing whitespace on save
autocmd('BufWritePre', {
  group = augroup('trim-whitespace', { clear = true }),
  pattern = '*',
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- Resize splits on window resize
autocmd('VimResized', {
  group = augroup('resize-splits', { clear = true }),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- Go to last location when opening a buffer
autocmd('BufReadPost', {
  group = augroup('last-location', { clear = true }),
  callback = function(event)
    local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(event.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some filetypes with q
autocmd('FileType', {
  group = augroup('close-with-q', { clear = true }),
  pattern = { 'help', 'man', 'qf', 'checkhealth', 'lspinfo', 'notify', 'query' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
  end,
})
