{...}: {
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      MusicFolder = "/navidrome/music";
      PlaylistPath = "/navidrome/playlist";
      DefaultLanguage = "pl";
      DefaultTheme = "AMusic";
      EnableTranscodingCancellation = true;
      EnableInsightsCollector = false;
    };
  };
}
