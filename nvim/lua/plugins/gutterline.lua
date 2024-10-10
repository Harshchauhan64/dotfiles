-- TODO: modify this file for all the Ui elements.
-- Add which key and move themes here
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function oil_status()
      if vim.bo.filetype == "oil" then
        return "Oil"
      end
      return ""
    end

    local function fzf_status()
      if vim.bo.filetype == "fzf" then
        return "FZF"
      end
      return ""
    end

    local function trouble_status()
      local trouble = require("trouble")
      if trouble.is_open() then
        return "Trouble"
      end
      return ""
    end

    local function mason_status()
      if vim.bo.filetype == "mason" then
        return "Mason"
      end
      return ""
    end

    local function lsp_client_names()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #clients == 0 then
        return "No LSP"
      end
      local client_names = {}
      for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
      end
      return table.concat(client_names, ", ")
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
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
            separator = { left = "" },
            right_padding = 2,
          },
        },
        lualine_b = {
          { "branch", icon = "" },
          { "filetype", icon_only = true },
        },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          { oil_status },
          { fzf_status },
          { trouble_status },
          { mason_status },
        },
        lualine_x = {
          { "diagnostics" },
          { lsp_client_names },
        },
        lualine_y = {
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_z = { "progress" },
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
      extensions = { "oil", "fzf", "trouble", "mason", "quickfix" },
    })
  end,
}
