vim.g.vscode_style = "dark"
local colorscheme = "vscode"

-- vim.g.material_style = "darker"
-- local colorscheme = "material"

-- vim.g.substrata_variant = "brighter"
-- local colorscheme = "substrata"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd "hi tablinesel gui=none guifg=#ffffff guibg=#666666"
-- vim.cmd "hi tablinefill cterm=reverse gui=reverse guifg=#eeeeee guibg=#eeeeee"
-- vim.cmd "hi tabline cterm=none ctermfg=15 ctermbg=242 gui=none guifg=#ffffff guibg=#666666"
-- vim.cmd "hi tablinesel gui=none guifg=#ffffff guibg=#1e1e1e"

vim.g.cursorline_timeout = 800

local ok2, ibl = pcall(require, "ibl")
if not ok2 then
	return
end

ibl.setup {
  indent= {
    char = "│",
  },
  exclude= {
    filetypes= {
	    "help",
	    "startify",
	    "dashboard",
	    "packer",
	    "neogitstatus",
	    "NvimTree",
	    "Trouble",
    },
    buftypes= { "terminal", "nofile" },
  },
  scope = {
    enabled = true,
  },

}

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"


vim.g.scrollbar_excluded_filetypes = {'NvimTree'}
vim.g.scrollbar_right_offset = 0
vim.g.scrollbar_shape = {
  head ='🮇',
  body ='🮇',
  tail ='🮇',
}
vim.cmd [[
  augroup ScrollbarInit
    autocmd!
    autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained,TabEnter  * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost,QuitPre,TabLeave * silent! lua require('scrollbar').clear()
  augroup end
]]

local ok3, colorizer = pcall(require, "colorizer")
if ok3 then
  colorizer.setup {
    '*';
    scss = {
      css      = true;   -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = true;   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode     = 'background';
    };
  }
end
