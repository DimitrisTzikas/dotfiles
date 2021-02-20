# Exports
export LANG="en_US.UTF-8"
export ZSH=~/.config/zsh/oh-my-zsh
export TERM=xterm-256color

# Sources
source $ZSH/../p10k.zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Plugins
plugins=(
    git
    emoji
)

# Files
HISTFILE=~/.cache/zsh/history

# History
HISTSIZE=100000
SAVEHIST=100000

# Aliases
# -- Actions
alias start='
    sudo systemctl start dnscrypt-proxy.service &&
    sudo chattr -i /etc/resolv.conf &&
    sudo cp /etc/resolv.conf.encrypt /etc/resolv.conf &&
    sudo chattr +i /etc/resolv.conf &&
    sudo firewall onLD &&
    startx
'
alias study='pkill Discord; pkill telegram-deskto'
alias ls='lsd'
alias help='function help(){curl cheat.sh/$1}; help'
alias e='emacsclient -c -t'
alias keyboard='bluetoothctl power on && bluetoothctl connect 1C:FC:83:10:04:5B'
alias clock='tty-clock -scnC7'
alias antivirus='function antivirus(){sudo clamscan $@}; antivirus'
alias antivirusall='function antivirusall(){sudo clamscan --recursive --infected $1}; antivirusall'
alias antivirusupdate='sudo freshclam'
alias songy='function songy(){spotdl --song $1 -o m4a}; songy'
alias songs='function songs(){for line in `cat $1`; do spotdl --song $line -o m4a; done}; songs'
alias songl='function songl(){spotdl --playlist $1}; songl'
alias songa='function songa(){spotdl --album $1}; songa'
alias song='function song(){ytmdl --format m4a --nolocal -m $1}; song'
alias alert='mplayer ~/.sounds/alertBeep.mp3'
alias t='tmux'
alias tm='tmux attach-session -t0'
alias space='duf'
# -- Programs
alias encrypt='function encrypt(){gpg --pinentry-mode=loopback --symmetric --hidden-recipient --encrypt $1}; encrypt'
alias decrypt='function decrypt(){gpg --pinentry-mode=loopback --decrypt $1}; decrypt'
alias pomodoro='pydoro'
alias texpackage='function texpackage(){tllocalmgr install $1 && sudo texhash}; texpackage'
alias tohtml='function tohtml(){jupyter nbconvert --to html $1}; tohtml'
# -- Change Directory
alias ieee='cd ~/Documents/University/IEEE'
alias ihu='cd ~/Documents/University/Courses/Running'
alias ihur='cd ~/Documents/University/Courses/Running && ranger'
alias jp='cd ~/Documents/Books/Japanese/Genki'
alias jpr='cd ~/Documents/Books/Japanese/Genki && ranger'
# -- Redshift Actions
alias warm='redshift -O 3500'
alias norm='redshift -x'
# -- Updates
alias linkFiles='cd ~/.dotfiles/ && stow ThinkpadX200s && cd -'
# -- System Actions
alias update='sudo pacman -Syu && sudo flatpak update && pacaur -Syu'
alias ss='sudo systemctl'
# -- Youtube
alias dv='youtube-dl --add-metadata -ic' # Download video link

