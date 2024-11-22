local wezterm = require("wezterm")
local config = {}
-- ln -s /mnt/c/Users/YourUsername/AppData/Roaming/wezterm/wezterm.lua wezterm.lua
-- Use the config_builder if available
if wezterm.config_builder then
  config = wezterm.config_builder()
end
-- Set the default domain to WSL:Ubuntu
config.default_domain = "WSL:Arch"

-- Default Domains list
config.wsl_domains = {
  {
    name = "WSL:Arch",
    distribution = "Arch",
    default_cwd = "~",
  },
}
-- window framing for windows
config.window_frame = {
  font = wezterm.font({ family = "Segoe UI", weight = "Bold" }),
}
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}
-- Rename on double click Ahh mouse shit !
-- config.rename_on_double_click = true
-- Ensuring preferred shell for WSL
config.default_prog = { "wsl.exe", "~", "-d", "arch" }
-- Set the font to JetBrains Mono NL with DemiBold weight
config.font = wezterm.font_with_fallback({ family = "JetBrains Mono NL", weight = "DemiBold" })

config.font_size = 12

-- Eable the tab bar
config.enable_tab_bar = true

-- Allow only resizing of the window
config.window_decorations = "RESIZE"

-- Set window opacity
config.window_background_opacity = 0.9

-- Set background blur (macOS only)
-- config.macos_window_background_blur = 10

-- Set the color scheme
config.color_scheme = "Catppuccin Mocha"

-- Set the leader key to ALT+q with a 2-second timeout
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 2000 }
-- GPU accleration on
config.front_end = "WebGpu"
-- Define custom key bindings
local act = wezterm.action
config.keys = {
  {
    key = "Backspace",
    mods = "CTRL",
    action = wezterm.action({ SendString = "\x17" }),
  },
  --remane window
  {
    key = "r",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
  -- CTRL+f : Fullscreen window
  {
    key = "f",
    mods = "CTRL",
    action = wezterm.action.ToggleFullScreen,
  },
  -- CTRL+' clear the window and Viewport I like ctrl L but some thimes it binded to another things
  --{
  --key = "'",
  --mods = "CTRL",
  --action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
  --},
  -- Windows Specfic Key bindings
  {
    key = "c",
    mods = "CTRL",
    action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
  },
  {
    key = "v",
    mods = "CTRL",
    action = wezterm.action.PasteFrom("Clipboard"),
  },
  -- LEADER+c: Spawn a new tab
  {
    mods = "LEADER",
    key = "c",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  -- LEADER+x: Close current pane with confirmation
  {
    mods = "LEADER",
    key = "q",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  -- LEADER+p: Activate previous tab
  {
    mods = "LEADER",
    key = "p",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- LEADER+n: Activate next tab
  {
    mods = "LEADER",
    key = "n",
    action = wezterm.action.ActivateTabRelative(1),
  },
  -- LEADER+|: Split pane horizontally
  {
    mods = "LEADER",
    key = "|",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- LEADER+-: Split pane vertically
  {
    mods = "LEADER",
    key = "-",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  -- LEADER+h/j/k/l: Navigate between panes
  {
    mods = "LEADER",
    key = "h",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    mods = "LEADER",
    key = "j",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    mods = "LEADER",
    key = "k",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    mods = "LEADER",
    key = "l",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  -- LEADER+Arrow keys: Adjust pane size
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
}

-- Add key bindings for switching to tabs 0-9
for i = 0, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wezterm.action.ActivateTab(i),
  })
end

-- Tab bar settings
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- Custom status bar
wezterm.on("update-right-status", function(window, _)
  local SOLID_LEFT_ARROW = ""
  local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
  local prefix = ""

  if window:leader_is_active() then
    prefix = " " .. utf8.char(0xf30a) -- ocean wave
    SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  end

  if window:active_tab():tab_id() ~= 0 then
    ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
  end -- arrow color based on if tab is first pane

  window:set_left_status(wezterm.format({
    { Background = { Color = "#b7bdf8" } },
    { Text = prefix },
    ARROW_FOREGROUND,
    { Text = SOLID_LEFT_ARROW },
  }))
end)

-- Custom mouse binding: Right-click to paste
config.mouse_bindings = config.mouse_bindings or {}
table.insert(config.mouse_bindings, {
  event = { Down = { streak = 1, button = "Right" } },
  mods = "NONE",
  action = wezterm.action.PasteFrom("Clipboard"),
})
table.insert(config.mouse_bindings, {
  event = { Up = { streak = 1, button = "Left" } },
  mods = "CTRL",
  action = wezterm.action.OpenLinkAtMouseCursor,
})

return config
