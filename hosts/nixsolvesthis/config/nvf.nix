{...}:
{
    programs.nvf = {
        enable = true;
        settings = {
        vim = { 
            languages = {
                lua = {
                    enable = true;
                    format = true;
                    treesiter = true;
                    lsp = {
                        enable = true;
                        servers = "lua-language-server"
                    };
                    extraDiagnostics = {
                        enable = true;
                        types = [ "luacheck" ]; 
                    };
                };
                nix = {
                    enable = true;
                    extraDiagnostics { 
                        enable = true;
                    };
                    format {
                      type = ["alejandra"];
                    };
                };
            };
        };
      };
    }
}