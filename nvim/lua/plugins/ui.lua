return {
  {
    "norcalli/nvim-colorizer.lua",
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    event = "VeryLazy",
    priority = 1000,
    config = function()
      -- Set colorscheme
      vim.g.gruvbox_sign_column = "none"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
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
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  -- Lua
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

      require("lualine").setup({
        options = {
          theme = "gruvbox-material", -- {"gruvbox-material","gruvbox_dark"}
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "lazy" },
            winbar = { "dashboard", "alpha", "TelescopePrompt", "lazy" },
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
            { "branch", icon = "" },
          },
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 1,
              newfile_status = true,
              symbols = { modified = "+", readonly = "RO", unnamed = "NEW" },
            },
            { oil_status },
            { fzf_status },
            { trouble_status },
            { mason_status },
          },
          lualine_x = {
            { "diagnostics" },
            { "filetype", icon_only = true },
          },
          lualine_y = {
            -- { this is just diff (staged,modified,added)
            --   "diff",
            --   symbols = { added = " ", modified = " ", removed = " " },
            -- },
            { "selectioncount" },
            { "searchcount", maxcount = 999, timeout = 500 },
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
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = function(ctx)
        return ctx.plugin and 400 or 800
      end,
    },
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
  --- NOTE : super temporary
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {},
  },
}
