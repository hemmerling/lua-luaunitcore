-- ** Start of modification for Lua@CORE **
if (CoreObject) then
else
    -- #!/usr/bin/env lua
end
-- ** End of modification for Lua@CORE **

-- ** Start of modification for Lua@CORE **
local startResult, breakerType = nil, nil
if (CoreObject) then
else
    if (os.getenv("_DEBUG")) then
        local json = require "json"
        local debuggee = require "vscode-debuggee"

        startResult, breakerType = debuggee.start(json)
        print("debuggee start ->", startResult, breakerType)
    end
end
-- ** End of modification for Lua@CORE **

-- ** Start of modification for Lua@CORE **
local test_luaunit = nil
if (CoreObject) then
    local propTest_luaunit = script:GetCustomProperty("test_luaunit")
    test_luaunit = require(propTest_luaunit)
    -- test_luaunit.TestLuaUnitUtilities.test_FailFmt = nil
else
    local no_error, err_msg
    no_error, err_msg = pcall(require, "test.test_luaunit")
    if not no_error then
        if nil == err_msg:find("module 'test.test_luaunit' not found") then
            -- module found but error loading it
            -- display the error by reproducing it
            require("test.test_luaunit")
        end

        -- run_unit_tests shall also work when called directly from the test directory
        require("test_luaunit")

        -- we must disable this test, not working in this case because it expects
        -- the stack trace to start with test/test_luaunit.lua
        TestLuaUnitUtilities.test_FailFmt = nil
    end
end
-- ** End of modification for Lua@CORE **

-- ** Start of modification for Lua@CORE **
local lu = nil
if (CoreObject) then
    local propLuaunit = script:GetCustomProperty("luaunit")
    lu = require(propLuaunit)
else
    lu = require("luaunit")
end
-- ** End of modification for Lua@CORE **

lu.LuaUnit.verbosity = 2
-- ** Start of modification for Lua@CORE **
if (CoreObject) then
    lu.LuaUnit.run()
else 
    os.exit(lu.LuaUnit.run())
end
-- ** End of modification for Lua@CORE **
