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
    "jose-elias-alvarez/typescript.nvim",
    config = function ()
      require("typescript").setup({})
    end
  },
  {
    "sainnhe/sonokai",
    init = function() -- init function runs before the plugin is loaded
      vim.g.sonokai_style = "default"
    end,
  },
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   config = function()
  --       require("monokai-pro").setup {
  --       filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  --   }
  --   end
  -- },
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
