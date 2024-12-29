return {

  {
    "sphamba/smear-cursor.nvim", -- animation idk just for fun
    enabled = false,
    opts = {
      -- Super experimental I dont know what i'm doing
      stiffness = 0.5, -- 0.6      [0, 1]
      trailing_stiffness = 0.3, -- 0.3      [0, 1]
      distance_stop_animating = 0.1, -- 0.1      > 0
      hide_target_hack = false, -- true     boolean
    },
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
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --   -- set colorscheme
    --   vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
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
        local clients = vim.lsp.get_clients({ bufnr = 0 })
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
          -- theme = "catppuccin",
          theme = "gruvbox",
          -- theme = "solarized",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "TelescopePrompt", "lazy" },
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
  --- NOTE : SUPER TEMPORARY I CAN REMOVE IT ANY TIME
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
  --     { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  --     { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
  --     { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  --     { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
  --     { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  --   },
  --   opts = {
  --     options = {
  --       mode = "buffers",
  --       diagnostics = "nvim_lsp",
  --       diagnostics_indicator = function(count, level)
  --         local icon = level:match("error") and " " or " "
  --         return " " .. icon .. count
  --       end,
  --       -- Configure as per catppuccin theme since you're using it
  --       themable = true,
  --       separator_style = "thin",
  --       show_buffer_close_icons = true,
  --       show_close_icon = false,
  --       color_icons = true,
  --       -- Show LSP and file icons
  --       get_element_icon = function(element)
  --         local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
  --         return icon, hl
  --       end,
  --       -- Custom indicators
  --       indicators = {
  --         modified = "●",
  --         pinned = "車",
  --       },
  --       -- Group configuration
  --       groups = {
  --         options = {
  --           toggle_hidden_on_enter = true,
  --         },
  --         items = {
  --           {
  --             name = "Tests",
  --             priority = 2,
  --             icon = "",
  --             matcher = function(buf)
  --               return buf.filename:match("_test") or buf.filename:match("test_")
  --             end,
  --           },
  --           {
  --             name = "Docs",
  --             priority = 3,
  --             icon = "",
  --             matcher = function(buf)
  --               return buf.filename:match("%.md") or buf.filename:match("%.txt")
  --             end,
  --           },
  --         },
  --       },
  --       -- Hide certain filetypes from bufferline
  --       custom_filter = function(buf_number, _)
  --         local exclude_ft = { "qf", "fugitive", "git", "oil" }
  --         local ft = vim.bo[buf_number].filetype
  --         return not vim.tbl_contains(exclude_ft, ft)
  --       end,
  --     },
  --     -- Match with your catppuccin theme
  --     -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
  --   },
  -- },
}
