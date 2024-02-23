return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    sources = {
      -- you must download code formatter by yourself!
      require("null-ls").builtins.formatting.stylua,
      require("null-ls").builtins.formatting.black,
      require("null-ls").builtins.formatting.ruff,
      require("null-ls").builtins.formatting.nixpkgs_fmt,
      require("null-ls").builtins.formatting.beautysh,
      require("null-ls").builtins.formatting.eslint_d,
      require("null-ls").builtins.formatting.prettierd,

      require("null-ls").builtins.diagnostics.eslint_d,

      require("null-ls").builtins.code_actions.eslint_d,
      require("null-ls").builtins.code_actions.refactoring,

      require("null-ls").builtins.hover.dictionary,

      require("null-ls").builtins.completion.spell,
    },
  },
}
