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
    inputs.subtui.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.hyprshutdown
    fastfetch
    spotify-cli-linux
    btop
    spotify
    mangohud
    udiskie
    wine
    kitty
    swaynotificationcenter
    wlogout
    gh
    libnotify
    cmatrix
    feh
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
    pwvucontrol
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
  services.tailscale.enable = true;
  services.resolved.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  programs.uwsm.enable = true;
    programs.hyprland = let 
   hyprflake = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
   in 
   {
   enable = true;
   withUWSM = true;
   package = hyprflake.hyprland;
   portalPackage = hyprflake.xdg-desktop-portal-hyprland;  
  };
  #programs.niri ={
  #enable = true;
  #package =  pkgs.niri;
  # };
}
