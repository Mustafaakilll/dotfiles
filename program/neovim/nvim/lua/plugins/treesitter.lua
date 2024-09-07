return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('plugins.config.treesitter')
    end
  },
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "JoosepAlviste/nvim-ts-context-commentstring",
  'RRethy/nvim-treesitter-textsubjects',
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/nvim-treesitter-context',
  'theHamsta/nvim-treesitter-pairs',
}
