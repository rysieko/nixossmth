{ config, pkgs, osConfig, inputs, ... }:

{
  imports = [
    ./config/hyprland.nix
    ./config/hyprstuff.nix
    ./config/kitty.nix
#    ./config/spicetify.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rysieko";
  home.homeDirectory = "/home/rysieko";
  
  home.pointerCursor = {
   gtk.enable = true;
   x11.enable = true; # Optional: enable if using X11 apps
   package = pkgs.rose-pine-cursor;
   name = "BreezeX-RosePine-Linux"; # Standard name for the Rose Pine xcursor
   size = 24;
  }; 
  gtk = {
    enable = true;
    theme = {
      name = "Nordic"; # The name of the theme to be used
      package = pkgs.nordic; # The package containing the theme
    };
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
    #gtk3 = {
     # extraConfig = "gtk-application-prefer-dark-theme=1";
      
    #};
    #gtk4 = {
     # extraConfig = " gtk-application-prefer-dark-theme=1";
    #};
  };
  programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "rysieko";
          email = "rrx9506@proton.me";
      };
    };
  };
  qt = {
    enable = true;
    style.name = "nordic";
  };
	
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [ 
    
  ];

  home.file = {
     
  };
  xdg.configFile."~/.config/hypr/hyprtoolkit.conf".source = ./config/hyprtoolkit.conf;
  xdg.configFile."~/.config/swaync/config.json".source = ./config/swaync/config.json;
  xdg.configFile."~/.config/swaync/configSchema.json".source = ./config/swaync/configSchema.json;
  xdg.configFile."~/.config/swaync/style.css".source = ./config/swaync/style.css ;
  xdg.configFile."~/.config/waybar/config.jsonc".source = ./config/waybar/config.jsonc;
  xdg.configFile."~/.config/waybar/style.css".source = ./config/waybar/style.css;
  home.sessionVariables = {
     mainMod ="SUPER";	
     EDITOR = "nvim";
     XCURSOR_SIZE = 24;
     HYPRCURSOR_SIZE = 24;
     XDG_TERMINAL_COMMAND = "kitty";
     font = "noto";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
