{
  description = "nix solves this smth";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    hyprland.url = "github:hyprwm/hyprland";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
    fok-quote.url = "github:FokoHetman/fok-quote";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:mcgi5sr2/hyprlock/feature/video-background";
      inputs = {
        hyprgraphics.follows = "hyprland";
        hyprutils.follows = "hyprland";
        hyprlang.follows = "hyprland";
        hyprwayland-scanner.follows = "hyprland";
      };
    };
    hyprtoolkit = {
      url = "github:hyprwm/hyprtoolkit";
      inputs = {
        hyprgraphics.follows = "hyprland";
        hyprlang.follows = "hyprland";
        hyprwayland-scanner.follows = "hyprland";
        aquamarine.follows = "hyprland";
        hyprutils.follows = "hyprland";
      };
    };
    hyprshutdown = {
      url = "github:hyprwm/hyprshutdown";
      inputs = {
        hyprgraphics.follows = "hyprland";
        hyprutils.follows = "hyprland";
        aquamarine.follows = "hyprland";
        hyprtoolkit.follows = "hyprtoolkit";
        
      };
    };
    hyprlauncher = {
      url = "github:hyprwm/hyprlauncher";
      inputs = {
        hyprgraphics.follows = "hyprland";
        hyprlang.follows = "hyprland";
        aquamarine.follows = "hyprland";
        hyprtoolkit.follows = "hyprtoolkit";
        hyprutils.follows = "hyprland";
        hyprwire.follows = "hyprland";
        };
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations.nixsolvesthis = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixsolvesthis/gamingstuff.nix
        ./hosts/nixsolvesthis/configuration.nix
        ./hosts/nixsolvesthis/nixsettings.nix
        ./hosts/nixsolvesthis/greetd.nix
        home-manager.nixosModules.default
        stylix.nixosModules.stylix
        nvf.nixosModules.default 
      ];
    };
    nixosConfigurations.nixserver = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixserver/configuration.nix
      ];
    };
  };
}
