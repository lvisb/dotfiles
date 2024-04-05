-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local custom_highlights = require("configs.highlights")
local highlights = vim.tbl_deep_extend("force", { Normal = { bg = 'none' } }, custom_highlights)

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",

  hl_override = highlights,
  hl_add = highlights.add,
}

return M
