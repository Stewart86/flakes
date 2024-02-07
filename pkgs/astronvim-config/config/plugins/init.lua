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
    config = { background_colour = "#000000" },
  },
  {
    "eandrju/cellular-automaton.nvim",
    opts = true,
    lazy = true,
    cmd = "CellularAutomaton",
    keys = {
      { "<leader>gof",  "<cmd>CellularAutomaton game_of_life<CR>", desc = "game of life" },
      { "<leader>rain", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "make it rain" },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufEnter",
  },
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", event = "LspAttach", opts = {} },
  {
    "willothy/flatten.nvim",
    opts = {},
    lazy = false,
    priority = 1001,
  },
  {
    "andythigpen/nvim-coverage",
    event = "User AstroFile",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
-- to be included
-- andythigpen/nvim-coverage
-- EthanJWright/vs-tasks.nvim
-- vuki656/package-info.nvim
