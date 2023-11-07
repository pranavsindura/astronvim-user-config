-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>ff"] = {
      function() require("telescope.builtin").find_files { previewer = false } end,
      desc = "Find files",
    },
    ["<leader>fF"] = {
      function() require("telescope.builtin").find_files { previewer = false, hidden = true, no_ignore = true } end,
      desc = "Find all files",
    },
    ["<leader>bx"] = {
      function()
        require("harpoon.mark").add_file()
        require("notify")("Added Harpoon Mark", "info", {
          title = "Harpoon"
        })
      end,
      desc = "Add Harpoon Mark",
    },
    ["<leader>fx"] = {
      "<cmd>Telescope harpoon marks<CR>",
      desc = "Find Harpoon Marks",
    },
    ["]h"] = {
      function()
        require("harpoon.ui").nav_next() -- navigates to next mark
      end,
      desc = "Next Harpoon Mark",
    },
    ["[h"] = {
      function()
        require("harpoon.ui").nav_prev() -- navigates to prev mark
      end,
      desc = "Previous Harpoon Mark",
    },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
