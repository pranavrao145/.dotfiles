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
useradd -m -G wheel cypher # add cypher user

echo "Please enter a password for the user cypher."
passwd cypher # set password for cypher
 
echo "User cypher set up successfully."

cp ./sudo/sudoers /etc/sudoers # copy sudoers file
cp ./doas/doas.conf /etc/doas.conf # copy doas configuration file

##### CLONING DOTFILES #####

# Clone dotfiles (again) but this time to home directory

sudo -u cypher -s << 'EOF'
    cd
    git clone https://github.com/pranavrao145/dotfiles.git ~/.dotfiles
EOF

##### FOREIGN PACKAGES #####

echo "Installing paru package manager."

# install aura package manager
sudo -u cypher -s << 'EOF'
    cd
    git clone https://aur.archlinux.org/paru-bin.git
EOF

echo "Exiting to shell for manual installation of paru and all AUR packages. Install paru by changing into the cloned /home/cypher/paru-bin directory and running makepkg -si. Then change into the /home/cypher/.dotfiles directory and run:" 
echo
echo "paru -Syyu --needed --noconfirm \$(cat ./package-lists/foreignpkglist.txt)"

exit

# NOTE: The script exits here so that the paru and all other AUR packages can be installed manually. AUR package building sometimes fails when makepkg is run automatically, and that leaves the system and the script in an odd state.

##### SHELL SETUP #####

echo "Setting up shell..."

# set up zsh by installing oh-my-zsh. Then symlink zsh config file.
sudo -u cypher -s << 'EOF'
    cd
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    cd .dotfiles
    rm ~/.zshrc
    stow zsh
    chsh -s /usr/bin/zsh
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
    stow scripts
    sudo ln -s /home/cypher/Scripts/system/update_color_scheme.sh /usr/bin/update-color-scheme
    sudo ln -s /home/cypher/.config/i3lock/lock.sh /usr/bin/lock
    sudo ln -s /home/cypher/Scripts/spotify/restart_spotify /usr/bin/restart_spotify
    pip install pywalfox
EOF

echo "Window manager (i3) setup successfully. Don't forget to run wal and update-color-scheme when logged into XSession."

##### TERMINAL EMULATOR #####

echo "Setting up terminal emulator..."

# set up kitty and symlink its config file

sudo -u cypher -s << 'EOF'
    mkdir -p ~/.config/kitty
    cd /home/cypher/.dotfiles
    stow kitty
EOF

echo "Terminal emulator set up successfully."

##### SYSTEM CONFIG #####

# set up system services, including pacman, lightdm, 

echo "Setting up pacman..."

# set up pacman hooks and copy config
sudo -u cypher -s << 'EOF'
    sudo mkdir -p /etc/pacman.d/hooks
    cd /home/cypher/.dotfiles
    sudo cp ./pacman/hooks/* /etc/pacman.d/hooks/
    sudo cp ./pacman/pacman.conf /etc/pacman.conf
    sudo cp ./paru/paru.conf /etc/paru.conf
EOF

echo "Pacman hooks setup successfully."

echo "Setting up pacman scripts..."

# set up pacman scripts
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    sudo ln -s /home/cypher/Scripts/system/update.sh /usr/bin/update
EOF

echo "Pacman scripts setup successfully."

echo "Setting up lightdm..."

# set up lightdm
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    sudo cp ./lightdm/lightdm/* /etc/lightdm/
    sudo systemctl enable lightdm
EOF

echo "Lightdm setup successfully."

echo "Setting up touchpad support..."

# set up lightdm and devices
sudo -u cypher -s << 'EOF'
    sudo mkdir -p /etc/X11/xorg.conf.d
    cd /home/cypher/.dotfiles
    sudo cp ./touchpad/90-touchpad.conf /etc/X11/xorg.conf.d
    sudo wget -O /usr/bin/mapwacom https://gist.githubusercontent.com/tom-galvin/6c19fe907945d735c045/raw/f16fa41cac87815bdd2f7da6da302fb272c7db70/mapwacom
    sudo chmod +x /usr/bin/mapwacom
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
    mkdir -p ~/.local/opt
    cd ~/.local/opt
    wget -O codelldb.zip https://github.com/vadimcn/vscode-lldb/releases/latest/download/codelldb-x86_64-linux.vsix && unzip codelldb.zip "extension/*" && mv extension codelldb
    git clone https://github.com/microsoft/java-debug.git && cd java-debug && chmod +x mvnw && sed -i '/ExecutionEnvironment/d' com.microsoft.java.debug.plugin/META-INF/MANIFEST.MF && ./mvnw clean install && cd ..
    curl https://raw.githubusercontent.com/eruizc-dev/jdtls-launcher/master/install.sh | bash
    cd ~/.local/opt
    git clone https://github.com/microsoft/vscode-java-test.git
    mkdir -p omnisharp
    wget https://github.com/OmniSharp/omnisharp-roslyn/releases/latest/download/omnisharp-linux-x86.zip && unzip -d omnisharp omnisharp-linux-x86.zip && chmod +x ./omnisharp/run
    cd ~/.local/opt
    rm -rf codelldb.zip omnisharp-linux-x86.zip
EOF

echo "Setting up tmux..."

# setup tmux
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    mkdir -p ~/.config/tmux
    stow tmux
    sudo ln -s /home/cypher/Scripts/tmux/tmux-cht.sh /usr/bin/tmux-cht
    sudo ln -s /home/cypher/Scripts/tmux/tmux-sessionizer /usr/bin/tmux-sessionizer
    sudo ln -s /home/cypher/Scripts/tmux/tmux-windowizer /usr/bin/tmux-windowizer
EOF
 
echo "Tmux set up successfully."

echo "Setting up git scripts..."

# setup git scripts
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    sudo ln -s /home/cypher/Scripts/git/switch-worktree /usr/bin/switch-worktree
EOF
 
echo "Git scripts set up successfully."

echo "Development workflow set up successfully."

##### MISCELLANEOUS CONFIG #####
echo "Setting up miscellaneous services..."

echo "Setting up profile... "

# setup profile
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    stow profile
EOF

echo "Profile set up successfully."

echo "Setting up other services... "

# setup profile
sudo -u cypher -s << 'EOF'
    cd /home/cypher/.dotfiles
    stow gh-dash
EOF

echo "Other services set up successfully."

echo "System setup completed successfully. Rebooting in 15 seconds... (press Ctrl-C to cancel)"

# wait for 5 seconds to cancel if necessary
sleep 15

systemctl reboot
