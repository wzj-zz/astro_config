return {
  "AckslD/nvim-neoclip.lua",
  event = { "User AstroFile", "InsertEnter" },
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  opts = {
    keys = {
      telescope = {
        i = {
          select = "<C-a>",
          paste = "<cr>",
          paste_behind = "<C-p>",
          replay = "<C-q>", -- replay a macro
          delete = "<C-d>", -- delete an entry
          edit = "<C-e>", -- edit an entry
          custom = {},
        },
        n = {
          select = "<C-a>",
          paste = { "p", "<cr>" },
          paste_behind = "P",
          replay = "q",
          delete = "d",
          edit = "e",
          custom = {},
        },
      },
    },
  },
  keys = {
    {
      "<M-;>",
      mode = { "n", "i", "t" },
      "<cmd>Telescope neoclip<cr>",
      desc = "Find Yanks (neoclip)",
    },
  },
  config = function(_, opts)
    require("neoclip").setup(opts)
    require("telescope").load_extension "neoclip"
  end,
}
