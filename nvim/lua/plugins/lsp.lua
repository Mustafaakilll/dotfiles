return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.lsp-config')
    end
  },
  { "williamboman/mason.nvim" },
  "williamboman/mason-lspconfig.nvim",
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup {
        auto_update = true,
        debounce_hours = 24,
        ensure_installed = {},
      }
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      -- TODO: Look here for config but it is not neccessary
      require('lsp_signature').setup()
    end,
  },

  "simrat39/inlay-hints.nvim",
  "j-hui/fidget.nvim",
  "folke/neodev.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jose-elias-alvarez/nvim-lsp-ts-utils",

  -- TODO: Check trouble package by folke
}
