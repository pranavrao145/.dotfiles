# get colorscheme
(cat ~/.cache/wal/sequences &)

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/cypher/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.  # CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-nvm zsh-autosuggestions zsh-syntax-highlighting sudo web-search copypath copyfile copybuffer dirhistory)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# to work when "vi m." is typed
vi() {
    if [ "$1" = "m." ]; then
        nvim .
    else
        nvim
    fi
}

v() {
    if [ "$1" = "im." ]; then
        nvim .
    else
        nvim .
    fi
}


# to reset the origin remote should it stop working
reset-remote() {
    remote_url=$(git config --get remote.origin.url)
    git remote remove origin
    git remote add origin $remote_url
}

alias vim="nvim"
alias vmi="nvim"
alias ivm="nvim"
alias imv="nvim"
alias lvim="nvim"
alias im="nvim"
alias p="cd && cd Programming"
alias pr="cd && cd Programming"
alias prog="cd && cd Programming"
alias lr="ranger"
alias dnd="dunstctl set-paused"
alias dnds="dunstctl is-paused"
alias ef="cd ~/.dotfiles && nvim ."
alias fe="cd ~/.dotfiles && nvim ."
alias a="tmux a || tmux"
alias t="tmux a || tmux"
alias ta="tmux a || tmux"
alias at="tmux a || tmux"
alias cht="tmux-cht"
alias tk="tmux kill-server"
alias tks="tmux kill-server"
alias ts="tmux-sessionizer"
alias tw="tmux-windowizer"
alias gwi="git worktree add master"
alias giw="git worktree add master"
alias gw="source switch-worktree"
alias lg="lazygit"
alias f='fg'
alias ff='cd && cd "$(fd -H --type d | fzf)"'
alias spt="spotify_player"
alias spot="spotify_player"
alias src='exec zsh'
alias switch-worktree="source switch-worktree"
alias sa="eval \$(ssh-agent -s) && ssh-add ~/.ssh/id_rsa"
alias po="sudo poweroff"
alias re="sudo reboot"

export PATH=/home/cypher/.local/bin:$PATH
export PATH=/home/cypher/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:$(yarn global bin)

export EDITOR=nvim
export TERMINAL=/usr/bin/alacritty

# Fallback prompt
PROMPT="%{$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"

if [ -f /usr/share/fzf/key-bindings.zsh ]; then
    source /usr/share/fzf/key-bindings.zsh
fi

if [ -f /usr/share/fzf/completion.zsh ]; then
    source /usr/share/fzf/completion.zsh
fi

# set up nvm
# source /usr/share/nvm/init-nvm.sh
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# run startup script on startup

#!/bin/bash

if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland
fi


if [ "$(tty)" != "/dev/tty1" ];then
  ruby /home/cypher/Scripts/shell/startup.rb
  eval "$(starship init zsh)"
fi
