{lib, ...}: {
  hjem.users.rysieko.files = {
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
    ".config/fuzzel/fuzzel.ini" = {
      generator = lib.generators.toINI {};
      value = {
        main = {
          use-bold = true;
          terminal = "ghostty +new-window -c";
          include = "~/.config/fuzzel/colors.ini";
          password-character = "*";
          enable-mouse = "yes";
          sort-result = "yes";
          tabs = 10;
          prompt = ">Input stuff :) | ";
          list-executables-in-path = "yes";
        };
      };
    };
  };
}
