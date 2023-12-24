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
    ["<leader>T"] = { name = "Tabs" },
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>ff"] = {
      function() require("telescope.builtin").find_files { previewer = false } end,
      desc = "Find files",
    },
    ["<leader>fF"] = {
      function() require("telescope.builtin").find_files { previewer = false, hidden = true, no_ignore = true } end,
      desc = "Find all files",
    },
    ["<leader>fx"] = {
      ":TroubleToggle<CR>",
      desc = "Toggle Trouble",
    },
    ["]x"] = {
      function() require("trouble").next { skip_groups = true, jump = true } end,
      desc = "Next Trouble Item",
    },
    ["[x"] = {
      function() require("trouble").previous { skip_groups = true, jump = true } end,
      desc = "Previous Trouble Item",
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
    ["<leader>m"] = {
      function() require("treesj").toggle() end,
      desc = "Toggle Code Join / Split",
    },
    ["<leader>r"] = {
      ":Ranger<CR>",
      desc = "Open Ranger",
    },
    ["ga."] = {
      "<cmd>TextCaseOpenTelescope<CR>",
      desc = "Open TextCase",
    },
    ["<leader>gd"] = {
      function()
        vim.cmd "tabnew %"
        require("gitsigns").diffthis()
      end,
      desc = "View Git diff",
    },
    ["<leader>Tc"] = {
      ":tabclose<cr>",
      desc = "Close current Tab",
    },
    ["dh"] = {
      function()
        local current_diffopt = vim.o.diffopt
        vim.cmd "set diffopt&"
        vim.cmd "diffget /:2"
        vim.cmd("set diffopt=" .. current_diffopt)
        vim.cmd "diffupdate"
      end,
      desc = "Get Current Change",
    },
    ["dl"] = {
      function()
        local current_diffopt = vim.o.diffopt
        vim.cmd "set diffopt&"
        vim.cmd "diffget /:3"
        vim.cmd("set diffopt=" .. current_diffopt)
        vim.cmd "diffupdate"
      end,
      desc = "Get Incoming Change",
    },
  },
  t = {},
  v = {
    [">"] = {
      ">gv",
      desc = "Indent Right",
    },
    ["<"] = {
      "<gv",
      desc = "Indent Left",
    },
    ["ga."] = {
      "<cmd>TextCaseOpenTelescope<CR>",
      desc = "Open TextCase",
    },
  },
  i = {
    ["<C-H>"] = "<LEFT>",
    ["<C-J>"] = "<DOWN>",
    ["<C-K>"] = "<UP>",
    ["<C-L>"] = "<RIGHT>",
    ["<C-;>"] = "<BS>",
  },
}
