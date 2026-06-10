{
  description = "nix solves this smth";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #package inputs
    hyprland.url = "github:hyprwm/hyprland";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    fok-quote = {
      url = "github:FokoHetman/fok-quote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    subtui = {
      url = "github:MattiaPun/SubTUI";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    concord = {
      url = "github:chojs23/concord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #modules and shit
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem.follows = "hjem-rum/hjem";
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        #hjem.follows = "hjem";
      };
    };
    #hjem = {
    #url = "github:feel-co/hjem";
    #inputs = {
    #   nixpkgs.follows = "nixpkgs";
    # hjem.follows = "hjem-rum/hjem";
    #};
    #};
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    hjem,
    ...
  } @ inputs: {
    nixosConfigurations.nixsolvesthis = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        #config
        ./hosts/nixsolvesthis/default.nix
        ./common/default.nix
        #modules
        hjem.nixosModules.default
        ./modules/default.nix
      ];
    };
    nixosConfigurations.nixserver = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixserver/default.nix
        ./common/run0.nix
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
