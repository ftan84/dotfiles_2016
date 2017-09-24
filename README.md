# Dotfiles 1.8.0 (2017-09-23)
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

### [Fugitive (Git Vim module)](https://github.com/tpope/vim-fugitive)
| Command | Description |
| --- | --- |
| <kbd>Leader + git</kbd> | Bring up git status |
| <kbd>Ctrl + n</kbd>/<kbd>Ctrl + p</kbd> | Move to next/previous file in git status screen |
| <kbd>-</kbd> | Move file to staging |
| <kbd>cc</kbd> | Commit from git status screen |
| <kbd>Leader + push</kbd> | Push to origin |

### [Git Flow](http://danielkummer.github.io/git-flow-cheatsheet/)
#### Initialization
In project directory (git initialized):
```
git flow init
```

#### Features
| Command | Description |
| --- | --- |
| `git flow feature start FEATURE` | Start a new feature |
| `git flow feature publish FEATURE` | Publish feature |
| `git flow feature finish FEATURE` | Finish feature |

#### Releases
| Command | Description |
| --- | --- |
| `git flow feature start RELEASE` | Start a new release |
| `git flow feature publish RELEASE` | Publish release |
| `git flow feature finish RELEASE` | Finish release |

#### Hotfixes
| Command | Description |
| --- | --- |
| `git flow feature start HOTFIX` | Start a new hotfix |
| `git flow feature finish HOTFIX` | Finish hotfix |

### [Tmux](https://tmux.github.io)
The *leader* key for tmux is <kbd>Ctrl + A</kbd>. Use this before Tmux commands.

| Command | Description |
| --- | --- |
| <kbd>Leader + v</kbd> | Split screen |
| <kbd>Leader + N</kbd> | Open a new window (tab) |
| <kbd>Leader + h</kbd>/<kbd>Leader + l</kbd> | Toggle between windows (tabs) |
| <kbd>Leader + window #</kbd> | Switch directly to window |
| <kbd>Leader + t</kbd> | Show the time |

### [Nvim-R (R Vim module)](https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt)
| Command | Description |
| --- | --- |
| <kbd>\rf</kbd> | Start a new R session |
| <kbd>\d</kbd> | Send lines to R |
| <kbd>\rq</kbd> | Quit R session without saving |

## Appendix

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
