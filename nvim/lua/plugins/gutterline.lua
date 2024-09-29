return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function lsp_diagnostics()
      local counts = { errors = 0, warnings = 0, info = 0, hints = 0 }
      local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
      }
      for k, level in pairs(levels) do
        counts[k] = #vim.diagnostic.get(0, { Severity = level })
      end
      local errors = counts.errors > 0 and string.format(" %d", counts.errors) or ""
      local warnings = counts.warnings > 0 and string.format(" %d", counts.warnings) or ""
      local info = counts.info > 0 and string.format(" %d", counts.info) or ""
      local hints = counts.hints > 0 and string.format(" %d", counts.hints) or ""
      return errors .. warnings .. info .. hints
    end

    require("lualine").setup({
      options = {
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "TelescopePrompt" },
          winbar = { "dashboard", "alpha", "TelescopePrompt" },
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
        lualine_x = {
          { lsp_diagnostics },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "encoding", separator = "", padding = { left = 0, right = 1 } },
          { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = { "nvim-tree", "toggleterm", "quickfix" },
    })
  end,
}
