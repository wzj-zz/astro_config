return {
  {
    "jay-babu/project.nvim",
    main = "project_nvim",
    event = "VeryLazy",
    opts = {
      manual_mode = true,
      silent_chdir = false,
      detection_methods = { "pattern" },
      ignore_lsp = { "lua_ls" },
      patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = { "jay-babu/project.nvim" },
    opts = function() require("telescope").load_extension "projects" end,
  },
}
