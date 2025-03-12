return {
  "nvzone/volt", --main dependency
  {
    "nvzone/typr", -- fun one haven't tired too much
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",

    opts = {
      timeout = 1,
      maxkeys = 5,
    },
  },
  { "nvzone/menu", lazy = true, opts = {} },
  { "nvzone/timerly", cmd = "TimerlyToggle" },
}
