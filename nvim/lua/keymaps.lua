-- some  basic keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Paste without overwriting yank" })
vim.keymap.set("n", "W", "<CMD>w<CR>", { desc = "Save File" })
vim.keymap.set("n", "YY", "<cmd>%y+<CR>", { desc = "Copy whole file" })
vim.keymap.set("n", "WQ", "<cmd>wqa<CR>", { desc = "Save Everything and quit all" })
vim.keymap.set("n", "QQ", "<cmd>q!<CR>", { desc = "quit all without saving" })
vim.keymap.set("n", "Q", "<cmd>wq<CR>", { desc = "Save and quit" })
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
-- Centering the view while moving half page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- replace (stolen from reddit r/neovim)
vim.keymap.set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
  { desc = "Search and replace the word under the cursor" }
)
-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Open file Explorer (oil is the way!)
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
--Update all plugins with lazy with single keystroke
vim.keymap.set("n", "<leader>up", "<CMD>Lazy update<CR>", { desc = "Update plugins Lazy" })
-- telescope Keymaps --- I still like and use telescope some times for the specific finds
vim.keymap.set("n", "<leader>t", function()
  require("telescope.builtin").builtin()
end, { desc = "[S]earch [S]elect Telescope" })

--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- >>>>> We don't like arrow keys <<<<<
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
-- Insert mode too
vim.keymap.set("i", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("i", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("i", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("i", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Miscellaneous Keymaps
vim.api.nvim_set_keymap("n", "yinq", 'yi"', { noremap = true, silent = true, desc = "Yank in [q]uotes" })
