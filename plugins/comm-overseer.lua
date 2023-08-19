local tasks_templates = {
  {
    name = "xmb -> xmake rebuild",
    builder = function()
      return {
        cmd = { "xmake" },
        args = { "-r" },
        components = {
          "default",
          { "on_output_quickfix", open = true },
        },
      }
    end,
  },
  {
    name = "xmbv -> xmake rebuild verbose",
    builder = function()
      return {
        cmd = { "xmake" },
        args = { "-rv" },
        components = {
          "default",
          { "on_output_quickfix", open = true },
        },
      }
    end,
  },
}

return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.code-runner.overseer-nvim" },
  {
    "stevearc/overseer.nvim",

    opts = {
      setup = {
        task_list = {
          bindings = {
            q = "<Cmd>close<CR>",
          },
        },
      },
    },

    config = function(_, opts)
      require("overseer").setup(opts.setup)
      vim.tbl_map(require("overseer").register_template, tasks_templates)
    end,
  },
}
