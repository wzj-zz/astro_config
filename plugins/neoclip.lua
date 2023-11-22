return {
  "AckslD/nvim-neoclip.lua",
  event = { "User AstroFile", "InsertEnter" },
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "kkharji/sqlite.lua" },
  },
  opts = {
    -- enable_persistent_history = true,
    content_spec_column = true,
    enable_macro_history = true,

    keys = {
      telescope = {
        i = {
          select = "<C-a>",
          paste = "<cr>",
          paste_behind = { "<C-p>", "<M-p>" },
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
      function() require("telescope").extensions.neoclip.default() end,
      desc = "Find Yanks (neoclip)",
    },
    {
      "<leader>fq",
      mode = { "n" },
      function() require("telescope").extensions.macroscope.default() end,
      desc = "Find Macros (neoclip)",
    },
  },
}
