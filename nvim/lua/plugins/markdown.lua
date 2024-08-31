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

      hybrid_modes = { "n", "i" },     -- Uses this feature on
      -- highlight_groups = hl_presets.h_decorated,
      -- headings = heading_presets.decorated_labels,
      -- This is nice to have
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2;
          vim.wo[win].concealcursor = "c";
        end
      }
    })
    vim.cmd("Markview enableAll")
  end
}
