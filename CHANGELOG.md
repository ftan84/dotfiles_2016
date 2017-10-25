# Changelog

This project somewhat follows the [Semantic Version](http://semver.org)
system with one difference -- minor adjustments to formatting, user interface,
plugins, etc are onsidered patch upgrades.

## 1.8.1 (2017-10-23)
- Added a command line flag for server or client install.

## 1.8.0 (2017-09-23)
- Using Atom as main editor of choice.

## 1.7.0 (2016-08-30)
- Added *Usage* and *Appendix* sections in readme.

## 1.6.0 (2016-05-15)
- Added support for mutt.

## 1.5.3 (2016-04-24)
- Removed the conditional that checks if vim is previously installed. Installer
script will now install vim every time.
- Update and upgrade now uses apt instead of apt-get.

## 1.5.2 (2016-04-13)
- Refactored some code in main and R install scripts. Can just run the scripts
if there are updates.

## 1.5.1 (2016-04-11)
- Fixed permission issues for the R plugin, Nvim-r, to work properly
- Updated README. Current vim set up no longer uses the YouCompleteMe plugin.

## 1.5.0 (2016-04-09)
- Major update -- added support for R.
- Install script now builds latest version of Vim.
- Added plugin for R integration in Vim.
- Add an R install script to set up the R environment which installs devtools
and colorout.
- Added .Rprofile to run initiallization every time R starts.

## 1.4.2 (2016-04-02)
- Added my git defaults to install script.

## 1.4.1 (2016-03-21)
- Added hostname to bottom right of tmux status line.
- Removed time left from tmux battery indicator section when in linux
environments.
