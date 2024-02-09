---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>pt"] = { "" },
    ["<leader>ph"] = { "" },
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- basics
    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>q"] = { "<cmd> q <CR>", "Close file" },
    ["<leader>n"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>p"] = { "<cmd> Telescope commands <CR>", "Command Pallet" },

    -- editing
    ["<leader>j"] = { "*``cgn", "Replace word under cursor" },

    -- panes
    ["|"] = { "<cmd> vsplit <CR>", "Split Pane Vertically" },
    ["-"] = { "<cmd> split <CR>", "Split Pane Horizontally" },
    ["gt"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["gT"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- git
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "LazyGit" },

    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle Transparency",
    },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    -- focus
    ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

return M
