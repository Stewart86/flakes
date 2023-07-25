function random_wall
  swww kill
  swww init
  swww img (fd . ~/Pictures/wallpapers/ -t file -e jpg -e png | shuf -n1)
end
