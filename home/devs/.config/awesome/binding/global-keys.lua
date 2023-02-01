-- Standard awesome library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local gears = require("gears")
local awful = require("awful")

-- local hotkeys_popup = require("awful.hotkeys_popup").widget
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local hotkeys_popup = require("awful.hotkeys_popup").widget

-- variables
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local vars = RC.vars

local modkey = vars.modkey

local M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function M.get()
  local globalkeys = gears.table.join(
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- awesome
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    awful.key({ modkey, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),

    awful.key({ modkey, "Shift"   }, "c", awesome.quit,
    { description = "quit awesome", group = "awesome" }),

    awful.key({ modkey }, "w", function () RC.main_menu:show() end,
    { description = "show main menu", group = "awesome" }),

    awful.key({ modkey }, "s", hotkeys_popup.show_help,
    { description="show help", group="awesome" }),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Tag browsing
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    awful.key({ modkey }, "Left", awful.tag.viewprev,
    { description = "view previous", group = "tag" }),

    awful.key({ modkey }, "Right", awful.tag.viewnext,
    { description = "view next", group = "tag" }),

    awful.key({ modkey }, "Escape", awful.tag.history.restore,
    { description = "last previous tag", group = "tag" }),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }),

    awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }),

    awful.key({ modkey }, "j", function () awful.client.focus.byidx(1) end,
    { description = "focus next client", group = "client" }),

    awful.key({ modkey }, "k", function () awful.client.focus.byidx(-1) end,
    { description = "focus previous client", group = "client" }),

    awful.key({ modkey }, "Tab", function ()
      awful.client.focus.history.previous()

      if client.focus then
        client.focus:raise()
      end
    end, 
    { description = "previous client", group = "client" }),

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Standard program
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

    awful.key({ modkey }, "Return", function () awful.spawn(vars.terminal) end,
    { description = "open a terminal", group = "launcher" }),

    awful.key({ modkey }, "r", function () awful.spawn(vars.launcher) end,
    { description = "run prompt", group = "launcher" }),

    awful.key({}, "Print", function () awful.spawn(vars.screenshot) end,
    { description = "screenshot", group = "launcher" })
  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
  __call = function(_, ...) return M.get(...) end
})
