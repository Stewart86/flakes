return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    sources = {
      -- you must download code formatter by yourself!
      require("null-ls").builtins.formatting.stylua,
      require("null-ls").builtins.formatting.black,
      require("null-ls").builtins.formatting.prettier,
      require("null-ls").builtins.formatting.nixpkgs_fmt,
      require("null-ls").builtins.formatting.beautysh,
      require("null-ls").builtins.formatting.rustfmt,
      require("null-ls").builtins.formatting.ruff,
      require("null-ls").builtins.formatting.eslint_d,
    },
    handlers = {
      -- For eslint_d:
      eslint_d = function()
        require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
          end,
          fileTypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "yaml",
            "markdown",
            "vue",
            "html",
            "css",
            "scss",
            "less",
            "graphql",
            "markdown",
          },
        })
      end,
    },
  },
}
