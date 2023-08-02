function random_wall
  if not pgrep -f swww > /dev/null
    swww init --no-cache
  end
  swww img (fd . ~/Pictures/wallpapers/ -t file -e jpg -e png | shuf -n1)
end
