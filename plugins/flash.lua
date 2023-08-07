-- https://github.com/folke/flash.nvim

return {
  {
    "folke/flash.nvim",

    event = "VeryLazy",
    vscode = true,

    dependencies = "nvim-telescope/telescope.nvim",

    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
      label = {
        before = true,
        after = false,
      },
    },

    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",

    optional = true,
    opts = function(_, opts)
      local function flash(prompt_bufnr)
        require("flash").jump {
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win) return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults" end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        }
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          n = { ["<c-s>"] = flash },
          i = { ["<c-s>"] = flash },
        },
      })
    end,
  },
}
