#!/bin/bash

# This is my dotfile install script that sets up my environment
# according to my liking. Much of the code here was drawn from
# nicknisi/dotfiles

PACKAGES = "zsh tree git-flow"

echo "Installing dotfiles"

# Check to see if we are running on OS X
if [ "$(uname)" == "Darwin" ]; then
	echo "Running on OS X"
	
	# Check to see if Homebrew is installed. Install otherwise
	if test ! $(which brew); then
		echo "Installing Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"	
		echo "Homebrew successfully installed!"
	fi

	echo "Installing packages"
	brew install $PACKAGES
else
	# sudo apt-get -y install zsh emacs24 tree multitail git-flow
	sudo apt-get -y install $PACKAGES
	# rm ~/.zshrc
	# ln -s ~/.environment_settings/.emacs ~/.emacs
	# sudo chsh -s $(which zsh)
fi

echo "Installing pip for Python"
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
rm get-pip.py
sudo pip install virtualenv
sudo pip install virtualenvwrapper

echo "Installing oh-my-zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Creating vim directories"
mkdir -p ~/.vim-tmp

echo "Creating symbolic links"
rm ~/.zshrc
rm ~/.emacs
ln -s ~/dotfiles/zsh/toothed.zsh-theme ~/.oh-my-zsh/themes/toothed.zsh-theme
ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -s ~/dotfiles/emacs/emacs.symlink ~/.emacs

echo "Configuring zsh to be the default shell"
chsh -s $(which zsh)
