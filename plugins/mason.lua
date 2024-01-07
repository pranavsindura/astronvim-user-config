-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "lua_ls",
      })
      opts.handlers = {
        ["clangd"] = function()
          local lspconfig = require "lspconfig"
          lspconfig.clangd.setup {
            cmd = {
              "clangd",
              "--offset-encoding=utf-16",
            },
          }
        end,
      }
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        -- "stylua",
      })

      opts.handlers = {
        eslint_d = function(_source_name, _methods)
          local null_ls = require "null-ls"
          -- Skip formatting using eslint_d for speed
          -- null_ls.register(null_ls.builtins.formatting.eslint_d)
          null_ls.register(null_ls.builtins.diagnostics.eslint_d)
          null_ls.register(null_ls.builtins.code_actions.eslint_d)
        end,
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}
