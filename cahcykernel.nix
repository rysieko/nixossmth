{ pkgs, ... }:
{
    nixpkgs.overlays = [
              # Use nixpkgs from your environment, nixpkgs.config will apply.
              # Has small chance of kernel modules not being compatible with kernel version.
    nix-cachyos-kernel.overlays.default
    ];
}