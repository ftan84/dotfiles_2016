# Dotfiles 1.3.0
A set of environment setting dotfiles that are tuned to my personal preference.

These dotfiles are really for my personal use. Much of the code can be credited
to [nicknisi/dotfiles](https://github.com/nicknisi/dotfiles).

## Requirements
The install script should install everything needed for the environment to run properly.
The only setup you need to make is to install [Powerline Fonts](https://github.com/powerline/fonts) so that Vim
airline will render the glyphs properly

## Installation
Change into the dotfiles directory and run the install.sh script.

```
cd ~/dotfiles
./install.sh
```

Once the install script finishes, run `vim +PluginInstall` to run the Vundle
Plugin Installer.

### YouCompleteMe Installation
The YouCompleteMe vim plugin requires compilation. Change into its bundle
directory (typically in ~/.vim/bundle) and run `./install.py`.

```
cd ~/.vim/bundle/YouCompleteMe
./install.py
```

## Credits

[nicknisi/dotfiles](https://github.com/nicknisi/dotfiles): Where my dotfiles drew inspiration from
