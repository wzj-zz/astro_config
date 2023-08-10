return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.project.nvim-spectre" },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = function()
      return {
        { "<leader>sp", function() require("spectre").toggle() end, desc = "Toggle Spectre" },
        {
          "<leader>sw",
          mode = "x",
          function() require("spectre").open_visual { select_word = true } end,
          desc = "Spectre (current word)",
        },
        { "<leader>sf", function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
      }
    end,
  },
}
