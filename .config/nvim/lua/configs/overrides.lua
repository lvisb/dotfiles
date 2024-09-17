local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "json",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  context_commentstring = {
    enable = true,
  },
}

M.mason = {
  pkgs = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",
    "prisma-language-server",
    "nginx-language-server",
    "tailwindcss-language-server",

    "eslint_d",
    "eslint-lsp",
    "prettier",
    "prettierd",

    "sqls",
    "ansible-language-server",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "yaml-language-server",

    "gopls",
    "goimports_reviser",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
