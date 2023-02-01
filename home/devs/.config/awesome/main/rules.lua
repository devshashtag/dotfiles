-- Standard awesome library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local awful     = require("awful")

-- Theme handling library
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
local beautiful = require("beautiful")

local M = {}

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function M.get(clientkeys, clientbuttons)
  local rules = {
    -- All clients
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    { rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus     = awful.client.focus.filter,
        raise     = true,
        keys      = clientkeys,
        buttons   = clientbuttons,
        screen    = awful.screen.preferred,
        placement = awful.placement.centered+awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },

    -- Floating clients.
    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    { rule_any = { class = { "Alacritty", "firefox", "copyq" } },
      except = { instance = "Navigator" },
      properties = { 
        floating = true
      }
    },
  }

  return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
    __call = function(_, ...) return M.get(...) end
})
