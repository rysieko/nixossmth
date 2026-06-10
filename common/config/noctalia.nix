{...}: {
  rysieko.noctalia = {
    enable = true;
    settings = {
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
        animation = {
          enabled = true;
          speed = 1.0;
        };
        screen_corners = {
          enabled = true;
          size = 25;
        };
        panel = {
          transparency_mode = "solid";
          borders = true;
          launcher_placement = "floating";
          control_center_placement = "attached";
          wallpaper_placement = "floating";
          session_placement = "attached";
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
          background_opacity = 0.2;
          border_width = 0;
          shadow = false;
          radius = 10;
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
      widgets = {
        workspaces = {
          display = "id";
          minimal = false;
        };
      };
      system = {
        monitor = {
          cpu_usage_activity_threshold = 20;
        };
      };
    };
  };
}
