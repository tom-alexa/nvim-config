-- Todo Comments

-- Highlight todo, notes, etc in comments

-- PERF: fully optimized
-- PERFORMANCE: fully optimized
-- OPTIM: fully optimized
-- OPTIMIZE: fully optimized

-- HACK: hmmm, this looks a bit funky

-- TODO: What else?

-- NOTE: Adding a note
-- INFO: Adding a note

-- FIX: this needs fixing
-- FIXME: this needs fixing
-- BUG: this needs fixing
-- FIXIT: this needs fixing
-- ISSUE: this needs fixing

-- WARN: Warning
-- WARNING: Warning
-- XXX: Warning

-- TEST: Test this
-- TESTING: Test this
-- PASSED: Test this
-- FAILED: Test this

return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {

    -- Add signs in the sign bar
    signs = true,
    sign_priority = 6,

    -- Add keymaps for next jump
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" }),

    -- Add keymaps for previous jump
    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" }),

    -- TODO: add to keys option
    -- Add fuzzy finding with telescope
    vim.keymap.set("n", "<leader>ta", "<cmd>TodoTelescope<CR>", { desc = "[T]odos - [A]ll" }),
    vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope keywords=TODO<CR>", { desc = "[T]odos - [T]odos" }),
    vim.keymap.set(
      "n",
      "<leader>te",
      "<cmd>TodoTelescope keywords=FIX,FIXME,BUG,FIXIT,ISSUE,WARN,WARNING,XXX<CR>",
      { desc = "[T]odos - [E]rrors" }
    ),
    vim.keymap.set(
      "n",
      "<leader>ts",
      "<cmd>TodoTelescope keywords=TEST,TESTING,PASSED,FAILED<CR>",
      { desc = "[T]odos - Te[S]ting" }
    ),
    vim.keymap.set("n", "<leader>tn", "<cmd>TodoTelescope keywords=NOTE,INFO<CR>", { desc = "[T]odos - [N]otes" }),
  },
}
