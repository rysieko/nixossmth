#/run/current-system/sw/bin/nu nu
const walldir = "/home/rysieko/Obrazy/Wallpapers"
let  current_dir = pwd
let wall =  cd $walldir 
| ls | get name | to text  
| fuzzel --dmenu  
  

# awww img (select_wall)
noctalia msg wallpaper-set $wall  out>> /dev/null
awww img $wall out>> /dev/null
cd $current_dir
