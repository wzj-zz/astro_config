return {
  "andrewferrier/debugprint.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>av",
      function() return require("debugprint").debugprint { variable = true } end,
      desc = "Print debug info",
      expr = true,
    },
    {
      "<leader>av",
      function() return require("debugprint").debugprint { variable = true } end,
      desc = "Print selection debug info",
      mode = "v",
      expr = true,
    },
    {
      "<leader>ad",
      "<cmd>DeleteDebugPrints<cr>",
      desc = "Delete debugprints",
    },
  },
  config = function()
    require("debugprint").setup {
      create_keymaps = false,
    }
  end,
  version = "*",
}
