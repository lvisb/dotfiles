-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local custom_highlights = require "configs.highlights"
local highlights = vim.tbl_deep_extend("force", { Normal = { bg = "none" } }, custom_highlights)

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  hl_override = highlights,
  hl_add = highlights.add,

  -- term = {
  --   float = {
  --     relative = "editor",
  --     row = 0.17,
  --     col = 0.16,
  --     width = 0.7,
  --     height = 0.6,
  --     border = "single",
  --   },
  -- },
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.17,
    col = 0.16,
    width = 0.7,
    height = 0.6,
    border = "single",
  },
}

return M
