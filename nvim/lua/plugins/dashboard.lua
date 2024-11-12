return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- header
    local headers = {
      {
        "⠀⠀⠀⠀⠀⠀⠀⢀⠀⠔⡀⠀⢀⠞⢰⠂⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⢸⠘⢰⡃⠔⠩⠤⠦⠤⢀⡀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⢀⠄⢒⠒⠺⠆⠈⠀⠀⢐⣂⠤⠄⡀⠯⠕⣒⣒⡀⠀",
        "⠀⠀⢐⡡⠔⠁⠆⠀⠀⠀⠀⠀⢀⠠⠙⢆⠀⠈⢁⠋⠥⣀⣀",
        "⠈⠉⠀⣰⠀⠀⠀⠀⡀⠀⢰⣆⢠⠠⢡⡀⢂⣗⣖⢝⡎⠉⠀",
        "⢠⡴⠛⡇⠀⠐⠀⡄⣡⢇⠸⢸⢸⡇⠂⡝⠌⢷⢫⢮⡜⡀⠀",
        "⠀⠀⢰⣜⠘⡀⢡⠰⠳⣎⢂⣟⡎⠘⣬⡕⣈⣼⠢⠹⡟⠇⠀",
        "⠀⠠⢋⢿⢳⢼⣄⣆⣦⣱⣿⣿⣿⣷⠬⣿⣿⣿⣿⠑⠵⠀⠀",
        "⠀⠀⠀⡜⢩⣯⢝⡀⠁⠀⠙⠛⠛⠃⠀⠈⠛⠛⡿⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⣿⠢⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢀⣀⡇⠀⠑⠀⠀⠀⠀⠐⢄⠄⢀⡼⠃⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢸⣿⣷⣤⣀⠈⠲⡤⣀⣀⠀⡰⠋⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣶⣤⣙⣷⣅⡀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⢀⣾⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀",
        "⠀⡠⠟⠁⠙⠟⠛⠛⢿⣿⣾⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀",
      },

      {
        "                                   ",
        "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
        "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
        "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
        "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
        "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
        "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
        "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
        " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
        " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
        "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
        "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
        "                                   ",
      },
      {
        "                                                  ",
        "██╗      ██████╗  ██████╗██╗  ██╗    ██╗███╗   ██╗",
        "██║     ██╔═══██╗██╔════╝██║ ██╔╝    ██║████╗  ██║",
        "██║     ██║   ██║██║     █████╔╝     ██║██╔██╗ ██║",
        "██║     ██║   ██║██║     ██╔═██╗     ██║██║╚██╗██║",
        "███████╗╚██████╔╝╚██████╗██║  ██╗    ██║██║ ╚████║",
        "╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝",
        "                                                  ",
      },
      -- {
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣴⢋⣔⣶⣿⢋⣙⣳⣤⣀⣠⣤⠐⠄⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⡾⣿⣿⣿⣿⣿⣿⣿⣬⣥⣤⣠⡦⠖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⣿⣿⣿⣿⣿⣿⣿⡟⠛⠆⢀⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣄⣠⣤⣄⠄⡀⢠⣯⣿⣿⣿⣿⣿⣿⣾⣷⣤⢔⣊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣾⣽⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣭⡟⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡗⠀⠻⢿⣿⣉⠛⢻⣿⠉⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⣼⢯⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⢿⣿⣷⠠⢠⢏⣿⠉⠉⠩⠛⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⢀⠄⠀⠓⣶⣯⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣇⣚⡁⠀⠁⢠⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠈⠃⡀⠀⣿⣿⣿⣿⣿⣟⣿⣯⣷⣻⣽⣿⣯⣟⢻⣻⣿⣿⣿⣷⢶⠞⢗⣲⣄⡤⡂⠉⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣹⠛⠏⢳⡀⠹⣿⣿⣿⣿⣿⣿⣿⣯⣤⣝⣿⣿⣿⣿⣿⣶⣷⣟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣦⡿⠋⣗⠤⢹⡜⢛⠻⣿⣿⣷⣾⣿⣯⣧⡽⣿⣿⣿⣿⣷⣍⢳⢥⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡗⠍⣅⣴⣿⣄⡘⠆⠈⠨⡌⢻⣿⡗⣬⣼⢟⣫⡾⢿⣿⣿⣿⣿⡿⡄⢮⣆⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⠀⠀⢠⠦⢀⡀⠀⠀⠀⢇⢸⡭⠓⠁⠁⠜⠈⠄⠀⠱⡀⢻⣿⣾⡤⢼⣿⣖⣿⣿⣿⣿⣿⣷⡆⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⢀⣔⣋⣥⢋⢹⡀⠀⠀⢰⢸⢀⢴⣀⣤⠦⠀⠨⠃⠀⠒⢮⣿⣵⣧⣸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⡄⠄⠀⠀⠀⠀⠀⠀⠀",
      --   "⠀⣀⡆⡎⡀⠀⠀⠀⠀⠀⠀⠰⠀⠸⠀⠷⣶⣆⣶⡆⠀⠀⣀⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⣰⠆⢀⡀⠆⠀⠀⠀⠀",
      --   "⠀⢕⣿⢀⣱⠪⢧⢻⠇⢀⠀⠀⠀⠀⠀⠀⠙⠯⡄⣙⣧⢤⣷⠿⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠛⣴⣵⡿⣣⢨⠄⠀⠀",
      --   "⢰⡆⡜⡎⠁⠀⢰⠒⣾⢠⡄⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⠿⠁⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢦⣗⣈⢻⣄⡟⠅⣀⢠⡄",
      --   "⠀⢿⠀⠐⢠⣆⠲⡶⡗⠱⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠩⣽⣿⣿⡳⣿⢴⡿⠅",
      --   "⢰⢘⠀⢻⡄⢧⠸⣗⡧⢄⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢠⣟⣾⡇⢹⠓⠀⠀",
      --   "⠈⡈⡀⠀⠁⡈⠚⣿⣉⣓⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠾⠃⣯⠀⡀⠀",
      --   "⠀⢳⣤⡀⠀⢰⠀⠻⣿⡿⠀⠀⠀⠀⠀⠀⠀⢀⠀⢠⠎⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣳⠆⢱⡇⠘⣄",
      --   "⠀⠈⠿⠹⠆⢀⡆⠈⠁⡇⠀⠀⠀⠀⠀⠀⡞⠃⣿⡏⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⢠⠀⡇⡀⢚",
      -- },
    }
    -- ascii art for the fonts - https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=
    math.randomseed(os.time())
    local function random_ascii()
      if not headers or #headers == 0 then
        return nil
      end
      local index = math.random(#headers)
      return headers[index]
    end
    dashboard.section.header.val = random_ascii()

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("w", "  Word from files", ":Telescope live_grep<CR>"),
      dashboard.button("c", "󰙨  Leetcode", ":Leet <CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
      dashboard.button("l", "󰤄  Lazy", ":Lazy update<CR>"),
      dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
    }
    --    
    -- Set footer
    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime)) --* 100 + 0.5) / 100)

      local loaded_plugins = stats.loaded
      local total_plugins = stats.count

      -- Construct footer string
      return string.format(" eovim loaded %d of %d plugins in %.2fms  ", loaded_plugins, total_plugins, ms)
    end

    dashboard.section.footer.val = footer

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
