{ pkgs ,...}:

{
  # https://search.nixos.org/
   environment.systemPackages = with pkgs; [
     wget
     protonup-ng
     hyprland-qt-support
     git
     cliphist
     vesktop
     prismlauncher
     lutris
     nordic
     candy-icons
     catppuccin-grub    
     hyprlauncher
     fastfetch
     spotify-cli-linux
     btop
     spotify
     godot
     mangohud
     udiskie
     wine
     kitty
     hyprshutdown
     swaynotificationcenter
     wlogout
     hyprpaper
     gh
     hyprshot
     pavucontrol
     cmatrix
     feh
     hyprpwcenter
   ];
   fonts.packages = with pkgs.nerd-fonts; [
	  fira-code
	  droid-sans-mono
	  noto
	  hack
	  ubuntu
   ];
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.waybar.enable = true;   
  programs.neovim.enable = true;
  programs.kdeconnect.enable = true;
}
