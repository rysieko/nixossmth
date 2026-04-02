{
  config,
  pkgs,
  ...
}: {
  services.pihole-ftl = {
    enable = true;
    openFirewallDNS = true; # To open port 53 for DNS traffic

    # Settings documented at <https://docs.pi-hole.net/ftldns/configfile/>
    settings = {
      dns.upstreams = [
        "8.8.8.8"
        "8.8.4.4"
        "1.1.1.1"
        "1.0.0.1"
        "208.67.222.222"
        "208.67.220.220"
        "4.2.2.1"
        "4.2.2.2"
        "8.26.56.26"
        "8.20.247.20"
        "149.112.112.112"
        "9.9.9.9"
        "9.9.9.10"
        "149.112.112.10"
        "149.112.112.11"
        "9.9.9.11"
      ];
    };
    # Lists can be added via URL
    lists = [
      {
        url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/pro.txt";
        type = "block";
        enabled = true;
        description = "Sample blocklist by hagezi";
      }
      {
        url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
        type = "block";
        enabled = true;
        description = "Sample blocklist by StevenBlack";
      }
    ];
  };
  services.pihole-web.enable = true;
}
