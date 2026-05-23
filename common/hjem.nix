{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./config/waybar.nix
    ./config/matugen.nix
    ./config/term.nix
    ./config/fuzzel.nix
  ];
  environment.systemPackages = with pkgs;
    lib.mkAfter [
      mako
      fastfetch
      inputs.subtui.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  hjem.users.rysieko = {
    directory = "/home/rysieko/";
    files = {
      ".config/mako/config".text = ''
        include=~/.config/mako/colors
        sort=-time
        layer=overlay
        background-color=#2e3440
        width=270
        height=100
        border-size=2
        border-radius=15
        icons=0
        max-icon-size=64
        default-timeout=1000
        ignore-timeout=1
        font=monospace 14
      '';
      ".config/fastfetch/config.jsonc" = {
        generator = lib.generators.toJSON {};
        value = {
          modules = [
            "title"
            "separator"
            "os"
            "host"
            "kernel"
            "separator"
            "shell"
            "wm"
            "terminal"
            "separator"
            "cpu"
            "gpu"
            "memory"
            "localip"
          ];
        };
      };
      ".config/subtui/config.toml".source = ./subtui.toml;
      "Obrazy/Wallpapers".source = ./config/wallpapers;
    };
  };
}
