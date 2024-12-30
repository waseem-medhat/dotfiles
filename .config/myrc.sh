# My RC
#
# Instead of adding my own shell config directly to ~/.bashrc, which gets mixed
# up with other config introduced by other installed software (e.g., nvm), I
# put them in this file to be simply sourced by .bashrc

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

export PYENV_ROOT='~/.pyenv/'
export FLYCTL_INSTALL="/home/waseem/.fly"

paths=(
    "/usr/local/go/bin"
    "~/go/bin"
    "~/.pyenv/bin/"
    "~/Downloads/software/emsdk"
    "~/Downloads/software/emsdk/upstream/emscripten"
    "$FLYCTL_INSTALL/bin"
)

for p in "${paths[@]}"; do
    export PATH="$PATH:$p"
done


PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias nv='~/Downloads/software/nvim.appimage'
alias nvim='nv'
alias g='gopen'
alias ll='lsd -la'
alias l='lsd'
alias tree='lsd -a --tree --group-dirs=first -I "node_modules" -I ".git"'
alias m='make'
alias lg='lazygit'
