return {
  "arsham/indent-tools.nvim",
  event = "User AstroFile",
  dependencies = {
    "arsham/arshlib.nvim",
  },
  opts = {
    normal = {
      up = "[u",
      down = "]u",
      repeatable = false, -- requires nvim-treesitter-textobjects
    },
    textobj = false,
  },
  config = true,
  keys = { "]u", "[u" },
}
