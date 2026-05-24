{...}: {
  #programs.fish = {
  # enable = true;
  # interactiveShellInit = ''
  #   set fish_greeting
  #   fastfetch
  #
  #'';
  #};
  #programs.direnv = {
  # enable = true;
  # enableFishIntegration = true;
  # nix-direnv.enable = true;
  #};
  hjem.users.rysieko.rum.programs.fish = {
    enable = true;
    functions = {
      fish_prompt = ''
        function interactiveShellInit
        fastfetch
        end
      '';
    };
  };
}
