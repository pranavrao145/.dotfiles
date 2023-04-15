#!/usr/bin/env bash

echo "Updating system colour scheme..."

echo "Updating Xresources..."
# update Xresources
xrdb -query -all > ~/.Xresources

echo "Updating Discord colour scheme..."
# update discord colour scheme
pywal-discord

# echo "Updating Firefox colour scheme..."
# update firefox colour scheme
# pywalfox update

get_colour() {
    xrdb -query | grep -m 1 $1 | awk '{print $2}'
}

echo "Updating zathura colour scheme..."


cat > "$HOME/.dotfiles/zathura/.config/zathura/zathurarc" <<- CONF
set recolor
set recolor-darkcolor "$(get_colour foreground)"
set recolor-lightcolor "$(get_colour *.color0:)"
set default-bg "$(get_colour *.color0:)"
map i recolor
set guioptions none
CONF

echo "Updating xmobar colour scheme..."

sed -i "/bgColor/c\        , bgColor =    \"$(get_colour *.color0:)\"" $HOME/.dotfiles/xmobar/.config/xmobar/xmobarrc0
sed -i "/bgColor/c\        , bgColor =    \"$(get_colour *.color0:)\"" $HOME/.dotfiles/xmobar/.config/xmobar/xmobarrc1
# sed -i "/fgColor/c\        , fgColor =    \"$(get_colour foreground)\"" $HOME/.dotfiles/xmobar/.config/xmobar/xmobarrc
sed -i "/ppTitle/c\                          , ppTitle = xmobarColor \"$(get_colour *.color6:)\" \"\" . shorten 60" $HOME/.dotfiles/xmonad/.xmonad/xmonad.hs
sed -i "/ppCurrentColorMarker1/c\                                xmobarColor \"$(get_colour *.color6:)\" \"\" . -- ppCurrentColorMarker1" $HOME/.dotfiles/xmonad/.xmonad/xmonad.hs
sed -i "/ppCurrentColorMarker2/c\                                    \"<box type=Bottom width=2 mb=2 color=$(get_colour *.color6:)>\" -- ppCurrentColorMarker2" $HOME/.dotfiles/xmonad/.xmonad/xmonad.hs

xmonad --restart

echo "System colour scheme updated successfully."
