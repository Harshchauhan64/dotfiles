return {
  "nvzone/volt", --main dependency
  {
    "nvzone/typr",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 3,
      -- more opts
    },
  },
  { "nvzone/menu", lazy = true, opts = {} },
  { "nvzone/timerly", cmd = "TimerlyToggle" },
}
