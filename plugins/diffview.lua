-- https://github.com/sindrets/diffview.nvim

return {
  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
    cmd = { "DiffviewOpen" },

    keys = {
      {
        "<M-j>",
        mode = { "n" },
        function() vim.cmd "normal ]c" end,
        desc = "Flash",
      },
      {
        "<M-k>",
        mode = { "n" },
        function() vim.cmd "normal [c" end,
        desc = "Flash",
      },
    },
  },
}
