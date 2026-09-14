local options = {
  ensure_installed = {
    "bash",
    "fish",
    "lua",
    "luadoc",
    "markdown",
    "printf",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "typescript",
    "tsx",
    "javascript",
    "html",
    "css",
    "astro",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter").setup(options)
