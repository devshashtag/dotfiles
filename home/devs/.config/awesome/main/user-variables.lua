local home = os.getenv("HOME")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local M = {
  terminal = "terminator",

  editor = os.getenv("EDITOR") or "nvim",

  launcher="rofi -modi drun -show drun -show-icons",

  screenshot="flameshot gui",

  wallpaper = home .. "/.config/awesome/images/background.jpg",

  modkey = "Mod4"
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return M
