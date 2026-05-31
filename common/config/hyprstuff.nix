{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [awww];
  hjem.users.rysieko.rum.programs.hypridle = {
    enable = true;
    settings = {
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
          on-timeout = "hyprctl dispatch(hl.dsp.dpms({\"off\",\"DP-1\"})"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch(hl.dsp.dpms({\"on\",\"DP-1\"})";
        }
        {
          timeout = 1800; # 30min
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
  hjem.users.rysieko.rum.programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.stdenv.hostPlatform.system}.hyprlock;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      source = "colors.conf";
      background = {
        monitor = "DP-1";
        path = "$image";
        blur_passes = 0;
      };
      animations = {
        enabled = true;
        fade_in = {
          duration = 100;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 20;
          bezier = "easeOutQuint";
        };
      };

      input-field = [
        {
          monitor = "DP-1";
          size = "20%, 5%";
          outline_thickness = 3;
          inner_color = "$color.on_primary";
          outer_color = "$color.primary";
          check_color = "$color.green";
          fail_color = "$color.red";
          font_color = "$color.on_background";
          fade_on_empty = true;
          rounding = 10;
          font_family = "noto";
          placeholder_text = "Passwd";
          fail_text = "$PAMFAIL";
          dots_text_format = "#";
          dots_size = 0.4;
          dots_spacing = 0.3;
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
      #time
      label = [
        {
          monitor = "DP-1";
          text = "cmd[update:600]echo $TIME";
          position = "0,400";
          halign = "center";
          valign = "center";
          font_size = 128;
          font_family = "noto";
        }
        {
          monitor = "DP-1";
          text = "cmd[update:8640000] date +%F";
          position = "0,250";
          halign = "center";
          valign = "center";
          font_size = 52;
          font_family = "noto";
        }
      ];
    };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hjem.users.rysieko.files = {
    ".config/hypr/hyprland.lua".source = ../hyprland/hyprland.lua;
    ".config/hypr/addons/scripts.lua".source = ../hyprland/addons/scripts.lua;
    ".config/hypr/binds.lua".source = ../hyprland/binds.lua;
    ".config/hypr/windows.lua".source = ../hyprland/windows.lua;
  };
}
