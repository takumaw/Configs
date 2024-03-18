#!/bin/bash
#
# Configs initializer
#
# See also: https://dotfiles.github.io/tutorials/
#

# Save the repository path
REPO_DIR=${PWD#"$HOME"/}

# Move to the home directory
cd ${HOME}

# Create symlinks
ln -s ${REPO_DIR}/Editor/.screenrc
ln -s ${REPO_DIR}/Editor/.vimrc

ln -s ${REPO_DIR}/Git/.gitconfig
ln -s ${REPO_DIR}/Git/.gitignore_global

ln -s ${REPO_DIR}/Shell/.zshrc

ln -s ${REPO_DIR}/SSH .ssh
chmod 600 .ssh/*
