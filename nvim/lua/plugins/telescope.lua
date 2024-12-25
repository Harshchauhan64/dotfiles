return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
          },
        },
        extension = {
          fzf = {},
        },
      })

      -- Enable telescope fzf native, if installed
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "noice")
      pcall(telescope.load_extension, "ui-select")
    end,
  },
}
