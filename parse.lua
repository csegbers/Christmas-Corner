--module(..., package.seeall)
local M = {}

local json = require("json")
local mime = require("mime")
local myApp = require( "myapp" ) 

M.parseNetworkListener	= function (event)

        t = json.decode(event.response)
        r = t.result
        print ("network listener"..r.appName)
        myApp.appName = r.appName
               
end

M.parseGetConfig  = function (event)
        headers = {}
        headers["X-Parse-Application-Id"] = myApp.ParseAPPID
        headers["X-Parse-REST-API-Key"] = myApp.ParseRESTAPIKEY
        headers["Content-Type"] = "application/json"

        local params = {}
        params.headers = headers
        local x = {}
        x.me = "S"
        params.body = json.encode(x)
 
        network.request( "https://api.parse.com/1/functions/getconfig" ,"POST", M.parseNetworkListener,  params)

end
    
return M