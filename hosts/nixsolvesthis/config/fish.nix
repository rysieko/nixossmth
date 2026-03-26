{config , ...} :
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ULTRAKILLLLLLLLLLLLLLLLLLL
    '';
    plugins = [
        {name = git; src = pkgs.fishPlugins.plugin-git}
    ]
                
    
  };
}
