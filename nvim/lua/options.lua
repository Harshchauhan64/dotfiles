-- Local and Global map leader as <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Convert tabs to spaces
vim.opt.expandtab = true
-- Set the width of a tab character to 2 spaces
vim.opt.tabstop = 2
-- Set the number of spaces to use when you press the Tab key
vim.opt.softtabstop = 2
-- Set the number of spaces used for each level of indentation
vim.opt.shiftwidth = 2
-- Terminal color correction
vim.opt.termguicolors = true
-- Set number line
vim.opt.number = true
vim.opt.relativenumber = true
-- Set highlight on search
vim.o.hlsearch = true
-- Save Undo line
vim.opt.undofile = true
-- Better case sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Enable Mouse mode
vim.opt.mouse = "a"
-- disable mode show its in status line
vim.opt.showmode = false
-- Show match brackets
vim.opt.showmatch = true
-- Set nerd font on
vim.g.have_nerd_font = true
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list' and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Enable break indent
vim.opt.breakindent = true
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes:1"
-- Show the modes turn this off when lualine or statusline is config
vim.opt.showmode = false
-- Decrease update time
vim.opt.updatetime = 250
-- show which cursor line you are
vim.opt.cursorline = true
-- Set colorscheme
vim.o.background = "dark"
--vim.cmd.colorscheme 'catppuccin-mocha' moved too ui.lua
-- Moved to ui for now
-- Disable Default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- Decrease mapped sequence time
vim.opt.timeoutlen = 300
-- Schedule and sync the clipboard with Neovim
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
-- Disable some  providers
for _, provider in ipairs({ "perl", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
-- Highlight when yanking text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), "info", {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
