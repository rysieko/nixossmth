
{config ,pkgs, ...}:
{
  programs.lazyvim = {
    enable = true;
    installCoreDependencies = true;
    
    extras = {
        lang.nix.enable = true;
        lang.python = {
        enable = true;
        installDependencies = true;        # Install ruff
        installRuntimeDependencies = true; # Install python3
        };
    };

    # Additional packages (optional)
    extraPackages = [
        pkgs.nixd       # Nix LSP
        pkgs.alejandra  # Nix formatter
    ];
  };
  programs.lazygit.enable = true;
}
