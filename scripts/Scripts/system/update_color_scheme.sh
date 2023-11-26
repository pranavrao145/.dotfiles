#!/usr/bin/env bash

echo "Updating system colour scheme..."

echo "Updating Xresources..."
# update Xresources
xrdb -query -all >~/.Xresources

echo "Updating Discord colour scheme..."
# update discord colour scheme
betterdiscordctl uninstall
betterdiscordctl install
pywal-discord

# echo "Updating Firefox colour scheme..."
# update firefox colour scheme
pywalfox update

get_xrdb_colour() {
    xrdb -query | grep -m 1 $1 | awk '{print $2}'
}

get_kitty_colour() {
    cat ~/.cache/wal/colors-kitty.conf | grep -m 1 $1 | awk '{print $2}'
}

echo "Updating zathura colour scheme..."

cat >"$HOME/.dotfiles/zathura/.config/zathura/zathurarc" <<-CONF
set recolor
set recolor-darkcolor "$(get_kitty_colour foreground)"
set recolor-lightcolor "$(get_kitty_colour color0)"
set default-bg "$(get_kitty_colour color0)"
map i recolor
set guioptions none
CONF

echo "Updating xmobar colour scheme..."

sed -i "/bgColor/c\        , bgColor =    \"$(get_xrdb_colour *.color0:)\"" $HOME/.dotfiles/xmobar/.config/xmobar/xmobarrc0
sed -i "/bgColor/c\        , bgColor =    \"$(get_xrdb_colour *.color0:)\"" $HOME/.dotfiles/xmobar/.config/xmobar/xmobarrc1
# sed -i "/fgColor/c\        , fgColor =    \"$(get_xrdb_colour foreground)\"" $HOME/.dotfiles/xmobar/.config/xmobar/xmobarrc
sed -i "/ppTitle/c\                          , ppTitle = xmobarColor \"$(get_xrdb_colour *.color6:)\" \"\" . shorten 30" $HOME/.dotfiles/xmonad/.xmonad/xmonad.hs
sed -i "/ppCurrentColorMarker1/c\                                xmobarColor \"$(get_xrdb_colour *.color6:)\" \"\" . -- ppCurrentColorMarker1" $HOME/.dotfiles/xmonad/.xmonad/xmonad.hs
sed -i "/ppCurrentColorMarker2/c\                                    \"<box type=Bottom width=2 mb=2 color=$(get_xrdb_colour *.color6:)>\" -- ppCurrentColorMarker2" $HOME/.dotfiles/xmonad/.xmonad/xmonad.hs

# Only to be uncommented if xmonad is in use
xmonad --restart

echo "Updating dunst colorscheme..."

sed -i "/NORMAL COLOUR/c\    background = \"$(get_xrdb_colour *.color1:)\" # NORMAL COLOUR" $HOME/.config/dunst/dunstrc && pkill -i dunst

echo "Updating tofi colorscheme..."

sed -i "/selection-color/c\selection-color = $(get_kitty_colour *.color8:)" $HOME/.config/tofi/config

echo "Updating cava colorscheme..."

cp -f ~/.cache/wal/colors-cava.cava ~/.config/cava/config

echo "Updating spicetify colorscheme..."

mkdir -p ~/.config/spicetify/Themes/Pywal
cp ~/.cache/wal/colors-spicetify.ini ~/.config/spicetify/Themes/Pywal/color.ini
spicetify apply

echo "System colour scheme updated successfully."
