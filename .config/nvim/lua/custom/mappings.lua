---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- general
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- resize window
    ["<C-Up>"] = { "<cmd> resize -2<CR>" },
    ["<C-Down>"] = { "<cmd> resize +2<CR>" },
    ["<C-Left>"] = { "<cmd> vertical resize -2<CR>" },
    ["<C-Right>"] = { "<cmd> vertical resize +3<CR>" },

    -- lazygit
    ["<leader>lg"] = { "<cmd> LazyGitCurrentFile <CR>", "Open lazygit" },

    -- lsp formatting
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },

    ["<leader>F"] = {
      "<Plug>CtrlSFPrompt",
    },

    -- vim hop
    ["f"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection

        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
      end,
    },

    ["F"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection

        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
      end,
    },

    ["H"] = { "<cmd> HopWord <CR>" },

    -- nvim-spectre
    ["<leader>S"] = { "<cmd> lua require('spectre').toggle() <CR>", "Toggle Spectre" },
  },
}

M.tabufline = {
  n = {
    -- cycle through buffers
    ["]b"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["[b"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

return M
