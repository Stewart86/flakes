return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    sources = {
      -- you must download code formatter by yourself!
      require("null-ls").builtins.formatting.beautysh,
    },
  },
}
