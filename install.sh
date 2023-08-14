#!/bin/sh
#
# Configs initializer
#
# See also: https://dotfiles.github.io/tutorials/
#

# Move to the home directory
cd $HOME

# Create symlinks
ln -s Configs/Editor/.screenrc
ln -s Configs/Editor/.vimrc

ln -s Configs/Git/.gitconfig
ln -s Configs/Git/.gitignore_global

ln -s Configs/Shell/.zshrc

ln -s Configs/SSH .ssh
chmod 600 .ssh/*
