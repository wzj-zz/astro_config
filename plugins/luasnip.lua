return {
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "plugins.configs.luasnip"(plugin, opts)

      -- load snippets paths
      require("luasnip.loaders.from_lua").lazy_load {
        paths = { "./lua/user/snippets/lua" },
      }

      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "./lua/user/snippets/vscode" },
      }

      require("luasnip.loaders.from_snipmate").lazy_load {
        paths = { "./lua/user/snippets/snipmate" },
      }
    end,
  },
}
