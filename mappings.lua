local user_utils = require "user.utils"

return {
  -- Normal mode
  n = {
    ["<M-d>"] = { "<cmd>Trouble lsp_definitions<cr>", desc = "Goto Definition" },
    ["<M-r>"] = { "<cmd>Trouble lsp_references<cr>", desc = "Goto References" },
    ["<M-y>"] = { "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
    ["<M-i>"] = { "<cmd>Trouble lsp_implementations<cr>", desc = "Goto Implementation" },
    ["<M-c>"] = { function() require("telescope.builtin").lsp_incoming_calls() end, desc = "Incoming Calls" },
    ["<S-M-c>"] = { function() require("telescope.builtin").lsp_outgoing_calls() end, desc = "Outgoing Calls" },

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

    ["<S-M-u>"] = { "<cmd>normal [f<cr>", desc = "Previous function start" },
    ["<S-M-i>"] = { "<cmd>normal ]f<cr>", desc = "Next function start" },

    ["<M-h>"] = { "<cmd>normal [s<cr>", desc = "Previous callsite start" },
    ["<M-l>"] = { "<cmd>normal ]s<cr>", desc = "Next callsite start" },

    ["<S-M-v>"] = { "<cmd>normal [?<cr>", desc = "Previous conditional start" },
    ["<M-v>"] = { "<cmd>normal ]?<cr>", desc = "Next conditional start" },

    ["<S-M-g>"] = { "<cmd>normal [l<cr>", desc = "Previous loop start" },
    ["<M-g>"] = { "<cmd>normal ]l<cr>", desc = "Next loop start" },

    ["<M-,>"] = { "<cmd>normal [A<cr>", desc = "Previous argument end" },
    ["<M-.>"] = { "<cmd>normal ]A<cr>", desc = "Next argument end" },
    ["<M-b>"] = { "<cmd>normal [a<cr>", desc = "Previous argument start" },

    ["<S-M-b>"] = { "<cmd>normal [K<cr>", desc = "Previous block end" },
    ["<S-M-e>"] = { "<cmd>normal ]k<cr>", desc = "Next block start" },

    ["<M-e>"] = { "<cmd>normal z%<cr>", desc = "Next matchup inside" },
    ["<M-u>"] = { "<cmd>normal [%<cr>", desc = "Goto matchup outside" },
    ["<M-a>"] = { "<cmd>normal %<cr>", desc = "Next matchup" },
    ["<S-M-a>"] = { "<cmd>normal g%<cr>", desc = "Previous matchup" },

    ["<M-k>"] = { "<cmd>normal [u<cr>", desc = "Previous Indent" },
    ["<M-j>"] = { "<cmd>normal ]u<cr>", desc = "Next Indent" },

    ["<M-[>"] = { "<cmd>normal m[<cr>", desc = "Previous Mark" },
    ["<M-]>"] = { "<cmd>normal m]<cr>", desc = "Next Mark" },

    ["<M-w>"] = { function() require("telescope.builtin").buffers() end, desc = "Find Buffer" },
    ["<M-n>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next Buffer",
    },
    ["<M-p>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous Buffer",
    },

    ["<S-M-p>"] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
    ["<S-M-n>"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
    ["<M-q>"] = {
      function() require("astronvim.utils.buffer").close() end,
      desc = "Close buffer",
    },
    ["<leader>q"] = { "<cmd>close<cr>", desc = "Close window" },

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
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
      desc = "Find Jumplist",
    },
    ["<leader>fb"] = { "<cmd>Telescope file_browser<cr>", desc = "Telescope file_browser" },
    ["<leader>fz"] = { "<cmd>Telescope zoxide list<CR>", desc = "Telescope zoxide" },
    ["<leader>fj"] = { function() require("telescope.builtin").jumplist() end, desc = "Find Jumplist" },
    ["<leader>fl"] = { function() require("telescope.builtin").filetypes() end, desc = "Select Language" },
    ["<leader>fs"] = { "<cmd>Telescope projects<cr>", desc = "Browse Sessions" },
    ["<leader>fg"] = { "<cmd>Telescope ast_grep<cr>", desc = "AST Grep" },

    ["<leader>uW"] = { "<cmd>set wrapscan!<cr>", desc = "Toggle wrapscan" },
    ["<leader>uq"] = { function() require("notify").dismiss() end, desc = "Dismiss notify message" },

    ["<leader>a"] = { name = "Action / Annotation" },

    ["<leader>xm"] = { "<cmd>MarksListBuf<cr>", desc = "Buf Marks (Location)" },
    ["<leader>xM"] = { "<cmd>MarksListGlobal<cr>", desc = "Global Marks (Location)" },
    ["<leader>xh"] = {
      "<cmd>exe 'vimgrep /\\v('. HiList()->map({i,v -> v.pattern})->join('\\v|'). '\\v)/gj %' | copen<cr>",
      desc = "Highlight (Quickfix)",
    },
    ["<leader>x"] = { name = "QuickFix / Location" },

    ["<leader>kc"] = {
      function()
        user_utils.adjust_path_from_clip()
        local path = user_utils.get_clip()
        if user_utils.isdir(path) then
          user_utils.cd(path)
          vim.cmd("CMakeSelectCwd " .. path)
        end
      end,
      desc = "Set CMake Root",
    },

    ["<leader>ka"] = { ":CMakeLaunchArgs ", desc = "CMakeLaunchArgs" },
    ["<leader>kb"] = { "<cmd>CMakeBuild<cr>", desc = "CMakeBuild" },
    ["<leader>kB"] = { "<cmd>CMakeQuickBuild<cr>", desc = "CMakeQuickBuild" },
    ["<leader>kd"] = { "<cmd>CMakeDebug<cr>", desc = "CMakeDebug" },
    ["<leader>ke"] = { "<cmd>CMakeSelectLaunchTarget<cr>", desc = "CMakeSelectLaunchTarget" },
    ["<leader>kf"] = { "<cmd>CMakeShowTargetFiles<cr>", desc = "CMakeShowTargetFiles" },
    ["<leader>kg"] = { ":CMakeGenerate ", desc = "CMakeGenerate" },
    ["<leader>kt"] = { "<cmd>CMakeSelectBuildType<cr>", desc = "CMakeSelectBuildType" },
    ["<leader>kl"] = { "<cmd>CMakeClean<cr>", desc = "CMakeClean" },
    ["<leader>k"] = { name = "C/CPP Action" },

    ["<leader>,,"] = {
      function()
        user_utils.adjust_path_from_clip()
        local path = user_utils.get_clip()
        if user_utils.isdir(path) then
          user_utils.cd(path)
          print(user_utils.cwd())
        elseif user_utils.isfile(path) then
          vim.cmd("e " .. path)
        else
          print "Invalid Path !!!"
        end
      end,
      desc = "Set cwd or Open file with clipboard",
    },

    ["<leader>,q"] = { "<cmd>copen<cr>", desc = "Open QuickFix (bqf)" },
    ["<leader>,l"] = { "<cmd>lopen<cr>", desc = "Open Location (bqf)" },
    ["<leader>,p"] = { "<cmd>ProjectRoot<cr>", desc = "Set Project Root" },

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

    ["<leader>,e"] = { "<cmd>cd %:h<cr><cmd>Neotree focus<cr><cmd>pwd<cr>", desc = "Sync Neotree With Current Buffer" },
    ["<leader>,1"] = { '<cmd>let @+ = expand("%:h")<cr><cmd>echo expand("%:h")<cr>', desc = "Yank directory path" },
    ["<leader>,2"] = { '<cmd>let @+ = expand("%:t")<cr><cmd>echo expand("%:t")<cr>', desc = "Yank filename" },
    ["<leader>,3"] = { '<cmd>let @+ = expand("%:p")<cr><cmd>echo expand("%:p")<cr>', desc = "Yank full path" },
    ["<leader>,c"] = {
      function()
        local work_dir = user_utils.cwd()
        user_utils.set_clip(work_dir)
        print(work_dir)
      end,
      desc = "Yank CWD",
    },

    ["<leader>,hh"] = { "<cmd>%!xxd -g 1<cr>", desc = "Switch to hex view" },
    ["<leader>,hr"] = { "<cmd>%!xxd -r<cr>", desc = "Switch to binary view" },
    ["<leader>,ho"] = { ":e ++binary ", desc = "Open binary file" },
    ["<leader>,h"] = { name = "Hex" },

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
    ["<M-q>"] = {
      "<cmd>close<cr>",
      desc = "Close buffer",
    },
  },
}
