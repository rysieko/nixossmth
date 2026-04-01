{ config, pkgs, osConfig, inputs, ... }:

{
  imports = [
    ./config/hyprland.nix
    ./config/hyprstuff.nix
    ./config/kitty.nix
    ./config/spicetify.nix
    ./config/lazyvim.nix
    ./config/fish.nix
    ./config/waybar.nix
    inputs.spicetify-nix.homeManagerModules.default
    inputs.lazyvim.homeManagerModules.default
    inputs.stylix.homeModules.stylix
  ];
  nixpkgs.config.allowUnfree = true ;
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
    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };
  };
  qt.enable = true;
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
  stylix = {
    enable = true;
    fonts.sizes = {
      applications = 11;
      desktop = 9;
    };
    polarity = "dark";
    image = ./config/corpseminos-v1.jpg;
  };
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  
  
	
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
  xdg.configFile."hypr/hyprtoolkit.conf" = {
      source = ./config/hyprtoolkit.conf;
      force = true;
  };
   xdg.configFile."swaync/config.json" = {
   source = ./config/swaync/config.json;
   force = true;
  };
  xdg.configFile."swaync/configSchema.json" = { 
    source = ./config/swaync/configSchema.json;
    force = true;
  };
  xdg.configFile."swaync/style.css" = {
    source = ./config/swaync/style.css ;
    force = true;
  };
  #xdg.configFile."waybar/config.jsonc" = { 
  # source = ./config/waybar/config.jsonc;
  # force = true;
  #};
  #xdg.configFile."waybar/style.css" = { 
  # source = ./config/waybar/style.css;
  # force = true; 
  #};
  xdg.configFile."fastfetch/config.jsonc" = {
    source = ./config/config.jsonc ;  
    force = true ;
  };
  
  
  
  
  home.sessionVariables = {
     mainMod ="SUPER";	
     EDITOR = "nvim";
     XCURSOR_SIZE = 24;
     HYPRCURSOR_SIZE = 24;
     XDG_TERMINAL_COMMAND = "kitty";
     font = "noto";
     terminalApplication = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
