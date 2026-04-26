{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland = let
    hyprflake = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
    #hyprplugins = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    plugins = [
      #      hyprplugins.hyprtrails
      #     hyprplugins.xtra-dispatchers
      #    pkgs.hyprlandPlugins.hyprtrails
      #   pkgs.hyprlandPlugins.xtra-dispatchers
    ];
    enable = true;
    package = hyprflake.hyprland;
    portalPackage = hyprflake.xdg-desktop-portal-hyprland;
  };
  xdg.configFile."hypr/hyprland.lua".source = ../../../lua/hyprland.lua;
  xdg.configFile."hypr/addons/scripts.lua".source = ../../../lua5/scripts.lua;
  xdg.configFile."hypr/var.lua" = let
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
    '';
  };
}
