fastfetch

set -x JAVA_HOME /usr/lib/jvm/java-11-openjdk
set -x PATH $JAVA_HOME/bin $PATH


source ~/.local/share/icons-in-terminal/icons.fish
source ~/.config/fish/user_variables.fish
source ~/.config/fish/abbreviations.fish

set -g fish_prompt_symbols nerd_fonts
set -x ANDROID_HOME /opt/android-sdk
set -x PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/cmdline-tools/latest/bin $PATH

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_CTYPE ja_JP.UTF-8


alias c="clear"
alias zi="unzip $argv"
alias n="nvim"
alias h="cd $home"
alias fa="clear && fastfetch"
alias far="clear && fastfetch --logo ~/.config/fastfetch/pngs/anhar.png"
alias fad="clear && fastfetch --logo ~/.config/fastfetch/pngs/deana.png"

alias "ngepul-dulu"="gco main && gpl && gco - && grb main"

function boiler
    git init && ga . && gnit && git branch -M main && git remote add origin $argv && git push -u origin main
end

function gfeat
    git commit -m "✨ feat: $argv"
end

function gfix
    git commit -m "🐛 fix: $argv"
end

function gref
    git commit -m "♻️ refactor: $argv"
end

function gnit
    git commit -m "🚀 initial project"
end

function cok
    code $argv
end

function ga
    git add $argv
end

function gc
    git clone $argv
end

function gcm
    git commit -m $argv
end

function gco
    git checkout $argv
end

function gp
    git push $argv
end

function gpoh
    git push origin HEAD $argv
end

function gpl
    git pull origin $argv
end

function grb
    git rebase $argv
end

if not set -q DISPLAY
    if test (tty) = /dev/tty1
        exec Hyprland
    end
end
