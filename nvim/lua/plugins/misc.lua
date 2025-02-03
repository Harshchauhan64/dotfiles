local leet_arg = "leetcode.nvim"
return {
  { -- testing rust stuff
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({})
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
    opts = {
      jump = {
        autojump = true,
      },
      modes = {
        char = {
          jump_labels = true,
        },
      },
      exclude = {
        "alpha",
        "dashboard",
      },
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "E",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
      disable_filetype = { "oil" },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    enabled = false,
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
  { "wakatime/vim-wakatime", lazy = false },
  { "tpope/vim-sleuth", event = { "BufReadPre", "BufNewFile" } }, -- Detect tabstop and shiftwidth automatically
  { "nvim-tree/nvim-web-devicons", lazy = true, enabled = vim.g.have_nerd_font, opts = true },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<leader>st",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "PERF", "HACK", "NOTE" } })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
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
      { "<leader>ll", "<cmd>Leet run<cr>",    desc = "Leetcode Run", },
      { "<leader>ld", "<cmd>Leet desc<cr>",   desc = "Leetcode desc close", },
      { "<leader>lc", "<cmd>Leet lang<cr>",   desc = "Leetcode Change Language", },
      { "<leader>ly", "<cmd>Leet yank<cr>",   desc = "Leetcode Yank Solution", },
      { "<leader>li", "<cmd>Leet info<cr>",   desc = "Leetcode info question", },
      { "<leader>lq", "<cmd>Leet exit<cr>",   desc = "Leetcode exit", },
      { "<leader>lp", "<cmd>Leet list<cr>",   desc = "Leetcode list", },
      { "<leader>lm", "<cmd>Leet menu<cr>",   desc = "Leetcode Menu", },
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
    dependencies = { "stevearc/dressing.nvim" }, -- optional but recommended
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
