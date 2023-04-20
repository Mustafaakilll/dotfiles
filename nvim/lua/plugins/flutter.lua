return {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    config = function()
      require'plugins.config.flutter'
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
  }
}
