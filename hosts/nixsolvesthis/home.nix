{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./config/config.nix 
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
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-icons";
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
    image = ./config/wallpapers/deltarune.gif;
  };
  services.hyprpaper.enable = lib.mkForce false;
  programs.yazi = { 
    enable = true;
    enableFishIntegration = true;
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
    ".config/niri/".source = ../../niri;
    ".config/subtui/config.toml".text = ''' 
      [app]
replaygain = 'track' # Options: 'track', 'album', 'no' https://mpv.io/manual/stable/#options-replaygain
gapless_playback = 'yes' # Options:  'yes', 'no', 'weak' https://mpv.io/manual/stable/#options-gapless-audio
desktop_notifications = false
discord_rich_presence = true
mouse_support         = false
default_volume = 90  
[theme]
display_album_art  = true
[columns]
  [columns.songs]
  track_number = false
  title = true
  artist = true
  album = true
  year = false
  genre = false
  rating = false
  play_count = false
  duration = true

  [columns.albums]
  name = true
  artist = true
  song_count = false
  year = false
  genre = false
  rating = true
  duration = true

  [columns.artists]
  name = true
  album_count = true
  rating = true

[keybinds]
  [keybinds.global]
  cycle_focus_next = ['tab']
  cycle_focus_prev = ['shift+tab']
  back             = ['backspace', 'esc']
  help             = ['?']
  quit             = ['q']
  hard_quit        = ['ctrl+c']

  [keybinds.navigation]
  up                = ['k', 'up']
  down              = ['j', 'down']
  top               = ['gg']
  bottom            = ['G']
  select            = ['enter']
  toggle_selection  = ['x']
  play_shuffled     = ['alt+enter']
  go_half_page_up   = ['ctrl+u']
  go_half_page_down = ['ctrl+d']

  [keybinds.search]
  focus_search = ['/']
  filter_next  = ['ctrl+n']
  filter_prev  = ['ctrl+b']

  [keybinds.library]
  add_to_playlist = ['A']
  add_rating      = ['R']
  go_to_album     = ['ga']
  go_to_artist    = ['gr']
  rate_0          = ['0']
  rate_1          = ['1']
  rate_2          = ['2']
  rate_3          = ['3']
  rate_4          = ['4']
  view_favorites   = ['F']

  rate_5          = ['5']

  [keybinds.media]
  play_pause          = ['p', 'P']
  next                = ['n']
  prev                = ['b']
  shuffle             = ['S']
  loop                = ['L']
  restart             = ['w']
  rewind              = [',']
  forward             = [';']
  volume_up           = ['v']
  volume_down         = ['V']
  toggle_media_player = ['m', 'M']

  [keybinds.queue]
  toggle_queue_view = ['Q']
  queue_next        = ['N']
  queue_last        = ['a']
  remove_from_queue = ['d']
  clear_queue       = ['D']
  move_up           = ['K']
  move_down         = ['J']
      ''; 
      
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
