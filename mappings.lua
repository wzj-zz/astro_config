return {
  -- Normal mode
  n = {
    ["<M-d>"] = {
      function() require("telescope.builtin").lsp_definitions() end,
      desc = "Show the definition of current symbol",
    },
    ["<M-r>"] = { function() require("telescope.builtin").lsp_references() end, desc = "References of current symbol" },
    ["<M-y>"] = {
      function() require("telescope.builtin").lsp_type_definitions() end,
      desc = "Definition of current type",
    },
    ["<M-i>"] = {
      function() require("telescope.builtin").lsp_implementations() end,
      desc = "Implementation of current symbol",
    },
    ["<M-c>"] = { function() require("telescope.builtin").lsp_incoming_calls() end, desc = "Incoming calls" },

    ["<M-s>"] = {
      function() require("aerial").toggle() end,
      desc = "Symbols outline",
    },
    ["<M-f>"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end

        -- require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Search symbols",
    },

    ["<M-j>"] = { "<cmd>normal ]f<cr>", desc = "Next function start" },
    ["<S-M-j>"] = { "<cmd>normal ]F<cr>", desc = "Next function end" },
    ["<M-k>"] = { "<cmd>normal [f<cr>", desc = "Previous function start" },
    ["<S-M-k>"] = { "<cmd>normal [F<cr>", desc = "Previous function end" },
    ["<M-h>"] = { "<cmd>normal [k<cr>", desc = "Previous block start" },
    ["<S-M-h>"] = { "<cmd>normal [K<cr>", desc = "Previous block end" },
    ["<M-l>"] = { "<cmd>normal ]k<cr>", desc = "Next block start" },
    ["<S-M-l>"] = { "<cmd>normal ]K<cr>", desc = "Next block end" },
    ["<M-,>"] = { "<cmd>normal [a<cr>", desc = "Previous argument start" },
    ["<M-.>"] = { "<cmd>normal ]a<cr>", desc = "Next argument start" },

    ["<M-w>"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    ["<M-n>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<M-p>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    ["<C-Tab>"] = { "<cmd>normal ]t<cr>", desc = "Next Tab" },
    ["<C-S-Tab>"] = { "<cmd>normal [t<cr>", desc = "Previous Tab" },

    ["<leader>br"] = { "<cmd>e!<cr>", desc = "Revert Buffer" },
    ["<leader>b"] = { name = "Buffers" },

    ["<leader>ss"] = {
      function() require("telescope.builtin").current_buffer_fuzzy_find() end,
      desc = "Find words in current buffer",
    },

    ["<leader>s"] = { name = "Search" },

    ["<leader>fj"] = { function() require("telescope.builtin").jumplist() end, desc = "Find jumplist" },
    ["<leader>fg"] = { function() require("telescope.builtin").filetypes() end, desc = "Select language" },
    ["<leader>uq"] = { function() require("notify").dismiss() end, desc = "Dismiss notify message" },

    ["<leader>,w"] = { "<cmd>w !cmd.exe /c xt -x<cr>", desc = "xt exec on win" },
    ["<leader>,l"] = { "<cmd>w !wsl.exe xt -x<cr>", desc = "xt exec on wsl" },
    ["<leader>,1"] = {
      "<cmd>!wsl.exe --set-default ubuntu_1<cr><cr><cmd>w !wsl.exe xt -x<cr>",
      desc = "xt exec on ubuntu_1",
    },
    ["<leader>,2"] = {
      "<cmd>!wsl.exe --set-default ubuntu_2<cr><cr><cmd>w !wsl.exe xt -x<cr>",
      desc = "xt exec on ubuntu_2",
    },
    ["<leader>,k"] = {
      "<cmd>!wsl.exe --set-default kali-linux<cr><cr><cmd>w !wsl.exe xt -x<cr>",
      desc = "xt exec on kali-linux",
    },

    ["<leader>,e"] = { "<cmd>cd %:h<cr><cmd>Neotree focus<cr>", desc = "Sync explorer with current buffer" },
    ["<leader>,"] = { name = "Local" },
    ["<leader>q"] = { "<cmd>q<cr>", desc = "Quit current buffer" },
  },

  -- Visual mode
  v = {
    ["<C-j>"] = { "<S-j>", desc = "merge lines" },
    ["<C-S-j>"] = { "g<S-j>", desc = "merge lines without space" },

    ["<C-S-Left>"] = { "b", desc = "" },
    ["<C-S-Right>"] = { "e", desc = "" },
    ["<S-Up>"] = { "k", desc = "" },
    ["<S-Down>"] = { "j", desc = "" },
    ["<S-Left>"] = { "h", desc = "" },
    ["<S-Right>"] = { "l", desc = "" },
    ["<S-PageUp>"] = { "<C-u>", desc = "" },
    ["<S-PageDown>"] = { "<C-d>", desc = "" },
  },

  -- Insert mode
  i = {
    ["<C-s>"] = { "<cmd>w!<cr><Esc>", desc = "Force write" },
    ["<C-v>"] = { "<cmd>normal P<cr><Right>", desc = "Paste from clipboard" },

    ["<C-h>"] = { "<C-w>", desc = "Delete word" },
    ["<C-S-Left>"] = { '_<Esc>mz"_xv`z<BS>ob<Space>', desc = "" },
    ["<C-S-Right>"] = { '_<Esc>my"_xi<S-Right><C-o><BS>_<Esc>mz"_xv`yo`z', desc = "" },
    ["<S-End>"] = { "<cmd>normal v<End><cr><Esc>", desc = "" },
    ["<S-Home>"] = { "<cmd>normal hv<Home><cr><Esc>", desc = "" },
    ["<S-Up>"] = { "<cmd>normal vkloho<cr><Esc>", desc = "" },
    ["<S-Down>"] = { "<cmd>normal vj<cr><Esc>", desc = "" },
    ["<S-Left>"] = { "<Esc>v", desc = "" },
    ["<S-Right>"] = { "<Esc>vlolo", desc = "" },
    ["<S-PageUp>"] = { "<Esc>v<C-u>", desc = "" },
    ["<S-PageDown>"] = { "<Esc>v<C-d>", desc = "" },
  },

  -- Command mode
  c = { ["<C-v>"] = { "<C-r>*", desc = "Paste in Command mode" } },

  -- Terminal mode
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
