{
  pkgs,
  inputs,
  ...
}: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    package = pkgs.lixPackageSets.latest.lix;
  };
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.millennium.overlays.default
      inputs.nix-cachyos-kernel.overlays.default
    ];
  };
}
