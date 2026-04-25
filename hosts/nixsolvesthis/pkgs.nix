{
  pkgs,
  inputs,
  lib,
  ...
}: {
  # https://search.nixos.org/
  environment.systemPackages = with pkgs; [
    wget
    protonup-ng
    hyprland-qt-support
    git
    cliphist
    prismlauncher
    lutris
    nordic
    candy-icons
    catppuccin-grub
    hyprlauncher
    fastfetch
    spotify-cli-linux
    btop
    spotify
    godot-mono
    mangohud
    udiskie
    wine
    kitty
    hyprshutdown
    swaynotificationcenter
    wlogout
    hyprpaper
    gh
    hyprshot
    pavucontrol
    cmatrix
    feh
    hyprpwcenter
    kdePackages.dolphin
    dolphin-emu
    melonds
    obs-studio
    hyprpicker
    kdePackages.kdenlive
    ffmpeg_7-full
    nixd
    alejandra
    nh
    lua-language-server
  ];
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs;
      [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.kdeconnect.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  programs.gamescope.enable = true;
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
