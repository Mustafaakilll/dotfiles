return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require 'plugins.config.completion'
    end
  },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "onsails/lspkind-nvim" },
  { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  { "mtoohey31/cmp-fish" },

  {
    'zbirenbaum/copilot.lua',
    config = function()
      require 'copilot'.setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = false,
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          txt = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node',
      })
    end
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require 'copilot_cmp'.setup {
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
      }
    end
  },

  {
    "L3MON4D3/LuaSnip",
    event = 'InsertEnter',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },

  'rafamadriz/friendly-snippets',
}
