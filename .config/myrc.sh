# My RC
#
# Instead of adding my own shell config directly to ~/.bashrc, which gets mixed
# up with other config introduced by other installed software (e.g., nvm), I
# put them in this file to be simply sourced by .bashrc

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.pyenv/bin/
export PYENV_ROOT='~/.pyenv/'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias nv='~/Downloads/software/nvim.appimage'
# alias nv='nvim'
alias g='gopen'
alias ll='lsd -la'
alias l='lsd'
alias tree='lsd -a --tree --group-dirs=first -I "node_modules" -I ".git"'
alias m='make'

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

if [ -z "$TMUX" ]; then
    tmux attach || tmux
fi
