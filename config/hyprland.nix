{config, ...}:

{
home.sessionVariables.NIXOS_OZONE_WL = "1";
wayland.windowManager.hyprland.settings = {
  package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
    rounding = 0;
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
      "$mainMod, Delete, exec, wpctultil"
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
      "$mainMod, Escape, exec, pkill -9 gamescope"
      "$mainMod, F1, exec, pkill -9 steam"
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
   "$mainMod, period, next workspace, workspace, ie+1"
   "$mainMod, comma, previous workspace, workspace, e-1"
  ];

  windowrule = [
    "tag +browser, match:class firefox"
    "tag +games, match:class gamescope"
    "tag +gamelaunch, match:class steam"
    "tag +gamelaunch, match:title lutris"
    "tag +im, match:class discord"
    "tag +file-manager, match:class thunar"
    "tag +codeeditor, match:class VSCode"
    "tag +screanshare, match:class obs-studio"
    "workspace 1, match:tag browser*"
    "workspace 5, match:tag codeeditor*"
    "workspace 2, match:tag gamelaunch*"
    "workspace 3, match:tag im*"
    "workspace 5, match:tag games*"
    "workspace 6, match:tag *screanshare*"
    "suppressevent maximize, match:class .*"
    "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"
    ];
  };
services.hyprpaper.enable = true;
services.hyprpaper.settings = {
    monitor = "DP-1";
    ipc = "on";
    splash = false;
    fit_mode = "cover";
  };
}  
