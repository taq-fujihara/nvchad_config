return {
  "nvim-tree/nvim-tree.lua",
  config = {
    git = {
      enable = true,
      ignore = false,
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
    view = {
      side = "right",
    },
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      local function my_copy(n)
        api.fs.copy.node(n)
        api.fs.paste(n)
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'c', my_copy, opts('Copy'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    end,
  },
}
