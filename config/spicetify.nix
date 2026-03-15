{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.homeManagerModules.spicetify;
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      
    ];
   # theme = spicePkgs.themes.text;
    #colorScheme = "nord";
  };
}
