{lib, ...}: {
  programs.waybar = {
    enable = true;
    systemd.target = "graphical-session.target";
  };
  hjem.users.rysieko.files = {
    ".config/waybar/config" = {
      generator = lib.generators.toJSON {};
      value = {
        layer = "top";
        position = "top";
        width = 2560;
        height = 34;
        spacing = 8;

        modules-left = ["cpu" "memory" "temperature"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["pulseaudio" "tray" "clock" "custom/notification"];
        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 5;
          };
        };
        tray = {
          spacing = 10;
        };

        cpu = {
          format = "{usage}% ";
        };

        memory = {
          format = "{}% ";
        };

        temperature = {
          format = "{temperatureC}°C ";
        };

        pulseaudio = {
          format = "{volume}% {icon}"; # {format_source}";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pwvucontrol";
        };
        "clock" = {
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };

        "custom/notification" = {
          tooltip = true;
          format = "<span size='16pt'>{icon}</span>";
          return-type = "json";

          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";

          format-icons = {
            notification = "󱅫";
            none = "󰂜";
            dnd-notification = "󰂠";
            dnd-none = "󰪓";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
        };
      };
    };
    ".config/waybar/style.css".text = ''           
       window#waybar, tooltip {
      background: alpha(@base00, 0.000000);
        }

      * {
        font-family: "DejaVu Sans Mono";
        font-size: 9pt;
      }

      @define-color base00 #00040c; @define-color base01 #414185;
      @define-color base02 #004edf; @define-color base03 #0090cc;
      @define-color base04 #00c5ff; @define-color base05 #08f0ff;
      @define-color base06 #08f0ff; @define-color base07 #08f0ff;

      @define-color base08 #0090cc; @define-color base09 #0090cc;
      @define-color base0A #0090cc; @define-color base0B #0090cc;
      @define-color base0C #0090cc; @define-color base0D #0090cc;
      @define-color base0E #0090cc; @define-color base0F #0090cc;
      window#waybar, tooltip {
            color: @base05;
        }

        tooltip {
            border-color: @base0D;
        }

        tooltip label {
            color: @base05;
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
        .modules-left #workspaces button {
            border-bottom: 3px solid transparent;
        }
        .modules-left #workspaces button.focused,
        .modules-left #workspaces button.active {
            border-bottom: 3px solid @base05;
        }

        .modules-left #workspaces button.urgent {
            border-bottom: 3px solid @base08;
            background-color: @base08;
            color: @base00;
        }
        .modules-center #workspaces button {
            border-bottom: 3px solid transparent;
        }
        .modules-center #workspaces button.focused,
        .modules-center #workspaces button.active {
            border-bottom: 3px solid @base05;
        }

        .modules-center #workspaces button.urgent {
            border-bottom: 3px solid @base08;
            background-color: @base08;
            color: @base00;
        }
        .modules-right #workspaces button {
            border-bottom: 3px solid transparent;
        }
        .modules-right #workspaces button.focused,
        .modules-right #workspaces button.active {
            border-bottom: 3px solid @base05;
        }

        .modules-right #workspaces button.urgent {
            border-bottom: 3px solid @base08;
            background-color: @base08;
            color: @base00;
        }

            #* {
              background-color: transparent;
            }'';
  };
}
