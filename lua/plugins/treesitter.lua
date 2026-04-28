---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  opts = function(_, opts)
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "php",
      "vue",
      "javascript",
      "typescript",
      "css",
      "scss",
      "blade",
      "php_only",
      "markdown",
      "json",
      "yaml",
      "dockerfile",
      "gitignore",
      "toml",
    })
  end,
}
