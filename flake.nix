{
  description = "Nixos desktop flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #hyprland.url = "github:hyprwm/hyprland";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";    
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    lazyvim.url = "github:pfassina/lazyvim-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";    
    };
    
    nix-gaming-edge = {
      url = "github:powerofthe69/nix-gaming-edge";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.millennium.follows = "millennium";
      };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };        
  };
  
    
  outputs = { self, nixpkgs, nix-cachyos-kernel, hyprland,nix-index-database,spicetify-nix ,lazyvim, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    nixosConfigurations.nixsolvesthis = nixpkgs.lib.nixosSystem {
      system =  "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./gamingstuff.nix
        ./configuration.nix
	      ./nixsettings.nix
        inputs.home-manager.nixosModules.default
	      inputs.nix-gaming-edge.nixosModules.default
        nix-index-database.nixosModules.default
        ];
    };
  };
}
