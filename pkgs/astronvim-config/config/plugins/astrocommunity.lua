local utils = require "astronvim.utils"
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },

  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.lsp.lsp-lens-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },

  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  { import = "astrocommunity.git.git-blame-nvim" },

  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  { import = "astrocommunity.terminal-integration.flatten-nvim" },

  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },

  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      return utils.extend_tbl(opts, {
        lsp = {
          signature = {
            enabled = false,
          },
          }
        }
      )
    end,
  },
  { import = "astrocommunity.utility.nvim-toggler" },

  { import = "astrocommunity.test.nvim-coverage" },
}
