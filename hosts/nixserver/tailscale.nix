{
  config,
  pkgs,
  ...
}: {
  services.tailscale = {
    enable = true;
    permitCertUid = "caddy";
  };

  services.caddy = {
    enable = true;
    virtualHosts."nixserver.taila10a1e.ts.net".extraConfig = ''
      reverse_proxy 127.0.0.1:4533
    '';
  };
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
}
