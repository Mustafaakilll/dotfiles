return {
  {
    'nvim-telescope/telescope.nvim',
    priority=100,
    config = function ()
      require('plugins.telescope.setup')
      require('plugins.telescope.keys')
    end
  },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-hop.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("git-worktree").setup {}
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
}
