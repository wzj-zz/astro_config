return {
  "Wansmer/treesj",
  keys = { { "<leader>am", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" } },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  opts = { use_default_keymaps = false },
}
