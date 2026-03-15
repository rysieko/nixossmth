{ pkgs, inputs, ... }:
let
  spicePkgs = spicetify-nix.homeManagerModules.spicetify;
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      
    ];
    theme = spicePkgs.themes.text;
    colorScheme = "nord";
  };
}