{
  inputs,
  pkgs,
  config,
  ...
}: {
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland = let
    hyprflake = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
    hyprplugins = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
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
  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
  xdg.configFile."hypr/var.lua" = let
    color = config.lib.stylix.colors;
  in {
    text = ''
      global base03-r = "${color.base03-rgb-r}"
      global base03-g = "${color.base03-rgb-g}"
      global base03-b = "${color.base03-rgb-b}"
      global base0D-r = "${color.base0D-rgb-r}"
      global base0D-b = "${color.base0D-rgb-b}"
      global base03-g = "${color.base0D-rgb-g}"
    '';
  };
}
