{lib,config,...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          name = "nord";
        enable = true;
        }; 
        options = { 
         shiftwidth = 2;
        };
        startPlugins = ["neo-tree-nvim"];
        formatter = {
          conform-nvim = {
            enable = true;
            setupOpts = {
              formatters = {
                "alejandra".command = "alejandra";
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
            extraDiagnostics = {
              enable = true;
            };
            treesitter.enable = true;
            lsp = {
              enable = true;
              servers = ["nixd"];
            };
            format = {
              type = ["alejandra"];
            };
          };
        };
      };
    };
  };
}
