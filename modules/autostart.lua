-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
--

local apps = require("modules.programs")

 hl.on("hyprland.start", function ()  
   hl.exec_cmd("killall waybar; waybar") 
   hl.exec_cmd("awww-daemon")
 end)


