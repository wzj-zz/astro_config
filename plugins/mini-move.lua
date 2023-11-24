return {
  {
    "echasnovski/mini.move",
    keys = {
      { "<leader>ah", mode = "n", desc = "Move line left" },
      { "<leader>aj", mode = "n", desc = "Move line down" },
      { "<leader>ak", mode = "n", desc = "Move line up" },
      { "<leader>al", mode = "n", desc = "Move line right" },
      { "<leader>ah", mode = "v", desc = "Move selection left" },
      { "<leader>aj", mode = "v", desc = "Move selection down" },
      { "<leader>ak", mode = "v", desc = "Move selection up" },
      { "<leader>al", mode = "v", desc = "Move selection right" },
    },
    opts = {
      mappings = {
        left = "<leader>ah",
        right = "<leader>al",
        down = "<leader>aj",
        up = "<leader>ak",
        line_left = "<leader>ah",
        line_right = "<leader>al",
        line_down = "<leader>aj",
        line_up = "<leader>ak",
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { mini = true } },
  },
}
