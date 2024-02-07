return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "andymass/vim-matchup",
        init = function() vim.g.matchup_matchparen_deferred = 1 end,
      },
    },
    opts = {
      auto_install = false,
      highlight = { disable = { "help" } },
      matchup = { enable = true },
      ensure_installed = { "markdown", "markdown_inline" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
  },
}
