{
  inputs,
  pkgs,
  ...
}: {
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland = let
    #hyprflake = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
    hyprplugins = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    plugins = [
      hyprplugins.hyprtrails
      hyprplugins.xtra-dispatchers
    ];
    enable = true;
    #package = hyprflake.hyprland;
    #portalPackage = hyprflake.xdg-desktop-portal-hyprland;
    settings = {
      "$mainMod" = "SUPER";
      "$fileManager" = "dolphin";
      "$terminal" = "kitty";
      "$menu" = "hyprlauncher";
      exec-once = [
        "swaync"
        "hyprpaper"
        "steam --console"
        "hyprpaper"
        "hypridle"
        "vesktop"
        "systemctl --user start hyprpolkitagent"
        "udiskie"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "waybar"
        "spotify"
        "kdeconnectd"
      ];
      input = {
        kb_layout = "pl";
        follow_mouse = 1;
        sensitivity = 0.9;
        touchpad = {
          natural_scroll = false;
        };
      };

      monitorv2 = {
        output = "DP-1";
        mode = "2560x1440@180";
        position = "0x0";
        scale = 1;
        bitdepth = 10;
        cm = "hdr";
        vrr = 0;
        supports_hdr = 1;
        supports_wide_color = 1;
        sdr_max_luminance = 140;
        sdr_min_luminance = 0.030;
        sdr_eotf = 1;
        #auto_hdr = 1
      };
      kb_layout = "pl";
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        middle_click_paste = false;
      };

      decoration = {
        rounding = 10;
        active_opacity = 1;
        inactive_opacity = 1;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };

        blur = {
          enabled = false;
          size = 311;
          passes = 2;
          vibrancy = 0;
          ignore_opacity = false;
        };
      };

      animations = {
        enabled = true;
        workspace_wraparound = true;

        bezier = [
          "easeOutQuint, 0.23,1,0.32,1"
          "easeInOutCubic, 0.65,0.05,0.36,1"
          "linear, 0,0,1,1"
          "almostLinear, 0.5,0.5,0.75,1.0"
          "quick, 0.15,0,0.1,1"
          "slidefade,0.42, 0.71, 0.6, 0.97 "
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
          "workspacesIn, 1, 1.21, slidefade, slidefade 30%"
          "workspacesOut, 1, 1.94, slidefade, slidefade 30%"
        ];
      };

      bind = [
        "$mainMod, D, exec, $menu"
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, Delete, exec, wlogout"
        "$mainMod SHIFT, P, exec, hyprpicker -f rgb -a"
        "$mainMod, n, exec, spotifycli --next"
        "$mainMod, b, exec, spotifycli --prev"
        "$mainMod, p, exec, spotifycli --playpause"
        "$mainMod, Tab, togglefloating"
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
        "$mainMod, F2, exec, pkill -9 waybar && waybar "

        "$mainMod, F3, exec, pkill -9 hyprpaper; hyprpaper"
        "$mainMod SHIFT, P, exec, hyprpicker -f rgb -a"
        "$mainMod, Print, exec, hyprshot -o ~/Obrazy/Screenshots/ -z -t 0 --mode region "
        "$mainMod, C, exec, protonvpn connect | notify-send \"VPN\" \"VPN connected\""
        "$mainMod, V, exec, protonvpn disconnect | notify-send \"VPN\" \"VPN disconnected\""
        "Ctrl Shift, 1, movetoworkspace, 1" # NOTE: code:10 = key 1"
        "Ctrl Shift, 2, movetoworkspace, 2" # NOTE: code:11 = key 2
        "Ctrl Shift, 3, movetoworkspace, 3" # NOTE: code:12 = key 3
        "Ctrl Shift, 4, movetoworkspace, 4" # NOTE: code:13 = key 4
        "Ctrl Shift, 5, movetoworkspace, 5" # NOTE: code:14 = key 5
        "Ctrl Shift, 6, movetoworkspace, 6" # NOTE: code:15 = key 6
        "Ctrl Shift, 7, movetoworkspace, 7" # NOTE: code:16 = key 7
        "Ctrl Shift, 8, movetoworkspace, 8" # NOTE: code:17 = key 8
        "Ctrl Shift, 9, movetoworkspace, 9" # NOTE: code:18 = key 9
        "Ctrl Shift, 0, movetoworkspace, 10"
        "$mainMod Ctrl Shift, 1, plugin:xtd:throwunfocused, 1 "
        "$mainMod Ctrl Shift, 2, plugin:xtd:throwunfocused, 2 "
        "$mainMod Ctrl Shift, 3, plugin:xtd:throwunfocused, 3 "
        "$mainMod Ctrl Shift, 4, plugin:xtd:throwunfocused, 4 "
        "$mainMod Ctrl Shift, 5, plugin:xtd:throwunfocused, 5 "
        "$mainMod Ctrl Shift, 6, plugin:xtd:throwunfocused, 6 "
        "$mainMod Ctrl Shift, 7, plugin:xtd:throwunfocused, 7 "
        "$mainMod Ctrl Shift, 8, plugin:xtd:throwunfocused, 8 "
        "$mainMod Ctrl Shift, 9, plugin:xtd:throwunfocused, 9 "
        "$mainMod Ctrl Shift, 0, plugin:xtd:throwunfocused,10 "
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, mouse_down, workspace, e+1"
      ];

      bindd = [
        "$mainMod, mouse_down, next workspace, workspace, e+1"
        "$mainMod, mouse_up, previous workspace, workspace, e-1"
        "$mainMod, period, next workspace, workspace, ie+1"
        "$mainMod, comma, previous workspace, workspace, e-1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrule = [
        "tag +browser, match:class firefox"
        "tag +games, match:class gamescope"
        "tag +games, match:class steam_app"
        "tag +gamelaunch, match:class steam"
        "tag +gamelaunch, match:title lutris"
        "tag +im, match:class vesktop"
        "tag +file-manager, match:class nemo"
        "tag +codeeditor, match:class code-oss"
        "tag +screanshare, match:class com.obsproject.Studio"
        "tag +music, match:class spotify"
        "workspace 1, match:tag browser*"
        "workspace 5, match:tag codeeditor*"
        "workspace 2, float on, match:tag gamelaunch"
        "workspace 3, match:tag im"
        "workspace 5, match:tag games"
        "workspace 2, float on,match:tag music"
        "workspace 6, match:tag screanshare"
        "workspace 2,float on, match:class org.kde.kdeconnect.app"
        "float on, match:class kitty"
        "float on, match:class hyprland-share-picker"
        "suppress_event maximize, match:class . "
        "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"
      ];
    };
  };
}
