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
          scroll_strategy = "limit",
          mappings = {
            n = {
              ["<esc>"] = require("telescope.actions").close,
              ["J"] = require("telescope.actions").preview_scrolling_down,
              ["K"] = require("telescope.actions").preview_scrolling_up,
            },
            i = {

              ["<esc>"] = require("telescope.actions").close,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["J"] = require("telescope.actions").preview_scrolling_down,
              ["K"] = require("telescope.actions").preview_scrolling_up,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case",
          },
        },
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  },
}
