{pkgs, ...}: {
  rysieko.mango = {
    enable = true;
    autostart_sh = "noctalia &
        steam &
        vesktop &
        wl-paste --type text --watch cliphist-store &
        wl-paste --type image --watch cliphist-store &
        awww-daemon &
        systemctl start --user app-com.mitchellh.ghostty.service &
    ";
    settings = let
      main = "SUPER";
      ipc = "noctalia msg";
    in {
      xkb_rules_layout = "pl";

      monitorrule = "name:DP-1,width:2560,height:1440,refresh:180";
      bind = [
        "${main}, Return,spawn,ghostty +new-window"
        "${main}, D,spawn, ${ipc} panel-toggle launcher"
        "${main}, Q, killclient"
        "${main}, E, spawn,ghostty +new-window -e nu -c yazi"
        "${main}, TAB, togglefloating"
        "${main}, O, togglejump"
        "${main}, F, togglefullscreen"
        "${main}, P, spawn, ${ipc} media play-pause"
        "${main}, N, spawn, ${ipc} media next"
        "${main}, B, spawn, ${ipc} media previous"
        "${main}, PRINT, spawn,${ipc} screenshot-region"
        "${main}, W , spawn, ${ipc}  panel-toggle wallpaper"
        "${main}, R, spawn, ${ipc} wallpaper-random"
        "${main}, H , focusdir, left"
        "${main}, L , focusdir, right"
        "${main}, K , focusdir, up"
        "${main}, J , focusdir, down"
        "CTRL+SHIFT,H, exchange_client, left"
        "CTRL+SHIFT, L, exchange_client, right"
        "CTRL+SHIFT, K , exchange_client ,up"
        "CTRL+SHIFT, J, exchange_client, down"
        "${main},1,view,1,0"
        "${main},2,view,2,0"
        "${main},3,view,3,0"
        "${main},4,view,4,0"
        "${main},5,view,5,0"
        "${main},6,view,6,0"
        "${main},7,view,7,0"
        "${main},8,view,8,0"
        "${main},9,view,9,0"
        "CTRL+SHIFT,1, tag,1,0"
        "CTRL+SHIFT,2, tag,2,0"
        "CTRL+SHIFT,3, tag,3,0"
        "CTRL+SHIFT,4, tag,4,0"
        "CTRL+SHIFT,5, tag,5,0"
        "CTRL+SHIFT,6, tag,6,0"
        "CTRL+SHIFT,7, tag,7,0"
        "CTRL+SHIFT,8, tag,8,0"
        "CTRL+SHIFT,9, tag,9,0"
      ];
      axisbind = [
        "SUPER,UP,viewtoleft_have_client"
        "SUPER,DOWN,viewtoright_have_client"
      ];
      windowrule = [
        "force_tearing:1,appid:gamescope,tags:5"
        "appid:zen,tags:1"
        "appid:steam,tags:2"
        "appid:lutris,tags:2"
        "appid:vesktop,tags:3"
        "appid:org.kde.kdeconnect.app,isfloating"
      ];
      tagrule = [
        "id:1,layout_name:fair"
        "id:2,layout_name:fair"
        "id:3,layout_name:fair"
        "id:4,layout_name:fair"
        "id:5,layout_name:fair"
        "id:7,layout_name:fair"
        "id:8,layout_name:fair"
        "id:9,layout_name:fair"

        "id:6,layout_name:scroller"
      ];
      mousebind = [
        "super, btn_left, moveresize, curmove"
        "super, btn_right, moveresize, curresize"
      ];
      drag_tile_to_tile = 1;
      borderpx = 0;
      border_radius = 15;
      source = "~/.config/mango/noctalia.conf";
    };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
