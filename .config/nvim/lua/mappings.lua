require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- resize window
map("n", "<C-Up>", "<cmd> resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", "<cmd> resize +2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", "<cmd> vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", "<cmd> vertical resize +3<CR>", { desc = "Resize window right" })

-- lazygit
map("n", "<leader>lg", "<cmd> LazyGitCurrentFile <CR>", { desc = "Open lazygit" })

-- lsp formatting
-- map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format { async = true }<CR>", { desc = "LSP formatting" })
map("n", "<leader>lf", function()
  require("conform").format { lsp_fallback = true }
  require('lint').try_lint()
end, { desc = "LSP formatting" })


-- vim hop
map("n", "f", function()
    local hop = require "hop"
    local directions = require("hop.hint").HintDirection

    hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
  end,
  { desc = "Hop words" })

map("n", "F", function()
    local hop = require "hop"
    local directions = require("hop.hint").HintDirection

    hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
  end,
  { desc = "Hop words" })

map("n", "H", "<cmd> HopWord <CR>", { desc = "Hop words" })

-- nvim-spectre
map("n", "<leader>S", "<cmd> lua require('spectre').toggle()<CR>", { desc = "Toggle Spectre" })

-- tabufline
map("n", "]b", function() require("nvchad.tabufline").next() end, { desc = "Goto next buffer" })
map("n", "[b", function() require("nvchad.tabufline").prev() end, { desc = "Goto prev buffer" })
