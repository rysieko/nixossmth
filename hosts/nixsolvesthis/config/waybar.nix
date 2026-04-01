{ config, pkgs , ... } :
{
  programs.waybar = {
    enable = true; 
    settings = { 
      width = 2550;
      spacing = 6;
      height = 34;
      modules-left = ["cpu" "memory" "temperature" ];
      modules-center = ["hyprland/workspaces"];
      modules-right = [ "pulseaudio" "tray" ];
      "hyprland/workspaces" = {
        persistent-workspaces = {
         "*" = 5;
        };
      };
      tray ={
        spacing = 10;
      };
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
        format-icons = {
            default = ["" "" ""];
        };
        on-click = "hyprpwcenter";
      };
      "custom/notification" = {
        tooltip = true;
        format  = "<span size='16pt'>{icon}</span>";
        format-icons = {
          notification = "󱅫";
          none ="󰂜";
          dnd-notification = "󰂠";
          dnd-none = "󰪓";
          inhibited-notification = "󰂛";
          inhibited-none = "󰪑";
          dnd-inhibited-notification = "󰂛";
          dnd-inhibited-none = "󰪑";
        };
      };
      "exec-if" = "which swaync-client";
      "return-type" = "json";
      "exec" = "swaync-client -swb";
      "on-click" = "swaync-client -t -sw";
      "on-click-right" = "swaync-client -d -sw";
      "escape" = true;
    };
  };
}
