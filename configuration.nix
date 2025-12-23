# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Use the superior (for dual boot) EFI boot loader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    device = "nodev";
    theme = pkgs.catppuccin-grub;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  networking = {
    hostName = "nixsolvesthis";
    networkmanager.enable = true;
    networkmanager.connectionConfig = {
      "ethernet.mtu" = "1368";
    };
    useDHCP	 = false;
  }; 
  networking.networkmanager.connectionConfig = {
    "ipv6.method" = "ignore";
    "ipv6.never-default" = "true";
  };  
 
 
  services.resolved.enable = true;

  #auto updates
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };
  #auto cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 15d";
  nix.settings.auto-optimise-store = true;
  #flakes and nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";
  services.xserver.layout = "pl";
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  nixpkgs.config.allowUnfree = true;
  # Select internationalisation properties.
   i18n.defaultLocale = "pl_PL.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "pl";
   #useXkbConfig = true; # use xkb.options in tty.
   };

  hardware.graphics.enable = true;
  #hardware.opengl.driSupport = true;
  #hardware.opengl.driSupport32Bit = true;
  
  # Enable the Desktop Environment.
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  services.displayManager.sddm.wayland.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
  #hyprland stuff
  services.hypridle.enable= true;
  programs.hyprlock.enable = true; #nice
  # Enable Bluetooth support.
 # services.bluetooth.enable = true;  
  # Enable sound.
    services.pipewire = {
     enable = true;
     pulse.enable = true;
   };
  # i wish i was a fish 
  programs.fish.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.rysieko = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ]; 
     shell = pkgs.fish; 
   };
  home-manager = {
   extraSpecialArgs = { inherit inputs; };
     users = {
           rysieko = import ./home.nix;
    };
  };
  programs.firefox = {
      enable = true;
     };   
  programs.thunar.enable = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     vscode
     nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     protonup-ng
     hyprland-qt-support
     git
     cliphist
     udiskie
     discord
     prismlauncher
     lutris
     nordic
     candy-icons
     catppuccin-grub    
     rofi
     rose-pine-hyprcursor
     rose-pine-cursor
     fastfetch
     spotify-cli-linux
     htop
     spotify
 # brave-browser
   ];
   fonts.packages = with pkgs.nerd-fonts; [
	fira-code
	droid-sans-mono
	noto
	hack
	ubuntu
   ];
  programs.git = {
    enable = true;
  };
 # nixpkgs.overlays = [ inputs.millennium.overlays.default ];
  programs.steam = {
    enable = true;
  #  package = pkgs.steam-millennium; 
    };
  

  programs.gamescope.enable = true;
  #system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Please read the comment before changing.

}

