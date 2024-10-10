return {
  "stevearc/conform.nvim",
  event = { "bufwritepre", "bufReadPost" },
  cmd = { "Conforminfo" },
  -- This Keymap is not the best imo and also there is keymap in lsp that does this so yah.
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end,
      mode = { "n", "v" },
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { "markdown" }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "gofmt", "goimports" },
      cpp = { "clang-format" },
      -- markdown = { "prettierd" },
      --- javascript = { 'prettierd', 'prettier' },
      -- typescript = { 'prettierd', 'prettier' },
      -- rust = { 'rustfmt' },
      -- Add more languages and formatters as needed
    },
    -- Format options for specific formatters
    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      black = {
        prepend_args = { "--line-length", "100" },
      },
      prettierd = {
        prepend_args = { "--print-width", "100", "--single-quote" },
      },
      ["clang-format"] = {
        prepend_args = { "--style=file" },
      },
    },
  },
}
