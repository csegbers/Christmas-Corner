
------------------------------------------------------
print ("splash: IN")
------------------------------------------------------

local myApp = require( "myapp" ) 

local background = display.newRect(0,0, display.contentWidth, display.contentHeight)
background:setFillColor(255/myApp.colorDivisor,255/myApp.colorDivisor,255/myApp.colorDivisor)
background.x = display.contentCenterX
background.y = display.contentCenterY

local logo = display.newImageRect("salogo.jpg",305,170)
logo.x = display.contentCenterX
logo.y = display.contentCenterY

-- local title = display.newText(myApp.appName, 0, 0, myApp.fontBold, 28)
-- if myApp.isGraphics2 then
--     title:setFillColor( 0 )
-- else
--     title:setTextColor(0)
-- end
-- title.x = display.contentCenterX
-- title.y = display.contentHeight - 64
--
-- now make the first tab active.align


local function closeSplash()
   local function closeSplashFinal()
            -- display.remove(title)
                -- title = nil
                display.remove(logo)
                logo = nil
                local function removeBack()
                   display.remove(background)
                   background = nil
                end
                transition.to( background, {time=1500, alpha=0 , onComplete=removeBack } )

                myApp.showScreen({key="home"})
    end
    local function closeSplash1()
            transition.to( logo, {time=1500, alpha=0, x=(display.contentWidth+50), y=(display.contentHeight-500), onComplete=closeSplashFinal } )

   end


    transition.to( logo.path, { time=1500, x2=20, y2=-20, x4=-40, y4=40 , onComplete=closeSplash1 } )
end

timer.performWithDelay(myApp.splashDelay, closeSplash)