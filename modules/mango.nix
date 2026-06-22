{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  cfg = config.rysieko.mango;
  variables = concatStringsSep " " cfg.systemd.variables;
  extraCommands = concatStringsSep " && " cfg.systemd.extraCommands;
  systemdActivation = "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd ${variables}; ${extraCommands}";
  autostart_sh = pkgs.writeShellScript "autostart.sh" ''
    ${optionalString cfg.systemd.enable systemdActivation}
    ${cfg.autostart_sh}
  '';
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf;
  inherit (lib.types) package listOf str bool lines;
  inherit (inputs.self.lib) toMango;
  inherit (lib) optionalString optional concatStringsSep;
  inherit (builtins) isString;
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
    systemd = {
      enable = mkOption {
        type = bool;
        default = pkgs.stdenv.isLinux;
        example = false;
        description = ''
          Whether to enable {file}`mango-session.target` on
          mango startup. This links to
          {file}`graphical-session.target`.
          Some important environment variables will be imported to systemd
          and dbus user environment before reaching the target, including
          * {env}`DISPLAY`
          * {env}`WAYLAND_DISPLAY`
          * {env}`XDG_CURRENT_DESKTOP`
          * {env}`XDG_SESSION_TYPE`
          * {env}`NIXOS_OZONE_WL`
          You can extend this list using the `systemd.variables` option.
        '';
      };
      variables = mkOption {
        type = listOf str;
        default = [
          "DISPLAY"
          "WAYLAND_DISPLAY"
          "XDG_CURRENT_DESKTOP"
          "XDG_SESSION_TYPE"
          "NIXOS_OZONE_WL"
          "XCURSOR_THEME"
          "XCURSOR_SIZE"
        ];
        example = ["--all"];
        description = ''
          Environment variables imported into the systemd and D-Bus user environment.
        '';
      };
      extraCommands = mkOption {
        type = listOf str;
        default = [
          "systemctl --user reset-failed"
          "systemctl --user start mango-session.target"
        ];
        description = ''
          Extra commands to run after D-Bus activation.
        '';
      };
      xdgAutostart = mkEnableOption ''
        autostart of applications using
        {manpage}`systemd-xdg-autostart-generator(8)`
      '';
    };
    autostart_sh = mkOption {
      description = ''
        Shell script to run on mango startup. No shebang needed.

        When this option is set, the script will be written to
        `~/.config/mango/autostart.sh` and an `exec-once` line
        will be automatically added to the config to execute it.
      '';
      type = lines;
      default = "";
      example = ''
        waybar &
        dunst &
      '';
    };
    extraConfig = mkOption {
      type = lines;
      default = "";
      description = ''
        Extra configuration lines to add to `~/.config/mango/config.conf`.
        This is useful for advanced configurations that don't fit the structured
        settings format, or for options that aren't yet supported by the module.
      '';
      example = ''
        # Advanced config that doesn't fit structured format
        special_option = 1
      '';
    };
  };
  config = mkIf cfg.enable (
    let
      finalConfigText =
        # Support old string-based config during transition period
        (
          if isString cfg.settings
          then cfg.settings
          else
            optionalString (cfg.settings != {}) (
              toMango {
                topCommandsPrefixes = cfg.topPrefixes;
                bottomCommandsPrefixes = cfg.bottomPrefixes;
              }
              cfg.settings
            )
        )
        + optionalString (cfg.autostart_sh != "") "\nexec-once=~/.config/mango/autostart.sh\n"
        + optionalString (cfg.extraConfig != "") cfg.extraConfig;

      validatedConfig = pkgs.runCommand "mango-config.conf" {} ''
        cp ${pkgs.writeText "mango-config.conf" finalConfigText} "$out"
        ${cfg.package}/bin/mango -c "$out" -p || exit 1
      '';
    in {
      programs.mango = {
        enable = true;
        package = cfg.package;
      };
      hjem.users.rysieko = {
        files = {
          ".config/mango/config.conf".source = validatedConfig;
          ".config/mango/autostart.sh" = mkIf (cfg.autostart_sh != "") {
            source = autostart_sh;
            executable = true;
          };
        };
        systemd.services.mango-session = mkIf cfg.systemd.enable {
          description = "mango compositor session";
          documentation = ["man:systemd.special(7)"];
          bindsTo = ["graphical-session.target"];
          wants =
            [
              "graphical-session-pre.target"
            ]
            ++ optional cfg.systemd.xdgAutostart "xdg-desktop-autostart.target";
          after = ["graphical-session-pre.target"];
          before = optional cfg.systemd.xdgAutostart "xdg-desktop-autostart.target";
        };
      };
    }
  );
}
