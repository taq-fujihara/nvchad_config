require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

map("n", "<leader>w", "<cmd> w <CR>", { desc = "Save file"} )
map("n", "<leader>q", "<cmd> q <CR>",  { desc = "Close file"} )
map("n", "<leader>n", "<cmd> enew <CR>",  { desc = "New buffer"} )
map("n", "<leader>p", "<cmd> Telescope commands <CR>")

map("n", "<leader>j", "*``cgn", { desc = "Replace word under cursor" })

map("n", "|", "<cmd> vsplit <CR>", { desc = "Split Pane Vertically" })
map("n", "-", "<cmd> split <CR>", { desc = "Split Pane Horizontally" })

map("n", "gt", function() require("nvchad.tabufline").tabuflineNext() end, { desc = "Goto next buffer" })
map("n", "gT", function() require("nvchad.tabufline").tabuflinePrev() end, { desc = "Goto previous buffer" })

map("n", "<leader>gg", "<cmd> LazyGit <CR>", { desc = "LazyGit" })

map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>o", "<cmd> NvimTreeFocus <CR>", { desc = "Focus nvimtree" })
