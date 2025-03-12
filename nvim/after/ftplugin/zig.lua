vim.g.zig_fmt_autosave = 0
vim.keymap.set("n", "<leader>e", "<CMD>!zig run %<CR>", {
  desc = "Zig run buffer",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>tb", "<CMD>!zig test %<CR>", {
  desc = "Zig test buffer",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>bd", "<CMD>!zig build<CR>", {
  desc = "Zig build buffer",
  noremap = true,
  silent = true,
})
