{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.configFile = {
    "hypr/hyprland.lua".source = ../../../lua/hyprland.lua;
    "hypr/addons/scripts.lua".source = ../../../lua/addons/scripts.lua;
    "hypr/binds.lua".source = ../../../lua/binds.lua;
    "hypr/windows.lua".source = ../../../lua/windows.lua;
    "hypr/var.lua" = let
      color = config.lib.stylix.colors;
     in {
      text = ''
        base03_r = "${color.base03-rgb-r}"
        base03_g = "${color.base03-rgb-g}"
        base03_b = "${color.base03-rgb-b}"
        base0D_r = "${color.base0D-rgb-r}"
        base0D_b = "${color.base0D-rgb-b}"
        base0D_g = "${color.base0D-rgb-g}"
        wallpaper = "${config.stylix.image}"
        mainMod     = "SUPER"
        terminal    = "ghostty +new-window"
        fileManager = "ghostty -e  fish -c yazi "
        menu        = "fuzzel"
      '';
    };
  "hypr/stubs/hl.meta.lua".source = "${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/usr/share/hypr/hl.meta.lua";
  };
}
