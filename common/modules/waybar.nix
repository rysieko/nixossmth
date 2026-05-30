{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf;
  inherit (lib.types) string attrsOf anything;
  inherit (lib.generators) toJSON;
  cfg = config.rysieko.waybar;
in {
  options.rysieko.waybar = {
    enable = mkEnableOption "whenever to enable Waybar";
    settings = mkOption {
      descriprtion = "What to write into waybar config.jsonc file";
      type = attrsOf anything;
      default = {};
    };
    style = mkOption {
      description = "waybars style.css file";
      type = string;
      default = '''';
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.waybar];
    hjem.users.rysieko = {
      files = {
        ".config/waybar/config" = {
          generator = toJSON {};
          value = cfg.settings;
        };
        ".config/waybar/style.css".text = cfg.style;
      };
    };
  };
}
