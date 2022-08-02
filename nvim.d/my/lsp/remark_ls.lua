-- Find more schemas here: https://www.schemastore.org/json/
local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  return
end

local opts = {
  settings = {
    bullet= '*', -- Use `*` for list item bullets (default)
    -- See <https://github.com/remarkjs/remark/tree/main/packages/remark-stringify> for more options.
  },
  plugins = {
    "remarkPresetLintConsistent", -- Check that markdown is consistent.
    "remarkPresetLintRecommended", -- Few recommended rules.
    -- Generate a table of contents in `## Contents`
  },
}

return opts
