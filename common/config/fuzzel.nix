{lib, ...}: {
  hjem.users.rysieko.files = {
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
          prompt = "Input stuff :) > ";
          list-executables-in-path = "yes";
        };
      };
    };
  };
}
