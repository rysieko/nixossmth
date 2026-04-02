programs.vscode = {
  enable = true;
  package = pkgs.vscodium;
  profiles.default.extensions = with pkgs.vscode-extensions; [
    ms-dotnettools.csdevkit
    woberg.godot-dotnet-tools
    jnoortheen.nix-ide
    kamadorueda.alejandra
    ms-python.python
  ];
};

