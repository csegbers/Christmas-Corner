--====================================================================--
-- Christmas Corner
--====================================================================--
local myApp = require( "myapp" ) 
------------------------------------------------------
print("main: Program Start") 
------------------------------------------------------
local parse = require( "parse" )
local composer = require( "composer" )
local widget = require( "widget" )
------------------------------------------------------
print ("main: After Main Requires")
------------------------------------------------------

parse.parseGetConfig()
------------------------------------------------------
composer.isDebug = myApp.debugMode
composer.recycleOnSceneChange = true
widget.setTheme(myApp.theme)

--------------------------------------------------
-- Home screen
--------------------------------------------------
function myApp.showScreen(parms)
    print ("goto " .. parms.key)
    local tnt = myApp.tabs.btns[parms.key]
    myApp.tabBar:setSelected(tnt.sel)
    composer.gotoScene(myApp.scenesfld .. tnt.lua, {time=tnt.time, effect=tnt.effect, params = tnt.options})
    return true
end

require( myApp.utilsfld .. "tabandtop" )
require( myApp.utilsfld .. "splash" )


