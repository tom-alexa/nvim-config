-- Which Key

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    -- "vim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  opts = {
    preset = "modern", -- <classic, modern, helix>
    spec = {
      { "<leader>s", group = "[S]earch", icon = { icon = "", color = "green", cat = "file" } },
      { "<leader>f", icon = { icon = "󰝔", color = "purple" } },
      { "<leader>l", icon = { icon = "", color = "orange" } },
      { "<leader>t", group = "[T]odos", icon = { icon = "", color = "yellow" } },
      { "<leader>ta", icon = { icon = "󰄭", color = "cyan" } },
      { "<leader>te", icon = { icon = "", color = "red" } },
      { "<leader>tn", icon = { icon = "", color = "blue" } },
      { "<leader>ts", icon = { icon = "󰅒", color = "orange" } },
      { "<leader>g", group = "[G]it", icon = { icon = "󰊢", color = "orange" } },
      { "<leader>gt", group = "[T]oggle", icon = { icon = "", color = "orange" } },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
