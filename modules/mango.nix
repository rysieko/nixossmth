{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.rysieko.mango;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf;
  inherit (lib.types) package listOf str;
  inherit (lib) toMango;
in {
  options.rysieko.mango = {
    enable = mkEnableOption "enable mango";
    package = mkOption {
      default = inputs.mangowm.packages.${pkgs.stdenv.hostPlatform.system}.default;
      type = package;
      description = "mango package to use";
      example = pkgs.mangowc;
    };
    settings = mkOption {
      description = "config of mango";
      type = with lib.types; let
        valueType =
          nullOr (oneOf [
            bool
            int
            float
            str
            path
            (attrsOf valueType)
            (listOf valueType)
          ])
          // {
            description = "Mango configuration value";
          };
      in
        valueType;
      example = {};
      default = {};
    };
    topPrefixes = mkOption {
      type = listOf str;
      default = [];
      description = ''
        List of prefixes for attributes that should appear at the top of the config file.
        Attributes starting with these prefixes will be sorted to the beginning.
      '';
      example = ["source"];
    };
    bottomPrefixes = mkOption {
      type = listOf str;
      default = [];
      description = ''
        List of prefixes for attributes that should appear at the bottom of the config file.
        Attributes starting with these prefixes will be sorted to the end.
      '';
      example = ["source"];
    };
  };
  config = lib.mkIf cfg.enable (
    let
      finalConfigText =
        # Support old string-based config during transition period
        (
          if builtins.isString cfg.settings
          then cfg.settings
          else
            lib.optionalString (cfg.settings != {}) (
              lib.toMango {
                topCommandsPrefixes = cfg.topPrefixes;
                bottomCommandsPrefixes = cfg.bottomPrefixes;
              }
              cfg.settings
            )
        );

      validatedConfig = pkgs.runCommand "mango-config.conf" {} ''
        cp ${pkgs.writeText "mango-config.conf" finalConfigText} "$out"
        ${cfg.package}/bin/mango -c "$out" -p || exit 1
      '';
    in {
      programs.mango = {
        enable = true;
        package = cfg.package;
      };
      hjem.users.rysieko.files.".config/mango/config.conf".text = validatedConfig;
    }
  );
}
