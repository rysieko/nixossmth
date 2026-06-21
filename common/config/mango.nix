{...}: {
  rysieko.mango = {
    enable = true;
    settings = let
      main = "SUPER";
      ipc = "noctalia msg";
    in {
      xkb_rules_layout = "pl";
      exec-once = [
        "noctalia"
        "steam"
        "vesktop"
        "wl-paste --type text --watch cliphist-store"
        "wl-paste --type image --watch cliphist-store"
      ];
      monitorrule = "name:DP-1,width:2560,height:1440,refresh:180";
      bind = [
        "${main}, Return,spawn,ghostty +new-window"
        "${main}, D,spawn, ${ipc} panel-toggle launcher"
        "${main}, Q, killclient"
        "${main}, E, spawn,ghostty +new-window -e nu -c yazi"
        "${main}, TAB, togglefloating"
        "${main}, o, toggleoverlay"
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
        "force_tearing:1,appid:gamescope"
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
      borderpx = 0;
    };
  };
}
