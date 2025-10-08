-- Language Server Protocol Configuration

-- LSP Configuration & Plugins

-- TODO: Add code action
-- TODO: Add go to definition
-- TODO: Add go to declaration
-- TODO: Add go to header file or source file
-- TODO: Add rename "gr"
-- vim.lsp.buf ...

return {
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls", "clangd", "pyright", "gopls" } },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

      -- lua_ls setup
      lspconfig.lua_ls.setup({
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              },
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
              -- library = vim.api.nvim_get_runtime_file("", true)
            },
          })
        end,
        settings = {
          Lua = {},
        },
      })

      -- clangd setup
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--query-driver=/usr/bin/g++" },
      })
      vim.keymap.set("n", "grh", function()
        vim.cmd([[ClangdSwitchSourceHeader]])
      end, { desc = "[G]o to the header/source file" })
      -- TODO: Add descriptions to keymaps groups

      -- pyright
      lspconfig.pyright.setup({})

      -- gopls
      lspconfig.gopls.setup({})
    end,
  },
}
