---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local custom_highlights = require "custom.highlights"

local highlights = vim.tbl_deep_extend("force", { Normal = { bg = 'none' } }, custom_highlights)

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
