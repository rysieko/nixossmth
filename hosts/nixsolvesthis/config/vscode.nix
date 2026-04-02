{config,pkgs, ...}:
{
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
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" =  true;
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "alejandra" ]; # 
          };
         };
      };
    };
  };
  };
}


