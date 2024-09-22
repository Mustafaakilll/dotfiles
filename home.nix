{  pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "mustafaakilll";
  home.homeDirectory = "/home/mustafaakilll";
  home.enableNixpkgsReleaseCheck = false;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  imports = [
    ./program/hypr/hypr.nix
    ./program/waybar/waybar.nix
    ./program/terminal/fish.nix
    ./program/terminal/kitty.nix
    ./program/terminal/wezterm.nix
    ./program/terminal/starship.nix
    ./program/services/dunst.nix
    ./program/services/rofi.nix
    ./program/services/swaylock.nix
    ./program/neovim/neovim.nix
    ./program/services/git.nix
    ./program/development/go.nix
    ./program/development/nix_ld.nix
    ./program/mime/default.nix
    # ./program/services/ollama.nix
    # ./program/development/android.nix
  ];

  fonts.fontconfig.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    # permittedInsecurePackages = [
    #   "electron-25.9.0"
    #   "electron-unwrapped-28.2.10"
    #   "hubstaff"
    # ];
  };

  home.packages = with pkgs; [
    kitty
    htop
    dunst
    killall
    fzf
    tldr
    nerdfonts
    pamixer

    font-awesome
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-code-pro
    noto-fonts-emoji
    ubuntu_font_family
    dejavu_fonts
    powerline-fonts
    powerline-symbols

    waybar
    outils

    cmake
    dbus

    rofi
    clipman
    # swaylock-effects
    wlogout
    grim
    slurp
    tesseract
    wl-clipboard
    swaybg
    playerctl

    fish
    eza
    ripgrep
    bat
    dwt1-shell-color-scripts
    jq
    zoxide
    starship
    git
    gitkraken
    ffmpeg
    gnused
    lazygit
    onefetch
    cloc
    unzip
    asdf-vm

    impala
    nap
    tokei
    cloc
    btop

    lxappearance

    inkscape
    gimp

    termius
    # openlens
    lens

    topgrade

    pavucontrol
    obs-studio

    glxinfo

    openvpn
    openconnect

    spotify

    clang
    gnumake
    # cargo-make
    fd
    tree-sitter

    # rustup
    rustc
    cargo
    rust-analyzer
    rustPlatform.bindgenHook
    jetbrains.rust-rover

    graphviz
    jetbrains.goland
    jetbrains.datagrip
    redisinsight
    dbeaver-bin
    github-copilot-intellij-agent
    jetbrains.idea-ultimate
    insomnia
    bruno
    httpie
    httpie-desktop
    nodejs_20
    yarn
    jdk17_headless
    delve
    python3
    python311Packages.numpy
    python311Packages.matplotlib

    # xdg-desktop-portal-hyprland
    hyprland-protocols
    kdePackages.wayland-protocols
    xdotool
    # kdePackages.xdg-desktop-portal-kde

    markdownlint-cli
    autocorrect
    nixpkgs-fmt
    nixpkgs-review

    webcord

    fastfetch

    obsidian
    libreoffice
    qbittorrent
    imagemagick

    yt-dlp
    vlc

    zed-editor
    minio-client

    partition-manager
    # libsForQt5.qt5ct
    kdePackages.filelight
    kdePackages.kcalc
    kdePackages.ksvg
    # libsForQt5.okular

    podman
    podman-compose
    podman-tui
    virt-manager
    libvirt

    docker
    docker-compose

    bleachbit

    xorg.libXinerama
    xorg.libX11
    xorg.libXrender
    xorg.xrandr
    freetype
    fontconfig
    qogir-theme
    qogir-icon-theme
    wlr-randr

    curlFull

    easyeffects
    headsetcontrol

    brave
    librewolf-unwrapped
    floorp

    gnupg
    openssl
    pkg-config

    kdePackages.kate
    okteta

    # telegram-desktop # Moved to flatpak

    flutter
    android-studio
    alsaLib
    dbus
    expat
    libpulseaudio
    libuuid
    libGL
    nspr
    nss
    systemd

    radeontop
    libva-utils

    wayland-utils
    wayland

    burpsuite

    qt6.qtwayland
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    kdePackages.kirigami
    qt6Packages.qtstyleplugin-kvantum
    qt6ct

    gamescope
    mangohud
    warp-terminal

    steam-run
    nix-ld

    mariadb
    postgresql

    erlang
    rebar3
    elixir
    elixir-ls
    gleam
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };


  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit.Description = "polkit-gnome-authentication-agent-1";

    Install = {
      WantedBy = ["graphical-session.target"];
      Wants = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    GOPATH = "/home/mustafaakilll/Documents/projects/go/";

    ANDROID_AVD_HOME = "/home/mustafaakilll/.android/avd";
    ANDROID_SDK_ROOT = "/home/mustafaakilll/Android/Sdk";
    ANDROID_HOME = "/home/mustafaakilll/Android/Sdk";
  };

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   name = "Catpuccin-mocha-mauve";
  #   size = 24;
  #   package = pkgs.catppuccin-cursors.mochaMauve;
  # };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Qogir-manjaro";
    size = 24;
    package = pkgs.qogir-icon-theme;
  };

  qt = {
    enable = true;
    style.name = "kvantum";

    platformTheme.name =  "kde";
  };

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      package = pkgs.jetbrains-mono;
    };
    theme.name = "adw-gtk3-dark";
    # cursorTheme = {
    #   name = "Catpuccin-mocha-mauve";
    #   size = 24;
    #   package = pkgs.catppuccin-cursors.mochaMauve;
    # };

    cursorTheme = {
      name = "Qogir-manjaro";
      package = pkgs.qogir-icon-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mustafaakilll/etc/profile.d/hm-session-vars.sh
  #

}



