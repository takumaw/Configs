#!/bin/bash
#
# Configs initializer
#
# See also: https://dotfiles.github.io/tutorials/
#

set -eEu -o pipefail

# Save the repository path
REPO_DIR=${PWD#"$HOME"/}

# Move to the home directory
cd ${HOME}

symlink() {
    [[ -e "$2" || -L "$2" ]] || ln -s "$1" "$2"
}

# Create symlinks
symlink ${REPO_DIR}/Editor/.screenrc .screenrc
symlink ${REPO_DIR}/Editor/.vimrc .vimrc

symlink ${REPO_DIR}/Git/.gitconfig .gitconfig
symlink ${REPO_DIR}/Git/.gitignore_global .gitignore_global

symlink ${REPO_DIR}/Shell/.zshrc .zshrc

symlink ${REPO_DIR}/SSH .ssh
chmod 700 ${REPO_DIR}/SSH

mkdir -p .claude
symlink ${REPO_DIR}/Claude/CLAUDE.md .claude/CLAUDE.md
