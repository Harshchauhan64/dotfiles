-- some  basic keymaps
-- s :k
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Paste without overwriting yank" })
vim.keymap.set("n", "W", "<CMD>w<CR>", { desc = "Save File" })
vim.keymap.set("n", "YY", "<cmd>%y+<CR>", { desc = "Copy whole file" })
vim.keymap.set("n", "WQ", "<cmd>wqa<CR>", { desc = "Save Everything and quit all" })
vim.keymap.set("n", "QQ", "<cmd>q!<CR>", { desc = "quit all without saving" })
vim.keymap.set("n", "Q", "<cmd>wq<CR>", { desc = "Save and quit" })
-- Centering the view while moving half page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- Move
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
-- telescope Keymaps
vim.api.nvim_set_keymap("n", "<leader>st", ":TodoTelescope<CR>", { noremap = true, desc = "[S]earch [T]odo" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>ta",
  "<cmd>TodoTelescope keywords=PERF,HACK,TODO,NOTE,FIX<cr>",
  { noremap = true, desc = "[T]odo [A]ll" }
)
vim.keymap.set("n", "<leader>sh", function()
  require("telescope.builtin").help_tags()
end, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", function()
  require("telescope.builtin").keymaps()
end, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", function()
  require("telescope.builtin").find_files()
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "sf", function()
  require("telescope.builtin").find_files()
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", function()
  require("telescope.builtin").builtin()
end, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", function()
  require("telescope.builtin").grep_string()
end, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", function()
  require("telescope.builtin").live_grep()
end, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", function()
  require("telescope.builtin").diagnostics()
end, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", function()
  require("telescope.builtin").resume()
end, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>so", function()
  require("telescope.builtin").oldfiles()
end, { desc = "[S]earch [O]pened Recent Files " })
vim.keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").buffers()
end, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })
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
