local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "eslint_d", "prettierd" },
    typescriptreact = { "eslint_d", "prettierd" },
    go = { "goimports_reviser" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    goimports_reviser = {
      command = "goimports-reviser",
      args = { "-rm-unused", "-set-alias", "-format", "$FILENAME" },
      stdin = false,
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
