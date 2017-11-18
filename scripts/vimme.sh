#! /bin/bash
set -e

cp ./.vimrc ~/.vimrc

vim -c PluginClean
vim -c PluginUpdate
vim -c PluginInstall
