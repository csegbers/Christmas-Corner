
-------------------------------------------------------
-- Store variables used across the app
-------------------------------------------------------
local M = { 
            debugMode = true,
            appName = "Christmas Corner Initial" ,
            splashDelay = 15,    -- milliseconds
            parse = {
                         appId = '',
                        restApikey = '',
                       getConfig = "https://api.parse.com/1/functions/getconfig",
                    },

        }

-------------------------------------------------------
-- Override print function make global
-------------------------------------------------------
reallyPrint = print
function print(...)
    if M.debugMode then
        reallyPrint("<-==============================================->") 
        reallyPrint(unpack(arg))
    end
end

-------------------------------------------------------
-- Seed random generator in case we use
-------------------------------------------------------
math.randomseed( os.time() )

print "In myapp.lua"

-------------------------------------------------------
-- Set app variables
-------------------------------------------------------
if (display.pixelHeight/display.pixelWidth) > 1.5 then
    M.isTall = true
end

if display.contentWidth > 320 then
    M.is_iPad = true
end

--
-- Handle Graphics 2.0 changes
M.colorDivisor = 255
M.isGraphics2 = true
if tonumber( system.getInfo("build") ) < 2013.2000 then
    -- we are a Graphics 1.0 build
    M.colorDivisor = 1
    M.isGraphics2 = false
end

return M
