{
  description = "nix solves this smth";
  inputs = {
    nixpkgs.url  = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/hyprland";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";    
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    lazyvim.url = "github:pfassina/lazyvim-nix";
    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      };
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
  
    
  outputs = { self, nixpkgs, stylix,nix-cachyos-kernel, hyprland,nix-index-database,spicetify-nix ,lazyvim ,dolphin-overlay,... }@inputs: {
    nixosConfigurations.nixsolvesthis = nixpkgs.lib.nixosSystem {
      system =  "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixsolvesthis/gamingstuff.nix
        ./hosts/nixsolvesthis/configuration.nix
	      ./hosts/nixsolvesthis/nixsettings.nix
        inputs.home-manager.nixosModules.default
	      inputs.nix-gaming-edge.nixosModules.default
        nix-index-database.nixosModules.default
	      stylix.nixosModules.stylix	
      ];
    };
    nixosConfigurations.nixserver = nixpkgs.lib.nixosSystem {
      system ="x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [ 
        ./hosts/nixserver/configuration.nix
      ];
    };
  };
}
