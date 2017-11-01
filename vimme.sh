#! /bin/bash
set -e

cp ./.vimrc ~/.vimrc

vim -c PluginInstall
