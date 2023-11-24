return {
  "azabiong/vim-highlighter",
  lazy = false, -- Not Lazy by default
  keys = {
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
  },
}
