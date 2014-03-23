------------------------------------------------------
print ("tabandtop: IN")
------------------------------------------------------

local myApp = require( "myapp" ) 
local widget = require( "widget" )

----------------------------------------------------------
--    Top Title Bar stuff
----------------------------------------------------------
myApp.topBarBg = myApp.imgfld .. "topBarBg7.png"
myApp.TitleGroup = display.newGroup( )

----------------------------------------------------------
--   This goes behind the status bar
----------------------------------------------------------
local statusBarBackground = display.newImageRect(myApp.topBarBg, myApp.cW, myApp.tSbch)
statusBarBackground.x = myApp.cCx
statusBarBackground.y = myApp.tSbch * .5  
myApp.TitleGroup:insert(statusBarBackground)

----------------------------------------------------------
--   This is the title bar
----------------------------------------------------------
local titleBar = display.newImageRect(myApp.topBarBg, myApp.cW, myApp.titleBarHeight)
titleBar.x = myApp.cCx
titleBar.y = (myApp.titleBarHeight * 0.5 )+ myApp.tSbch
myApp.TitleGroup:insert(titleBar)

----------------------------------------------------------
--   text in the Titlebar
----------------------------------------------------------
local titleText = display.newText( myApp.appName, 0, 0, myApp.fontBold, 20 )
if myApp.isGraphics2 then
    titleText:setFillColor(1, 1, 1)
else
    titleText:setTextColor( 255, 255, 255 )
end
titleText.x = myApp.cCx
titleText.y = titleBar.height * 0.5 + myApp.tSbch 
myApp.TitleGroup:insert(titleText)



----------------------------------------------------------
--    Bottom Tab sections
----------------------------------------------------------

myApp.tabBar = {}

local tabButtons = {}
local tabCnt = 0
local function addtabBtn(tkey)
    tabCnt = tabCnt + 1
    local btnrntry = myApp.tabs.btns[tkey]
    btnrntry.sel=tabCnt
    local tabitem = 
        {
            label = btnrntry.label,
            defaultFile = btnrntry.def,
            overFile = btnrntry.over,
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

---- following wors just puts them in random order
-- for k,v in pairs(myApp.tabs.btns) do 
--     addtabBtn(k)
-- end

addtabBtn("home")
addtabBtn("video")
addtabBtn("menu")
addtabBtn("blogs")
addtabBtn("pics")

addtabBtn("maps")

myApp.tabBar = widget.newTabBar{
    top =  myApp.cH - myApp.tabs.tabBarHeight ,
    left = 0,
    width = myApp.cW,
    backgroundFile = myApp.imgfld .. "tabBarBg7.png",
    tabSelectedLeftFile = myApp.imgfld .. "tabBar_tabSelectedLeft7.png",       
    tabSelectedRightFile = myApp.imgfld .. "tabBar_tabSelectedRight7.png",     
    tabSelectedMiddleFile = myApp.imgfld .. "tabBar_tabSelectedMiddle7.png",       
    tabSelectedFrameWidth = myApp.tabs.frameWidth,                                         
    tabSelectedFrameHeight = myApp.tabs.tabBarHeight,                                          
    buttons = tabButtons,
    height = myApp.tabs.tabBarHeight,
    --background="images/tabBarBg7.png"
}

----------------------------------------------------------
--   Common info fot the screens
----------------------------------------------------------
myApp.screenStartTop = titleBar.height + display.topStatusBarContentHeight