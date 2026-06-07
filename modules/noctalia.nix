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
  cfg = config.rysieko.noctalia;
in {
  options.rysieko.noctalia = {
    enable = mkEnableOption "whnever to enable noctalia v5";
    settings = mkOption {
      description = "what to write to the noctalia config file";
      type = attrsOf anything;
      default = {};
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      libsForQt5.qt5ct
      qt6Packages.qt6ct
    ];
    hjem.users.rysieko.files.".config/noctalia/config.toml" = {
      generator = (toml {}).generate "config.toml";
      value = cfg.settings;
    };
  };
}
