# Dotfiles 1.6.0 (2016-05-15)
A set of environment setting dotfiles that are tuned to my personal preference.

These dotfiles are really for my personal use. Much of the code can be credited
to [nicknisi/dotfiles](https://github.com/nicknisi/dotfiles).

## Requirements
The install script should install everything needed for the environment to run properly.
The only setup you need to make is to install [Powerline Fonts](https://github.com/powerline/fonts) so that Vim
airline will render the glyphs properly.

If using R and your host machine is OS X, then you need to install
[XQuartz](http://www.xquartz.org) to render plots properly.

This install script has been tested on Ubuntu 15.10 and Mac OS X El Capitan.

## Installation
Change into the dotfiles directory and run the install.sh script.

```
cd ~/dotfiles
./install.sh
```

Once the install script finishes, run `vim +PluginInstall` to run the Vundle
Plugin Installer.

## Usage
### Git Flow
[Infographic Cheat Sheet](http://danielkummer.github.io/git-flow-cheatsheet/)

#### Initialization
In project directory (git initialized):
```
git flow init
```

#### Features
##### Start and publish a feature
```
git flow feature start MYFEATURE
git flow feature publish MYFEATURE
```

##### Finish a feature
```
git flow feature finish MYFEATURE
```

#### Releases
##### Start and publish a release
```
git flow release start RELEASE
git flow release publish RELEASE
```

##### Finish a release
```
git flow release finish RELEASE
```

#### Hotfixes
##### Start a hotfix
```
git flow hotfix start HOTFIX
```

##### Finish a hotfix
```
git flow hotfix finish HOTFIX
```

### YouCompleteMe Installation
My current Vim setup does not utilize the plugin, YouCompleteMe, but instead
uses Jedi + Supertab. However, in case you decide to use YCM instead, please
follow the instructions below.

The YouCompleteMe vim plugin requires compilation. Change into its bundle
directory (typically in ~/.vim/bundle) and run `./install.py`.

```
cd ~/.vim/bundle/YouCompleteMe
./install.py
```

## Credits

[nicknisi/dotfiles](https://github.com/nicknisi/dotfiles): Where my dotfiles drew inspiration from
