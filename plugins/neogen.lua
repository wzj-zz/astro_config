local prefix = "<leader>a"

return {
  "danymat/neogen",
  cmd = "Neogen",
  opts = {
    snippet_engine = "luasnip",
    languages = {
      lua = { template = { annotation_convention = "ldoc" } },
      typescript = { template = { annotation_convention = "tsdoc" } },
      typescriptreact = { template = { annotation_convention = "tsdoc" } },
    },
  },
  keys = {
    { prefix .. "a", "<cmd>Neogen<cr>", desc = "Annotation Auto" },
    { prefix .. "c", function() require("neogen").generate { type = "class" } end, desc = "Annotation Class" },
    { prefix .. "f", function() require("neogen").generate { type = "func" } end, desc = "Annotation Function" },
    { prefix .. "t", function() require("neogen").generate { type = "type" } end, desc = "Annotation Type" },
    { prefix .. "F", function() require("neogen").generate { type = "file" } end, desc = "Annotation File" },
  },
}
