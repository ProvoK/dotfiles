#!/bin/bash
set -euo pipefail

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

install_packages() {
	P_PACKAGES="xclip git httpie nodejs npm yarn firefox docker docker-compose neovim zsh discord unzip protobuf powerline-font"
	echo "Installing pacman packages: [${P_PACKAGES}]"
	sudo pacman -Sy $P_PACKAGES

	Y_PACKAGES="spaceship-prompt-git rancher-k3d-bin elm-bin franz-bin"
	echo "Installing yay packages: [${Y_PACKAGES}]"
	yay -S $Y_PACKAGES

	NPM_PACKAGES="bash-language-server @elm-tooling/elm-language-server"
	mkdir -p ~/.npm
	npm config set prefix ~/.npm
	echo "Installing npm (global) packages: [${NPM_PACKAGES}]"
	npm install -g ${NPM_PACKAGES}
}

install_ext() {
	echo "Installing Go v1.14.4"
	curl -L -o go.tar.gz https://golang.org/dl/go1.14.4.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go.tar.gz
	rm go.tar.gz

	echo "Installing Pyenv"
	curl https://pyenv.run | bash

	echo "Installing Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "Installing kubectl"
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod +x kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
}

neovim_post_install() {
	echo "Executing Neovim post-install hook"
	nvim +PlugInstall

	pyenv install 2.7.15
	pyenv install 3.7.7

	pyenv virtualenv 2.7.15 neovim2
	pyenv virtualenv 3.7.7 neovim3

	eval "$(pyenv init -)"

	pyenv shell neovim2
	pip install neovim

	pyenv shell neovim3
	pip install neovim

	pyenv shell system
}

go_post_install() {
	echo "Executing Golang post-install hook"
	gopls version 2>/dev/null || go get golang.org/x/tools/gopls@latest
}

docker_post_install() {
	echo "Executing Docker post-install hook"
	sudo groupadd -f docker
	sudo usermod -aG docker $USER

	sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
	sudo chmod g+rwx "$HOME/.docker" -R

	sudo systemctl enable docker
	sudo systemctl start docker
}

dotfiles() {
	current_name=$(git config --global user.name)
	read -p "Please insert global git username (${current_name}): " git_username
	git config --global --replace-all user.name "${git_username:-${current_name}}"
	current_email=$(git config --global user.email)
	read -p "Please insert global git email (${current_email}): " git_email
	git config --global --replace-all user.email "${git_email:-${current_email}}"
	git config --global pull.rebase false
	git config --global core.editor "nvim"

	if [[ -f "${HOME}/.ssh/id_rsa.pub" ]]; then
		echo "Found ssh key, skipping creation"
	else
		echo "Creating ssh key"
		mkdir -p ~/.ssh
		ssh-keygen -t rsa -b 4096 -C "vittorio.camisa@gmail.com" -f ~/.ssh/id_rsa
	fi

	xclip ~/.ssh/id_rsa.pub -selection clipboard
	echo "Copied ~/.ssh/id_rsa.pub to clipboard! Add it to github/gitlab"
	read -rsn1 -p "Press any key to continue"; echo

	echo "Preparing dotfiles"
	if [[ -d "${HOME}/dotfiles" ]]; then
		echo "Found dotfiles folder in home"
	else
		git clone "git@github.com:ProvoK/dotfiles.git" ${HOME}/dotfiles
	fi

	mkdir -p ~/.config/nvim
	ln -s -f ~/dotfiles/init.vim ~/.config/nvim/init.vim
	ln -s -f ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
	mv ~/.zshrc ~/.zshrc.backup
	ln -s -f ~/dotfiles/.zshrc ~/.zshrc
	chsh -s $(which zsh)
	ln -s -f ~/dotfiles/spaceship.zsh-theme ${ZSH}/themes/spaceship.zsh-theme
}

post_install() {
	go_post_install
	neovim_post_install
	docker_post_install
}

main()
{
	echo "Installer started"
	install_packages
	dotfiles
	install_ext
	post_install
}


main
