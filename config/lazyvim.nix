
{config , ...}:
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
    extraPackages = with pkgs; [
        nixd       # Nix LSP
        alejandra  # Nix formatter
    ];
    plugins = {
      colorscheme = ''
        return {
          "shaunsingh/nord.nvim",
          opts = {
          nord_contrast = true
          },
        }
      '';
    };
  };
}