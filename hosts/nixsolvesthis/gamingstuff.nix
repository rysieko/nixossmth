{pkgs, ...}: { 
  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
        extraCompatPackages = with pkgs; [
      #        proton-cachyos-x86_64-v4
    ];
  };
}
