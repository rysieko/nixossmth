{...}: {
  programs.noctalia-greeter = {
    enable = true;
  };
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default-session = {
        user = "greeter";
      };
    };
  };
}
