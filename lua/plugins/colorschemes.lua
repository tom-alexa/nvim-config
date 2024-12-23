-- Colorschemes

return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokynight",
  },
  {
    "xiantang/darcula-dark.nvim",
    name = "darcula-dark",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
}
