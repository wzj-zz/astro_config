return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "andymass/vim-matchup",
        init = function()
          vim.g.matchup_matchparen_deferred = 1
          -- vim.g.matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "Normal", syntax_hl = 1 }
        end,
      },
    },
    opts = {
      auto_install = vim.fn.executable "tree-sitter" == 1,
      matchup = {
        enable = true,
        enable_quotes = true,
      },
    },
  },
}
