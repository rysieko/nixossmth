{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        kamadorueda.alejandra
        ms-python.python
        sumneko.lua
      ];
      userSettings = {
        "git.confirmSync" = false;
        "qt-qml.qmlls.useQmlImportPathEnvVar" = true;
        "lua.serverPath" = "lua-language-server";
        "lua.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = ["alejandra"]; #
            };
          };
        };
      };
    };
  };
}
