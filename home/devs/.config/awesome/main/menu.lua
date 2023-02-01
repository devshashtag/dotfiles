-- Standard awesome library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

-- Theme handling library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local beautiful = require("beautiful") -- for awesome.icon

local menu = {}  -- menu
local M = {} -- module

-- read about menu
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- terminal
local terminal = RC.vars.terminal

-- editor
local editor_cmd = terminal .. " -e " .. RC.vars.editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- awesome tab
menu.awesome = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "Terminal", terminal },
  { "Shutdown/Logout", "oblogout" },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end }
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function M.get()
  -- Main Menu
  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
  local menu_items = {
    { "awesome", menu.awesome, beautiful.awesome_subicon },
    { "open terminal", terminal }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
    __call = function(_, ...) return M.get(...) end
})
