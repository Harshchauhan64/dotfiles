local leet_arg = "leetcode.nvim"
return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({})
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      show_icons = true,
      leader_key = ";",
      buffer_leader_key = "m",
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      exclude = {
        "alpha",
        "dashboard",
      },
    },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  { "meznaric/key-analyzer.nvim", command = "KeyAnalyzer", opts = {} },
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
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup({
        -- In which modes mappings from this `config` should be created
        modes = { insert = true, command = false, terminal = false },
        mappings = {
          ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
          ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
          ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

          [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
          ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
          ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

          ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
          ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
          ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
        },
      })
    end,
  },
  --
  -- {
  --   "gbprod/substitute.nvim",
  --   keys = {
  --     { "s", desc = "Substitute operator" },
  --     { "ss", desc = "Substitute line" },
  --     { "S", desc = "Substitute to end of line" },
  --     { "sx", desc = "Exchange operator" },
  --     { "sxx", desc = "Exchange line" },
  --     { "sxc", desc = "Cancel exchange" },
  --   },
  --   config = function()
  --     local substitute = require("substitute")
  --     local exchange = require("substitute.exchange")
  --
  --     substitute.setup({})
  --     vim.keymap.set("n", "s", substitute.operator, { noremap = true, desc = "Substitute operator" })
  --     vim.keymap.set("n", "ss", substitute.line, { noremap = true, desc = "Substitute line" })
  --     vim.keymap.set("n", "S", substitute.eol, { noremap = true, desc = "Substitute to end of line" })
  --     vim.keymap.set("x", "s", substitute.visual, { noremap = true, desc = "Substitute visual selection" })
  --     vim.keymap.set("n", "sx", exchange.operator, { noremap = true, desc = "Exchange operator" })
  --     vim.keymap.set("n", "sxx", exchange.line, { noremap = true, desc = "Exchange line" })
  --     vim.keymap.set("x", "X", exchange.visual, { noremap = true, desc = "Exchange visual selection" })
  --     vim.keymap.set("n", "sxc", exchange.cancel, { noremap = true, desc = "Cancel exchange" })
  --   end,
  -- },
  { "wakatime/vim-wakatime", lazy = false },
  { "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } }, -- Detect tabstop and shiftwidth automatically
  { "andymass/vim-matchup" },
  -- {
  --   "kevinhwang91/nvim-hlslens",
  --   config = function()
  --     require("hlslens").setup({
  --       calm_down = true,
  --       nearest_only = true,
  --     })
  --   end,
  -- },
  { "nvim-tree/nvim-web-devicons", lazy = true, enabled = vim.g.have_nerd_font, opts = true },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
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
    "kawre/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv(0, -1),
    cmd = "Leet",
  -- stylua: ignore
    keys = {
      { "<leader>ll", "<cmd>Leet run<cr>", desc = "Leetcode Run", },
      { "<leader>ld", "<cmd>Leet desc<cr>", desc = "Leetcode desc close", },
      { "<leader>lc", "<cmd>Leet lang<cr>", desc = "Leetcode Change Language", },
      { "<leader>ly", "<cmd>Leet yank<cr>", desc = "Leetcode Yank Solution", },
      { "<leader>li", "<cmd>Leet info<cr>", desc = "Leetcode info question", },
      { "<leader>lq", "<cmd>Leet exit<cr>", desc = "Leetcode exit", },
      { "<leader>lp", "<cmd>Leet list<cr>", desc = "Leetcode list", },
      { "<leader>lm", "<cmd>Leet menu<cr>", desc = "Leetcode Menu", },
      { "<leader>ls", "<cmd>Leet submit<cr>", desc = "Leetcode Submit", },
    },
    opts = {
      arg = leet_arg,
      lang = "cpp",
      -- image_support = true,
      injector = {
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "using namespace std;" },
          -- after = "int main() {}",
        },
      },
    },
  },
  -- codeforces or CP or cp
  {
    "A7lavinraj/assistant.nvim",
    -- dependencies = { "stevearc/dressing.nvim" }, -- optional but recommended
    keys = {
      { "<leader>a", "<cmd>AssistantToggle<cr>", desc = "Toggle Assistant.nvim window" },
    },
    opts = {
      command = {
        cpp = {
          compile = {
            args = { "$FILENAME_WITH_EXTENSION", "-o", "bin/$FILENAME_WITHOUT_EXTENSION" },
          },
          exclude = {
            main = "./bin/$FILENAME_WITHOUT_EXTENSION",
          },
        },
      },
    },
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
}
