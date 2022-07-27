export PATH=/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH

export ZSH="/Users/umed/.oh-my-zsh"

ZSH_THEME="agnoster"

fpath+=~/.zfunc


COMPLETION_WAITING_DOTS="true"


plugins=(git)

plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

 export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias cwu="cd ~/work/arcadia/taxi/uservices"

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
# bindkey -v

ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

cc() {
    clear
    tmux clear-history
}

test -n "$ALACRITTY_LOG" && printf "\e[?1042l"

alias nuter_psql="PGCONNECT_TIMEOUT=2 nuter psql"
PROMPT=${PROMPT/\%c/\%~}

alias vim="nvim"

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
