{config , inputs, ... }:
{
 nixpkgs.overlays = with inputs; [
    nix-gaming-edge.overlays.default
    nix-gaming-edge.overlays.proton-cachyos
    nix-cachyos-kernel.overlays.default   
    nur.overlays.default
    ];
  
 nix = { 
   gc = { 
       automatic = true;
       dates = "daily";
       options = "--delete-older-than 15d";
   };
   settings = {
       experimental-features = [ "nix-command" "flakes" ];
       auto-optimise-store = true;
       substituters = ["https://hyprland.cachix.org" "https://attic.xuyh0120.win/lantian"];
       trusted-substituters = ["https://hyprland.cachix.org" "https://attic.xuyh0120.win/lantian"];
       trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="  ];
   };
 };
 nixpkgs.config.allowUnfree = true;
}
