# no longer modefied poz code but still a shoutout (there are some leftovers tho (: )
{
  config,
  lib,
  pkgs,
  options,
  ...
}: let
  inherit (lib.generators) toINI;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) listOf package str;
  qt_shit = {
    description = "shit to pass to the generator";
    default = {};
  };
  cfg = config.rysieko.themes.qt;
in {
  options.rysieko.themes.qt = {
    enable = mkEnableOption "qt theming";
    name = mkOption {
      description = "qt theme name";
      type = str;
    };
    qtct = {
      enable = mkEnableOption "enable theming via qt{5,6}ct";
      qt5-conf = mkOption qt_shit;
      qt6-conf = mkOption qt_shit;
    };
    themePackages = mkOption {
      description = "qt theme package";
      type = listOf package;
    };
  };

  # thanks raf (: https://github.com/NotAShelf/nyx/blob/main/homes/notashelf/themes/qt.nix
  config = mkIf cfg.enable {
    environment.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
      #  QT_STYLE_OVERRIDE = mkIf config.rysieko.matugen.targets.qt.enable "Matugen";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      DISABLE_QT_COMPAT = "0";
    };
    rysieko.themes.qt = {
      qtct.enable = true;
    };
    hjem = {
      users.rysieko = {
        files = {
          ".config/qt5ct/qt5ct.conf" = {
            generator = toINI {};
            value = cfg.qtct.qt5-conf;
          };
          ".config/qt6ct/qt6ct.conf" = {
            generator = toINI {};
            value = cfg.qtct.qt6-conf;
          };
        };
        packages = with pkgs;
          [
            libsForQt5.qt5ct
            qt6Packages.qt6ct
            kdePackages.breeze-icons
            qt5.qttools
            qt6Packages.qtstyleplugin-kvantum
          ]
          ++ cfg.themePackages;
      };
    };
  };
}
