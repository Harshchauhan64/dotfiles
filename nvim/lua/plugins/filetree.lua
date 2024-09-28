return {
  "stevearc/oil.nvim",
  opts = {},
  config = function()
    require("oil").setup({
      -- Oil configuration options go here
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
        ["-"] = "actions.parent",
        ["<C-h>"] = false,
      },
      -- You can add more options here
    })
  end,
}
