{...}: {
  services.greetd = {
    enable = true;
    restart = false;
    settings = rec {
      initial_session = {
        #   command = "uwsm start hyprland.desktop";
        user = "rysieko";
        command = "start-hyprland";
      };
      default_session = initial_session;
    };
  };
}
