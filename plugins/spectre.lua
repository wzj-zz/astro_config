local prefix = "<leader>s"
local maps = { n = {}, x = {} }

local icon = vim.g.icons_enabled and "󰛔 " or ""
maps.n[prefix] = { desc = icon .. "Search / Replace" }
maps.x[prefix] = { desc = icon .. "Search / Replace" }

require("astronvim.utils").set_mappings(maps)

return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { prefix .. "p", function() require("spectre").toggle() end, desc = "Toggle Spectre" },
      {
        prefix .. "w",
        function() require("spectre").open_visual { select_word = true } end,
        desc = "Spectre (current word)",
      },
      { prefix .. "f", function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
    },

    opts = function()
      return {
        mapping = {
          send_to_qf = { map = "<C-q>" },
          replace_cmd = { map = "<C-x>" },
          run_current_replace = { map = "<C-c>" },
          run_replace = { map = "<C-r>" },
          change_view_mode = { map = "<C-v>" },
          resume_last_search = { map = "<C-l>" },
        },
      }
    end,
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then opts.bottom = {} end
      table.insert(opts.bottom, { ft = "spectre_panel", title = "Search/Replace", size = { height = 0.4 } })
    end,
  },
}
