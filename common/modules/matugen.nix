# TODO: fix this war crime
{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.modules) mkIf;
  inherit (lib.generators) toINI toJSON;
  inherit (pkgs.formats) toml;

  cfg = config.rysieko.matugen;
  cava-template = {
    color = {
      background = "default";
      foreground = "{{colors.primary.default.hex}}";
      gradient = 1;
      gradient_color_1 = "{{colors.primary_container.default.hex}}";
      gradient_color_2 = "{{colors.primary.default.hex}}";
      gradient_color_3 = "{{colors.on_primary_container.default.hex}}";
      horizontal_gradient = 1;
      horizontal_gradient_color_1 = "{{colors.primary_container.default.hex}}";
      horizontal_gradient_color_2 = "{{colors.primary.default.hex}}";
      horizontal_gradient_color_3 = "{{colors.on_primary_container.default.hex}}";
      horizontal_gradient_color_4 = "{{colors.primary.default.hex}}";
      horizontal_gradient_color_5 = "{{colors.primary_container.default.hex}}";
    };
  };
in {
  options.rysieko.matugen = {
    enable = mkEnableOption "enable Matugen theming (templates hardcoded since i was stupid and i will fix it soon™)";
    autoEnable = mkEnableOption "auto enable targets";
    targets = {
      gtk = mkEnableOption "enable GTK target";
      qt = mkEnableOption "enable QT target";
      waybar = mkEnableOption "enable Waybar target";
      hyprland = mkEnableOption "enable Hyprland target";
      hyprstuff = mkEnableOption "enable Hypr* target";
      ghostty = mkEnableOption "enable Ghostty target";
      fuzzel = mkEnableOption "enable Fuzzel target";
      pywalfox = mkEnableOption "enable Pywalfox firefox extension target";
      mako = mkEnableOption "enable Mako target";
      cava = {
        enable = mkEnableOption "enable Cava target";
        template = mkOption {
          description = "what to pass to the INI generator to make a theme";
          default = cava-template;
          example = cava-template;
        };
      };
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.glib pkgs.matugen];
    rysieko.matugen.targets = mkIf cfg.autoEnable {
      gtk = true;
      qt = true;
      waybar = true;
      hyprland = true;
      hyprstuff = true;
      ghostty = true;
      fuzzel = true;
      pywalfox = true;
      mako = true;
      cava.enable = true;
    };
    hjem.users.rysieko.files = {
      ".config/matugen/config.toml" = {
        generator = (toml {}).generate "config.toml";
        value = {
          templates = {
            waybar = mkIf cfg.targets.waybar {
              input_path = "~/.config/matugen/colors.css";
              output_path = "~/.config/waybar/colors.css";
              post_hook = "pkill -SIGUSR2 waybar";
              type = "SchemeExpressive";
            };
            hyprland = mkIf cfg.targets.hyprland {
              input_path = "~/.config/matugen/hyprland-colors.lua";
              output_path = "~/.config/hypr/colors.lua";
              type = "SchemeExpressive";
            };
            ghostty = mkIf cfg.targets.ghostty {
              input_path = "~/.config/matugen/ghostty";
              output_path = "~/.config/ghostty/themes/matugen";
              post_hook = "pkill -SIGUSR2 ghostty";
              type = "SchemeExpressive";
            };
            fuzzel = mkIf cfg.targets.fuzzel {
              input_path = "~/.config/matugen/fuzzel.ini";
              output_path = "~/.config/fuzzel/colors.ini";
            };
            gtk3 = mkIf cfg.targets.gtk {
              input_path = "~/.config/matugen/gtk.css";
              output_path = "~/.config/gtk-3.0/colors.css";
              post_hook = "gsettings set org.gnome.desktop.interface gtk-theme \"\"; gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-{{mode}}";
            };
            gtk4 = mkIf cfg.targets.gtk {
              input_path = "~/.config/matugen/gtk.css";
              output_path = "~/.config/gtk-4.0/colors.css";
              post_hook = "~/.config/matugen/gtk-hook.sh";
            };
            hyprlang = mkIf cfg.targets.hyprstuff {
              input_path = "~/.config/matugen/hyprlang.conf";
              output_path = "~/.config/hypr/colors.conf";
            };

            kvantum_config = mkIf cfg.targets.qt {
              input_path = "~/.config/matugen/kvantum.kvconfig";
              output_path = "~/.config/Kvantum/matugen.kvconfig";
            };
            kvantum_svg = mkIf cfg.targets.qt {
              input_path = "~/.config/matugen/kvantum.svg";
              output_path = "~/.config/Kvantum/matugen/matugen.svg";
            };
            pywalfox = mkIf cfg.targets.pywalfox {
              input_path = "~/.config/matugen/pywalfox.json";
              output_path = "~/.cache/wal/colors.json";
              post_hook = "pywalfox update";
            };
            cava = mkIf cfg.targets.cava.enable {
              input_path = "~/.config/matugen/cava-colors.ini";
              output_path = "~/.config/cava/themes/matugen";
              post_hook = "pkill -USR2 cava";
            };
            mako = mkIf cfg.targets.mako {
              input_path = "~/.config/matugen/mako";
              output_path = "~/.config/mako/colors";
              post_hook = "makoctl reload && sleep 0.5 | notify-send \"Wallpaper changed\" \" (: \" ";
              type = "SchemeExpressive";
            };
          };
          config = {
            version_check = false;
            prefer = "darkness";
            caching = false;
            contrast = 0.0;
            wallpaper = {
              set = true;
              command = "awww img --transition-type center {{ image }}";
            };
          };
        };
      };
      ".config/matugen/colors.css".text = mkIf cfg.targets.waybar ''
         <* for name, value in colors *>
         @define-color {{name}} {{value.default.hex}};
        <* endfor *>    '';
      ".config/matugen/hyprland-colors.lua".text = mkIf cfg.targets.hyprland ''           
            return {
              image = "{{image}}",
          <* for name, value in colors *>
              {{name}} = "0xff{{value.default.hex_stripped}}",
          <* endfor *>
        }'';
      ".config/matugen/kvantum.kvconfig".source = ./qt/qt.kvconfig;
      ".config/matugen/kvantum.svg".source = ./qt/qt.svg;
      ".config/matugen/mako".text = mkIf cfg.targets.mako ''
        background-color={{colors.primary.default.hex}}
        text-color={{colors.tertiary.default.hex}}
        border-color={{colors.tertiary_container.default.hex}}
        [mode=do-not-disturb]
        invisible=1
        on-notify=none
        [mode=silent]
        on-notify=none
        [urgency=high]
        border-color={{colors.error_container.default.hex}}
      '';
      ".config/matugen/gtk-hook.sh".text = mkIf cfg.targets.gtk ''
        #! /run/current-system/sw/bin/bash

         current=$(gsettings get org.gnome.desktop.interface color-scheme)

         if [[ "$current" == "'prefer-dark'" ]]; then
             gsettings set org.gnome.desktop.interface color-scheme prefer-light
             gsettings set org.gnome.desktop.interface color-scheme prefer-dark
         else
             gsettings set org.gnome.desktop.interface color-scheme prefer-dark
             gsettings set org.gnome.desktop.interface color-scheme prefer-light
         fi
      '';
      ".config/matugen/ghostty".text = mkIf cfg.targets.ghostty ''
          background = {{colors.background.default.hex}}
        foreground = {{colors.on_surface.default.hex}}
           cursor-color = {{colors.primary.default.hex}}
          cursor-text = {{colors.on_primary.default.hex}}
          selection-background = {{colors.secondary_container.default.hex}}
          selection-foreground = {{colors.on_secondary_container.default.hex}}
          palette = 0={{colors.surface_container_high.default.hex}}
          palette = 1={{colors.error.default.hex}}
          palette = 2={{colors.primary.default.hex}}
          palette = 3={{colors.tertiary.default.hex}}
          palette = 4={{colors.secondary.default.hex}}
          palette = 5={{colors.primary_fixed.default.hex}}
          palette = 6={{colors.secondary_fixed.default.hex}}
          palette = 7={{colors.on_surface_variant.default.hex}}
          palette = 8={{colors.outline.default.hex}}
          palette = 9={{colors.error_container.default.hex}}
          palette = 10={{colors.primary_container.default.hex}}
          palette = 11={{colors.tertiary_container.default.hex}}
          palette = 12={{colors.secondary_container.default.hex}}
          palette = 13={{colors.inverse_primary.default.hex}}
          palette = 14={{colors.outline_variant.default.hex}}
          palette = 15={{colors.on_surface.default.hex}}
      '';

      ".config/matugen/gtk.css".text = mkIf cfg.targets.gtk ''
        @define-color accent_color {{colors.primary_fixed_dim.default.hex}};
        @define-color accent_fg_color {{colors.on_primary_fixed.default.hex}};
        @define-color accent_bg_color {{colors.primary_fixed_dim.default.hex}};
        @define-color window_bg_color {{colors.surface_dim.default.hex}};
        @define-color window_fg_color {{colors.on_surface.default.hex}};
        @define-color headerbar_bg_color {{colors.surface_dim.default.hex}};
        @define-color headerbar_fg_color {{colors.on_surface.default.hex}};
        @define-color popover_bg_color {{colors.surface_dim.default.hex}};
        @define-color popover_fg_color {{colors.on_surface.default.hex}};
        @define-color view_bg_color {{colors.surface.default.hex}};
        @define-color view_fg_color {{colors.on_surface.default.hex}};
        @define-color card_bg_color {{colors.surface.default.hex}};
        @define-color card_fg_color {{colors.on_surface.default.hex}};
        @define-color sidebar_bg_color @window_bg_color;
        @define-color sidebar_fg_color @window_fg_color;
        @define-color sidebar_border_color @window_bg_color;
        @define-color sidebar_backdrop_color @window_bg_color;
      '';
      ".config/waybar/style.css".text = mkIf cfg.targets.waybar ''
        @import "colors.css";
        window#waybar, tooltip {
         background: alpha(@background, 0.000000);
         }

         * {
         font-family: "DejaVu Sans Mono";
         font-size: 9pt;
         }

         window#waybar, tooltip {
             color: @tertiary_container;
         }

         tooltip {
             border-color: @on_tertiary_container;
         }

         tooltip label {
             color: @primary;
         }
         #wireplumber,
         #pulseaudio,
         #sndio {
           padding: 0 5px;
         }
         #wireplumber.muted,
         #pulseaudio.muted,
         #sndio.muted {
           padding: 0 5px;
         }
         #upower,
         #battery {
           padding: 0 5px;
         }
         #upower.charging,
         #battery.Charging {
           padding: 0 5px;
         }
         #network {
           padding: 0 5px;
         }
         #network.disconnected {
           padding: 0 5px;
         }
         #user {
           padding: 0 5px;
         }
         #clock {
           padding: 0 5px;
         }
         #backlight {
           padding: 0 5px;
         }
         #cpu {
           padding: 0 5px;
         }
         #disk {
           padding: 0 5px;
         }
         #idle_inhibitor {
           padding: 0 5px;
         }
         #temperature {
           padding: 0 5px;
         }
         #mpd {
           padding: 0 5px;
         }
         #language {
           padding: 0 5px;
         }
         #keyboard-state {
           padding: 0 5px;
         }
         #memory {
           padding: 0 5px;
         }
         #window {
           padding: 0 5px;
         }
         #bluetooth {
           padding: 0 5px;
         }
         #bluetooth.disabled {
           padding: 0 5px;
         }
          .modules-center #workspaces button {
             border-bottom: 3px solid transparent;
             color: @primary;
         }
         .modules-center #workspaces button.focused,
         .modules-center #workspaces button.active {
             border-bottom: 3px solid @primary_container;
         }

         .modules-center #workspaces button.urgent {
             border-bottom: 3px solid @outline;
             background-color: @primary;
             color: @on_primary;
         }

      '';
      ".config/ghostty/config.ghostty".text = mkIf cfg.targets.ghostty ''theme = matugen '';
      ".config/matugen/hyprlang.conf".text = mkIf cfg.targets.hyprstuff ''
        $image = {{image}}
        <* for name, value in colors *>
        $\{{name}} = rgba({{value.default.hex_stripped}}ff)
        <* endfor *>
      '';
      ".config/matugen/fuzzel.ini" = mkIf cfg.targets.fuzzel {
        generator = toINI {};
        value = {
          colors = {
            background = "{{colors.background.default.hex_stripped}}ff";
            text = "{{colors.on_surface.default.hex_stripped}}ff";
            prompt = "{{colors.secondary.default.hex_stripped}}ff";
            placeholder = "{{colors.tertiary.default.hex_stripped}}ff";
            input = "{{colors.primary.default.hex_stripped}}ff";
            match = "{{colors.tertiary.default.hex_stripped}}ff";
            selection = "{{colors.primary.default.hex_stripped}}ff";
            selection-text = "{{colors.on_surface.default.hex_stripped}}ff";
            selection-match = "{{colors.on_primary.default.hex_stripped}}ff";
            counter = "{{colors.secondary.default.hex_stripped}}ff";
            border = "{{colors.primary.default.hex_stripped}}ff";
          };
        };
      };
      ".config/matugen/pywalfox.json" = mkIf cfg.targets.pywalfox {
        generator = toJSON {};
        value = {
          wallpaper = "{{image}}";
          alpha = "100";
          colors = {
            color0 = "{{colors.surface.dark.hex}}";
            color1 = "";
            color2 = "";
            color3 = "{{colors.primary.default.hex}}";
            color4 = "";
            color5 = "{{colors.secondary.default.hex}}";
            color6 = "";
            color7 = "{{colors.surface_container_highest.default.hex}}";
            color8 = "";
            color9 = "";
            color10 = "{{colors.primary.default.hex}}";
            color11 = "";
            color12 = "";
            color13 = "{{colors.secondary.default.hex}}";
            color14 = "";
            color15 = "{{colors.on_background.default.hex}}";
          };
        };
      };
      ".config/matugen/cava-colors.ini" = mkIf cfg.targets.cava.enable {
        generator = toINI {};
        value = cfg.targets.cava.template;
      };
    };
    rysieko = {
      cava = {
        enable = mkIf cfg.targets.cava.enable true;
        settings.colors.theme = "matugen";
      };
      themes.qt.enable = mkIf cfg.targets.qt true;
    };
  };
}
