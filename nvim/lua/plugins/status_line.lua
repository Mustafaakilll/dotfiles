return {
  {
    -- TODO: Change this if it is not working what you want
    -- from old dotfiles
    'tjdevries/express_line.nvim',
    config = function()
      require('plugins.config.status_line')
    end
  }
}
