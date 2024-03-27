# My RC
#
# Instead of adding my own shell config directly to ~/.bashrc, which gets mixed
# up with other config introduced by other installed software (e.g., nvm), I
# put them in this file to be simply sourced by .bashrc

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias nv='~/Downloads/software/nvim.appimage'
alias g='gopen'
alias ll='lsd -la'
alias l='lsd'
alias tree='lsd --tree --group-dirs=first'
alias m='make'

if [ -z "$TMUX" ]; then
    tmux attach || tmux
fi
