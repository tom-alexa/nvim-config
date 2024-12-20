-- Colorschemes


return {
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'folke/tokyonight.nvim',
    name = 'tokynight',
  },
  {
    'xiantang/darcula-dark.nvim',
    name = 'darcula-dark',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },
}
