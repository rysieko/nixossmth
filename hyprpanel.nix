{config, ...}:

{
   
  programs.hyprpanel = {
     enable = true;    
     # See 'https://hyprpanel.com/configuration/settings.html'.
     # Default: <same as gui>
      settings = {
      # Configure bar layouts for monitors.
      # See 'https://hyprpanel.com/configuration/panel.html'.
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;
      bar.layouts = {
       "DP-1" = {
      	 left = [
           "media"
           "ram"
 	   "cpu"
         ];
         middle = [ "workspaces" ];
         right = [
           "volume"
           "network"
	   "systray"
           "clock"
           "notifications"
         ];
	};
	};
      bar.battery.label = false;
      bar.bluetooth.label = false;
      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
	};
	weather = {
	 location = "Warsaw";
	 units = 2;
	};
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = false;

      theme.bar.transparent = true;
      theme.bar.color = "#3b4252";
      theme.font = {
        name = "noto";
        size = "16px";
      };
    };
  };
}
