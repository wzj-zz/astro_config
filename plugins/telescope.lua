local ast_grep = {
  "Marskey/telescope-sg",
  config = function(_, _)
    require("telescope").setup {
      extensions = {
        ast_grep = {
          command = {
            "sg",
            "--json=stream",
          }, -- must have --json=stream
          grep_open_files = false, -- search in opened files
          lang = nil, -- string value, specify language for ast-grep `nil` for default
        },
      },
    }
  end,
}

return {
  "nvim-telescope/telescope.nvim",

  dependencies = { ast_grep },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "Marskey/telescope-sg" },
    opts = function() require("telescope").load_extension "ast_grep" end,
  },
}
