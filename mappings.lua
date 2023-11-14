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
        require "notify"("Added Harpoon Mark", "info", {
          title = "Harpoon",
        })
      end,
      desc = "Add Harpoon Mark",
    },
    ["<leader>bX"] = {
      function()
        require("harpoon.mark").rm_file()
        require "notify"("Removed Harpoon Mark", "info", {
          title = "Harpoon",
        })
      end,
      desc = "Remove Harpoon Mark",
    },
    ["<leader>fx"] = {
      "<cmd>Telescope harpoon marks previewer=false<CR>",
      desc = "Find Harpoon Marks",
    },
    ["]x"] = {
      function()
        require("harpoon.ui").nav_next() -- navigates to next mark
      end,
      desc = "Next Harpoon Mark",
    },
    ["[x"] = {
      function()
        require("harpoon.ui").nav_prev() -- navigates to prev mark
      end,
      desc = "Previous Harpoon Mark",
    },
    ["]<space>"] = {
      "m`o<esc>``",
      desc = "Put Blank below",
    },
    ["[<space>"] = {
      "m`O<esc>``",
      desc = "Put Blank above",
    },
    ["]q"] = {
      ":cnext<CR>",
      desc = "Next Quickfix Item",
    },
    ["[q"] = {
      ":cprevious<CR>",
      desc = "Previous Quickfix Item",
    },
    ["<leader>fq"] = {
      function()
        local qf_exists = false
        for _, win in pairs(vim.fn.getwininfo()) do
          if win["quickfix"] == 1 then qf_exists = true end
        end

        if qf_exists then
          vim.cmd "cclose"
        else
          vim.cmd "copen"
        end
      end,
      desc = "Toggle Quickfix List",
    },
    ["]e"] = {
      ":move .+1<cr>",
      desc = "Move Line Below",
    },
    ["[e"] = {
      ":move .-2<cr>",
      desc = "Move Line Above",
    },
    ["]p"] = {
      "o<esc>p",
      desc = "Paste Below",
    },
    ["[p"] = {
      "O<esc>p",
      desc = "Paste Above",
    },
    ["<leader>o"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd "Neotree action=focus source=last"
        end
      end,
      desc = "Toggle Explorer Focus",
    },
    ["<leader>gd"] = {
      function ()
        vim.cmd("Gvdiffsplit")
      end,
      desc = "Git Diff - Vertical split"
    }
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    [">"] = {
      ">gv",
      desc = "Indent Right",
    },
    ["<"] = {
      "<gv",
      desc = "Indent Left",
    },

    -- ["]e"] = {
    --   ":move '>+1<cr>gv",
    --   desc = "Move Line Below",
    -- },
    -- ["[e"] = {
    --   ":move '>-2<cr>gv",
    --   desc = "Move Line Above",
    -- },
  },
}
