require("notify").setup({
  stages = "fade_in_slide_out",
  -- Fancy notification
  on_open = nil,
  on_close = nil,

  -- Render function for notification
  render = "default",

  timeout = 5000,

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
vim.notify = require("notify")

local plugin = "My Awesome Plugin"

