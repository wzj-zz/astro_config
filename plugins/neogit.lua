-- https://github.com/NeogitOrg/neogit

local utils = require "astronvim.utils"
local fold_signs = { utils.get_icon "FoldClosed", utils.get_icon "FoldOpened" }

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    },
    event = "User AstroGitFile",
    opts = function(_, opts)
      return utils.extend_tbl(opts, {
        disable_builtin_notifications = utils.is_available "nvim-notify",
        telescope_sorter = function()
          if utils.is_available "telescope-fzf-native.nvim" then
            return require("telescope").extensions.fzf.native_fzf_sorter()
          end
        end,
        integrations = { telescope = true, diffview = true },
        signs = { section = fold_signs, item = fold_signs },
      })
    end,
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
      { "<leader>go", ":Neogit cwd=", desc = "Open Neogit Override CWD" },
    },
  },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { neogit = true } },
  },
}
