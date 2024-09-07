return {
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({
        restore_state = true,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.config.bufferline")
    end,
  },
}
