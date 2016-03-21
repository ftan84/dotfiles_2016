#!/bin/bash

# This is my dotfile install script that sets up my environment
# according to my liking. Much of the code here was drawn from
# nicknisi/dotfiles

sudo echo "Installing dotfiles..."

# Check to see if we are running on OS X
if [ "$(uname)" == "Darwin" ]; then
    # Check to see if Homebrew is installed. Install otherwise
    if test ! $(which brew); then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"	
    fi

    brew install wget
    brew install zsh
    brew install tree
    brew install git-flow
    brew install vim
    brew install tmux
    brew install python-dev
    brew install python3-dev
    brew install build-essential
    brew install cmake
else
    sudo apt-get -y install wget
    sudo apt-get -y install zsh
    sudo apt-get -y install tree
    sudo apt-get -y install git-flow
    sudo apt-get -y install vim
    sudo apt-get -y install tmux
    sudo apt-get -y install python-dev
    sudo apt-get -y install python3-dev
    sudo apt-get -y install build-essential
    sudo apt-get -y install cmake
    sudo apt-get -y install acpi
fi

# Installing pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
rm get-pip.py
sudo pip install virtualenv
sudo pip install --no-deps virtualenvwrapper
sudo pip install --no-deps stevedore

# Create vim directory for swap files
mkdir -p ~/.vim-tmp

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/vim/bundle/Vundle.vim


# Change default shell to zsh
# chsh -s $(which zsh)

# Install Oh My Zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# rm ~/.zshrc.pre-oh-my-zsh
# ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc

# Manual Install of Oh-My-Zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Symlinks
# rm ~/.vimrc
# rm ~/.zshrc
# rm ~/.emacs
mkdir ~/.old-dotfiles
mv ~/.vimrc ~/.old-dotfiles
mv ~/.zshrc ~/.old-dotfiles
mv ~/.emacs ~/.old-dotfiles
ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -s ~/dotfiles/emacs/emacs.symlink ~/.emacs
ln -s ~/dotfiles/vim/vimrc.symlink ~/.vimrc
ln -s ~/dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf
ln -s ~/dotfiles/zsh/toothed.zsh-theme ~/.oh-my-zsh/themes/toothed.zsh-theme
ln -s ~/dotfiles/zsh/not-amused.zsh-theme ~/.oh-my-zsh/themes/not-amused.zsh-theme

chsh -s $(which zsh)

exit 0
