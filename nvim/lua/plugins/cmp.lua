return {
  {
    "saghen/blink.cmp",
    enabled = function()
      return not vim.tbl_contains({
        "oil",
        "Telescope",
        "TelescopePrompt",
      }, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      "onsails/lspkind.nvim",
    },
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<Up>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Down>"] = { "select_next", "snippet_forward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
        ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      sources = {
        default = {
          "luasnip",
          "snippets",
          "lsp",
          "path",
          "buffer",
          "lazydev",
        },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            module = "blink.cmp.sources.lsp",
            fallbacks = { "snippets", "luasnip", "buffer" },
            score_offset = 85, -- the higher the number, the higher the priority
          },
          luasnip = {
            name = "luasnip",
            enabled = true,
            module = "blink.cmp.sources.luasnip",
            min_keyword_length = 2,
            fallbacks = { "snippets" },
            score_offset = 85, -- the higher the number, the higher the priority
          },
          path = {
            name = "Path",
            module = "blink.cmp.sources.path",
            score_offset = 3,
            fallbacks = { "snippets", "luasnip", "buffer" },
            opts = {
              trailing_slash = false,
              label_trailing_slash = true,
              get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end,
              show_hidden_files_by_default = true,
            },
          },
          buffer = {
            name = "Buffer",
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 2,
          },
          snippets = {
            name = "snippets",
            enabled = true,
            module = "blink.cmp.sources.snippets",
            score_offset = 85, -- the higher the number, the higher the priority
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 90,
          },
        },
        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end

          -- Commands
          if type == ":" then
            return { "cmdline" }
          end
          return {}
        end,
      },
      completion = {
        list = {
          selection = function(ctx)
            return ctx.mode == "cmdline" and "auto_insert" or "preselect"
          end,
        },
        accept = { auto_brackets = { enabled = true } },
        menu = {
          border = "rounded",

          cmdline_position = function()
            if vim.g.ui_cmdline_pos ~= nil then
              local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
              return { pos[1] - 1, pos[2] }
            end
            local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
            return { vim.o.lines - height, 0 }
          end,

          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "kind" },
            },
            components = {
              kind_icon = {
                text = function(item)
                  local kind = require("lspkind").symbol_map[item.kind] or ""
                  return kind .. " "
                end,
                highlight = "CmpItemKind",
              },
              label = {
                text = function(item)
                  return item.label
                end,
                highlight = "CmpItemAbbr",
              },
              kind = {
                text = function(item)
                  return item.kind
                end,
                highlight = "CmpItemKind",
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 550,
          treesitter_highlighting = true,
          window = { border = "rounded" },
        },
        ghost_text = { enabled = true },
      },
      snippets = {
        expand = function(snippet)
          require("luasnip").lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require("luasnip").jumpable(filter.direction)
          end
          return require("luasnip").in_snippet()
        end,
        jump = function(direction)
          require("luasnip").jump(direction)
        end,
      },
      -- Experimental signature help support
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
    },
    opts_extend = { "sources.default" },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = { "InsertEnter", "CmdlineEnter" },
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-nvim-lua",
  --     "hrsh7th/cmp-cmdline",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     {
  --       "L3MON4D3/LuaSnip",
  --       dependencies = { "rafamadriz/friendly-snippets" },
  --       config = function()
  --         require("luasnip.loaders.from_vscode").lazy_load() -- PERF: lazy_loading the snips
  --       end,
  --     },
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --     local docs_closed_by_user = true
  --     local toggle_docs = function()
  --       if cmp.visible_docs() then
  --         cmp.close_docs()
  --         docs_closed_by_user = true
  --       else
  --         cmp.open_docs()
  --         docs_closed_by_user = false
  --       end
  --     end
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       window = {
  --         documentation = cmp.config.window.bordered(),
  --         completion = cmp.config.window.bordered(),
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }),
  --         ["<C-y>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }),
  --         ["<Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_next_item()
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<S-Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_prev_item()
  --           elseif luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<C-x>"] = cmp.mapping(toggle_docs, { "i", "c" }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "nvim_lua" },
  --         { name = "luasnip" },
  --       }, {
  --         { name = "buffer" },
  --       }),
  --       experimental = { ghost_text = true },
  --       view = {
  --         docs = {
  --           auto_open = true,
  --         },
  --       },
  --       event_handlers = {
  --         ["complete_done"] = function()
  --           if not docs_closed_by_user then
  --             cmp.open_docs()
  --           end
  --         end,
  --       },
  --     })
  --     -- `:` cmdline setup.
  --     cmp.setup.cmdline(":", {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = cmp.config.sources({
  --         { name = "path" },
  --       }, {
  --         {
  --           name = "cmdline",
  --           option = {
  --             ignore_cmds = { "Man", "!" },
  --           },
  --         },
  --       }),
  --     })
  --
  --     -- `/` cmdline setup.
  --     cmp.setup.cmdline("/", {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = {
  --         { name = "buffer" },
  --       },
  --     })
  --   end,
  -- },
}

-- Failed to run `config` for blink.cmp
--
-- ...share/nvim/lazy/blink.cmp/lua/blink/cmp/config/utils.lua:14: sources.providers.lsp.kind: unexpected field found in configuration
--
-- # stacktrace:
--   - /blink.cmp/lua/blink/cmp/config/utils.lua:14 _in_ **validate**
--   - /blink.cmp/lua/blink/cmp/config/sources.lua:136 _in_ **validate_provider**
--   - /blink.cmp/lua/blink/cmp/config/sources.lua:126 _in_ **validate**
--   - /blink.cmp/lua/blink/cmp/config/init.lua:43 _in_ **validate**
--   - /blink.cmp/lua/blink/cmp/config/init.lua:52 _in_ **merge_with**
--   - /blink.cmp/lua/blink/cmp/init.lua:18 _in_ **setup**
--   - ~/.config/nvim/lua/config/lazy.lua:19
--   - ~/.config/nvim/init.lua:6
