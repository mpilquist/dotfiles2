#!/bin/bash
set -o errexit

mkdir -p ~/.config/fish

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ln -s "$SCRIPTPATH"/.config/fish/config.fish ~/.config/fish/config.fish || true
mkdir -p ~/.config/fish/functions
ln -s "$SCRIPTPATH"/.config/fish/functions/* ~/.config/fish/functions/ || true
ln -s "$SCRIPTPATH"/.config/fish/fishfile ~/.config/fish/fishfile || true
ln -s "$SCRIPTPATH"/.config/helix/config.toml ~/.config/helix/config.toml || true
ln -s "$SCRIPTPATH"/.config/bat/config ~/.config/bat/config || true
ln -s "$SCRIPTPATH"/.config/atuin/config.toml ~/.config/atuin/config.toml || true
ln -sF "$SCRIPTPATH"/.config/alacritty ~/.config/ || true
ln -sF "$SCRIPTPATH"/.config/zellij ~/.config/ || true
mkdir -p ~/.ammonite/
ln -s "$SCRIPTPATH"/predef.sc ~/.ammonite/predef.sc || true
ln -s "$SCRIPTPATH"/.vimrc ~/.vimrc || true
ln -s "$SCRIPTPATH"/.wezterm.lua ~/.wezterm.lua || true

