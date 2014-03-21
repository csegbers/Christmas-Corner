---------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myApp = require( "myapp" )
print ("In home "..myApp.appName)



function scene:create(event)
    print "menu createscene"
	local group = self.view
    local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
    background:setFillColor(242/myApp.colorDivisor, 242/myApp.colorDivisor, 242/myApp.colorDivisor, 255/myApp.colorDivisor)
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2

    group:insert(background)
end

function scene:show( event )
	local group = self.view

end

function scene:hide( event )
	local group = self.view

	--
	-- Clean up native objects
	--

end

function scene:destroy( event )
	local group = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene