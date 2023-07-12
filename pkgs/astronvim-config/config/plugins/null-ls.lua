return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    sources = {
      -- you must download code formatter by yourself!
      require("null-ls").builtins.formatting.stylua,
      require("null-ls").builtins.formatting.black,
      require("null-ls").builtins.formatting.prettierd,
      require("null-ls").builtins.formatting.nixpkgs_fmt,
      require("null-ls").builtins.formatting.beautysh,
      require("null-ls").builtins.formatting.rustfmt,
      require("null-ls").builtins.formatting.ruff,
      require("null-ls").builtins.formatting.eslint_d,
    },
    handlers = {
      prettierd = function()
        require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
                or utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.json"
                or utils.root_has_file ".prettierrc.js"
          end,
        })
      end,
      -- For eslint_d:
      eslint_d = function()
        require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
          end,
        })
      end,
    },
  },
}
