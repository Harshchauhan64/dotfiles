return {
  "stevearc/oil.nvim",
  lazy = true,
  cmd = "Oil",
  event = "VeryLazy",
  opts = {},
  config = function()
    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      columns = {
        "icon",
        --"permissions", "size","mtime",
      },
      view_options = {
        show_hidden = true,
        natural_order = "fast",
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      -- Use - to toggle oil
      keymaps = {
        ["\\"] = "actions.close",
        ["q"] = "actions.close",
        ["v"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-CR>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        -- ["P"] = "actions.preview",
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
      -- Floating window configuration
      float = {
        padding = 3,
        max_width = 100,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 10,
        },
        preview_split = "right",
        override = function(conf)
          return conf
        end,
      },
    })
  end,
}
