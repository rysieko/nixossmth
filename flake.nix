{
  description = "nix solves this smth";

  outputs = {
    self,
    nixpkgs,
    nvf,
    hjem,
    noctalia-greeter,
    import-tree,
    nix-cachyos-kernel,
    ...
  } @ inputs: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [nix-cachyos-kernel.overlays.default];
    };
  in {
    nixosConfigurations.nixsolvesthis = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        #config
        (import-tree ./hosts/nixsolvesthis)
        (import-tree ./common)
        #modules
        hjem.nixosModules.default
        noctalia-greeter.nixosModules.default
        (import-tree ./modules)
      ];
    };
    nixosConfigurations.nixserver = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixserver/default.nix
        ./common/run0.nix
        ./common/nixsettings.nix
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
      kernel = pkgs.callPackage ./kernel.nix {inherit pkgs;};
    };
  };

  inputs = {
    #nixpkgs

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #common inputs i dont fucking use them

    systems.url = "github:nix-systems/default";
    systems-linux.url = "github:nix-systems/default-linux";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    flake-compact = {
      flake = false;
      url = "git+https://git.lix.systems/lix-project/flake-compat.git";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      #also no nixpkgs
    };
    #package inputs

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems-linux";
      };
    };
    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      #    inputs.nixpkgs.follows = "nixpkgs";
    };
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
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #modules and shit
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        flake-parts.follows = "flake-parts";
      };
    };
    hjem.follows = "hjem-rum/hjem";
    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nix-darwin.follows = "";
        #hjem.follows = "hjem";
      };
    };
    import-tree = {
      url = "github:vic/import-tree";
      #no nixpkgs i guess
    };
    #hjem = {
    #url = "github:feel-co/hjem";
    #inputs = {
    #   nixpkgs.follows = "nixpkgs";
    # hjem.follows = "hjem-rum/hjem";
    #};
    #};
  };
}
