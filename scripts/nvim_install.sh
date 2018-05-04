# Installation
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install neovim
pip3 install neovim # Needed for some plugins that uses python

# Vim-plug install
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim

nvim -c PlugInstall
