{pkgs, ...}: {
  config.vim = {
    extraPackages = with pkgs; [
      nil
      alejandra
      stylua
      deadnix
      lua-language-server
      nushell
      rust-analyzer
    ];
    theme = {
      name = "nord";
      enable = true;
    };
    options.shiftwidth = 2;
    utility.nix-develop.enable = true;
    formatter.conform-nvim = {
      enable = true;
      setupOpts.formatters."stylua".command = "stylua";
    };
    telescope.enable = true;
    lazy.enable = true;
    autocomplete.blink-cmp.enable = true;
    tabline.nvimBufferline.enable = true;
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
    session.nvim-session-manager.enable = true;
    dashboard.alpha.enable = true;

    lsp = {
      presets.nil.enable = true;
      servers.nil = {
        formatting = "alejandra";
        nix = {
          autoEvalInputs = true;
          maxMemory = 5120;
        };
      };
      formatOnSave = true;
      enable = true;
    };
    statusline.lualine = {
      enable = true;
      theme = "auto";
    };
    visuals.nvim-web-devicons.enable = true;

    filetree.neo-tree.enable = true;
    withPython3 = true;
    languages = {
      lua = {
        enable = true;
        format = {
          type = ["stylua"];
        };
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = ["lua-language-server"];
        };
        extraDiagnostics = {
          enable = true;
          types = ["luacheck"];
        };
      };
      nix = {
        enable = true;
        extraDiagnostics.enable = true;
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = ["nil"];
        };
        format = {
          enable = true;
          type = ["alejandra"];
        };
      };
      nu = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      rust = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
        format = {
          enable = true;
          type = ["rustfmt"];
        };
        extensions.crates-nvim.enable = true;
      };
    };
  };
}
