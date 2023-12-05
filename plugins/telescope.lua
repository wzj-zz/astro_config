local dap = {
  "nvim-telescope/telescope-dap.nvim",
  keys = {
    { "<leader>df", function() require("telescope").extensions.dap.frames() end, desc = "Telescope DAP frames" },
    {
      "<leader>dv",
      function() require("telescope").extensions.dap.variables() end,
      desc = "Telescope DAP variables",
    },
    {
      "<leader>dl",
      function() require("telescope").extensions.dap.list_breakpoints() end,
      desc = "Telescope DAP list breakpoints",
    },
  },
}

local project_nvim = {
  "jay-babu/project.nvim",
  main = "project_nvim",
  event = "VeryLazy",
  opts = {
    manual_mode = true,
    silent_chdir = false,
    detection_methods = { "pattern" },
    ignore_lsp = { "lua_ls" },
    patterns = {
      ".git",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json",
    },
  },
}

local ast_grep = {
  "Marskey/telescope-sg",
  config = function(_, _)
    require("telescope").setup {
      extensions = {
        ast_grep = {
          command = {
            "sg",
            "--json=stream",
          }, -- must have --json=stream
          grep_open_files = false, -- search in opened files
          lang = nil, -- string value, specify language for ast-grep `nil` for default
        },
      },
    }
  end,
}

local lua_snip = {
  "benfowler/telescope-luasnip.nvim",
  keys = {
    {
      "<M-o>",
      "<cmd>lua require 'telescope'.extensions.luasnip.luasnip()<cr>",
      mode = { "n", "i" },
      desc = "Telescope luasnip",
    },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      dap,
      ast_grep,
      lua_snip,
      project_nvim,
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "jvgrootveld/telescope-zoxide",
    },

    opts = function(_, opts)
      local trouble = require "trouble.providers.telescope"
      local live_grep_args_actions = require "telescope-live-grep-args.actions"

      local new_opts = {
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
        extensions = {
          aerial = {
            show_nesting = {
              ["_"] = true,
              java = false,
            },
          },

          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = { -- extend mappings
              i = {
                ["<C-a>"] = live_grep_args_actions.quote_prompt(),
                ["<C-f>"] = live_grep_args_actions.quote_prompt { postfix = " -t" },
                ["<C-i>"] = live_grep_args_actions.quote_prompt { postfix = " --iglob " },
              },
            },
          },

          zoxide = {
            mappings = {
              ["<C-b>"] = {
                keepinsert = true,
                action = function(selection)
                  require("telescope.builtin").find_files { cwd = selection.path, hidden = true, no_ignore = true }
                end,
              },
            },
          },
        },
      }
      return require("astronvim.utils").extend_tbl(opts, new_opts)
    end,

    config = function(plugin, opts)
      require "plugins.configs.telescope"(plugin, opts)
      local telescope = require "telescope"
      telescope.load_extension "dap"
      telescope.load_extension "live_grep_args"
      telescope.load_extension "file_browser"
      telescope.load_extension "ast_grep"
      telescope.load_extension "zoxide"
      telescope.load_extension "luasnip"
      telescope.load_extension "projects"
    end,
  },
}
