---@type LazySpec
return {
  "andweeb/presence.nvim",

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████╗ ████████╗██████╗ ██╗   ██╗ ██████╗ ███████╗",
            "██╔══██╗╚══██╔══╝██╔══██╗██║   ██║██╔═══██╗██╔════╝",
            "███████║   ██║   ██║  ██║██║   ██║██║   ██║███████╗",
            "██╔══██║   ██║   ██║  ██║██║   ██║██║   ██║╚════██║",
            "██║  ██║   ██║   ██████╔╝╚██████╔╝╚██████╔╝███████║",
            "╚═╝  ╚═╝   ╚═╝   ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝",
          }, "\n"),
        },
      },
    },
  },

  { "max397574/better-escape.nvim", enabled = false },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      }, Rule("a", "a", "-vim"))
    end,
  },
  {
    "andrewferrier/wrapping.nvim",
    opts = {
      auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "mail",
        "markdown",
        "rst",
        "tex",
        "text",
      },
    },
    config = function(_, opts) require("wrapping").setup(opts) end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function() require("tiny-inline-diagnostic").setup() end,
  },
}
