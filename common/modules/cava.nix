{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) package;
  inherit (lib.generators) toINI;
  cfg = config.rysieko.cava;
in {
  options.rysieko.cava = {
    enable = mkEnableOption "Whenever to enable Cava";
    settings = mkOption {
      description = "Shit to write to cava config file";
      default = {};
      example = {
        general.framerate = 60;
        input.method = "pipewire";
      };
    };
    package = mkOption {
      description = "Package to use for Cava";
      type = package;
      default = pkgs.cava;
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [cfg.package];

    hjem.users.rysieko.files.".config/cava/config" = mkIf cfg.enable {
      generator = toINI {};
      value = cfg.settings;
    };
  };
}
