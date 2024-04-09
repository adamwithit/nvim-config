-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://github.com/nanotee/nvim-lua-guide
-- https://www.youtube.com/watch?v=OhnLevLpGB4&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ
-- https://github.com/LunarVim/Neovim-from-scratch

vim.cmd "source ~/.config/nvim/lua/autocmd.vim"
vim.cmd "source ~/.config/nvim/lua/tmux.vim"
require "my.option"
require "my.utilities"
require "my.colorscheme"
require "my.keymap"
require "my.plugin"
require "my.completion"
require "my.telescope"
require "my.lsp"
require "my.treesitter"
require "my.comment"
require "my.git"
require "my.explorer"
require "my.statusline"
require "my.tabline"
require "my.toggleterm"
require "my.whichkey"
