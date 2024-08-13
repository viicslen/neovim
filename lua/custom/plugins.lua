local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
     "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function ()
      require('copilot').setup({
        suggestion = {
          auto_trigger = true
        }
      })
    end,
  },

  { "fatih/vim-go" },

  {
    "NvChad/nvcommunity",

    -- Editor
    { import = "nvcommunity.editor.treesittercontext" },
    { import = "nvcommunity.editor.illuminate" },
    { import = "nvcommunity.editor.cutlass" },
    { import = "nvcommunity.editor.hlargs" },

    -- Folds
    -- { import = "nvcommunity.folds.ufo" },

    -- Diagnostics
    { import = "nvcommunity.diagnostics.trouble" },

    -- Git
    { import = "nvcommunity.git.lazygit" },
  },

  -- Navigate seamlessly between Vim windows and Tmux panes.
  { 'christoomey/vim-tmux-navigator' },

  -- Jump to the last location when opening a file.
  { 'farmergreg/vim-lastplace' },

  -- Automatically create parent dirs when saving.
  { 'jessarcher/vim-heritage' },

  -- Text objects for HTML attributes.
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user',
  },

  {
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  },

  -- Better notifications
  {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        -- this for transparency
        notify.setup({ background_colour = "#000000" })
        -- this overwrites the vim notify function
        vim.notify = notify.notify
    end
  },

  -- Method signature 
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require'lsp_signature'.setup(opts)
    end
  },

  -- Laravel integration
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    config = true,
  },

  -- LazyGit integration
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
}

return plugins
