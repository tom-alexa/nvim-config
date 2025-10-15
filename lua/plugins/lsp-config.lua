-- Language Server Protocol Configuration

-- LSP Configuration & Plugins

-- TODO: Add code action
-- TODO: Add go to definition
-- TODO: Add go to declaration
-- TODO: Add go to header file or source file
-- TODO: Add rename "gr"
-- vim.lsp.buf ...

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls", "clangd", "pyright", "gopls" } },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

      -- lua_ls setup
      vim.lsp.config("lua_ls", {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
              path ~= vim.fn.stdpath("config")
              and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using (most
              -- likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
              -- Tell the language server how to find Lua modules same way as Neovim
              -- (see `:h lua-module-load`)
              path = {
                "lua/?.lua",
                "lua/?/init.lua",
              },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- Depending on the usage, you might want to add additional paths
                -- here.
                -- '${3rd}/luv/library'
                -- '${3rd}/busted/library'
              },
              -- Or pull in all of 'runtimepath'.
              -- NOTE: this is a lot slower and will cause issues when working on
              -- your own configuration.
              -- See https://github.com/neovim/nvim-lspconfig/issues/3189
              -- library = {
              --   vim.api.nvim_get_runtime_file('', true),
              -- }
            },
          })
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- clangd setup
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = { "clangd", "--query-driver=/usr/bin/g++" },
      })
      vim.keymap.set("n", "grh", function()
        vim.cmd([[ClangdSwitchSourceHeader]])
      end, { desc = "[G]o to the header/source file" })
      -- TODO: Add descriptions to keymaps groups

      -- pyright
      vim.lsp.config("pyright", {})

      -- gopls
      vim.lsp.config("gopls", {})
    end,
  },
}
