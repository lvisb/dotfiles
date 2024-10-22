local options = {
  log_level = vim.log.levels.DEBUG,
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "eslint_d", "prettierd" },
    typescriptreact = { "eslint_d", "prettierd" },
    go = { "goimports_reviser" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
  },

  formatters = {
    goimports_reviser = {
      command = "goimports-reviser",
      args = { "-rm-unused", "-set-alias", "-format", "$FILENAME" },
      stdin = false,
    },

    eslint_d = {
      command = "eslint_d",
      args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
      cwd = require("conform.util").root_file({
        "package.json",
      }),
    }
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
