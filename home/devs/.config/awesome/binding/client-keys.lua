-- Standard Awesome library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local gears = require("gears")
local awful = require("awful")

-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function M.get()
  local clientkeys = gears.table.join(
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- window management
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    awful.key({ modkey, "Shift"   }, "q", function (c) c:kill() end,
    { description = "close window", group = "client" }),

    awful.key({ modkey }, "f", function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }),

    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }),

    awful.key({ modkey }, "t", function (c) c.ontop = not c.ontop end,
    { description = "toggle keep on top", group = "client" })
  )

  return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
  __call = function(_, ...) return M.get(...) end
})
