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
        -- require "neotest-rust",
        require "neotest-python",
      },
    }
  end,
  ft = { "rust", "python" },
  keys = {
    { "<leader>Tt", function() require("neotest").run.run() end,                  "Run test" },
    { "<leader>Ts", function() require("neotest").summary.toggle() end,           "Toggle summary" },
    { "<leader>To", function() require("neotest").output.open() end,              "Open output" },
    { "<leader>TP", function() require("neotest").output_panel.toggle() end,      "Toggle output panel" },
    { "<leader>Tf", function() require("neotest").run.run(vim.fn.expand "%") end, "Run current file" },
  },
  dependencies = {
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    -- "nvim-neotest/neotest-rust",
  },
}
