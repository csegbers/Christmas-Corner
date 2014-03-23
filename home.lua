---------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local myApp = require( "myapp" )
local common = require( "common" )

print ("In home "..myApp.appName)


function scene:create(event)
    print "menu createscene"
	local group = self.view
	local background = common.SceneBackground()
    group:insert(background)
end

function scene:show( event )

    local group = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
	

end

function scene:hide( event )
    local group = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end

function scene:destroy( event )
	local group = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene