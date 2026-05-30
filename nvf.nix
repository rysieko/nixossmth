{pkgs, ...}: {
  config.vim = {
    extraPackages = with pkgs; [
      nixd
      alejandra
      stylua
      deadnix
      ruff
      mypy
      pyright
      lua-language-server
    ];
    theme = {
      name = "nord";
      enable = true;
      transparent = true;
    };
    options = {
      shiftwidth = 2;
    };
    #startPlugins = ["neo-tree-nvim"];
    formatter = {
      conform-nvim = {
        enable = true;
        setupOpts = {
          formatters = {
            "stylua".command = "stylua";
          };
        };
      };
    };
    telescope = {
      enable = true;
    };
    lazy = {
      enable = true;
    };
    autocomplete = {
      blink-cmp = {
        enable = true;
      };
    };
    tabline = {
      nvimBufferline = {
        enable = true;
      };
    };
    lsp = {
      presets = {
        nixd = {
          enable = true;
        };
      };
      servers = {
        nixd = {
          nixos = {
            expr = "(builtins.getFlake (builtins.toString /home/rysieko/nixossmth/)).nixosConfigurations.nixsolvesthis.options";
          };
        };
      };
      enable = true;
      formatOnSave = true;
    };
    statusline.lualine = {
      enable = true;
      theme = "auto";
    };
    visuals = {
      nvim-web-devicons = {
        enable = true;
      };
    };

    filetree = {
      neo-tree = {
        enable = true;
      };
    };
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
      fish = {
        enable = true;
        lsp = {
          enable = true;
        };
        format = {
          enable = true;
        };
        treesitter.enable = true;
      };
      nix = {
        enable = true;
        extraDiagnostics = {
          enable = true;
        };
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = ["nixd"];
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
      python = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = ["mypy"];
        };
        format = {
          enable = true;
          type = ["ruff"];
        };
      };
    };
  };
}
