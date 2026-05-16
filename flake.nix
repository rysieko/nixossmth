{
  description = "nix solves this smth";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    hyprland.url = "github:hyprwm/hyprland/v0.55.2";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    fok-quote.url = "github:FokoHetman/fok-quote";
    subtui.url = "github:MattiaPun/SubTUI";
    concord.url = "github:chojs23/concord";
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
        ./hosts/nixsolvesthis/configuration.nix
        ./hosts/nixsolvesthis/nixsettings.nix
        ./common/greetd.nix
        home-manager.nixosModules.default
        stylix.nixosModules.stylix 
      ];
    };
    nixosConfigurations.nixserver = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixserver/configuration.nix
      ];
    };
    packages.x86_64-linux = {
        nvim = 
        (nvf.lib.neovimConfiguration { 
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [./nvf.nix ];
        })
      .neovim;
      default = self.packages.x86_64-linux.nvim;
      }; 
  };
} 
