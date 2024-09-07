return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.config.indent-blankline")
    end,
    main = "ibl",
    opts = {},
  },
  { "HiPhish/rainbow-delimiters.nvim" },
}
