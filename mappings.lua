
local M = {}

--=========================================================================================

M.disabled = {
  n = {
      ["<A-i>"] = "",             -- nvterm
      ["<A-h>"] = "",
      ["<A-v>"] = "",
      ["<leader>h"] = "",
      ["<leader>v"] = "",
      ["<leader>wK"] = "",        -- whichkey
      ["<leader>wk"] = "",
  },
  t = {
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
  },
}

--=========================================================================================

M.general = {
  n = {
    ["<leader><space>"] = { ":noh<CR>", "cancel the search highlight" },
    ["<leader>w"] = { ":w<CR>", "save buffer" },
    ["<leader>wc"]  = { "g<C-g>", "word count" },
    ["<leader>rtw"] = { ":%s/\\s\\+$//e<CR>", "remove trailing whitespace" },
    ["<leader>zt"]  = { ":<C-u>exec 'normal! ' . 15 . 'kzt' . 15 . 'j' <CR>",
            "scroll so cursor is 15 lines from the top", opts = { silent = true } },
    ["<leader>s"] = { "<cmd> Ouroboros<CR>", "switch between header and source file" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree file explorer" },
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<leader>wc"] = { "g<C-g>", "word count" },
  },
  i = {
    ["<leader>wc"] = { "g<C-g>", "word count" },
  },
  t = {
    ["<Esc>"] = { "<C-\\><C-n>", "terminal escape to normal mode" },
  },
}

--=========================================================================================

M.maximizer = {
    n = {
        ["<leader>m"]  = { "<cmd> MaximizerToggle!<CR>", "toggle maximize window" },
    }
}

--=========================================================================================

M.telescope = {
    n = {
        ["<leader>f"]  = { "<cmd> Telescope git_files <CR>", "Find git project files" },
    }
}

--=========================================================================================

M.neoterm = {
    n = { ["<leader>r"]  = { "<cmd> Ttoggle<CR>", "toggle terminal" } },
    i = { ["<leader>r"]  = { "<cmd> Ttoggle<CR>", "toggle terminal" } },
    t = { ["<leader>r"]  = { "<cmd> Ttoggle<CR>", "toggle terminal" } },
}

--=========================================================================================

M.nvim_tmux_navigation = {
    n = {
        ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<CR>" },
        ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<CR>" },
        ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<CR>"   },
        ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<CR>"},
    }
}
--=========================================================================================

-- neoscroll: see mappings in plugins file

--=========================================================================================

M.map_buffers = {
    n = {
        ["<leader>1"] = {"<cmd>b1<CR>", "switch to buffer 1"},
        ["<leader>2"] = {"<cmd>b2<CR>", "switch to buffer 2"},
        ["<leader>3"] = {"<cmd>b3<CR>", "switch to buffer 3"},
        ["<leader>4"] = {"<cmd>b4<CR>", "switch to buffer 4"},
        ["<leader>5"] = {"<cmd>b5<CR>", "switch to buffer 5"},
        ["<leader>6"] = {"<cmd>b6<CR>", "switch to buffer 6"},
        ["<leader>7"] = {"<cmd>b7<CR>", "switch to buffer 7"},
        ["<leader>8"] = {"<cmd>b8<CR>", "switch to buffer 8"},
        ["<leader>9"] = {"<cmd>b9<CR>", "switch to buffer 9"},
    }
}

--=========================================================================================

return M
