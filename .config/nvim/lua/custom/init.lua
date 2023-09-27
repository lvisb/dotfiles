-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.wo.foldmethod = "expr"

vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.wo.foldenable = false

vim.cmd("set cmdheight=0")

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = { "*.*" },
  command = "mkview",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.*" },
  command = "silent! loadview",
})

vim.g.closetag_filetypes = 'html,js,typescriptreact'
vim.g.closetag_emptyTags_caseSensitive = 1
vim.g.closetag_regions = {
  ['typescript.tsx'] = 'jsxRegion,tsxRegion',
  ['javascript.jsx'] = 'jsxRegion',
}

