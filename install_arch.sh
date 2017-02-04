#!/bin/bash

# This is my dotfile install script that sets up my environment
# according to my liking. Much of the code here was drawn from
# nicknisi/dotfiles


sudo echo -e "\033[1mInstalling dotfiles...\033[0m"


if type apt-get > /dev/null 2>&1; then
    echo -e "\033[1mRunning Apt-based Linux\033[0m"
    sudo apt install software-properties-common

    sudo add-apt-repository ppa:neovim-ppa/unstable

    sudo apt update
    sudo apt -y upgrade

    # sudo apt-get -y install wget
    # sudo apt-get -y install zsh
    # sudo apt-get -y install tree
    # sudo apt-get -y install git-flow
    # sudo apt-get -y install tmux
    # sudo apt-get -y install python-dev
    # sudo apt-get -y install python3-dev
    # sudo apt-get -y install build-essential
    # sudo apt-get -y install cmake
    # sudo apt-get -y install acpi
    # sudo apt-get -y install r-base
    # sudo apt-get -y install libssl-dev
    # sudo apt-get -y build-dep libcurl4-gnutls-dev
    # sudo apt-get -y install libcurl4-gnutls-dev
    # sudo apt-get -y build-dep vim
    # sudo apt-get -y install pandoc
    # sudo apt-get -y install texlive-full

    sudo apt-get -y build-dep \
        libcurl4-gnutls-dev \
        vim
    sudo apt -y install \
        wget \
        zsh \
        tree \
        git-flow \
        tmux \
        python-dev \
        python3-dev \
        python-pip \
        python3-pip \
        build-essential \
        cmake \
        acpi \
        r-base \
        libssl-dev \
        libcurl4-gnutls-dev \
        pandoc \
        pandoc-citeproc \
        texlive \
        neovim \
        ruby \
        ruby-dev \
        rubygems \
        nodejs \
        xauth

    # echo -e "\033[1mInstall Microsoft R Open\033[0m"
    # wget https://mran.microsoft.com/install/mro/3.3.1/microsoft-r-open-3.3.1.tar.gz
    # tar -xf microsoft-r-open-3.3.1.tar.gz
    # cd microsoft-r-open
    # sudo ./install.sh
    # cd ..
    # sudo rm -rf microsoft-r-open
    # sudo rm microsoft-r-open-3.3.1.tar.gz


elif type pacman > /dev/null 2>&1; then
    echo -e "\033[1mRunning Pacman...\033[0m"
    sudo pacman -Syu --noconfirm

    git clone https://aur.archlinux.org/package-query.git
    cd package-query
    makepkg -si --noconfirm
    cd ..
    rm -rf package-query

    git clone https://aur.archlinux.org/yaourt.git
    cd yaourt
    makepkg -si --noconfirm
    cd ..
    rm -rf yaourt

    # cd ~
    # mkdir .tmp
    # mkdir .tmp/yaourt
    # echo 'set TMPDIR=/home/vagrant/.tmp/yaourt' > ~/.yaourtrc

    sudo pacman -Sy --noconfirm --needed \
        base-devel \
        libcurl-gnutls \
        vim \
        wget \
        tree \
        tmux \
        cmake \
        acpi \
        python-pip \
        python2-pip \
        pandoc \
        pandoc-citeproc \
        texlive-core \
        numix-themes \
        chromium

    yaourt -Sy --noconfirm --needed \
        numix-icon-theme-git \
        numix-circle-icon-theme-git \
        xfce-theme-greybird \
        xfpanel-switch \
        powerline-fonts-git \

    # Yaourt could not install MS R Open, installing manually
    git clone https://aur.archlinux.org/microsoft-r-open.git
    cd microsoft-r-open
    makepkg -si --noconfirm
    cd ..
    rm -rf microsoft-r-open

    # Manual install for gitflow
    git clone https://aur.archlinux.org/gitflow-avh-git.git
    cd gitflow-avh-git
    makepkg -si --noconfirm
    cd ..
    rm -rf gitflow-avh-git

    echo -e "\033[1mFinished pacman install.\033[0m"
fi

# Getting powerline fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

# Build latest vim
# if ! type pacman > /dev/null 2>&1; then
#     if ! hash vim 2>/dev/null; then
#         echo -e "\033[1mBuilding the latest Vim...\033[0m"
#         git clone https://github.com/vim/vim ~/viminstaller
#         cd ~/viminstaller/src
#         ./configure --enable-pythoninterp
#         make
#         sudo make install
#         # Create vim directory for swap files
#         mkdir -p ~/.vim-tmp
#     fi
#     echo -e "\033[1mBuilding the latest Vim...\033[0m"
#     git clone https://github.com/vim/vim ~/viminstaller
#     cd ~/viminstaller/src
#     ./configure --enable-pythoninterp
#     make
#     sudo make install
#     # Create vim directory for swap files
#     mkdir -p ~/.vim-tmp
# fi


# Run R install script
# This doesn't really work on arch with MS R
echo -e "\033[1mSetting up R environment...\033[0m"
# sudo chmod o+w /usr/lib/microsoft-r/3.3/lib64/R/library
# sudo Rscript ~/dotfiles/R/install.R


# Installing pip
# if ! type pacman > /dev/null 2>&1; then
#     if ! hash pip 2>/dev/null; then
#         echo -e "\033[1mInstalling pip...\033[0m"
#         wget https://bootstrap.pypa.io/get-pip.py
#         sudo python get-pip.py
#         rm get-pip.py
#     fi
# fi

# if ! hash pip 2>/dev/null; then
#     echo -e "\033[1mInstalling pip...\033[0m"
#     wget https://bootstrap.pypa.io/get-pip.py
#     sudo python get-pip.py
#     rm get-pip.py
# fi
sudo pip install virtualenv
sudo pip install stevedore
sudo pip install virtualenvwrapper


# Install Vundle
cd ~
if [ -e './dotfiles/vim/bundle/Vundle.vim' ]; then
    echo -e "\033[1mVundle already installed. Skipping\033[0m"
else
    echo -e "\033[1mInstalling Vundle...\033[0m"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/vim/bundle/Vundle.vim
fi


# Change default shell to zsh
# chsh -s $(which zsh)

# Install Oh My Zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# rm ~/.zshrc.pre-oh-my-zsh
# ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc


# Manual Install of Oh-My-Zsh
cd ~
if [ -d '.oh-my-zsh' ]; then
    echo -e "\033[1mOh-My-Zsh already installed. Skipping\033[0m"
else
    echo -e "\033[1mInstalling Oh-My-Zsh...\033[0m"
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi


# Symlinks
echo -e "\033[1mCreating symlinks.and setting permissions..\033[0m"
# rm ~/.vimrc
# rm ~/.zshrc
# rm ~/.emacs
cd ~
if [ ! -d './.old-dotfiles' ]; then
    mkdir ~/.old-dotfiles/
fi
if [ -e '.vimrc' ]; then
    mv ~/.vimrc ~/.old-dotfiles
fi
if [ -e '.zshrc' ]; then
    mv ~/.zshrc ~/.old-dotfiles
fi
if [ -e '.emacs' ]; then
    mv ~/.emacs ~/.old-dotfiles
fi
if [ -e '.tmux.conf' ]; then
    mv ~/.tmux.conf ~/.old-dotfiles
fi
ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -s ~/dotfiles/emacs/emacs.symlink ~/.emacs
ln -s ~/dotfiles/vim/vimrc.symlink ~/.vimrc
ln -s ~/dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf
ln -s ~/dotfiles/zsh/toothed.zsh-theme ~/.oh-my-zsh/themes/toothed.zsh-theme
ln -s ~/dotfiles/zsh/not-amused.zsh-theme ~/.oh-my-zsh/themes/not-amused.zsh-theme
ln -s ~/dotfiles/R/Rprofile.symlink ~/.Rprofile
ln -s ~/dotfiles/mutt/muttrc.symlink ~/.muttrc
# Neovim symlink
mkdir ~/.config
mkdir ~/.config/nvim
ln -s ~/dotfiles/vim/vimrc.symlink ~/.config/nvim/init.vim
sudo chmod a+w /usr/local/lib/R/site-library


# Setting git defaults
echo -e "\033[1mSetting up sane git defaults...\033[0m"
git config --global user.email "francis.adrian.tan@gmail.com"
git config --global user.name "Francis Tan"
git config --global push.default simple
git config --global core.editor "vim"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=14400' # 4 hour timeout


# Remove the vim directory after building
if ! type pacman > /dev/null 2>&1; then
    cd ~
    if [ -d 'viminstaller' ]; then
        rm -rf ~/viminstaller
    fi
    cd ~
fi


# Set zsh as default
if [ $SHELL == '/usr/bin/zsh' ]; then
    echo -e "\033[1mZSH is already the default shell. Skipping\033[0m"
else
    echo -e "\033[1mSetting ZSH as default shell...\033[0m"
    chsh -s $(which zsh)
fi

exit 0
