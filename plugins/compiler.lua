return {
  "Zeioth/compiler.nvim",
  dependencies = {
    {
      "stevearc/overseer.nvim",
      opts = {
        task_list = { -- this refers to the window that shows the result
          direction = "bottom",
          min_height = 25,
          max_height = 25,
          default_detail = 1,
          bindings = {
            ["q"] = function() vim.cmd "OverseerClose" end,
          },
        },
      },
      config = function(_, opts) require("overseer").setup(opts) end,
    },
  },
  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo", "CompilerStop" },
  keys = {
    { "<leader>kk", "<cmd>CompilerOpen<cr>", desc = "CompilerOpen (select compiler)" },
    { "<leader>kx", "<cmd>CompilerStop<cr>", desc = "CompilerStop (clean compile result)" },
    {
      "<leader>kb",
      "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>",
      desc = "CompilerStopRedo (clean compile result and redo)",
    },
    { "<leader>kr", "<cmd>CompilerToggleResults<cr>", desc = "CompilerToggleResults (toggle compile result)" },
  },
  opts = {},
}
