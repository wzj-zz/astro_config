-- https://github.com/AstroNvim/astrocommunity/tree/main

return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
      },
    },
  },

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

  { import = "astrocommunity.indent.mini-indentscope" },

  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },

  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.file-explorer.oil-nvim" },

  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.telescope-fzy-native-nvim" },

  { import = "astrocommunity.completion.cmp-cmdline" },

  { import = "astrocommunity.color.transparent-nvim" },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
