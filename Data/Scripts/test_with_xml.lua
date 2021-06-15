-- ** Start of modification for Lua@CORE **
local lu = nil
if (CoreObject) then
    local propLuaunit = script:GetCustomProperty("luaunit")
    lu = require(propLuaunit)
else
    lu = require("luaunit")
end
-- ** End of modification for Lua@CORE **

TestFailuresWithXml = {} --class

    TestFailuresWithXml.__class__ = 'TestFailuresWithXml'

    function TestFailuresWithXml:test_failure_with_simple_xml()
        lu.assertEquals( '<toto>ti"ti</toto>', 'got it' )
    end

    function TestFailuresWithXml:test_failure_with_cdata_xml()
        lu.assertEquals( 'cdata does not like ]]>', 'got it' )
    end

function TestThatLastsALongTime()
	local start = os.clock()
	while os.clock() - start < 1.1 do
	end
end

lu.LuaUnit.verbosity = 2

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
    lu.LuaUnit.run()  
 else
    local result = lu.LuaUnit.run()    
    --os.exit(result)    
end
-- ** End of modification for Lua@CORE **