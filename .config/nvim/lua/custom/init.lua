-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.wo.foldmethod = "expr"

vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.wo.foldenable = false

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = { "*.*" },
  command = "mkview",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.*" },
  command = "silent! loadview",
})

