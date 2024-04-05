-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local custom_highlights = require "configs.highlights"
local highlights = vim.tbl_deep_extend("force", { Normal = { bg = "none" } }, custom_highlights)

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",

  hl_override = highlights,
  hl_add = highlights.add,

  term = {
    float = {
      relative = "editor",
      row = 0.17,
      col = 0.16,
      width = 0.7,
      height = 0.6,
      border = "single",
    },
  },
}

return M
