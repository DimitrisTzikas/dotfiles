# Exports
export LANG="en_US.UTF-8"
export ZSH=/home/dimitris/.config/zsh/oh-my-zsh
pgrep tmux && export TERM="screen-256color"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9k_BATTERY_STAGES=false
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_USER_ICON=""
POWERLEVEL9K_ROOT_ICON=""
POWERLEVEL9K_TIME_FORMAT='%D{%T }'

# Plugins
plugins=(
git
)

# Files
HISTFILE=~/.cache/zsh/history

# History
HISTSIZE=100000
SAVEHIST=100000

# Sources
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Aliases
# -- Actions
alias new='termite & disown %termite'
alias wifi='sudo -A wifi-menu'
alias useResolv='sudo cp /etc/resolv.conf.example /etc/resolv.conf && sudo chattr +i /etc/resolv.conf'
alias dontUseResolv='sudo chattr -i /etc/resolv.conf && sudo rm /etc/resolv.conf && sudo resolvconf -u'
alias noHostsFiltering='sudo mv /etc/hosts /etc/hosts.dis && echo Enable hosts filtering again \<Enter\> && read && sudo mv /etc/hosts.dis /etc/hosts'
alias ls='lsd'
alias help='function help(){curl cheat.sh/$1}; help'
alias edit='file=`find ~/.dotfiles/ThinkpadX200s -type f | grep -v emacs.d | fzf` && emacs $file & disown %emacs'
alias keyboard='bluetoothctl power on && bluetoothctl connect 1C:FC:83:10:04:5B'
# -- Programs
alias vanilaemacs='rm ~/.emacs.d & ln -s ~/.dotfiles/ThinkpadX200s/.emacs.d.old ~/.emacs.d & ln -s ~/.dotfiles/ThinkpadX200s/.emacs ~/.emacs'
alias spacemacs='rm -r ~/.emacs ~/.emacs.d & ln -s ~/.dotfiles/ThinkpadX200s/.emacs.d ~/.emacs.d'
alias javacfx='~/.java/JDK/jdk1.8.0_202/bin/javac'
alias javafx='~/.java/JDK/jdk1.8.0_202/bin/java'
# -- Change Directory
alias ieee='cd ~/Documents/University/IEEE'
alias tei='cd ~/Documents/University/Courses/Running'
# -- Redshift Actions
alias warm='redshift -O 3500'
alias norm='redshift -x'
# -- Updates
alias linkFiles='cd ~/.dotfiles/ && stow ThinkpadX200s && cd -'
# -- System Actions
alias update='sudo pacman -Syu && sudo flatpak update'
alias ss='sudo systemctl'
# -- Youtube
alias dv='youtube-dl --add-metadata -ic' # Download video link
alias dm='function dm(){spotdl --song "$1" -o song.m4a}; dm'
