# Exports
export LANG="en_US.UTF-8"
export ZSH=~/.config/zsh/oh-my-zsh
export TERM=xterm-256color

POWERLEVEL10K_PROMPT_ON_NEWLINE=true
POWERLEVEL10K_PROMPT_ADD_NEWLINE=true
POWERLEVEL10k_BATTERY_STAGES=false
POWERLEVEL10K_HOME_ICON=''
POWERLEVEL10K_HOME_SUB_ICON=''
POWERLEVEL10K_FOLDER_ICON=''
POWERLEVEL10K_USER_ICON=""
POWERLEVEL10K_ROOT_ICON=""
POWERLEVEL10K_TIME_FORMAT='%D{%T }'

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

# Sources
source $ZSH/../p10k.zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Aliases
# -- Actions
alias start='
rfkill unblock wifi &&
    sudo ip link set wlp0s26u1u6 up &&
    sudo wpa_supplicant -B -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlp0s26u1u6 &&
    sudo dhcpcd &&
    sudo systemctl start dnscrypt-proxy.service &&
    sudo chattr -i /etc/resolv.conf &&
    sudo cp /etc/resolv.conf.encrypt /etc/resolv.conf &&
    sudo chattr +i /etc/resolv.conf &&
    sudo firewall onL
'
alias new='termite & disown %termite'
alias ls='lsd'
alias help='function help(){curl cheat.sh/$1}; help'
alias edit='file=`find ~/.dotfiles/ThinkpadX200s -type f | grep -v emacs.d | fzf` && emacs $file & disown %emacs'
alias keyboard='bluetoothctl power on && bluetoothctl connect 1C:FC:83:10:04:5B'
alias clock='tty-clock -scnC7'
alias server='ssh -XY dimitris@192.168.123.100'
alias antivirus='function antivirus(){sudo clamscan $@}; antivirus'
alias antivirusall='function antivirusall(){sudo clamscan --recursive --infected $1}; antivirusall'
alias antivirusupdate='sudo freshclam'
alias song='function song(){spotdl --song $1 -o m4a}; song'
alias songs='function songs(){for line in `cat $1`; do spotdl --song $line -o m4a; done}; songs'
alias songl='function songl(){spotdl --playlist $1}; songl'
alias songa='function songa(){spotdl --album $1}; songa'
alias alert='mplayer ~/.sounds/alertBeep.mp3'
alias maudio='pacmd load-module module-remap-sink sink_name=mono master=alsa_output.pci-0000_00_1b.0.analog-stereo channels=2 channel_map=mono,mono'
# -- Programs
alias encrypt='function encrypt(){gpg --pinentry-mode=loopback --symmetric --hidden-recipient --encrypt $1}; encrypt'
alias decrypt='function decrypt(){gpg --pinentry-mode=loopback --decrypt $1}; decrypt'
alias javacfx='~/.java/JDK/jdk1.8.0_202/bin/javac'
alias javafx='~/.java/JDK/jdk1.8.0_202/bin/java'
alias pomodoro='pydoro'
alias emacs='emacs --no-window-system'
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
alias update='sudo pacman -Syu && sudo flatpak update'
alias ss='sudo systemctl'
# -- Youtube
alias dv='youtube-dl --add-metadata -ic' # Download video link
# -- JavaFx
alias javafx='~/.java/JDK/jdk1.8.0_202/bin/java'
alias javacfx='~/.java/JDK/jdk1.8.0_202/bin/javac'
alias jarfx='~/.java/JDK/jdk1.8.0_202/bin/jar'
