-- ** Start of modification for Lua@CORE **
local lu = nil
if (CoreObject) then
    local propLuaunit = script:GetCustomProperty("luaunit")
    lu = require(propLuaunit)
else
    lu = require("luaunit")
end
-- ** End of modification for Lua@CORE **

--[[ Test used by functional tests ]]
TestSomething = {} --class

    function TestSomething:test1_Success1()
        lu.assertEquals( 1+1, 2 )
    end

    function TestSomething:test1_Success2()
        lu.assertEquals( 1+2, 3 )
    end

    function TestSomething:test2_Fail1()
        lu.assertEquals( 1+1, 0 )
    end

    function TestSomething:test2_Fail2()
        lu.assertEquals( 1+2, 0 )
    end

    function TestSomething:test3_Err1()
        local v = 1 + { 1,2 }
    end

    function TestSomething:test3_Err2()
        local v = 1 + { 1,2 }
    end

TestAnotherThing = {} --class

    function TestAnotherThing:test1_Success1()
        lu.assertEquals( 1+1, 2 )
    end

    function TestAnotherThing:test1_Success2()
        lu.assertEquals( 1+2, 3 )
    end

    function TestAnotherThing:test2_Err1()
        local v = 1 + { 1,2 }
    end

    function TestAnotherThing:test2_Err2()
        local v = 1 + { 1,2 }
    end

    function TestAnotherThing:test3_Fail1()
        lu.assertEquals( 1+1, 0 )
    end

    function TestAnotherThing:test3_Fail2()
        lu.assertEquals( 1+2, 0 )
    end


function testFuncSuccess1()
    lu.assertEquals( 1+1, 2 )
end

function testFuncFail1()
    lu.assertEquals( 1+2, 0 )
end

function testFuncErr1()
    local v = 1 + { 1,2 }
end

-- ** Start of modification for Lua@CORE **
local runner = lu.LuaUnit.new()
if (CoreObject) then
    -- Copy _ENV table to the _G client table, as _G = _ENV does not work!
    -- With Lua@CORE, _ENV contains a list of all global symbols ( functions, tables.. )
    -- With Lua@Core, there is a _G client and a _G server table for each player, both are "empty". 
    -- _G = _ENV  -- Does not work!
    for name, address in pairs(_ENV) do 
        --print(name, address)
        _G[name] = address
    end   
    runner:runSuite() 
else
    runner:setOutputType("text")
    os.exit( runner:runSuite() )    
end
-- ** End of modification for Lua@CORE **
