#!/bin/bash
set -o errexit

if [ ! $(which brew) ]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update
brew upgrade || true
brew bundle install --file=- <<-EOF
brew "fish"
brew "vim"
brew "the_silver_searcher"
brew "tree"
brew "helix"
brew "zellij"
brew "fd"
EOF

brew install alacritty wezterm bat dust broot ripgrep tokei eva atuin lsd
brew install coursier/formulas/coursier
brew install Virtuslab/scala-cli/scala-cli

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

sudo dscl . -create /Users/$USER UserShell $(which fish)

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

VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d "$VUNDLE_DIR" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

vim +PluginInstall +qall

cs setup --apps sbt-launcher
