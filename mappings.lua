return {
  -- Normal mode
  n = {
    ["<M-d>"] = {
      function() require("telescope.builtin").lsp_definitions() end,
      desc = "Goto Definition",
    },
    ["<M-r>"] = { function() require("telescope.builtin").lsp_references() end, desc = "Goto References" },
    ["<M-y>"] = {
      function() require("telescope.builtin").lsp_type_definitions() end,
      desc = "Goto Type Definition",
    },
    ["<M-i>"] = {
      function() require("telescope.builtin").lsp_implementations() end,
      desc = "Goto Implementation",
    },
    ["<M-c>"] = { function() require("telescope.builtin").lsp_incoming_calls() end, desc = "Incoming Calls" },

    ["<M-s>"] = {
      function() require("aerial").toggle() end,
      desc = "Symbols Outline",
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
      desc = "Search Symbols",
    },

    ["<M-g>"] = { "<cmd>normal ]F<cr>", desc = "Next Function End" },
    ["<M-j>"] = { "<cmd>normal ]f<cr>", desc = "Next Function Start" },
    ["<M-k>"] = { "<cmd>normal [f<cr>", desc = "Previous Function Start" },
    ["<M-.>"] = { "<cmd>normal ]A<cr>", desc = "Next Argument End" },
    ["<M-,>"] = { "<cmd>normal [A<cr>", desc = "Previous Argument End" },
    ["<M-b>"] = { "<cmd>normal [a<cr>", desc = "Previous Argument Start" },
    ["<M-;>"] = { "<cmd>normal ]k<cr>", desc = "Next Block Start" },
    ["<M-a>"] = { "<cmd>normal [k<cr>", desc = "Previous Block Start" },

    ["<M-w>"] = { function() require("telescope.builtin").buffers() end, desc = "Find Buffer" },
    ["<M-n>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next Buffer",
    },
    ["<M-p>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous Buffer",
    },

    ["<M-h>"] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
    -- ["<S-M-h>"] = { "<cmd>tabfirst<cr>", desc = "First Tab" },
    ["<M-l>"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
    -- ["<S-M-l>"] = { "<cmd>tablast<cr>", desc = "Last Tab" },
    ["<M-q>"] = {
      function()
        local ok, _ = pcall(vim.cmd.close)
        if not ok then require("astronvim.utils.buffer").close() end
      end,
      desc = "Close Buffer",
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
    ["<leader>fs"] = { "<cmd>Telescope projects<cr>", desc = "Browse sessions" },

    ["<leader>uq"] = { function() require("notify").dismiss() end, desc = "Dismiss notify message" },

    ["<leader>,a"] = { "<cmd>InspectTree<cr>", desc = "Show AST" },
    ["<leader>,w"] = { "<cmd>w !cmd.exe /c xt -x<cr>", desc = "xt exec on win" },
    ["<leader>,l"] = { "<cmd>w !wsl.exe xt -x<cr>", desc = "xt exec on wsl" },
    ["<leader>,u1"] = { "<cmd>w !wsl.exe -d ubuntu_1 xt -x<cr>", desc = "xt exec on ubuntu_1" },
    ["<leader>,u2"] = { "<cmd>w !wsl.exe -d ubuntu_2 xt -x<cr>", desc = "xt exec on ubuntu_2" },
    ["<leader>,kl"] = { "<cmd>w !wsl.exe -d kali-linux xt -x<cr>", desc = "xt exec on kali-linux" },

    ["<leader>,s"] = { "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
    ["<leader>,r"] = { "<cmd>OverseerRun<cr>", desc = "Overseer Run Task" },
    ["<leader>,oi"] = { "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    ["<leader>,od"] = { function() require("overseer").debug_parser() end, desc = "Overseer Parser Debug" },
    ["<leader>,o"] = { name = "Overseer" },

    ["<leader>,d"] = { "<cmd>DBUIToggle<cr>", desc = "DBUIToggle" },

    ["<leader>,e"] = { "<cmd>cd %:h<cr><cmd>Neotree focus<cr>", desc = "Sync Neotree With Current Buffer" },
    ["<leader>,1"] = { '<cmd>let @+ = expand("%:h")<cr><cmd>echo expand("%:h")<cr>', desc = "Yank directory path" },
    ["<leader>,2"] = { '<cmd>let @+ = expand("%:t")<cr><cmd>echo expand("%:t")<cr>', desc = "Yank filename" },
    ["<leader>,3"] = { '<cmd>let @+ = expand("%:p")<cr><cmd>echo expand("%:p")<cr>', desc = "Yank full path" },

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
