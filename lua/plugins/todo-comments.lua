-- todo-comments

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
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
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

    -- Add fuzzy finding with telescope
    vim.keymap.set("n", "<leader>sta", "<cmd>TodoTelescope<CR>", {desc = "[S]earch [T]odos - [A]ll"}),
    vim.keymap.set("n", "<leader>stt", "<cmd>TodoTelescope keywords=TODO<CR>", {desc = "[S]earch [T]odos - [T]odos"}),
    vim.keymap.set("n", "<leader>ste", "<cmd>TodoTelescope keywords=FIX,FIXME,BUG,FIXIT,ISSUE,WARN,WARNING,XXX<CR>", {desc = "[S]earch [T]odos - [E]rrors"}),
    vim.keymap.set("n", "<leader>sts", "<cmd>TodoTelescope keywords=TEST,TESTING,PASSED,FAILED<CR>", {desc = "[S]earch [T]odos - Te[S]ting"}),
    vim.keymap.set("n", "<leader>stn", "<cmd>TodoTelescope keywords=NOTE,INFO<CR>", {desc = "[S]earch [T]odos - [N]otes"}),
  },
}
