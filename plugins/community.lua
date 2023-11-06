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

  { import = "astrocommunity.debugging.nvim-bqf" },

  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },

  { import = "astrocommunity.indent.indent-tools-nvim" },

  { import = "astrocommunity.git.git-blame-nvim" },

  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  {
    "Wansmer/treesj",
    keys = { { "<leader>j", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" } },
  },

  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.file-explorer.oil-nvim" },

  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.telescope-fzy-native-nvim" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.project.project-nvim" },

  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.color.vim-highlighter" },
  {
    "vim-highlighter",
    keys = function()
      return {
        -- These are basing keymaps to guide new users
        { "f<Enter>", desc = "Highlight" },
        { "f<BS>", desc = "Remove Highlight" },
        { "f<C-L>", desc = "Clear Highlight" },
        { "f<Tab>", desc = "Find Highlight (similar to Telescope grep)" },
        -- They are derivated from the default keymaps, see README.md to github repo for documentation
        { "<S-M-j>", "<cmd>Hi><CR>", desc = "Next Recently Set Highlight" },
        { "<S-M-k>", "<cmd>Hi<<CR>", desc = "Previous Recently Set Highlight" },
        { "<S-M-h>", "<cmd>Hi{<CR>", desc = "Next Nearest Highlight" },
        { "<S-M-l>", "<cmd>Hi}<CR>", desc = "Previous Nearest Highlight" },
      }
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
