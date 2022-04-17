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

# Please pay extra attention to nvim.d/my/keymap.lua, some builtin keymaps are cancelled on purpose.
# Please fork this repo, modify to fit your habit.

# Icons provided by Fonts (Nerd Fonts)
# access https://www.nerdfonts.com/font-downloads
# download and unzip the one you like (I use MPlus Nerd Font)
# mv 'M+ 1mn light Nerd Font Complete Mono.ttf' ~/.local/share/fonts
# fc-cache -fv
# fc-list :mono | awk -F: '{print $2}' | sort -u
# change gnome-terminal profile to use mplus (size = 17, make sure the font looks taller)
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
