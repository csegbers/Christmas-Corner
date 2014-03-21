
-------------------------------------------------------
-- Store variables used across the app
-------------------------------------------------------
local M = { 
            debugMode = true,
            appName = "Christmas Corner Initial" ,
            splashDelay = 150,    -- milliseconds
            saColor = { },
            saColorTrans = { },
            colorGray = { },
            isTall = false,
            colorDivisor = 255,
            isGraphics2 = true,
            is_iPad = false,
            imgfld = "images/",
            theme = "widget_theme_ios7",
            font = "HelveticaNeue-Light",
            fontBold = "HelveticaNeue",
            fontItalic = "HelveticaNeue-LightItalic",
            fontBoldItalic = "Helvetica-BoldItalic",
            parse = {
                        appId = '',
                        restApikey = '',
                        getConfig = "https://api.parse.com/1/functions/getconfig",

                    },
            tabs = {
                        tabbtnw = 32,tabbtnh = 32,
                        home = {label="Home",lua="home",time=250, effect="crossFade",def="images/tabbaricon.png",over="images/tabbaricon-down.png"},
                        menu = {label="Menu",lua="menu",time=250, effect="crossFade",def="images/tabbaricon.png",over="images/tabbaricon-down.png"},
                        blogs = {
                                  label="Blogs",lua="feed",time=250, effect="crossFade",def="images/tabbaricon.png",over="images/tabbaricon-down.png",
                                  options = {
                                        feedName = "corona.rss",
                                        feedURL = "http://www.coronalabs.com/feed/",
                                        icons = "fixed",
                                        displayMode = "webpage",
                                        pageTitle = "Corona Labs"
                                             }
                                  },
                       pics = {label="Pics",lua="photogallery",stime=250, effect="crossFade",def="images/tabbaricon.png",over="images/tabbaricon-down.png"},
                       video = {
                                    label="Video",lua="feed2",time=250, effect="crossFade",def="images/tabbaricon.png",over="images/tabbaricon-down.png",
                                    options = {
                                            feedName = "video.rss",
                                            feedURL = "http://gdata.youtube.com/feeds/mobile/users/CoronaLabs/uploads?max-results=20&alt=rss&orderby=published&format=1",
                                            icons = "fixed",
                                            displayMode = "videoviewer",
                                            pageTitle = "Corona Videos"
                                               }                                
                                },
                       maps = {
                                    label="Maps",lua="mapscene",time=250, effect="crossFade",def="images/tabbaricon.png",over="images/tabbaricon-down.png",
                                    options = {
                                            pageTitle = "Corona Headquarters"
                                             }                              
                                },
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
print "In myapp.lua"

-------------------------------------------------------
-- Seed random generator in case we use
-------------------------------------------------------
math.randomseed( os.time() )

-------------------------------------------------------
-- Set app variables
-------------------------------------------------------
if (display.pixelHeight/display.pixelWidth) > 1.5 then
    M.isTall = true
end

if display.contentWidth > 320 then M.is_iPad = true end

--
-- Handle Graphics 2.0 changes
if tonumber( system.getInfo("build") ) < 2013.2000 then
    -- we are a Graphics 1.0 build
    M.colorDivisor = 1
    M.isGraphics2 = false
end

M.saColor = { 0/M.colorDivisor, 104/M.colorDivisor, 167/M.colorDivisor } 
M.saColorTrans = { 0/M.colorDivisor, 104/M.colorDivisor, 167/M.colorDivisor, .75 }
M.colorGray = { 83/M.colorDivisor, 83/M.colorDivisor, 83/M.colorDivisor }

if system.getInfo("platformName") == "Android" then
    myApp.theme = "widget_theme_android"
    myApp.font = "Droid Sans"
    myApp.fontBold = "Droid Sans Bold"
    myApp.fontItalic = "Droid Sans"
    myApp.fontBoldItalic = "Droid Sans Bold"
    myApp.topBarBg = M.imgfld .. "topBarBg7.png"
else
    local coronaBuild = system.getInfo("build")
    if tonumber(coronaBuild:sub(6,12)) < 1206 then myApp.theme = "widget_theme_ios" end
end

local iconInfo = {
    width = 40,
    height = 40,
    numFrames = 20,
    sheetContentWidth = 200,
    sheetContentHeight = 160
}

M.icons = graphics.newImageSheet(M.imgfld.. "ios7icons.png", iconInfo)

return M
