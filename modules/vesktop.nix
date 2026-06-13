{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf;
  inherit (lib.types) attrsOf anything;
  inherit (lib.generators) toJSON;
  cfg = config.rysieko.vesktop;
in {
  options.rysieko.vesktop = {
    enable = mkEnableOption "whenever to enable vesktop";
    settings = mkOption {
      description = "What to write into vesktops config file";
      type = attrsOf anything;
      default = {};
    };
    vencordSettings = mkOption {
      description = "What to write into vencords config file";
      type = attrsOf anything;
      default = {};
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.vesktop];
    hjem.users.rysieko = {
      files = {
        ".config/vesktop/settings.json" = {
          generator = toJSON {};
          value = cfg.settings;
        };
        ".config/vesktop/settings/settings.json" = {
          generator = toJSON {};
          value = cfg.vencordSettings;
        };
      };
    };
  };
}
