return {
  "nvim-neotest/neotest",
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup {
      adapters = {
        require "neotest-python",
        require "neotest-jest",
      },
      jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand "%:p:h") .. " --watch",
    }
  end,
  ft = { "rust", "python" },
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "rouge8/neotest-rust",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
  },
}
