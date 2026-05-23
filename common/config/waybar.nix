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
        modules-right = ["pulseaudio" "tray" "clock"];
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
      };
    };
    ".config/waybar/style.css".text = ''
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
  };
}
