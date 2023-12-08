local user_utils = require "user.utils"

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
    { "<leader>kk", "<cmd>CompilerOpen<cr>", desc = "CompilerOpen (select compiler for current file/directory)" },
    { "<leader>kx", "<cmd>CompilerStop<cr>", desc = "CompilerStop (clean compile result)" },
    {
      "<leader>kr",
      "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>",
      desc = "CompilerStopRedo (clean compile result and redo)",
    },
    { "<leader>ks", "<cmd>CompilerToggleResults<cr>", desc = "CompilerToggleResults (toggle compile result)" },
    {
      "<leader>ko",
      function()
        user_utils.adjust_path_from_clip()
        local path = user_utils.get_clip()
        if user_utils.isdir(path) then
          user_utils.cd(path)
          print(user_utils.cwd())
          vim.cmd "CompilerOpen"
        elseif user_utils.isfile(path) then
          vim.cmd("e " .. path)
          user_utils.cd(user_utils.dirname(path))
          vim.cmd "CompilerOpen"
        else
          print "Invalid Path !!!"
        end
      end,
      desc = "CompilerOpen (select compiler for file/directory in clipboard)",
    },
  },
  opts = {},
}
