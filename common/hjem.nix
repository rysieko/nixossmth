{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  rysieko = {
    vesktop = {
      enable = true;
      vencordSettings = {
        autoUpdate = false;
        frameless = true;
        enabledThemes = ["noctalia-material.theme.css"];
        plugins = {
          MessageLogger = {
            enabled = true;
            ignoreSelf = true;
          };
          BetterGifPicker.enabled = true;
          FakeNitro.enabled = true;
        };
      };
    };
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
                @import 'noctalia.css';
              '';
              gtk4 = ''
                @import 'noctalia.css';
              '';
            };
            settings = {
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

        "Obrazy/Wallpapers".source = ./config/wallpapers;
      };
      systemd.enable = true;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      kdePackages.breeze
      kdePackages.breeze.qt5
      kdePackages.breeze-icons
      kdePackages.plasma-integration
      fastfetch
      rose-pine-cursor
      xdg-user-dirs
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      adw-gtk3
    ];

    sessionVariables = {
      EDITOR = "nvim";
      NIXPKGS_ALLOW_UNFREE = 1;
      XCURSOR_THEME = "BreezeX-RosePine-Linux";
      XCURSOR_SIZE = 24;
      QT_QPA_PLATFORMTHEME = "qt6ct";
      HYPRCURSOR_SIZE = 24;
      XDG_TERMINAL_COMMAND = "ghostty +new-window -e";
      terminalApplication = "ghostty +new-window -e";
    };
  };
}
