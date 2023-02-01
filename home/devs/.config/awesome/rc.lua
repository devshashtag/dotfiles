-- RC global namespace, on top before require any modules
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
RC = {}

-- error handling
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
require("main.error-handling")

-- Standard awesome library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local beautiful = require("beautiful")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- user variables
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
RC.vars = require("main.user-variables")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.wallpaper = RC.vars.wallpaper

-- layout, tags, menu, rules
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local main = {
  layouts = require("main.layouts"),
  tags    = require("main.tags"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
}

-- keys and mouse binding
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local binding = {
  -- mouse
  globalbuttons = require("binding.global-buttons"),
  clientbuttons = require("binding.client-buttons"),
  -- keyboard
  globalkeys    = require("binding.global-keys"),
  clientkeys    = require("binding.client-keys"),
  -- tags bindings
  tags          = require("binding.tags"),
}


-- Mouse and Key bindings
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
RC.globalkeys = binding.tags(binding.globalkeys())

-- set root buttons
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- layouts
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
RC.layouts = main.layouts()

-- tags
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
RC.tags = main.tags()

-- main menu
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
RC.main_menu = awful.menu({ items = main.menu() })

-- launcher
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- RC.launcher = awful.widget.launcher(
--   { image = beautiful.awesome_icon, menu = RC.main_menu }
-- )

-- rules
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)

-- Statusbar: Wibar
require("deco.statusbar")

-- signals
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
require("main.signals")

-- autoruns
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
awful.spawn.with_shell("~/.config/awesome/scripts/autorun.sh")

