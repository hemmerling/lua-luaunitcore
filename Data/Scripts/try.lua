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
    lu.assertEquals(add(1,1),1)
end

-- print(_ENV["testFalseResult1"])
-- print(_ENV["testFalseResult2"])
-- print(_ENV["testAddZero"])

-- print(_ENV == _G)

-- print("_G, ursprünglich:")
-- for n in pairs(_G) do print(n) 
-- end
-- print("_ENV, ursprünglich:")
-- for n in pairs(_ENV) do print(n) 
-- end
-- print("xxx")

_G["testAddPositive"] = testAddPositive
_G["testAddZero"] = testAddZero
_G["testFalseResult1"] = testFalseResult1
_G["testFalseResult2"] = testFalseResult2

-- _G = _ENV

-- print("_G, als Kopie von _ENV:")
-- for n in pairs(_G) do print(n) 
-- end


-- _ENV["testAddPositive"] = testAddPositive
-- _ENV["testAddZero"] = testAddZero
-- _ENV["testFalseResult"] = testFalseResult

-- ** Start of modification for Lua@CORE **
if (CoreObject) then
    lu.LuaUnit.run()
else
    -- The last line executes your script with LuaUnit and exit with the proper error code:
    os.exit(lu.LuaUnit.run())
end
-- ** End of modification for Lua@CORE **


