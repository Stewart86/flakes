return {
  {
    "nvim-treesitter/nvim-treesitter",
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   dependencies = {
  --     {
  --       "andymass/vim-matchup",
  --       init = function() vim.g.matchup_matchparen_deferred = 1 end,
  --     },
  --     {
  --       "HiPhish/nvim-ts-rainbow2",
  --       config = function()
  --         vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
  --           callback = function()
  --             vim.cmd.TSDisable "rainbow"
  --             vim.cmd.TSEnable "rainbow"
  --           end,
  --         })
  --       end,
  --     },
  --   },
  --   opts = {
  --     auto_install = true,
  --     highlight = { disable = { "help" } },
  --     matchup = { enable = true },
  --     rainbow = { enable = true },
  --   },
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   event = "BufEnter",
  -- },
}
