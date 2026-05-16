{...}: {
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    enableFishIntegration = true;
    settings = {
    wait-after-command = false;
    };
  }; 
}
