return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require 'plugins.config.nvim-tree' end,
  },

  'nvim-tree/nvim-web-devicons',
}
