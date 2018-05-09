NVIM_PYTHON2=2.7.15
NVIM_PYTHON3=3.6.5

.PHONY: pyenv_requires
pyenv_requires:
	sudo apt-get install -y \
		make build-essential libssl-dev zlib1g-dev libbz2-dev \
		libreadline-dev libsqlite3-dev wget curl llvm \
		libncurses5-dev libncursesw5-dev xz-utils tk-dev

.PHONY: install _pyenv
install_pyenv: pyenv_requires
	curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
	echo 'eval "$(pyenv init -)"' >> ~/.zhsrc
	echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zhsrc
	@echo You may need to add ~/.pyenv/bin/ to your PATH!!!

.PHONY: nvim_requires
nvim_requires:
	add-apt-repository ppa:neovim-ppa/stable
	apt-get update

.PHONY: install_nvim
install_nvim:
	apt-get install neovim

.PHONY: install_pyenv_versions
install_pyenv_versions:
	-pyenv install ${NVIM_PYTHON2}
	-pyenv install ${NVIM_PYTHON3}

.PHONY: setup_nvim_python
setup_nvim_python: install_pyenv_versions
	pyenv virtualenv ${NVIM_PYTHON2} neovim2
	pyenv local neovim2
	pip2 install neovim
	pyenv local system


	pyenv virtualenv ${NVIM_PYTHON3} neovim3
	pyenv local neovim3
	pip3 install neovim
	pyenv local system

	rm -rf .python-version

.PHONY: refresh_nvim_conf
refresh_nvim_conf:
	mkdir -p ~/.config/nvim
	cp ./init.vim ~/.config/nvim/init.vim
	nvim -c PlugClean -c PlugInstall -c qa


