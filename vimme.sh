#! /bin/bash
set -e

# Setup vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# pre-requisite for lusty-explorer
# debian
apt-get install vim-gnome

cp ./.vimrc ~/.vimrc

vim -c PluginInstall
