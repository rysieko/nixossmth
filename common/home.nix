{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./config/default.nix 
    inputs.stylix.homeModules.stylix
    inputs.nvf.homeManagerModules.default
  ];
  nixpkgs.config.allowUnfree = true; # Home Manager needs a bit of information about you and the paths it should # manage.
  home = { 
    username = "rysieko";        
    homeDirectory = "/home/rysieko";
    };
  programs.vesktop = {
    enable = true;
    vencord.settings = {
      autoUpdate = true;
      #      themes = [../../DiscordPlus.theme.css];
      #  enabledThemes = ["DiscordPlus.theme.css"];      
      transparent = true;
      frameless = true;
      plugins = {
        MessageLogger = {
          enabled = true;
          ignoreSelf = true;
        };
        FakeNitro.enabled = true;
      };
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true; # Optional: enable if using X11 apps
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux"; # Standard name for the Rose Pine xcursor
    size = 24;
  };
  gtk = {
    gtk4.theme = lib.mkDefault null;
    enable = true;
    iconTheme = { 
      package = lib.mkDefault pkgs.rose-pine-icon-theme;
      name = "Rosé Pine Moon";
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
  services.hyprpaper.enable = lib.mkForce false;
  programs.yazi = { 
    enable = true;
    extraPackages = with pkgs; [ 
      mpv
      _7zz
      imagemagick
    ];
    enableFishIntegration = true;
  keymap = {
    mgr.prepend_keymap = [ {
      on   = "t";
      for  = "unix";
      run  = "shell fish --block";
      desc = "Open fish here";
      }];
    };
  };
  programs.mpv = {
    enable = true;
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
  home.file = let
    color = config.lib.stylix.colors;
    FETCHLOGO = ./config/fastfetch/kris.jpeg;
  in {
    ".config/hypr/hyprtoolkit.conf".text = ''
      font-family = noto
      font-size = 11
      background = rgb(${color.base00-rgb-r},${color.base00-rgb-g},${color.base00-rgb-b})
      base = rgb(${color.base01-rgb-r},${color.base01-rgb-g},${color.base01-rgb-b})
      accent = rgb(${color.base02-rgb-r},${color.base02-rgb-g},${color.base02-rgb-b})
      text = rgb(${color.base05-rgb-r},${color.base05-rgb-g},${color.base05-rgb-b})
    '';
    ".config/fastfetch/config.jsonc".text = ''
        {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json", 
        "modules": [
          "title",
          "separator",
          "os",
          "host",
          "kernel",
          "shell",
          "wm",
          "terminal",
          "cpu",
          "gpu",
          "memory",
          "localip",
          ],
        "logo": {
        "type": "kitty",        // Logo type: auto, builtin, small, file, etc.
        "source": "${FETCHLOGO}",      // Built-in logo name or file path
        }  
      }'';
    ".config/subtui/config.toml".source = ./subtui.toml; 
      
  };
  programs.fuzzel = {
    enable = true;
  };
  xdg.userDirs = {
    enable = true;
    setSessionVariables = true;
    pictures = "${config.home.homeDirectory}/Obrazy";
    download = "${config.home.homeDirectory}/Pobrane";
    music = "${config.home.homeDirectory}/Muzyka";
    templates = "${config.home.homeDirectory}/Szablony";
    projects = "${config.home.homeDirectory}/Projekty";
    documents = "${config.home.homeDirectory}/Dokumenty";
    videos = "${config.home.homeDirectory}/Wideo";
    publicShare = "${config.home.homeDirectory}/Publiczne";
    desktop = "${config.home.homeDirectory}/Pulpit";
    createDirectories = true;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = 1;
    XCURSOR_SIZE = 24;
    HYPRCURSOR_SIZE = 24;
    XDG_TERMINAL_COMMAND = "kitty";
    font = "noto";
    terminalApplication = "kitty";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

