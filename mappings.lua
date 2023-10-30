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
      end,
      desc = "Search symbols",
    },

    -- ["<S-M-j>"] = { "<cmd>normal ]F<cr>", desc = "Next function end" },
    ["<M-j>"] = { "<cmd>normal ]f<cr>", desc = "Next function start" },
    ["<M-k>"] = { "<cmd>normal [f<cr>", desc = "Previous function start" },
    ["<M-.>"] = { "<cmd>normal ]A<cr>", desc = "Next argument end" },
    ["<M-,>"] = { "<cmd>normal [A<cr>", desc = "Previous argument end" },
    ["<M-b>"] = { "<cmd>normal [a<cr>", desc = "Previous argument start" },
    ["<M-;>"] = { "<cmd>normal ]k<cr>", desc = "Next block start" },
    ["<M-a>"] = { "<cmd>normal [k<cr>", desc = "Previous block start" },

    ["<M-w>"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    ["<M-n>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<M-p>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    ["<M-h>"] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
    ["<S-M-h>"] = { "<cmd>tabfirst<cr>", desc = "First Tab" },
    ["<M-l>"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
    ["<S-M-l>"] = { "<cmd>tablast<cr>", desc = "Last Tab" },
    ["<M-q>"] = {
      function()
        local ok, _ = pcall(vim.cmd.close)
        if not ok then require("astronvim.utils.buffer").close() end
      end,
      desc = "Close",
    },

    ["<leader>br"] = { "<cmd>e!<cr>", desc = "Revert Buffer" },
    ["<leader>b"] = { name = "Buffers" },

    ["<leader>Dd"] = { "<cmd>diffthis<cr>", desc = "Diff this" },
    ["<leader>Dc"] = { "<cmd>diffoff<cr>", desc = "Diff off" },
    ["<leader>D"] = { name = " Diff View" },

    ["<leader>ss"] = {
      function() require("telescope.builtin").current_buffer_fuzzy_find() end,
      desc = "Find words in current buffer",
    },

    ["<leader>fj"] = { function() require("telescope.builtin").jumplist() end, desc = "Find jumplist" },
    ["<leader>fg"] = { function() require("telescope.builtin").filetypes() end, desc = "Select language" },
    ["<leader>fs"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" },
    ["<leader>fd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" },
    ["<leader>f,"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" },
    ["<leader>f."] = { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session" },
    ["<leader>fl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" },

    ["<leader>uq"] = { function() require("notify").dismiss() end, desc = "Dismiss notify message" },

    ["<leader>,w"] = { "<cmd>w !cmd.exe /c xt -x<cr>", desc = "xt exec on win" },
    ["<leader>,l"] = { "<cmd>w !wsl.exe xt -x<cr>", desc = "xt exec on wsl" },
    ["<leader>,u1"] = { "<cmd>w !wsl.exe -d ubuntu_1 xt -x<cr>", desc = "xt exec on ubuntu_1" },
    ["<leader>,u2"] = { "<cmd>w !wsl.exe -d ubuntu_2 xt -x<cr>", desc = "xt exec on ubuntu_2" },
    ["<leader>,kl"] = { "<cmd>w !wsl.exe -d kali-linux xt -x<cr>", desc = "xt exec on kali-linux" },

    ["<leader>,s"] = { "<cmd>OverseerToggle<cr>", desc = "Overseer Show task" },
    ["<leader>,r"] = { "<cmd>OverseerRun<cr>", desc = "Overseer Run task" },
    ["<leader>,oi"] = { "<cmd>OverseerInfo<cr>", desc = "Overseer info" },
    ["<leader>,od"] = { function() require("overseer").debug_parser() end, desc = "Overseer Parser Debug" },
    ["<leader>,o"] = { name = "Overseer" },

    ["<leader>,d"] = { "<cmd>DBUIToggle<cr>", desc = "DBUIToggle" },
    ["<leader>,e"] = { "<cmd>cd %:h<cr><cmd>Neotree focus<cr>", desc = "Sync explorer with current buffer" },

    ["<leader>,1"] = { '<cmd>let @+ = expand("%:h")<cr><cmd>echo expand("%:h")<cr>', desc = "Yank directory path" },
    ["<leader>,2"] = { '<cmd>let @+ = expand("%:t")<cr><cmd>echo expand("%:t")<cr>', desc = "Yank filename" },
    ["<leader>,3"] = { '<cmd>let @+ = expand("%:p")<cr><cmd>echo expand("%:p")<cr>', desc = "Yank full path" },
    -- ["<leader>,p"] = { name = "Yank path" },

    ["<leader>,"] = { name = "Local" },
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
    ["<C-l>"] = false,
  },
}
