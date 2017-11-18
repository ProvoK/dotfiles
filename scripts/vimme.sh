#! /bin/bash
set -e

# Backup vimrc
cp ~/.vimrc ~/.vimrc_backup_`date +%F`

# Copy new vimrc
cp ./.vimrc ~/.vimrc

# Vim update
vim -c PluginClean -c PluginUpdate -c PluginInstall -c qa
