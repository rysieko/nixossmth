{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-dotnettools.csdevkit
        woberg.godot-dotnet-tools
        jnoortheen.nix-ide
        kamadorueda.alejandra
        ms-python.python
      ];
      userSettings = {
        "qt-qml.qmlls.useQmlImportPathEnvVar" = true;
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
