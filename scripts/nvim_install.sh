# Requirements pyenv
apt-get install -y \
	make build-essential libssl-dev zlib1g-dev libbz2-dev \
	libreadline-dev libsqlite3-dev wget curl llvm \
	libncurses5-dev libncursesw5-dev xz-utils tk-dev

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash


$HOME/.pyenv/bin/pyenv update

$HOME/.pyenv/bin/pyenv install 2.7.15
$HOME/.pyenv/bin/pyenv virtualenv 2.7.15 neovim2
$HOME/.pyenv/bin/pyenv local neovim2
pip2 install neovim
$HOME/.pyenv/bin/pyenv local system



$HOME/.pyenv/bin/pyenv install 3.6.5
$HOME/.pyenv/bin/pyenv virtualenv 3.6.5 neovim3
$HOME/.pyenv/bin/pyenv local neovim3
pip3 install neovim
$HOME/.pyenv/bin/pyenv local system

rm -f ./.python-version  # This file is created by pyenv local command.

# Installation
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
pip3 install neovim # Needed for some plugins that uses python

mkdir -p ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

nvim -c PlugClean -c PlugInstall -c qa
