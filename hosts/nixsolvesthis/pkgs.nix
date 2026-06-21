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
    wlogout
    gh
    libnotify
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
    rose-pine-icon-theme
    proton-vpn-cli
    nix-your-shell
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
  programs = {
    git.enable = true;
    kdeconnect.enable = true;

    gamescope.enable = true;
    steam = {
      enable = true;
      #  package = pkgs.millennium-steam;
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
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
