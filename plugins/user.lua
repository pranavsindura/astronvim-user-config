return {
  {
    "tpope/vim-fugitive",
    event = "User AstroGitFile"
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false
  },
  {
    "MunifTanjim/eslint.nvim",
    dependencies = { "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
    config = function()
      require("eslint").setup()
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
    opts = {},
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup {
        filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    }
    end
  },
  {
    "tpope/vim-sleuth",
    event = "User AstroFile"
  }
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
