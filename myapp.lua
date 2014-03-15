
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

-------------------------------------------------------
-- Seed random generator in case we use
-------------------------------------------------------
math.randomseed( os.time() )

print "In myapp.lua"

-------------------------------------------------------
-- Set app variables
-------------------------------------------------------
if (display.pixelHeight/display.pixelWidth) > 1.5 then
    M.isTall = true
end

if display.contentWidth > 320 then
    M.is_iPad = true
end

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
    myApp.topBarBg = "images/topBarBg7.png"
else
    local coronaBuild = system.getInfo("build")
    if tonumber(coronaBuild:sub(6,12)) < 1206 then
        myApp.theme = "widget_theme_ios"
    end
end

local iconInfo = {
    width = 40,
    height = 40,
    numFrames = 20,
    sheetContentWidth = 200,
    sheetContentHeight = 160
}

M.icons = graphics.newImageSheet("images/ios7icons.png", iconInfo)

return M
