{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  services.awww = {
    enable = true;
    extraArgs = [
      "--no-cache"
      "--layer"
      "bottom"
    ];
  };
  services.hypridle.enable = true;
  services.hypridle.settings = {
    general = {
      before_sleep_cmd = "loginctl lock-session";
      after_sleep_cmd = "hyprctl dispatch dpms on";
      lock_cmd = "pidof hyprlock || hyprlock";
    };

    listener = [
      {
        timeout = 180; # 3min.
        on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
        on-resume = "brightnessctl -r"; # monitor backlight restore.
      }
      {
        timeout = 180; # 3min.
        on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
        on-resume = "brightnessctl -rd rgb:kbd_backlight";
      }
      {
        timeout = 300; # 5min
        on-timeout = "loginctl lock-session";
      }
      {
        timeout = 330; # 5.5min
        on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
        on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
      }
      {
        timeout = 1800; # 30min
        on-timeout = "systemctl suspend";
      }
    ];
  };
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 100;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 100;
          bezier = "easeOutQuint";
        };
      };
      #time
      label = let
        colors = config.lib.stylix.colors;
      in [
        {
          monitor = "DP-1";
          text = "cmd[update:600] $TIME";
          position = "0,400";
          halign = "center";
          valign = "center";
          color = "rgb(${colors.base01-rgb-r},${colors.base01-rgb-g},${colors.base01-rgb-b})";
          font_size = 128;
          font = "noto";
        }
        {
          monitor = "DP-1";
          text = "cmd[update:8640000] date +%F";
          position = "0,2nh c50";
          halign = "center";
          valign = "center";
          color = "rgb(${colors.base01-rgb-r},${colors.base01-rgb-g},${colors.base01-rgb-b})";
          font_size = 52;
          font = "noto";
        }
      ];
    };
  };
}
