local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with {},
  b.formatting.eslint_d.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- go
  b.formatting.goimports_reviser,
  b.formatting.gofumpt,
  b.diagnostics.golangci_lint.with {
    filetypes = { "go" },
    args = {
      "run",
      "--fix=false",
      "--out-format=json",
      "-E", "revive"
    },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
