{...}: {
stylix = {
    autoEnable = true;
    enable = true;
    fonts.sizes = {
      applications = 11;
      desktop = 9;
    };
    opacity = {
      desktop = 0.0;
      applications = 1.0;
      popups = 0.7;
      terminal = 1.0;
    };
    polarity = "dark";
    targets = {
      vscode = {
        enable = false;
      };
        nvf.enable = false;
      firefox = {
        profileNames = ["rysieko"];
        colors.enable = true;
        colorTheme.enable = true;
        enable = true;
      };
      swaync = {
        enable = true;
      };
      vencord = {
        enable = false;
        colors.enable = true;
        fonts.enable = true;
        extraCss = ''
            *  = {
              opacity: 0.0;
            }
            text {
              opacity 1.0
            };

        '';
      };
      kde = {
        enable = true;
      };
    };
    image = ./wallpapers/deltarune.gif;
  }; }
