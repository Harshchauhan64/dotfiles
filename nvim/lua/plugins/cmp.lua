return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "mikavilpas/blink-ripgrep.nvim",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "onsails/lspkind.nvim",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<Up>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Down>"] = { "select_next", "snippet_forward", "fallback" },
      ["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    sources = {
      default = {
        "buffer",
        "lsp",
        "snippets",
        "path",
        "lazydev",
        "ripgrep",
      },
      providers = {
        lsp = {
          name = "lsp",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          fallbacks = { "snippets", "luasnip", "buffer" },
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
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
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          opts = {
            prefix_min_len = 3,
            context_size = 5,
            max_filesize = "1M",
            project_root_marker = ".git",
            search_casing = "--smart-case",
            fallback_to_regex_highlighting = true,
            debug = false,
          },
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              item.labelDetails = item.labelDetails or {}
              item.labelDetails.description = "(rg)"
            end
            return items
          end,
        },
        cmdline = {
          min_keyword_length = function(ctx)
            if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
              return 2
            end
            return 0
          end,
        },
      },
    },
    cmdline = {
      keymap = {
        ["<Up>"] = { "select_prev" },
        ["<Down>"] = { "select_next" },
        ["<Tab>"] = { "show_and_insert", "accept" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
      completion = {
        menu = {
          auto_show = true,
        },
      },
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        elseif type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
    },
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
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
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        treesitter_highlighting = true,
        window = { border = "rounded" },
      },
      ghost_text = { enabled = true },
    },
    snippets = {
      preset = "luasnip",
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

    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
  },
}
