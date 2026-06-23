{
  pkgs,
  lib,
  config,
  ...
}: {
  environment.systemPackages = with pkgs;
    lib.mkAfter [
      ghostty
    ];
  hjem.users.rysieko.files = {
    ".config/ghostty/config.ghostty".text = ''
      wait-after-command = false
      shell-integration = nushell
      background-blur = true
      confirm-close-surface = false
      font-family = "noto-music"
      theme=noctalia
      quit-after-last-window-closed = false
    '';
  };
}
