local myApp = require( "myapp" )
-------------------------------------------------------
-- Store variables used across the app
-------------------------------------------------------
local M = { }
 
function M.SceneBackground()
    local background = display.newRect(0,0,myApp.cW, myApp.cH)
    background:setFillColor(242/myApp.colorDivisor, 242/myApp.colorDivisor, 242/myApp.colorDivisor, 255/myApp.colorDivisor)
    background.x = myApp.cW / 2
    background.y = myApp.cH / 2
    return background
end

return M