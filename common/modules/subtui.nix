{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  inherit (pkgs.formats) toml;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf;
  inherit (lib.types) attrsOf anything;
  cfg = config.rysieko.subtui;
in {
  options.rysieko.subtui = {
    enable = mkEnableOption "whnever to enable subtui subsonic player";
    settings = mkOption {
      description = "what to write to the subtui config file";
      type = attrsOf anything;
      default = {};
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [
      inputs.subtui.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    hjem.users.rysieko.files.".config/subtui/config.toml" = {
      generator = (toml {}).generate "config.toml";
      value = cfg.settings;
    };
  };
}
