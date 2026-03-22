{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      catJamSynced
#      full-screen
      volumePercentage
    ];
    wayland = true;
    theme = pkgs.lib.mkDefault spicePkgs.themes.text;
    colorScheme = pkgs.lib.mkDefault "Nord";
  };
}
