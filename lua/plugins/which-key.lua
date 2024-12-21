-- Which Key

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = "modern", -- <classic, modern, helix>
    spec = {
        { "<leader>s", group = "[S]earch" },
        { "<leader>st", group = "[S]earch [T]odos" },
        { "<leader>h", group = "Git" },
    }
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
