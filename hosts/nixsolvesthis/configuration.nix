# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./pkgs.nix
    inputs.home-manager.nixosModules.default
  ];
  services.displayManager.ly = {
    enable = true; # TRUE
    #settings = { # for testing in vm
    # auto_login_session = "hyprland";
    #auto_login_user = "rysieko";
    # };
  };
  # use limine as a bootloader
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    style.wallpapers = [./config/wallpapers/nordic.jpg];
    style.interface.resolution = "2560x1440";
  };
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v4;
  # specializations = {
  #cachyos-kernel-lts.configuration = {
  # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts-x86_64-v4;
  #};
  #};
  boot.loader.efi.canTouchEfiVariables = true;
  networking = {
    hostName = "nixsolvesthis";
    networkmanager.enable = true;
    networkmanager.connectionConfig = {
      "ethernet.mtu" = "1368";
    };
    useDHCP = false;
  };
  networking.networkmanager.connectionConfig = {
    "ipv6.method" = "ignore";
    "ipv6.never-default" = "true";
  };
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.resolved.enable = true;
  # users.users.root.initialHashedPassword = "sudo";
  #auto updates
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  #auto cleanup
  # Set your time zone.
  time.timeZone = "Europe/Warsaw";
  services.xserver.xkb.layout = "pl";
  # Select internationalisation properties.
  i18n.defaultLocale = "pl_PL.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "pl";
    #useXkbConfig = true; # use xkb.options in tty.
  };

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  programs.hyprland.enable = true;
  # Enable Bluetooth support.
  #  services.bluetooth.enable = true;
  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  # i wish i was a fish
  programs.fish.enable = true;
  users.users.rysieko = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.fish;
    password = "sudo";
  };
  home-manager.backupFileExtension = ".bak";
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      rysieko = import ./home.nix;
    };
  };
  # do not fucking touch it does not change nixpkgs version it doesnt update the fucking system
  system.stateVersion = "26.05"; # Please read the comment before changing.
}
