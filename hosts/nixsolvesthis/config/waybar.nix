{...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
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
          format = "{volume}% {icon} {format_source}";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "hyprpwcenter";
        };
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
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
      }
    ];
    style = ''
      * {
      background-color: transparent;
       }
    '';
  };
}
