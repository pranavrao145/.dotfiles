setxkbmap -option ctrl:nocaps

/usr/bin/start_hyprland && echo "goodbye, now logging out" && exit 0 \
 || echo "$? start_hyprland failed" && tty | grep tty1 \
  && echo "refusing autologin without Hyprland on tty1" && exit 0 \
  || echo "not on tty1, letting in"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
