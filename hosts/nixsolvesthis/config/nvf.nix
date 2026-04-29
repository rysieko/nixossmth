{lib,...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        startPlugins = ["neo-tree-nvim"];
        keymaps = [
          {
            key = "<leader>n";
            mode = "n";
            silent = true;
            action = "<cmd>Telescope find files";
          }
          {
            key = "<leader>l";
            mode = ["n" "x"];
            silent = true;
            action = "<cmd>cnext<CR>";
          }
        ];
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
        autocmds = [{
                event = [""];
                pattern = ["*"];
                desc = "format";
                callback = lib.generators.mkLuaInline ''
                function()
                conform.format({ bufnr = args.buf })
                end
                '';
        }];
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
