{
  description = "Nixos desktop flake";
  nix.settings = {
      substituters = ["https://hyprland.cachix.org" "https://attic.xuyh0120.win/lantian"];
      trusted-substituters = ["https://hyprland.cachix.org" "https://attic.xuyh0120.win/lantian"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="  ];
    };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    millennium = {
      url = "git+https://github.com/SteamClientHomebrew/Millennium"; 
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.homeManagerModules.spicetify
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
        
    };
    hyprland.url = "github:hyprwm/hyprland";
      
  };
  
    
  outputs = { self, nixpkgs, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    nixosConfigurations.nixsolvesthis = nixpkgs.lib.nixosSystem {
      systems = [ "x86_64-linux" ];
      specialArgs = {inherit inputs;};
      modules = [
        ./cahcykernel.nix
        ./configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
