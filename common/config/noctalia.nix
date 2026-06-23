{...}: {
  rysieko.noctalia = {
    enable = true;
    settings = {
      plugins = ["noctalia/bongocat"];
      wallpaper = {
        directory = "~/Obrazy/Wallpapers";
        enable = false;
      };
      theme = {
        source = "wallpaper";
        wallpaper_theme = "vibrant";
      };
      shell = {
        lang = "en";
        ui_scale = 1.0;
        polkit_agent = true;
        telemetry_enabled = false;
        avatar_path = "~/Obrazy/avatar.png";
        settings_show_advanced = true;
        clipboard_enabled = false;
        password_style = "default";
        setup_wizard_enabled = false;
        font_family = "noto-music";
        time_format = "%H:%M:%S";
        date_format = "%D %m %y";
        screenshot.directory = "~/Obrazy/Screenshots";
        animation = {
          enabled = true;
          speed = 1.0;
        };
        screen_corners = {
          enabled = true;
          size = 25;
        };
        mpris.blacklist = ["Mozilla zen"];
        panel = {
          transparency_mode = "solid";
          borders = true;
          control_center_placement = "attached";
          session_placement = "attached";
          launcher_placement = "centered";
          open_near_click_control_center = true;
          wallpaper_placement = "attached";
        };
        session.actions = [
          {
            action = "logout";
            command = "hyprshutdown";
            enabled = true;
            shortcut = "2";
            variant = "default";
          }
          {
            action = "reboot";
            command = "sleep 0,5 && hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";
            enabled = true;
            shortcut = "4";
            variant = "default";
          }
          {
            action = "shutdown";
            command = "sleep 0,5 && hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'";
            enabled = true;
            shortcut = "5";
            variant = "destructive";
          }
          {
            action = "lock_and_suspend";
            enabled = true;
            shortcut = "1";
            variant = "default";
          }
        ];
      };
      bar = {
        order = [
          "main"
        ];
        main = {
          enabled = true;
          position = "top";
          reserve_space = true;
          layer = "top";
          auto_hide = false;
          thickness = 34;
          background_opacity = 1;
          border_width = 0;
          shadow = false;
          radius = 0;
          margin_edge = 0;
          margin_ends = 0;
          capsule = false;
          start = [
            "control-center"
            "sysmon"
            "media"
            "audio_visualizer"
            "cat"
          ];
          center = ["workspaces"];
          end = [
            "weather"
            "volume"
            "tray"

            "clock"
          ];
        };
      };
      location.auto_locate = true;
      idle = {
        behavior_order = ["lock" "screen-off" "lock-and-suspend"];
        pre_action_fade_seconds = 10;
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
          };
        };
      };
      widgets = {
        workspaces = {
          display = "id";
          minimal = false;
        };
        audio_visualizer.centered = false;
        cat = {
          audio_spectrum = true;
          tappy_mode = true;
          type = "noctalia/bongocat:cat";
          use_mpris_filter = true;
        };
      };
      system = {
        monitor = {
          cpu_usage_activity_threshold = 20;
        };
      };
      hooks.colors_changed = "mmsg dispatch reload_config";
      control-center = [
        {
          type = "wifi";
        }
        {
          type = "bluetooth";
        }
        {
          type = "notification";
        }
      ];
    };
  };
}
