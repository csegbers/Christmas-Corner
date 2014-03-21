------------------------------------------------------
print ("tabandtop: IN")
------------------------------------------------------

local myApp = require( "myapp" ) 
local widget = require( "widget" )

local tabBarBackgroundFile = myApp.imgfld .. "tabBarBg7.png"
local tabBarLeft = myApp.imgfld .. "tabBar_tabSelectedLeft7.png"
local tabBarMiddle = myApp.imgfld .. "tabBar_tabSelectedMiddle7.png"
local tabBarRight = myApp.imgfld .. "tabBar_tabSelectedRight7.png"

myApp.topBarBg = myApp.imgfld .. "topBarBg7.png"
myApp.tabBar = {}

-- build the top bar which is a tab bar without buttons
--

--Create a group that contains the screens beneath the tab bar
-- each button has a label which shows on the buttons.  You need an up-state
-- graphic (non-selected buttons, a down-state button (the currently selected
-- tab) selected will mark which button starts as active, and the onPress calls
-- the function above to actually show each tab.
local tabButtons = {}
local tabCnt = 0
local function addtabBtn(tkey)
    tabCnt = tabCnt + 1
    myApp.tabs[tkey].sel=tabCnt
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
addtabBtn("menu")
addtabBtn("blogs")
addtabBtn("pics")
addtabBtn("video")
addtabBtn("maps")

myApp.TitleGroup = display.newGroup( )

local statusBarBackground = display.newImageRect(myApp.topBarBg, display.contentWidth, display.topStatusBarContentHeight)
statusBarBackground.x = display.contentCenterX
statusBarBackground.y = display.topStatusBarContentHeight * 0.5  
myApp.TitleGroup:insert(statusBarBackground)

local titleBar = display.newImageRect(myApp.topBarBg, display.contentWidth, 50)
titleBar.x = display.contentCenterX
titleBar.y = 25 + display.topStatusBarContentHeight 
myApp.TitleGroup:insert(titleBar)
--
-- set up the text for the title bar, will be changed based on what page
-- the viewer is on

-- create embossed text to go above toolbar
local titleText = display.newText( myApp.appName, 0, 0, myApp.fontBold, 20 )
if myApp.isGraphics2 then
    titleText:setFillColor(1, 1, 1)
else
    titleText:setTextColor( 255, 255, 255 )
end
titleText.x = display.contentCenterX
titleText.y = titleBar.height * 0.5 + display.topStatusBarContentHeight  
myApp.TitleGroup:insert(titleText)

myApp.ScreenStartTop = titleBar.height + display.topStatusBarContentHeight

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