--====================================================================--
-- Christmas Corner
--====================================================================--
local myApp = require( "myapp" ) 

print("Program Start") 
--
local parse = require( "parse" )
local composer = require( "composer" )
local widget = require( "widget" )
local json = require( "json" )

print ("After Main Requires")

parse.parseGetConfig()

composer.isDebug = myApp.debugMode
composer.recycleOnSceneChange = true
--
-- Load our fonts and define our styles
--

local tabBarBackgroundFile = "images/tabBarBg7.png"
local tabBarLeft = "images/tabBar_tabSelectedLeft7.png"
local tabBarMiddle = "images/tabBar_tabSelectedMiddle7.png"
local tabBarRight = "images/tabBar_tabSelectedRight7.png"

myApp.topBarBg = "images/topBarBg7.png"


widget.setTheme(myApp.theme)

myApp.tabBar = {}

function myApp.showScreen1()
    myApp.tabBar:setSelected(1)
   -- storyboard.removeAll()
   print "goto scene1"
    composer.gotoScene("menu", {time=250, effect="crossFade"})
    return true
end

function myApp.showScreen2()
    myApp.tabBar:setSelected(2)
    local options = {
        feedName = "corona.rss",
        feedURL = "http://www.coronalabs.com/feed/",
        icons = "fixed",
        displayMode = "webpage",
        pageTitle = "Corona Labs"
    }
   -- storyboard.removeAll()
    composer.gotoScene("feed", {time=250, effect="crossFade", params = options})
    return true
end

function myApp.showScreen3()
    myApp.tabBar:setSelected(3)
    --storyboard.removeAll()
    composer.gotoScene("photogallery", {time=250, effect="crossFade"})
    return true
end

function myApp.showScreen4()
    myApp.tabBar:setSelected(4)
    local options = {
        feedName = "video.rss",
        feedURL = "http://gdata.youtube.com/feeds/mobile/users/CoronaLabs/uploads?max-results=20&alt=rss&orderby=published&format=1",
        icons = "fixed",
        displayMode = "videoviewer",
        pageTitle = "Corona Videos"
    }
   -- storyboard.removeAll()
    composer.gotoScene("feed2", {time=250, effect="crossFade", params = options})
    return true
end

function myApp.showScreen5()
    myApp.tabBar:setSelected(5)
    local options = {

        pageTitle = "Corona Headquarters"
    }
   -- storyboard.removeAll()
    composer.gotoScene("mapscene", {time=250, effect="crossFade", params = options})
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

local tabButtons = {
    {
        label = "Menu",
        defaultFile = "images/tabbaricon.png",
        overFile = "images/tabbaricon-down.png",
        labelColor = { 
            default = myApp.colorGray,   
            over = myApp.saColor,  
        },
        width = 32,
        height = 32,
        onPress = myApp.showScreen1,
        selected = true
    },
    {
        label = "Blogs",
        defaultFile = "images/tabbaricon.png",
        overFile = "images/tabbaricon-down.png",
         labelColor = { 
            default = myApp.colorGray,  
            over = myApp.saColor,  
        },
        width = 32,
        height = 32,
        onPress = myApp.showScreen2,
    },
    {
        label = "Pics",
        defaultFile = "images/tabbaricon.png",
        overFile = "images/tabbaricon-down.png",
        labelColor = { 
            default = myApp.colorGray,  
            over = myApp.saColor,  
        },
        width = 32,
        height = 32,
        onPress = myApp.showScreen3,
    },
    {
        label = "Video",
        defaultFile = "images/tabbaricon.png",
        overFile = "images/tabbaricon-down.png",
        labelColor = { 
            default = myApp.colorGray,  
            over = myApp.saColor,  
        },
        width = 32,
        height = 32,
        onPress = myApp.showScreen4,
    },
    {
        label = "Map",
        defaultFile = "images/tabbaricon.png",
        overFile = "images/tabbaricon-down.png",
        labelColor = { 
            default = myApp.colorGray,  
            over = myApp.saColor,  
        },
        width = 32,
        height = 32,
        onPress = myApp.showScreen5,
    },
}

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
--

local function closeSplash()
   local function closeSplashFinal()
            -- display.remove(title)
                -- title = nil
                display.remove(logo)
                logo = nil
                display.remove(background)
                background = nil
                myApp.showScreen1()
    end
    local function closeSplash1()
            transition.to( logo, {time=1500, alpha=0, x=(display.contentWidth+50), y=(display.contentHeight-500), onComplete=closeSplashFinal } )
    end


    transition.to( logo.path, { time=1500, x2=20, y2=-20, x4=-40, y4=40 , onComplete=closeSplash1 } )
end

timer.performWithDelay(myApp.splashDelay, closeSplash)

