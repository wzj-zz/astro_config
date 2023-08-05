-- https://github.com/sindrets/diffview.nvim

return {
  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
    cmd = { "DiffviewOpen" },
    opts = {
      keymaps = {
        diff2 = {
          { "n", "<M-j>", function() vim.cmd "normal ]c" end, { desc = "Next diff" } },
          { "n", "<M-k>", function() vim.cmd "normal [c" end, { desc = "Previous diff" } },
        },
      },
    },
  },
}
