export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export WORKON_HOME=/home/vitto/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.5
source /usr/local/bin/virtualenvwrapper.sh

# Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gocode
export PATH=$PATH:$HOME/gocode/bin
