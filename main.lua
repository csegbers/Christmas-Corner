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
--
-- Load our fonts and define our styles
--
local tabBarBackgroundFile = myApp.imgfld .. "tabBarBg7.png"
local tabBarLeft = myApp.imgfld .. "tabBar_tabSelectedLeft7.png"
local tabBarMiddle = myApp.imgfld .. "tabBar_tabSelectedMiddle7.png"
local tabBarRight = myApp.imgfld .. "tabBar_tabSelectedRight7.png"

myApp.topBarBg = myApp.imgfld .. "topBarBg7.png"
myApp.tabBar = {}

--------------------------------------------------
-- Home screen
--------------------------------------------------
function myApp.showScreen(parms)
    print ("goto " .. parms.key)
    local tnt = myApp.tabs[parms.key]
    myApp.tabBar:setSelected(tnt.sel)
    composer.gotoScene(tnt.lua, {time=tnt.time, effect=tnt.effect, params = tnt.options})
    return true
end

--
-- build the top bar which is a tab bar without buttons
--

--Create a group that contains the screens beneath the tab bar
-- each button has a label which shows on the buttons.  You need an up-state
-- graphic (non-selected buttons, a down-state button (the currently selected
-- tab) selected will mark which button starts as active, and the onPress calls
-- the function above to actually show each tab.
local tabButtons = {}
local function addtabBtn(tkey)
    local tabitem = 
        {
            label = myApp.tabs[tkey].label,
            defaultFile = myApp.tabs[tkey].def,
            overFile = myApp.tabs[tkey].over,
            labelColor = { 
                default = myApp.colorGray,   
                over = myApp.saColor,  
            },
            width = myApp.tabs.tabbtnw,
            height = myApp.tabs.tabbtnh,
            onPress = function () myApp.showScreen({key=tkey}) end,
        }
    table.insert(tabButtons, tabitem)
end

addtabBtn("home")
addtabBtn("blogs")
addtabBtn("pics")
addtabBtn("video")
addtabBtn("maps")

myApp.tabBar = widget.newTabBar{
    top =  display.contentHeight - 50 ,
    left = 0,
    width = display.contentWidth,
    backgroundFile = tabBarBackgroundFile,
    tabSelectedLeftFile = tabBarLeft,      -- New
    tabSelectedRightFile = tabBarRight,    -- New
    tabSelectedMiddleFile = tabBarMiddle,      -- New
    tabSelectedFrameWidth = 20,                                         -- New
    tabSelectedFrameHeight = 50,                                        -- New    
    buttons = tabButtons,
    height = 50,
    --background="images/tabBarBg7.png"
}


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

