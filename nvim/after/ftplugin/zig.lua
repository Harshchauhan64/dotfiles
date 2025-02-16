vim.keymap.set("n", "<leader>e", "<CMD>!zig run %<CR>", {
  desc = "Zig run",
  noremap = true,
  silent = true,
})
