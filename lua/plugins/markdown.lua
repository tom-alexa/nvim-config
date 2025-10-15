return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  },
}
