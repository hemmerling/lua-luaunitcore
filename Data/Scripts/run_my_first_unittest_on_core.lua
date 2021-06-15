-- ** Start of modification for Lua@CORE **
local lu = nil
if (CoreObject) then
    local propLuaunit = script:GetCustomProperty("luaunit")
    lu = require(propLuaunit)
else
    lu = require("luaunit")
end
-- ** End of modification for Lua@CORE **

function add(v1,v2)
    -- add positive numbers
    -- return 0 if any of the numbers are 0
    -- error if any of the two numbers are negative
    if v1 < 0 or v2 < 0 then
        error('Can only add positive or null numbers, received '..v1..' and '..v2)
    end
    if v1 == 0 or v2 == 0 then
        return 0
    end
    return v1+v2
end

function testAddPositive()
    lu.assertEquals(add(1,1),2)
end

function testAddZero()
    lu.assertEquals(add(1,0),0)
    lu.assertEquals(add(0,5),0)
    lu.assertEquals(add(0,0),0)
end

function testFalseResult1()
    lu.assertEquals(add(1,1),1)
end

function testFalseResult2()
    lu.assertEquals(add(1,2),1)
end

TestListCompare = {}

    function TestListCompare:test1()
        local A = 1
        local B = 1
        lu.assertEquals( A, B )
    end

    function TestListCompare:test2()
        local A = 1
        local B = 2
        lu.assertEquals( A, B )
    end

    function TestListCompare:test3()
        local A = { 1, 1 } 
        local B = { 1, 2 }
        lu.assertEquals( A, B )
    end
   
    function test04()
        lu.assertAlmostEquals( 1, 2, 0.1 )
    end

-- end TestListCompare

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
    -- The last line executes your script with LuaUnit and exit with the proper error code:
    local result = lu.LuaUnit.run()
    os.exit(result)
end
-- ** End of modification for Lua@CORE **


