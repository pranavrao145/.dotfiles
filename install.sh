#!/usr/bin/env bash

######################################
#                   _                #
#   ___ _   _ _ __ | |__   ___ _ __  #
#  / __| | | | '_ \| '_ \ / _ \ '__| #
# | (__| |_| | |_) | | | |  __/ |    #
#  \___|\__, | .__/|_| |_|\___|_|    #
#       |___/|_|                     #
#                                    #
######################################

# This is a script to recreate my system on any clean Arch Linux install. This
# script is to be run as root.

set -e # exit if there are any errors

if [ "$EUID" -ne 0 ]
  then echo "Sorry, this script must be run as root. Try again with root priveleges."
  exit
fi
 
##### BASE PACKAGES #####

echo "Installing native packages using pacman..."

pacman -Syyu --needed --noconfirm - < ./package-lists/pkglist.txt

##### USER SETUP #####

echo "Setting up user cypher..."
useradd -m cypher # add cypher user

echo "Please enter a password for the user cypher."
passwd cypher # set password for cypher
 
echo "User cypher set up successfully."

##### CLONING DOTFILES #####

# Clone dotfiles (again) but this time to home directory

sudo -u cypher -s << 'EOF'
    cd
    git clone https://github.com/pranavrao145/dotfiles.git ~/.dotfiles
EOF

##### FOREIGN PACKAGES #####

echo "Installing aura package manager."

# install aura package manager
sudo -u cypher -s << 'EOF'
    cd
    git clone https://aur.archlinux.org/aura.git
    cd aura
    makepkg -si
EOF

echo "Installing foreign packages using aura."

# install foreign packages using aura
sudo -u cypher -s << 'EOF'
    aura -Ayyu --needed --noconfirm - < ./package-lists/foreignpkglist.txt
EOF 

echo "Installation of all packages completed successfully."

##### SHELL SETUP #####

echo "Setting up shell..."

# set up zsh by installing oh-my-zsh. Then symlink zsh config file.
sudo -u cypher -s << 'EOF'
    cd
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    cd .dotfiles
    stow zsh
EOF

echo "Shell setup successfully."

##### WINDOW MANAGER #####

echo "Setting up window manager..."

# set up i3-gaps and symlink i3 config, polybar config, dunst, picom, i3lock, and rofi config.
# also stow scripts, wallpapers, and pictures

sudo -u cypher -s << 'EOF'
    mkdir -p ~/.config/i3
    mkdir -p ~/.config/polybar
    mkdir -p ~/.config/rofi
    mkdir -p ~/.config/dunst
    mkdir -p ~/.config/i3lock
    mkdir -p ~/.config/picom
    mkdir -p ~/Pictures
    cd /home/cypher/.dotfiles
    stow i3
    stow polybar
    stow rofi
    stow pictures
    stow wallpapers
    stow dunst
    stow picom
    stow i3lock
    ln -s /home/cypher/Scripts/system/update_color_scheme.sh /usr/bin/update-color-scheme
    ln -s /home/cypher/.config/i3lock/lock.sh /usr/bin/lock
EOF

echo "Window manager (i3) setup successfully. Don't forget to run wal and update-color-scheme when logged into XSession."

##### TERMINAL EMULATOR #####

echo "Setting up terminal emulator..."

# set up alacritty and symlink its config file

sudo -u cypher -s << 'EOF'
    mkdir -p ~/.config/alacritty
    cd /home/cypher/.dotfiles
    stow alacritty
EOF

echo "Terminal emulator set up successfully."

##### SYSTEM CONFIG #####

# set up system services, including pacman, lightdm, 

echo "Setting up pacman hooks..."

# set up pacman hooks
sudo -u cypher -s << 'EOF'
    mkdir -p /etc/pacman.d/hooks
    cd /home/cypher/.dotfiles
    cp ./pacman-hooks/hooks/* /etc/pacman.d/hooks
EOF

echo "Pacman hooks setup successfully."

echo "Setting up pacman scripts..."

# set up pacman scripts
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    ln -s /home/cypher/Scripts/system/update.sh /usr/bin/update
EOF

echo "Pacman scripts setup successfully."

echo "Setting up lightdm..."

# set up lightdm
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    cp ./lightdm/lightdm/* /etc/lightdm/
EOF

echo "Lightdm setup successfully."

echo "Setting up touchpad support..."

# set up lightdm
sudo -u cypher -s << 'EOF'
    mkdir -p /etc/X11/xorg.conf.d
    cd /home/cypher/.dotfiles
    cp ./touchpad/90-touchpad.conf /etc/X11/xorg.conf.d
EOF

echo "Touchpad support setup successfully."

##### DEV WORKFLOW #####

# set up dev workflow, which includes nvim, tmux, and any associated software.

echo "Setting up development workflow..."

echo "Setting up neovim..."

# set up neovim 
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    mkdir -p ~/.config/nvim
    stow nvim
    stow vimspector
    pip install neovim
    ln -s /home/cypher/.dotfiles/jdtls/launch-jdtls.sh /usr/bin/launch-jdtls
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
EOF

echo "Neovim set up successfully."

echo "Setting up tmux..."

# setup tmux
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    mkdir -p ~/.config/tmux
    stow tmux
    ln -s /home/cypher/Scripts/tmux/tmux-cht.sh /usr/bin/tmux-cht
    ln -s /home/cypher/Scripts/tmux/tmux-sessionizer /usr/bin/tmux-sessionizer
EOF
 
echo "Tmux set up successfully."

echo "Setting up git scripts..."

# setup git scripts
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    ln -s /home/cypher/Scripts/git/switch-worktree /usr/bin/switch-worktree
EOF
 
echo "Git scripts set up successfully."

echo "Development workflow set up successfully."

##### MISCELLANEOUS CONFIG #####
echo "Setting up miscellaneous services..."

echo "Setting up profile... "

# setup profile
sudo -u cypher -s << 'EOF'
    stow profile
EOF

echo "Profile set up successfully."

echo "System setup completed successfully. Rebooting in 5 seconds... (press Ctrl-C to cancel)"

# wait for 5 seconds to cancel if necessary
sleep 5

systemctl reboot
