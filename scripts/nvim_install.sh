# Installation
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
pip3 install neovim # Needed for some plugins that uses python

mkdir -p ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

nvim -c PlugClean -c PlugInstall -c qa
