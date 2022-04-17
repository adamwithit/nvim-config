#!/usr/bin/env bash
# Prerequisite
# neovim 6.1+
#   download nvim.appimage from https://github.com/neovim/neovim/releases/tag/v0.6.1
#   sudo mv nvim.appimage /usr/local/bin/nvim
#   sudo chmod +x /usr/local/bin/nvim
# python2 with pynvim (for auto-install lua packages within nvim)
#   python3 -m pip install --user --upgrade pynvim
#   sudo apt-get install python
# ripgrep for live fuzzy searching
#   sudo apt-get install ripgrep
# nodejs 16 & eslint
#   sudo apt update
#   curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
#   sudo apt install -y nodejs
#   sudo npm install -g eslint

if nvim --version | head -n1 | grep -vq 0.7; then
  echo "expected nvim 0.7, aborting..."
  exit 1
fi

if pip3 list | grep pynvim | grep -vq pynvim; then
  echo "expected pynvim, aborting..."
  exit 1
fi

if tmux -V | grep -vq 3.2; then
  echo "expected tmux 3.2, aborting..."
  exit 1
fi

if ! which rg > /dev/null; then
  echo "rg not found, aborting..."
  exit 1
fi

if ! which fdfind > /dev/null; then
  echo "fdfind not found, aborting..."
  exit 1
fi

if ! which fzf > /dev/null; then
  echo "fzf not found, aborting..."
  exit 1
fi

rm -rf \
  ~/.config/nvim/init.lua \
  ~/.config/nvim/lua \
  ~/.config/nvim/UltiSnips \
  ~/.tmux.conf \
  ~/.config/kitty/kitty.conf

python3 -m pip install --user --upgrade pynvim
if  [[ "$OSTYPE" == "darwin"* ]]; then
  brew install the_silver_searcher prettier black stylua wget rigrep packer luarocks flake8 nodejs eslint python2
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
        #Mac OSX
else
  sudo apt-get install silversearcher-ag prettier black stylua
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fi

ln -s `pwd`/vimrc.lua ~/.config/nvim/init.lua
ln -s `pwd`/nvim.d ~/.config/nvim/lua
ln -s `pwd`/UltiSnips ~/.config/nvim/UltiSnips
ln -s `pwd`/tmux.conf ~/.tmux.conf
[ -d ~/.config/kitty ] && ln -s `pwd`/kitty.conf ~/.config/kitty/kitty.conf

echo "Symlinks done"

if ! which open-project 1>/dev/null 2>&1; then
  sourceLine="export PATH=\"\$PATH:`pwd`/bin\""
  [ -f ~/.bashrc ] && echo $sourceLine >> ~/.bashrc
  [ -f ~/.zshrc ] && echo $sourceLine >> ~/.zshrc
  echo "RC files Done"
fi

tmux source-file ~/.tmux.conf
echo "Reload tmux done"
