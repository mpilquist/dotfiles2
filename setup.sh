#!/bin/bash
set -o errexit

if [ ! $(which brew) ]; then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade || true
brew install fish vim the_silver_searcher tree sbt scala

sudo dscl . -create /Users/$USER UserShell /usr/local/bin/fish

mkdir -p ~/.config/fish

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ln -s "$SCRIPTPATH"/.config/fish/config.fish ~/.config/fish/config.fish
mkdir ~/.config/fish/functions
ln -s "$SCRIPTPATH"/.config/fish/functions/* ~/.config/fish/functions/
ln -s "$SCRIPTPATH"/.config/fish/fishfile ~/.config/fish/fishfile
ln -s "$SCRIPTPATH"/.vimrc ~/.vimrc

VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d "$VUNDLE_DIR" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

vim +PluginInstall +qall
