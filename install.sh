#!/bin/bash

# This is my dotfile install script that sets up my environment
# according to my liking. Much of the code here was drawn from
# nicknisi/dotfiles

echo "Installing dotfiles"

# Check to see if we are running on OS X
if [ "$(uname)" == "Darwin" ]; then
	echo "Running on OS X"
	
	# Check to see if Homebrew is installed. Install otherwise
	if test ! $(which brew); then
		echo "Installing Homebrew..."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"	
	fi

sudo apt-get -y install zsh emacs24 tree multitail git-flow
rm ~/.zshrc
ln -s ~/.environment_settings/.emacs ~/.emacs
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
rm get-pip.py
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -s ~/.environment_settings/toothed.zsh-theme ~/.oh-my-zsh/themes/toothed.zsh-theme
ln -s ~/.environment_settings/multitailrc ~/.multitailrc
ln -s ~/.environment_settings/.zshrc ~/.zshrc
sudo chsh -s $(which zsh)
