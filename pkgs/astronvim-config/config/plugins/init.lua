return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        ui = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = { background_colour = "#000000" },
  },
}
