{
  pkgs,
  inputs,
  lib,
  ...
}: {
  # https://search.nixos.org/
  environment.systemPackages = with pkgs; [
    hyprland-qt-support
    cliphist
    prismlauncher
    inputs.fok-quote.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprshutdown
    fastfetch
    btop
    mangohud
    wine
    kitty
    wlogout
    gh
    libnotify
    cmatrix
    feh
    kdePackages.dolphin
    dolphin-emu
    lutris
    melonds
    lutris-unwrapped
    obs-studio
    hyprpicker
    slurp
    wl-clipboard
    grim
    xdg-user-dirs
    r2modman
    mangohud
    inputs.self.packages.x86_64-linux.nvim
    pwvucontrol
    rose-pine-icon-theme
    mako
    strawberry
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
  programs = {
    git.enable = true;
    kdeconnect.enable = true;

    gamescope.enable = true;
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
    };
    hyprland = let
      hyprflake = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;
      package = hyprflake.hyprland;
      portalPackage = hyprflake.xdg-desktop-portal-hyprland;
    };
  };
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
    tailscale.enable = true;
    resolved.enable = true;
    playerctld.enable = true;
  };
  security.pam.services.greetd.enableGnomeKeyring = true;
  #programs.niri ={
  #enable = true;
  #package =  pkgs.niri;
  # };
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
