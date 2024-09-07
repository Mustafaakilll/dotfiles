{pkgs,...}:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    # package = pkgs.neovim-nightly;

    plugins = with pkgs.vimPlugins; [
      nvim-fzf
      fzf-vim
      telescope-fzf-writer-nvim
      telescope-fzf-native-nvim
    ];
  };

  home.file.".config/nvim/init.lua".source = ./nvim/init.lua;
  home.file.".config/nvim/lua".source = ./nvim/lua;
  home.file.".config/nvim/after".source = ./nvim/after;
  home.file.".config/nvim/snippets".source = ./nvim/after;
}
