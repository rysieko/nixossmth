{...}: {
  rysieko.waybar = {
    enable = true;
    settings = {
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
}
