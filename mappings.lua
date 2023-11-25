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

    ["<S-M-u>"] = { "<cmd>normal [f<cr>", desc = "Previous Function Start" },
    ["<S-M-i>"] = { "<cmd>normal ]f<cr>", desc = "Next Function Start" },
    ["<M-g>"] = { "<cmd>normal ]F<cr>", desc = "Next Function End" },

    ["<M-,>"] = { "<cmd>normal [A<cr>", desc = "Previous Argument End" },
    ["<M-.>"] = { "<cmd>normal ]A<cr>", desc = "Next Argument End" },
    ["<M-b>"] = { "<cmd>normal [a<cr>", desc = "Previous Argument Start" },
    ["<S-M-b>"] = { "<cmd>normal [K<cr>", desc = "Previous Block End" },

    ["<M-e>"] = { "<cmd>normal z%<cr>", desc = "Next Matchup Inside" },
    ["<M-u>"] = { "<cmd>normal [%<cr>", desc = "Matchup Outside" },
    ["<M-a>"] = { "<cmd>normal %<cr>", desc = "Matchup" },

    ["<M-k>"] = { "<cmd>normal [u<cr>", desc = "Previous Indent" },
    ["<M-j>"] = { "<cmd>normal ]u<cr>", desc = "Next Indent" },
    ["<M-[>"] = { "<cmd>normal [i<cr>", desc = "Indent Top" },
    ["<M-]>"] = { "<cmd>normal ]i<cr>", desc = "Indent Bottom" },

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

    ["<leader>tl"] = { "<cmd>TermSelect<cr>", desc = "TermSelect" },

    ["<leader>br"] = { "<cmd>e!<cr>", desc = "Revert Buffer" },
    ["<leader>b"] = { name = "Buffers" },

    ["<leader>Dd"] = { "<cmd>diffthis<cr>", desc = "Diff this" },
    ["<leader>Dc"] = { "<cmd>diffoff<cr>", desc = "Diff off" },
    ["<leader>D"] = { name = " Diff View" },

    ["<leader>ss"] = {
      function() require("telescope.builtin").current_buffer_fuzzy_find() end,
      desc = "Find words in current buffer",
    },

    ["<leader>lg"] = {
      function()
        vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
          if query then
            -- word under cursor if given query is empty
            if query == "" then query = vim.fn.expand "<cword>" end
            require("telescope.builtin").lsp_workspace_symbols {
              query = query,
              prompt_title = ("Find word (%s)"):format(query),
            }
          end
        end)
      end,
      desc = "Search workspace symbols",
    },

    ["<leader>lx"] = {
      function() require("telescope.builtin").diagnostics() end,
      desc = "Search diagnostics",
    },

    ["<leader>fe"] = {
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Find Jumplist",
    },
    ["<leader>fb"] = { "<cmd>Telescope file_browser<cr>", desc = "Telescope file_browser" },
    ["<leader>fj"] = { function() require("telescope.builtin").jumplist() end, desc = "Find Jumplist" },
    ["<leader>fl"] = { function() require("telescope.builtin").filetypes() end, desc = "Select Language" },
    ["<leader>fs"] = { "<cmd>Telescope projects<cr>", desc = "Browse Sessions" },
    ["<leader>fg"] = { "<cmd>Telescope ast_grep<cr>", desc = "AST Grep" },

    ["<leader>uq"] = { function() require("notify").dismiss() end, desc = "Dismiss notify message" },

    ["<leader>a"] = { name = "Action / Annotation" },

    ["<leader>,,"] = {
      function()
        local path = vim.fn.getreg "*"
        if vim.fn.isdirectory(path) == 1 then
          vim.cmd("cd " .. path)
          print(vim.cmd "pwd")
        elseif vim.fn.filereadable(path) == 1 then
          local parent_path = vim.fn.fnamemodify(path, ":h")
          vim.cmd("cd " .. parent_path)
          print(vim.cmd "pwd")
        else
          print "Invalid Path !!!"
        end
      end,
      desc = "Set CWD With ClipBoard",
    },

    ["<leader>,x"] = {
      function() require("noice").redirect "w !xt -x -d" end,
      desc = "xtools exec",
    },

    ["<leader>,."] = {
      function()
        require("user.utils").new_term_cmd_vertical {
          cmd = "xs",
          display_name = "xtools",
        }
      end,
      desc = "ToggleTerm xtools (python)",
    },
    ["<leader>,s"] = {
      function()
        require("user.utils").new_term_cmd_vertical {
          cmd = vim.o.shell,
          display_name = "shell",
        }
      end,
      desc = "ToggleTerm shell",
    },

    ["<leader>,a"] = { "<cmd>InspectTree<cr>", desc = "Show AST" },

    ["<leader>,r"] = { "<cmd>OverseerRun<cr>", desc = "Overseer Run Task" },
    ["<leader>,oo"] = { "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
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
    ["<leader>,x"] = {
      function()
        local line_begin = vim.fn.getpos("v")[2]
        local line_end = vim.fn.getcurpos()[2]
        require("noice").redirect(line_begin .. "," .. line_end .. " w !xt -x -d")
      end,
      desc = "xt exec",
    },
    ["<leader>,"] = { name = "Local" },

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
