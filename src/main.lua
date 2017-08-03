--- Test
local ctg = require "luangs.fn.category"
local function showErr(err)
  print ("Error: " + err)
end
local function doTest(name, cond, msg)
  local function fn ()
    assert(cond, msg)
    print("Test for '" .. name .. "' OK.")
  end 
  local function showErr(msg)
    print("Test for '" .. name .. "' >>>> Error:", msg)
  end
  xpcall(fn, showErr)
end
local function test_ensureAny ()
  doTest("ensureAny-true", ctg.ensureAny(1) == 1, "Param val and return value must be the same.")
  doTest("ensureAny-false", ctg.ensureAny("qqq") ~= 1, "Param val and return value must be the same.")
end
local function test_makeTypeVerifier()
  local fn = ctg.makeTypeVerifier("number")
  doTest("makeTypeVerifier-true", fn(1) == true, "Not a number.local doNil")
  doTest("makeTypeVerifier-false", fn("ss") == false, "Is a number.")
end
local function test_makeEnsureType()
  local fn = ctg.makeEnsureType("string")
  local res1 = pcall(fn, "a string value")
  doTest("makeEnsureType-true", res1 == true, "Param is not of a string type")
  local res2 = pcall(fn,1)
  doTest("makeEnsureType-false", res2 == false, "Param is not of a string type")
end
local function test_isNil()
  doTest("isNil-true", ctg.isNil(nil), "Param is not nil")
  doTest("isNil-false", ctg.isNil(1) == false, "Param is not Nil")
end
local function test_ensureNil()
  local res1 = pcall(ctg.ensureNil, nil)
  doTest("ensureNil-true", res1 == true, "Param is not of a nil type")
  local res2 = pcall(ctg.ensureNil, 1)
  doTest("ensureNil-false", res2 == false, "Param is not of a nil type")
end
local function test_isNumber()
  doTest("isNumber-true", ctg.isNumber(1), "Param is not number")
  doTest("isNumber-false", ctg.isNumber("abc") == false, "Param is not number")
end
local function test_ensureNumber()
  local res1 = pcall(ctg.ensureNumber, 1)
  doTest("ensureNumber-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureNumber, nil)
  doTest("ensureNumber-false", res2 == false, "Param is not of a right type")
end
local function test_isString()
  doTest("isString-true", ctg.isString("abc"), "Param is not of the right type")
  doTest("isString-false", ctg.isString(1) == false, "Param is not of the right type")
end
local function test_ensureString()
  local res1 = pcall(ctg.ensureString, "a")
  doTest("ensureString-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureString, {})
  doTest("ensureString-false", res2 == false, "Param is not of a right type")
end
local function test_isBoolean()
  doTest("isBoolean-true", ctg.isBoolean(true), "Param is not of the right type")
  doTest("isBoolean-false", ctg.isBoolean("false") == false, "Param is not of the right type")
end
local function test_ensureBoolean()
  local res1 = pcall(ctg.ensureBoolean, true)
  doTest("ensureBoolean-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureBoolean, 123)
  doTest("ensureBoolean-false", res2 == false, "Param is not of a right type")
end
local function test_isTable()
  doTest("isTable-true", ctg.isTable({}), "Param is not of the right type")
  doTest("isTable-false", ctg.isTable("abc") == false, "Param is not of the right type")
end
local function test_ensureTable()
  local res1 = pcall(ctg.ensureTable, {})
  doTest("ensureTable-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureTable, "123")
  doTest("ensureTable-false", res2 == false, "Param is not of a right type")
end
local function test_isFunction()
  doTest("isFunction-true", ctg.isFunction(function () return nil end), "Param is not of the right type")
  doTest("isFunction-false", ctg.isFunction("abc") == false, "Param is not of the right type")
end
local function test_ensureFunction()
  local res1 = pcall(ctg.ensureFunction, function () return nil end)
  doTest("ensureFunction-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureFunction, "123")
  doTest("ensureFunction-false", res2 == false, "Param is not of a right type")
end
local function test_isInteger()
  doTest("isInteger-true", ctg.isInteger(1234), "Param is not of the right type")
  doTest("isInteger-false", ctg.isInteger(12.5) == false, "Param is not of the right type")
end
local function test_ensureInteger()
  local res1 = pcall(ctg.ensureInteger, 1234)
  doTest("ensureInteger-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureInteger, 10.01)
  doTest("ensureFunction-false", res2 == false, "Param is not of a right type")
end
local function test_isChar()
  doTest("isChar-true", ctg.isChar('a'), "Param is not of the right type")
  doTest("isChar-false", ctg.isChar('abc') == false, "Param is not of the right type")
end
local function test_ensureChar()
  local res1 = pcall(ctg.ensureChar, 'a')
  doTest("ensureChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureChar, 'abc')
  doTest("ensureChar-false", res2 == false, "Param is not of a right type")
end
local function main()
  test_ensureAny()
  test_makeTypeVerifier()
  test_makeEnsureType()
  test_isNil()
  test_ensureNil()
  test_isNumber()
  test_ensureNumber()
  test_isString()
  test_ensureString()
  test_isBoolean()
  test_ensureBoolean()
  test_isTable()
  test_ensureTable()
  test_isFunction()
  test_ensureFunction()
  test_isInteger()
  test_ensureInteger()
  test_isChar()
  test_ensureChar()
end
main()
