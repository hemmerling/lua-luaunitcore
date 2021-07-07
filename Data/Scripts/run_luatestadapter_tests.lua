-- ** Start of modification for Lua@CORE **
local luaunit = nil
if (CoreObject) then
    local propLuaunit = script:GetCustomProperty("luaunit")
    luaunit = require(propLuaunit)
else
    luaunit = require("luaunit")
end
-- ** End of modification for Lua@CORE **

function testPass()
    luaunit.assertEquals({1, 2, 3}, {1, 2, 3})
end

function testFail()
    luaunit.assertEquals({1, 2, 3}, {1, 2, 4})
end

-- ** Start of modification for Lua@CORE **
if (CoreObject) then
    -- Copy _ENV table to the _G client table, as _G = _ENV does not work!
    -- With Lua@CORE, _ENV contains a list of all global symbols ( functions, tables.. )
    -- With Lua@Core, there is a _G client and a _G server table for each player, both are "empty". 
    -- _G = _ENV  -- Does not work!
    for name, address in pairs(_ENV) do 
        --print(name, address)
        _G[name] = address
    end   
    luaunit.LuaUnit.run()
else
    -- The last line executes your script with LuaUnit and exit with the proper error code:
    local result = luaunit.LuaUnit.run()
    os.exit(result, true)
end
-- ** End of modification for Lua@CORE **
