{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs;
    lib.mkAfter [
      matugen
    ];
  hjem.users.rysieko.files = {
    ".config/matugen/config.toml" = {
      generator = (pkgs.formats.toml {}).generate "config.toml";
      value = {
        templates = {
          waybar = {
            input_path = "~/.config/matugen/colors.css";
            output_path = "~/.config/waybar/colors.css";
            post_hook = "pkill -SIGUSR2 waybar";
            type = "SchemeExpressive";
          };
          hyprland = {
            input_path = "~/.config/matugen/hyprland-colors.lua";
            output_path = "~/.config/hypr/colors.lua";
            type = "SchemeExpressive";
          };
          ghostty = {
            input_path = "~/.config/matugen/ghostty";
            output_path = "~/.config/ghostty/themes/matugen";
            post_hook = "pkill -SIGUSR2 ghostty";
            type = "SchemeExpressive";
          };
          fuzzel = {
            input_path = "~/.config/matugen/fuzzel.ini";
            output_path = "~/.config/fuzzel/colors.ini";
          };
          mako = {
            input_path = "~/.config/matugen/mako";
            output_path = "~/.config/mako/colors";
            post_hook = "makoctl reload && sleep 0.5 | notify-send \"Wallpaper changed\" \" (: \" ";
            type = "SchemeExpressive";
          };
        };
        config = {
          version_check = false;
          prefer = "dark";
          caching = false;
          contrast = 0.0;
          wallpaper = {
            set = true;
            command = "awww img --transition-type center {{ image }}";
          };
        };
      };
    };
    ".config/matugen/colors.css".text = ''
       <* for name, value in colors *>
       @define-color {{name}} {{value.default.hex}};
      <* endfor *>    '';
    ".config/matugen/hyprland-colors.lua".text = ''     
          return {
            image = "{{image}}",
        <* for name, value in colors *>
            {{name}} = "0xff{{value.default.hex_stripped}}",
        <* endfor *>
      }'';
    ".config/matugen/mako".text = ''
      background-color={{colors.primary.default.hex}}
      text-color={{colors.tertiary.default.hex}}
      border-color={{colors.tertiary_container.default.hex}}
      [mode=do-not-disturb]
      invisible=1
      on-notify=none
      [mode=silent]
      on-notify=none
      [urgency=high]
      border-color={{colors.error_container.default.hex}}
    '';
    ".config/matugen/fuzzel.ini" = {
      generator = lib.generators.toINI {};
      value = {
        colors = {
          background = "{{colors.background.default.hex_stripped}}ff";
          text = "{{colors.on_surface.default.hex_stripped}}ff";
          prompt = "{{colors.secondary.default.hex_stripped}}ff";
          placeholder = "{{colors.tertiary.default.hex_stripped}}ff";
          input = "{{colors.primary.default.hex_stripped}}ff";
          match = "{{colors.tertiary.default.hex_stripped}}ff";
          selection = "{{colors.primary.default.hex_stripped}}ff";
          selection-text = "{{colors.on_surface.default.hex_stripped}}ff";
          selection-match = "{{colors.on_primary.default.hex_stripped}}ff";
          counter = "{{colors.secondary.default.hex_stripped}}ff";
          border = "{{colors.primary.default.hex_stripped}}ff";
        };
      };
    };
  };
}
