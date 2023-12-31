return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.pack.cpp" },
  {
    "Civitasv/cmake-tools.nvim",
    cmd = { "CMakeSelectCwd" },
    opts = function(_, opts)
      local out_path = "out/${variant:buildType}"
      if vim.fn.has "win64" == 1 then out_path = string.gsub(out_path, "/", "\\") end
      opts.cmake_build_directory = out_path
      return opts
    end,
  },
  { import = "astrocommunity.pack.cmake" },

  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.html-css" },

  { import = "astrocommunity.pack.full-dadbod" },
  {
    "kristijanhusak/vim-dadbod-ui",
    init = function()
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_win_position = "right"
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_force_echo_notifications = 1
    end,
  },
}
