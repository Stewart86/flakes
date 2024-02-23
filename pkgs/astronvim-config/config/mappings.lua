-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local neotest = require "neotest"
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- buffer switch
    ["L"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["H"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>T"] = {
      name = "󰙨 Unit Test",
      t = { function() neotest.run.run() end, "Run test" },
      w = { function() neotest.watch.toggle() end, "Toggle watch test" },
      s = { function() neotest.summary.toggle() end, "Toggle summary" },
      o = { function() neotest.output.open() end, "Open output" },
      p = { function() neotest.output_panel.toggle() end, "Toggle output panel" },
      f = { function() neotest.run.run(vim.fn.expand "%") end, "Run current file" },
    },
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    ["<leader>z"] = {
      name = "Obsidian",
      f = { "<cmd>ObsidianFollowLink<CR>", "Follow Link" },
      d = { "<cmd>ObsidianToday<CR>", "Today" },
      n = { "<cmd>ObsidianNew<CR>", "New" },
      ln = { "<cmd>ObsidianLinkNew<CR>", "Link new" },
      i = { "<cmd>ObsidianLink<CR>", "Link" },
      o = { "<cmd>ObsidianOpen<CR>", "Open" },
      r = { "<cmd>ObsidianRename<CR>", "Rename" },
      s = { "<cmd>ObsidianSearch<CR>", "Search" },
      tmr = { "<cmd>ObsidianTomorrow<CR>", "Tomorrow" },
      tg = { "<cmd>ObsidianTags<CR>", "Tag" },
      ch = { "<cmd>ObsidianCheck<CR>", "Check" },
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "selection move up" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "selection move down" },
  },
}
