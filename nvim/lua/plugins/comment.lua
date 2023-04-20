return {
  {
    "folke/todo-comments.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("plugins.config.comment")
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup()
    end,
  },


}
