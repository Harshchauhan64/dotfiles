return {
  "stevearc/oil.nvim",
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
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      -- Use - to toggle oil
      keymaps = {
        ["\\"] = "actions.close",
        ["q"] = "actions.close",
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
      -- Floating window configuration
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 10,
        },
      },
    })
  end,
}
