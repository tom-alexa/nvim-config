-- Nvim Treesitter
-- to create Abstract Syntax Tree

-- Highlight, edit, and navigate code

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { 'bash', 'c', 'cpp', 'lua', 'markdown', 'python', 'vim', 'vimdoc' },

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
