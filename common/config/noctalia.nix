{...}: {
  rysieko.noctalia = {
    enable = true;
    settings = {
      plugins = ["noctalia/bongocat"];
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
      /*
      LOCK SCREEN
      (thats a lot isnt it)
      */
      lockscreen_widgets = {
        enabled = true;
        widget = {
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          "lockscreen-login-box@WL-1" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 640.0;
            cy = 601.0;
            output = "WL-1";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };
          lockscreen-widget-0000000000000001 = {
            box_height = 624.0;
            box_width = 2560.0;
            cx = 1296.0;
            cy = 1160.0;
            flip_y = true;
            output = "DP-1";
            rotation = -3.1415927410125732;
            type = "audio_visualizer";
            settings = {
              background = false;
              bands = 128.0;
              centered = false;
              mirrored = true;
              show_when_idle = false;
            };
          };
          lockscreen-widget-0000000000000003 = {
            box_height = 187.0;
            box_width = 508.0;
            cx = 1280.0;
            cy = 304.0;
            output = "DP-1";
            rotation = 0.0;
            type = "clock";

            settings = {
              background = false;
              clock_style = "digital";
              color = "tertiary";
            };
          };

          lockscreen-widget-0000000000000004 = {
            box_height = 78.0;
            box_width = 324.0;
            cx = 1280.0;
            cy = 445.5;
            output = "DP-1";
            rotation = 0.0;
            type = "clock";

            settings = {
              background = false;
              clock_style = "digital";
              color = "tertiary";
              format = "%D";
            };
          };

          lockscreen-widget-0000000000000005 = {
            box_height = 384.0;
            box_width = 288.0;
            cx = 1648.0;
            cy = 633.0;
            output = "DP-1";
            rotation = 0.0;
            type = "media_player";
            lockscreen_widgets.widget.lockscreen-widget-0000000000000005.settings = {
              background = false;
              color = "tertiary";
              hide_when_no_media = true;
              layout = "vertical";
            };
          };

          lockscreen_widgets.widget.lockscreen-widget-0000000000000006 = {
            box_height = 80.0;
            box_width = 272.0;
            cx = 1296.0;
            cy = 544.0;
            output = "DP-1";
            rotation = 0.0;
            type = "weather";

            settings = {
              background = false;
              color = "tertiary";
            };
          };
        };
      };
    };
  };
}
