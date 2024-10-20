return {
  {
    "gbprod/substitute.nvim",
    keys = {
      { "s", desc = "Substitute operator" },
      { "ss", desc = "Substitute line" },
      { "S", desc = "Substitute to end of line" },
      { "sx", desc = "Exchange operator" },
      { "sxx", desc = "Exchange line" },
      { "sxc", desc = "Cancel exchange" },
    },
    config = function()
      local substitute = require("substitute")
      local exchange = require("substitute.exchange")

      substitute.setup({})
      vim.keymap.set("n", "s", substitute.operator, { noremap = true, desc = "Substitute operator" })
      vim.keymap.set("n", "ss", substitute.line, { noremap = true, desc = "Substitute line" })
      vim.keymap.set("n", "S", substitute.eol, { noremap = true, desc = "Substitute to end of line" })
      vim.keymap.set("x", "s", substitute.visual, { noremap = true, desc = "Substitute visual selection" })
      vim.keymap.set("n", "sx", exchange.operator, { noremap = true, desc = "Exchange operator" })
      vim.keymap.set("n", "sxx", exchange.line, { noremap = true, desc = "Exchange line" })
      vim.keymap.set("x", "X", exchange.visual, { noremap = true, desc = "Exchange visual selection" })
      vim.keymap.set("n", "sxc", exchange.cancel, { noremap = true, desc = "Cancel exchange" })
    end,
  },
  { "wakatime/vim-wakatime", lazy = false },
  { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
  {
    "andymass/vim-matchup",
    event = "VimEnter",
  },
  { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font, opts = true },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xf",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xb",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" }, -- it will not add a pair on that treesitter node
        javascript = { "template_string" },
      },
      disable_filetype = { "TelescopePrompt" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
    config = function(_, opts)
      local npairs = require("nvim-autopairs")
      npairs.setup(opts)

      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
