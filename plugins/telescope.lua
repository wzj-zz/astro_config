local live_grep_args = { "nvim-telescope/telescope-live-grep-args.nvim" }

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

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { live_grep_args, ast_grep },

    opts = function(_, opts)
      local live_grep_args_actions = require "telescope-live-grep-args.actions"

      local new_opts = {
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
        },
      }
      return require("astronvim.utils").extend_tbl(opts, new_opts)
    end,

    config = function(...)
      require "plugins.configs.telescope"(...)
      local telescope = require "telescope"
      telescope.load_extension "live_grep_args"
      telescope.load_extension "ast_grep"
    end,
  },
}
