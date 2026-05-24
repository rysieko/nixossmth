# modefied poz code
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.rysieko.themes.qt;
  inherit (lib.attrsets) attrValues;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) package str boolean;
in {
  cfg = {
    enable = mkEnableOption "qt theming";
    name = mkOption {
      description = "qt theme name";
      type = str;
    };
    package = mkOption {
      description = "qt theme package";
      type = package;
    };
  };
  # thanks raf (: https://github.com/NotAShelf/nyx/blob/main/homes/notashelf/themes/qt.nix
  config = mkIf cfg.enable {
    environment.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_STYLE_OVERRIDE = mkIf cfg.matugenTheming "Matugen";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      DISABLE_QT_COMPAT = "0";
    };

    hjem = {
      user.rysieko.packages =
        attrValues {
          inherit
            (pkgs.libsForQt5)
            qtstyleplugin-kvantum
            qt5ct
            ;
        }
        ++ [
          pkgs.kdePackages.breeze-icons
          pkgs.qt5.qttools
          pkgs.qt6Packages.qtstyleplugin-kvantum
          cfg.package
        ];
    };
  };
}
