alias mkdir='mkdir -p -v'
alias ..='cd ..'

alias cmus='cmus --listen 0.0.0.0:3000'

# alias ls='ls --color=auto'
alias ls='exa -l --group-directories-first'
# alias ll='ls -la'
# alias l='ls'
alias pacman='pacman --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias blaze='bazel'
alias alacritty='env WAYLAND_DISPLAY= alacritty'

alias down="cd ~/Downloads"
alias i3config='vim ~/.config/i3/config'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias df='df -h' # human-readable sizes
alias rm='rm -i'

alias androidebug='adb logcat *:E BOBS:V'

alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'

alias spotify='spotify --force-device-scale-factor=1.5'
alias chrome="google-chrome-stable --force-device-scale-factor=1.8"

alias cm='QT_SCALE_FACTOR=1 streamlink -p mpv twitch.tv/creativemonkeyz $1'

# alias drive='gdfs -o allow_other -o big_writes /home/sergiu/.gdfs/creds /mnt/drive/'

alias drive='gdfs -o allow_other,default_permissions,default_perm_folder=770,default_perm_file_noneditable=440,default_perm_file_editable=660,big_writes /home/sergiu/.gdfs/creds /mnt/drive/'
