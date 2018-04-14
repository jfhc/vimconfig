# Convenience function for cd & ls in one go

function cs () {
    cd "$@" && ls
}

# Like cs above but using z.sh: https://github.com/rupa/z
# Adds in a pwd so you can check z has put you where you expected it to!

. ~/.etc/z/z.sh

function zs () {
    z "$@" && pwd && ls
}

alias setclip='termux-clipboard-set'
alias getclip='termux-clipboard-get'

export ANDROID_DATA=/data ANDROID_ROOT=/system
