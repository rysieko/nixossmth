{config, pkgs, inputs, ...}:

{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    wallpaper = {
      monitor = "DP-1";
      path = ./config/nordic.jpg
      ipc = "on";
      fit_mode = "cover";
      };
    splash = false;
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
        timeout = 180                                # 3min.
        on-timeout = "brightnessctl -s set 10"         # set monitor backlight to minimum, avoid 0 on OLED monitor.
        on-resume = "brightnessctl -r"        # monitor backlight restore.
      };
      {
        timeout = 180                                          # 3min.
        on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0" 
        on-resume = "brightnessctl -rd rgb:kbd_backlight"
      }
      {
        timeout = 300;                                 # 5min
        on-timeout = "loginctl lock-session"
      }
      {
        timeout = 330;                                                    # 5.5min
        on-timeout = "hyprctl dispatch dpms off";                            # screen off when timeout has passed
        on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
      }
      {
        timeout = 1800                                # 30min
        on-timeout = "systemctl suspend";
      }
    ];
  };
  services.hyprlock.enable = true;
  services.hyprlock.settings = {
    general = {
      hide_cursor = true;
      ignore_empty_input = true;
    };
    
    animations = {
      enabled = true;
      fade_in = {
        duration = 300;
        bezier = "easeOutQuint";
      };
      fade_out = {
        duration = 300;
        bezier = "easeOutQuint";
      };
    };

    background = [
      {
        path = "screenshot";
        blur_passes = 3;
        blur_size = 8;
      }
    ];

    input-field = [
      {
        monitor = DP-1;
        size = "20%, 5%";
        outline_thickness = 3;
        inner_color =  "rgb(79, 133, 163)";
        outer_color = "rgb(26, 57, 78)";
        check_color = "rgb(163, 190, 140)";
        fail_color = "rgb(191, 97, 106)";

        font_color = "rgb(190, 206, 219)";
        fade_on_empty = true; 
        rounding = 0;

        font_family = $font;
        placeholder_text = "Input password";
        fail_text = $PAMFAIL;

  
     dots_text_format = "#"
     dots_size = 0.4;
      dots_spacing = 0.3;

    # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
    # hide_input = true;

        position = "0, -20";
        halign = "center";
        valign = "center";
      }
    ];
  };
  xdg.configFile."$HOME/.config/waybar/".source = ./config/waybar;
  xdg.configFile."$HOME/.config/swaync/".source = ./config/swaync;
  xdg.configFile."$HOME/.config/hypr/hyprtoolkit.conf".source = ./config/hyprtoolkitconf;
}






