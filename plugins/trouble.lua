local prefix = "<leader>x"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱍼 " or ""
maps.n[prefix] = { desc = icon .. "Trouble" }
require("astronvim.utils").set_mappings(maps)
return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { prefix .. "X", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { prefix .. "x", "<cmd>Trouble document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { prefix .. "l", "<cmd>Trouble loclist<cr>", desc = "Location List (Trouble)" },
      { prefix .. "q", "<cmd>Trouble quickfix<cr>", desc = "Quickfix List (Trouble)" },
      { prefix .. "r", "<cmd>Trouble lsp_references<cr>", desc = "LSP References (Trouble)" },
      { prefix .. "i", "<cmd>Trouble lsp_implementations<cr>", desc = "LSP Implementations (Trouble)" },
      { prefix .. "d", "<cmd>Trouble lsp_definitions<cr>", desc = "LSP Definitions (Trouble)" },
      { prefix .. "t", "<cmd>Trouble lsp_type_definitions<cr>", desc = "LSP Type Definitions (Trouble)" },
    },
    opts = {
      cycle_results = false,
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then opts.bottom = {} end
      table.insert(opts.bottom, "Trouble")
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { lsp_trouble = true } },
  },
}
