return {

  'tpope/vim-surround',
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
}
