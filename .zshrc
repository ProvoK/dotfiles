export ZSH=$HOME/.oh-my-zsh
ZSH_DISABLE_COMPFIX=true

#ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"
#ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT=$(pyenv root)

# FZF functions
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

export KUBE_EDITOR=nvim
export PATH=$PATH:/usr/local/bin:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

source <(kubectl completion zsh)
alias kb=kubectl
alias dc=docker
alias dcc=docker-compose

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

PATH="$PATH:$GOPATH"
export GOPRIVATE="github.com/draios/shared-go"
