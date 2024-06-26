local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
require('nvim-treesitter.install').prefer_git = true

-- now postresql is still under development
-- when ready, we can edit the below file to support embedded sql in javascript
-- vi ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/queries/ecma/injections.scm
configs.setup {
  prefer_git = true,
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "dart","vimdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },
  indent = { enable = true, disable = { "javascript" } },   -- turn off for js because it can't auto indent embedded sql
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
