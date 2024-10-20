return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Set colorscheme
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    keys = {
      {
        "<leader>nn",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss All Notifications",
      },
    },
    config = function()
      local notify = require("notify")
      notify.setup({
        render = "minimal",
        stages = "fade",
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }),
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  -- Lua
  {
    "folke/zen-mode.nvim", -- TODO : Check the docs of zen mode
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "tris203/precognition.nvim",
    --event = "VeryLazy", -- PERF : Lazyload ?
    opts = {
      -- startVisible = true,
      -- showBlankVirtLine = true,
      -- highlightColor = { link = "Comment" },
      -- hints = {
      --      Caret = { text = "^", prio = 2 },
      --      Dollar = { text = "$", prio = 1 },
      --      MatchingPair = { text = "%", prio = 5 },
      --      Zero = { text = "0", prio = 1 },
      --      w = { text = "w", prio = 10 },
      --      b = { text = "b", prio = 9 },
      --      e = { text = "e", prio = 8 },
      --      W = { text = "W", prio = 7 },
      --      B = { text = "B", prio = 6 },
      --      E = { text = "E", prio = 5 },
      -- },
      -- gutterHints = {
      --     G = { text = "G", prio = 10 },
      --     gg = { text = "gg", prio = 9 },
      --     PrevParagraph = { text = "{", prio = 8 },
      --     NextParagraph = { text = "}", prio = 8 },
      -- },
      -- disabled_fts = {
      --     "startify",
      -- },
    },
  },
  {
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
  },
  -- TODO : Read docs
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ mode = "n", auto = true })
        end,
        desc = "Show all keymaps",
      },
    },
  },
}
