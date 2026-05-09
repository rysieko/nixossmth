# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./pkgs.nix
    inputs.home-manager.nixosModules.default
  ];
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    style.wallpapers = [./config/wallpapers/nordic.jpg];
    style.interface.resolution = "2560x1440";
  };

  boot.loader.efi.canTouchEfiVariables = true;
  networking = {
    hostName = "nixsolvesthis";
    networkmanager.enable = true;
    networkmanager.connectionConfig = {
      "ethernet.mtu" = "1368";
      "ipv6.method" = "ignore";
      "ipv6.never-default" = "true";
    };
    useDHCP = false;
    enableIPv6 = lib.mkForce false;
    
  };
  systemd.services.tailscale-autoconnect = {
  description = "Automatic connection to Tailscale";
  after = [ "network-pre.target" "tailscale.service" ];
  wants = [ "network-pre.target" "tailscale.service" ];
  serviceConfig.Type = "oneshot";
  script = with pkgs; ''
    # Wait for Tailscale service to start
    sleep 5
    # Check if already authenticated
    status="$(${tailscale}/bin/tailscale status -json | jq -r .BackendState)"
    if [ "$status" = "Running" ]; then
      exit 0
    fi
    # Authenticate with Tailscale using the pre-auth key
    ${tailscale}/bin/tailscale up --auth-key file:/etc/tailscale/tskey-reusable
  '';
};
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
