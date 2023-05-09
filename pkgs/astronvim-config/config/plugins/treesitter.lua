local utils = function(tbl, vals)
  if type(vals) ~= "table" then
    vals = { vals }
  end
  for _, val in ipairs(vals) do
    if not vim.tbl_contains(tbl, val) then
      table.insert(tbl, val)
    end
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      if type(opts.ensure_installed) == "table" then
        utils(opts.ensure_installed, { "bash", "markdown", "markdown_inline", "regex", "vim" })
      end
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "andymass/vim-matchup",
        init = function()
          vim.g.matchup_matchparen_deferred = 1
        end,
      },
      {
        "HiPhish/nvim-ts-rainbow2",
        config = function()
          vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
            callback = function()
              vim.cmd.TSDisable("rainbow")
              vim.cmd.TSEnable("rainbow")
            end,
          })
        end,
      },
    },
    opts = {
      auto_install = true,
      highlight = { disable = { "help" } },
      matchup = { enable = true },
      rainbow = { enable = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
  },
}
