{config, ...}:

{
home.sessionVariables.NIXOS_OZONE_WL = "1";
wayland.windowManager.hyprland.settings = {
  "$mainMod" = "SUPER";
  "$fileManager" = "Thunar";
  "$terminal" = "kitty";
  "$menu" = "rofi -show drun";
  exec-once  = [
  "hyprpanel"
  "hyprpaper"
  "steam --console"
  "discord"
  "systemctl --user start hyprpolkitagent"
  "udiskie"
  "wl-paste --type text --watch cliphist store"
  "wl-paste --type image --watch cliphist store"
  "steam"	
  ];

  monitor = "DP-1,highres highrr,0x0,1";
  kb_layout = "pl";
  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  misc = {
    force_default_wallpaper = -1;
    disable_hyprland_logo = true;
  };

  decoration = {
    rounding = 7;
    active_opacity = 1;
    inactive_opacity = 0.8;

    shadow = {
      enabled = true;
      range = 4;
      render_power = 3;
      color = "rgba(1a1a1aee)";
    };

    blur = {
      enabled = true;
      size = 3;
      passes = 2;
      vibrancy = 0.1696;
    };
  };

   animations = {
    enabled = true;

    bezier = [
     "easeOutQuint, 0.23,1,0.32,1"
     "easeInOutCubic, 0.65,0.05,0.36,1"
     "linear, 0,0,1,1"
     "almostLinear, 0.5,0.5,0.75,1.0"
     "quick, 0.15,0,0.1,1"
    ];

    animation = [
     "global, 1, 10, default"
     "border, 1, 5.39, easeOutQuint"
     "windows, 1, 4.79, easeOutQuint"
     "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
     "windowsOut, 1, 1.49, linear, popin 87%" #nice
     "fadeIn, 1, 1.73, almostLinear"
     "fadeOut, 1, 1.46, almostLinear"
     "fade, 1, 3.03, quick"
     "layers, 1, 3.81, easeOutQuint"
     "layersIn, 1, 4, easeOutQuint, fade"
     "layersOut, 1, 1.5, linear, fade"
     "fadeLayersIn, 1, 1.79, almostLinear"
     "fadeLayersOut, 1, 1.39, almostLinear"
     "workspaces, 1, 1.94, almostLinear, fade"
     "workspacesIn, 1, 1.21, almostLinear, fade"
     "workspacesOut, 1, 1.94, almostLinear, fade"
   ];
  };

  bind =
    [
      "$mainMod, D, exec, $menu"
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, Q, killactive"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      "$mainMod, Delete, exec, hyprctl dispatch exit 0"
      "$mainMod, n, exec, spotifycli --next"
      "$mainMod, b, exec, spotifycli --prev"
      "$mainMod, p, exec, spotifycli --playpause"			
      "$mainMod, 1, workspace, 1" # NOTE: code:10 = key 1
      "$mainMod, 2, workspace, 2" # NOTE: code:11 = key 2
      "$mainMod, 3, workspace, 3" # NOTE: code:12 = key 3
      "$mainMod, 4, workspace, 4" # NOTE: code:13 = key 4
      "$mainMod, 5, workspace, 5" # NOTE: code:14 = key 5
      "$mainMod, 6, workspace, 6" # NOTE: code:15 = key 6 
      "$mainMod, 7, workspace, 7" # NOTE: code:16 = key 7 
      "$mainMod, 8, workspace, 8" # NOTE: code:17 = key 8
      "$mainMod, 8, workspace, 9" # NOTE: code:18 = key 9
      "$mainMod, 8, workspace, 10" # NOTE: code:19 = key 0
      "$mainMod, F, fullscreen, 0"
      "Ctrl, 1, movetoworkspace, 1" # NOTE: code:10 = key 1"
      "Ctrl, 2, movetoworkspace, 2" # NOTE: code:11 = key 2
      "Ctrl, 3, movetoworkspace, 3" # NOTE: code:12 = key 3
      "Ctrl, 4, movetoworkspace, 4" # NOTE: code:13 = key 4
      "Ctrl, 5, movetoworkspace, 5" # NOTE: code:14 = key 5
      "Ctrl, 6, movetoworkspace, 6" # NOTE: code:15 = key 6 
      "Ctrl, 7, movetoworkspace, 7" # NOTE: code:16 = key 7 
      "Ctrl, 8, movetoworkspace, 8" # NOTE: code:17 = key 8
      "Ctrl, 9, movetoworkspace, 9" # NOTE: code:18 = key 9
      "Ctrl, 0, movetoworkspace, 10" # NOTE: code:19 = key 0		
     ];      
   

  bindd = [
   "$mainMod, mouse_down, next workspace, workspace, e+1"
   "$mainMod, mouse_up, previous workspace, workspace, e-1"
   "$mainMod, period, next workspace, workspace, e+1"
   "$mainMod, comma, previous workspace, workspace, e-1"
  ];

  windowrule = [
    "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$"
    "tag +games, class:^(gamescope)$"
    "tag +gamelaunch, class:^(steam)$"
    "tag +gamelaunch, title:^([Ll]utris)$"
    "tag +im, class:^([Dd]iscord)$"
    "tag +file-manager, class:^([Tt]hunar)$"
    "tag +codeeditor, class:^(VSCode|code-url-handler)$"
    "tag +screanshare, class:(obs-studio)$"
    "workspace 1, tag:browser*"
    "workspace 5, tag:codeeditor*"
    "workspace 2, tag:gamelaunch*"
    "workspace 3, tag:im*"
    "workspace 4, tag:games*"
    "workspace 6, tag:*screanshare*"
    "suppressevent maximize, class:.*"
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
services.hyprpaper.enable = true;
services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    preload = "~/nordic.jpg";
    wallpaper = "DP-1, ~/nordic.jpg";
  };
}  
