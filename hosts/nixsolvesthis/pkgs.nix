{
  pkgs,
  inputs,
  lib,
  ...
}: {
  # https://search.nixos.org/
  environment.systemPackages = with pkgs; [
    
    wget
    hyprland-qt-support
    git
    cliphist
    prismlauncher
    inputs.fok-quote.packages.${pkgs.stdenv.hostPlatform.system}.default
    # lutris
    inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.hyprshutdown
    fastfetch
    spotify-cli-linux
    btop
    spotify
    mangohud
    udiskie
    wine
    kitty
    #inputs.hyprlauncher.packages.${pkgs.stdenv.hostPlatform.system}.
    hyprlauncher
    swaynotificationcenter
    wlogout
    gh
    libnotify
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
    stylua
    deadnix 
    ruff
    mypy
    pyright
    slurp
    wl-clipboard
    grim
    xdg-user-dirs
    r2modman
    mangohud
    tailscale
    gelly #.overrideAttrs (final: prev: { 
    #version = "1.2.2";
    # src = pkgs.fetchFromGitHub {
    #   owner = "Fingel";
    #   repo = "gelly";
    #   tag = "v1.2.2";
    #   hash = "sha256-qiTT2ZhpV/0qMb7S0JoN9PJfbZa6AnT/rUMEK0KsqfM=";
    #   cargoHash = "sha256-dPscQzt+n6V3IWJwl61lb5+BlITlMmxncusbjCwdIBU=";
    # };
    # }))
    rose-pine-icon-theme
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
        xdg-desktop-portal-gnome
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
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

}
