{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      catJamSynced
      fullScreen
      volumePercentage
      oneko
    ];
    enabledCustomApps  = with spicePkgs.apps; [
      lyricsPlus 
      marketplace
    ];
    wayland = true;
    windowManagerPatch = true;
    theme = pkgs.lib.mkForce spicePkgs.themes.text;
    colorScheme = pkgs.lib.mkForce "Nord";
  };
}
