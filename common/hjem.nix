{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [./config/default.nix];
  environment.systemPackages = with pkgs;
    lib.mkAfter [
      mako
      fastfetch
      vesktop
      rose-pine-cursor
    ];
  rysieko = {
    cava = {
      enable = true;
      settings = {
        inputs.method = "pipewire";
      };
    };
    matugen = {
      enable = true;
      autoEnable = true;
      targets.pywalfox = false;
    };
  };
  hjem = {
    extraModules = [inputs.hjem-rum.hjemModules.default];
    users.rysieko = {
      directory = "/home/rysieko";
      rum = {
        programs = {
          yazi = {
            enable = true;
            # extraPackages = with pkgs; [
            #  mpv
            # _7zz
            # imagemagick
            #];
            #    shellWrapperName = "y";
            keymap = {
              mgr.prepend_keymap = [
                {
                  on = "t";
                  for = "unix";
                  run = "shell nu --block";
                  desc = "Open nushell here";
                }
              ];
            };
          };
          fuzzel.enable = true;
          mpv.enable = true;
          git = {
            enable = true;
            settings = {
              init.defaultBranch = "main";
              user = {
                name = "rysieko";
                email = "rrx9506@proton.me";
              };
            };
          };
        };
        misc = {
          gtk = {
            enable = true;
            packages = with pkgs; [
              rose-pine-cursor
              rose-pine-icon-theme
            ];
            css = lib.modules.mkIf config.rysieko.matugen.enable {
              gtk3 = ''
                @import 'colors.css';
              '';
              gtk4 = ''
                @import 'colors.css';
              '';
            };
            settings = lib.modules.mkIf config.rysieko.matugen.enable {
              application-prefer-dark-theme = true;
              decoration-layout = "menu:close";
              enable-primary-paste = false;
            };
          };
        };
      };
      files = {
        ".config/mako/config".text = ''
          sort=-time
          layer=overlay
          background-color=#2e3440
          width=270
          height=100
          border-size=2
          border-radius=15
          icons=0
          max-icon-size=64
          default-timeout=1000
          ignore-timeout=1
          font=monospace 14
        '';
        ".config/fastfetch/config.jsonc" = {
          generator = lib.generators.toJSON {};
          value = {
            modules = [
              "title"
              "separator"
              "os"
              "host"
              "kernel"
              "separator"
              "shell"
              "wm"
              "terminal"
              "separator"
              "cpu"
              "gpu"
              "memory"
              "localip"
            ];
          };
        };
        ".config/vesktop/settings/settings.json" = {
          generator = lib.generators.toJSON {};
          value = {
            autoUpdate = false;
            transparent = true;
            frameless = true;
            plugins = {
              MessageLogger = {
                enabled = true;
                ignoreSelf = true;
              };
              FakeNitro.enabled = true;
            };
          };
        };
        "Obrazy/Wallpapers".source = ./config/wallpapers;
      };
      environment.sessionVariables = {
        EDITOR = "nvim";
        NIXPKGS_ALLOW_UNFREE = 1;
        XCURSOR_THEME = "BreezeX-RosePine-Linux";
        XCURSOR_SIZE = 24;
        HYPRCURSOR_SIZE = 24;
        XDG_TERMINAL_COMMAND = "ghostty +new-window -e";
        font = "noto";
        terminalApplication = "ghostty +new-window -e";
      };
    };
  };
}
