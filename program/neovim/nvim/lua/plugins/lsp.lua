local config = require("lazy.core.config")
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.config.lsp-config")
    end,
  },
  { "williamboman/mason.nvim" },
  "williamboman/mason-lspconfig.nvim",
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        auto_update = true,
        debounce_hours = 24,
        ensure_installed = {},
      })
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  { "j-hui/fidget.nvim",      branch = "legacy" },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("plugins.config.conform")
    end,
  },
}
