{
  description = "nix solves this smth";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/hyprland";
    fok-quote.url = "github:FokoHetman/fok-quote";
    subtui.url = "github:MattiaPun/SubTUI";
    concord.url = "github:chojs23/concord";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem.follows = "hjem-rum/hjem";
    #hjem = {
    #url = "github:feel-co/hjem";
    #inputs = {
    #   nixpkgs.follows = "nixpkgs";
    # hjem.follows = "hjem-rum/hjem";
    #};
    #};
    hjem-rum = {
      url = "github:FokoHetman/hjem-rum/";
      inputs = {
        #nixpkgs.follows = "nixpkgs";
        #hjem.follows = "hjem";
      };
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
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nvf,
    hjem,
    ...
  } @ inputs: {
    nixosConfigurations.nixsolvesthis = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixsolvesthis/configuration.nix
        ./hosts/nixsolvesthis/nixsettings.nix
        ./hosts/nixsolvesthis/hardware-configuration.nix
        ./hosts/nixsolvesthis/pkgs.nix
        ./common/greetd.nix
        ./common/hjem.nix
        ./common/zen.nix
        home-manager.nixosModules.default
        hjem.nixosModules.default
        ./common/modules/default.nix
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
          modules = [./nvf.nix];
        })
      .neovim;
      default = self.packages.x86_64-linux.nvim;
    };
  };
}
