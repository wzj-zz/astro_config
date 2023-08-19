-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
local polish = function()
  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }

  local ui = require "astronvim.utils.ui"
  ui.toggle_ui_notifications(true)

  vim.api.nvim_create_autocmd("User", {
    desc = "Set number in Telescope",
    pattern = "TelescopePreviewerLoaded",
    command = "setlocal number",
  })
end

return polish
