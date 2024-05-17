local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
      }
    end
  },

  {
    "nvim-tree/nvim-web-devicons"
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "kkoomen/vim-doge",
    lazy = false,
    config = function()
      -- vim.api.nvim_command('call doge#install()')
    end,
  },

  {
    "pantharshit00/vim-prisma",
    lazy = false,
  },

  -- { "romgrk/nvim-treesitter-context", lazy = false },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },

  {
    "editorconfig/editorconfig-vim",
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    "nvim-pack/nvim-spectre"
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>",
            },
            layout = {
              position = "bottom", -- | top | left | right
              ratio = 0.4,
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = "<C-l>",
              accept_word = false,
              accept_line = false,
              next = "<C-n>",
              prev = "<C-p>",
              dismiss = "<C-d>",
            },
          },
          filetypes = {
            yaml = true,
            markdown = true,
            help = true,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
          copilot_node_command = "node", -- Node.js version must be > 16.x
          server_opts_overrides = {},
        }
      end, 100)
    end,
  },

  { "zbirenbaum/copilot-cmp", after = { "copilot.lua", "nvim-cmp" } },

  {
    "elkowar/yuck.vim",
    lazy = false,
  },

  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    config = function()
      require("Comment").setup {
        -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", "build", "dist" },
      },
    },
  },

  {
    "alvan/vim-closetag",
    lazy = false,
  },
}
