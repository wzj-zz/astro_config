local user_utils = require "user.utils"

return {
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("harpoon"):setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "harpoon" },
        callback = function()
          local opts = { buffer = 0 }
          vim.keymap.set("n", "<M-f>", "0<cmd>normal gF<cr>", opts)
          vim.keymap.set("n", "<M-j>", "<cmd>normal j<cr>", opts)
          vim.keymap.set("n", "<M-k>", "<cmd>normal k<cr>", opts)
        end,
      })
    end,
    keys = {
      {
        "<S-M-m>",
        function()
          local item = {
            value = user_utils.get_buf_file_relpath() .. ":" .. user_utils.get_cursor()[1],
            { row = 1, col = 0 },
          }
          require("harpoon"):list():append(item)
        end,
        desc = "harpoon file append",
      },
      {
        "<M-m>",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      { "<C-M-m>", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1" },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2" },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3" },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4" },
      { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5" },
    },
  },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { harpoon = true } },
  },
}
