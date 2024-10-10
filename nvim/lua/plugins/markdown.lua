return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway
  config = function()
    -- local markview = require("markview")
    -- local presets = require("markview.presets")
    -- local heading_presets = require("markview.presets").headings;
    -- local hl_presets = require("markview.presets").highlight_groups;
    require("markview").setup({
      modes = { "n", "no", "c", "i" }, -- Change these modes

      hybrid_modes = { "n", "i" }, -- Uses this feature on
      -- highlight_groups = hl_presets.h_decorated,
      -- headings = heading_presets.decorated_labels,
      -- This is nice to have
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].concealcursor = "c"
        end,
      },
      list_items = {
        enable = true,

        --- Amount of spaces that defines an indent
        --- level of the list item.
        ---@type integer
        indent_size = 2,

        --- Amount of spaces to add per indent level
        --- of the list item.
        ---@type integer
        shift_width = 4,

        marker_minus = {
          add_padding = true,
          text = "",
          hl = "MarkviewListItemMinus",
        },
        marker_plus = {
          add_padding = true,

          text = "",
          hl = "MarkviewListItemPlus",
        },
        marker_star = {
          add_padding = true,

          text = "",
          hl = "MarkviewListItemStar",
        },

        --- These items do NOT have a text or
        --- a hl property!

        --- n. Items
        marker_dot = {
          add_padding = true,
        },

        --- n) Items
        marker_parenthesis = {
          add_padding = true,
        },
      },
    })
    vim.cmd("Markview enableAll")
  end,
}
