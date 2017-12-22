#!/bin/bash

# This is my dotfile install script that sets up my environment
# according to my liking. Much of the code here was drawn from
# nicknisi/dotfiles

clientinstall=true
while getopts ":s" opt
do
  case $opt in
    s)
      clientinstall=false
  esac
done
if [ "$clientinstall" = true ]; then
  echo "Running client install"
else
  echo "Running server install"
fi

sudo echo -e "\033[1mInstalling dotfiles...\033[0m"


# Check to see if we are running on OS X
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\033[1mRunning OS X\033[0m"
    # Check to see if Homebrew is installed. Install otherwise
    if test ! $(which brew); then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    brew install wget
    brew install zsh
    brew install tree
    brew install git-flow
    brew install tmux
    brew install python-dev
    brew install python3-dev
    brew install build-essential
    brew install cmake
    brew install r-base
else
    echo -e "\033[1mRunning Linux\033[0m"
    sudo apt -y install software-properties-common
    # sudo add-apt-repository ppa:kelleyk/emacs
    # Add repo for latest R
    # sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    # sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
    sudo apt update
    sudo apt -y upgrade

    sudo apt -y install \
        wget \
        tree \
        screenfetch \
        git-flow \
        build-essential \
        cmake \
        acpi \
        libssl-dev \
        libcurl4-gnutls-dev \
        pandoc \
        pandoc-citeproc \
        lmodern \
        xzdec \
        texlive \
        texlive-latex-extra \
        xauth \
        libopenblas-dev \
        pkg-config
    if [ "$clientinstall" = true ]; then
      sudo apt -y install \
        tmux \
        zsh
    fi
fi


# Build latest vim
# if ! hash vim 2>/dev/null; then
#     echo -e "\033[1mBuilding the latest Vim...\033[0m"
#     git clone https://github.com/vim/vim ~/viminstaller
#     cd ~/viminstaller/src
#     ./configure --enable-pythoninterp
#     make
#     sudo make install
#     # Create vim directory for swap files
#     mkdir -p ~/.vim-tmp
# fi

# echo -e "\033[1mBuilding the latest Vim...\033[0m"
# git clone https://github.com/vim/vim ~/viminstaller
# cd ~/viminstaller/src
# ./configure --enable-pythoninterp
# make
# sudo make install
# Create vim directory for swap files
# mkdir -p ~/.vim-tmp

# # Installing pip
# if ! hash pip 2>/dev/null; then
#     echo -e "\033[1mInstalling pip...\033[0m"
#     wget https://bootstrap.pypa.io/get-pip.py
#     sudo python get-pip.py
#     rm get-pip.py
#     sudo -H pip install virtualenv
#     sudo -H pip install --no-deps virtualenvwrapper
#     sudo -H pip install --no-deps stevedore
# fi

# Install Jupyter
# sudo -H pip install jupyter
# jupyter notebook --generate-config


# Install Vundle
# cd ~
# if [ -e './dotfiles/vim/bundle/Vundle.vim' ]; then
#     echo -e "\033[1mVundle already installed. Skipping\033[0m"
# else
#     echo -e "\033[1mInstalling Vundle...\033[0m"
#     git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/vim/bundle/Vundle.vim
# fi


# Change default shell to zsh
# chsh -s $(which zsh)

# Install Oh My Zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# rm ~/.zshrc.pre-oh-my-zsh
# ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc

if [ "$clientinstall" = true ]; then
  # Manual Install of Oh-My-Zsh
  cd ~
  if [ -d '.oh-my-zsh' ]; then
      echo -e "\033[1mOh-My-Zsh already installed. Skipping\033[0m"
  else
      echo -e "\033[1mInstalling Oh-My-Zsh...\033[0m"
      git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi


  # # Install Atom
  # cd ~
  # echo -e "\033[1mInstalling Atom\033[0m"
  # wget https://atom.io/download/deb -O atom.deb
  # sudo apt -fy install ./atom.deb
  # mkdir .atom
  # rm atom.deb
  # rm .atom/config.cson
fi

# Spacemacs setup
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Run R install script
echo -e "\033[1mSetting up R environment...\033[0m"
sudo Rscript ~/dotfiles/R/install.R

# Post install Docker setup
# sudo usermod -aG docker $USER
# sudo systemctl enable docker

# Docker DataScience Notebook
# sudo docker pull jupyter/datascience-notebook
# sudo docker pull jupyter/tensorflow-notebook


# Symlinks
echo -e "\033[1mCreating symlinks.and setting permissions..\033[0m"
# rm ~/.vimrc
# rm ~/.zshrc
# rm ~/.emacs
cd ~
if [ ! -d './.old-dotfiles' ]; then
    mkdir ~/.old-dotfiles/
fi

# if [ -e '.vimrc' ]; then
#     mv ~/.vimrc ~/.old-dotfiles
# fi

if [ -e '.zshrc' ]; then
    mv ~/.zshrc ~/.old-dotfiles
fi

# if [ -e '.emacs' ]; then
#     mv ~/.emacs ~/.old-dotfiles
# fi
# if [ -e '.atom' ]; then
#     mv ~/.atom ~/.old-dotfiles
# fi
# ln -s ~/dotfiles/emacs/emacs.symlink ~/.emacs

# ln -s ~/dotfiles/spacemacs/spacemacs.symlink ~/.spacemacs
# ln -s ~/dotfiles/vim/vimrc.symlink ~/.vimrc
ln -s ~/dotfiles/R/Rprofile.symlink ~/.Rprofile
# ln -s ~/dotfiles/mutt/muttrc.symlink ~/.muttrc
sudo chmod a+w /usr/local/lib/R/site-library
if [ "$clientinstall" = true ]; then
  ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc
  ln -s ~/dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf
  ln -s ~/dotfiles/zsh/toothed.zsh-theme ~/.oh-my-zsh/themes/toothed.zsh-theme
  ln -s ~/dotfiles/zsh/not-amused.zsh-theme ~/.oh-my-zsh/themes/not-amused.zsh-theme
#   ln -s ~/dotfiles/atom/config.cson ~/.atom/config.cson
#   ln -s ~/dotfiles/atom/keymap.cson ~/.atom/keymap.cson
fi


# Setting git defaults
echo -e "\033[1mSetting up sane git defaults...\033[0m"
git config --global user.email "francis.adrian.tan@gmail.com"
git config --global user.name "Francis Tan"
git config --global push.default simple
# git config --global core.editor "vim"
# git config --global diff.tool vimdiff
# git config --global merge.tool vimdiff
git config --global difftool.prompt false
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=14400' # 4 hour timeout


# Remove the vim directory after building
# cd ~
# if [ -d 'viminstaller' ]; then
#     rm -rf ~/viminstaller
# fi
# cd ~

# Install Data Science Stack using Conda
cd ~
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo chmod a+x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
rm Miniconda3-latest-Linux-x86_64.sh

if [ "$clientinstall" = true ]; then
  # Install atom packages from list
  # cd ~
  # apm install --packages-file ~/dotfiles/atom/package.list


  # Set zsh as default
  if [ $SHELL == '/usr/bin/zsh' ]; then
      echo -e "\033[1mZSH is already the default shell. Skipping\033[0m"
  else
      echo -e "\033[1mSetting ZSH as default shell...\033[0m"
      chsh -s $(which zsh)
  fi
fi

exit 0
