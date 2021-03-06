--- Test
local ctg = require "luangs.fn.category"
local coll = require "luangs.fn.collection"
-- Test Cathegory
local function showErr(err)
  print ("###>Error: " + err)
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
local function test_isDigitChar()
  doTest("isDigitChar-true", ctg.isDigitChar('9'), "Param is not of the right type")
  doTest("isDigitChar-false", ctg.isDigitChar('a') == false, "Param is not of the right type")
end
local function test_ensureDigtiChar()
  local res1 = pcall(ctg.ensureDigitChar, '7')
  doTest("ensureDigitChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureDigitChar, 'a')
  doTest("ensureDigitChar-false", res2 == false, "Param is not of a right type")
end
local function test_isUpperAlphaChar()
  doTest("isUpperAlphaChar-true", ctg.isUpperAlphaChar('W'), "Param is not of the right type")
  doTest("isUpperAlphaChar-false", ctg.isUpperAlphaChar('a') == false, "Param is not of the right type")
end
local function test_ensureUpperAlphaChar()
  local res1 = pcall(ctg.ensureUpperAlphaChar, 'W')
  doTest("ensureUpperAlphaChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureUpperAlphaChar, 'a')
  doTest("ensureUpperAlphaChar-false", res2 == false, "Param is not of a right type")
end
local function test_isLowerAlphaChar()
  doTest("isLowerAlphaChar-true", ctg.isLowerAlphaChar('a'), "Param is not of the right type")
  doTest("isLowerAlphaChar-false", ctg.isLowerAlphaChar('A') == false, "Param is not of the right type")
end
local function test_ensureLowerAlphaChar()
  local res1 = pcall(ctg.ensureLowerAlphaChar, 'a')
  doTest("ensureLowerAlphaChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureLowerAlphaChar, 'W')
  doTest("ensureLowerAlphaChar-false", res2 == false, "Param is not of a right type")
end
local function test_isAlphaChar()
  doTest("isAlphaChar-true", ctg.isAlphaChar('a'), "Param is not of the right type")
  doTest("isAlphaChar-false", ctg.isAlphaChar('2') == false, "Param is not of the right type")
end
local function test_ensureAlphaChar()
  local res1 = pcall(ctg.ensureAlphaChar, 'A')
  doTest("ensureAlphaChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureAlphaChar, '3')
  doTest("ensureAlphaChar-false", res2 == false, "Param is not of a right type")
end
local function test_isUpperAlphaNumericChar()
  doTest("isUpperAlphaNumericChar-true", ctg.isUpperAlphaNumericChar('A'), "Param is not of the right type")
  doTest("isUpperAlphaNumericChar-false", ctg.isUpperAlphaNumericChar('a') == false, "Param is not of the right type")
end
local function test_ensureUpperAlphaNumericChar()
  local res1 = pcall(ctg.ensureUpperAlphaNumericChar, 'A')
  doTest("ensureUpperAlphaNumericChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureUpperAlphaNumericChar, 'a')
  doTest("ensureUpperAlphaNumericChar-false", res2 == false, "Param is not of a right type")
end
local function test_isLowerAlphaNumericChar()
  doTest("isLowerAlphaNumericChar-true", ctg.isLowerAlphaNumericChar('a'), "Param is not of the right type")
  doTest("isLowerAlphaNumericChar-false", ctg.isLowerAlphaNumericChar('A') == false, "Param is not of the right type")
end
local function test_ensureLowerAlphaNumericChar()
  local res1 = pcall(ctg.ensureLowerAlphaNumericChar, 'a')
  doTest("ensureLowerAlphaNumericChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureLowerAlphaNumericChar, 'A')
  doTest("ensureLowerAlphaNumericChar-false", res2 == false, "Param is not of a right type")
end

local function test_isAlphaNumericChar()
  doTest("isAlphaNumericChar-true", ctg.isAlphaNumericChar('a'), "Param is not of the right type")
  doTest("isAlphaNumericChar-false", ctg.isAlphaNumericChar('!') == false, "Param is not of the right type")
end
local function test_ensureAlphaNumericChar()
  local res1 = pcall(ctg.ensureAlphaNumericChar, 'a')
  doTest("ensureAlphaNumericChar-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureAlphaNumericChar, '!')
  doTest("ensureAlphaNumericChar-false", res2 == false, "Param is not of a right type")
end
local function test_isDigitString()
  doTest("isDigitString-true", ctg.isDigitString('157'), "Param is not of the right type")
  doTest("isDigitString-false", ctg.isDigitString('15a3') == false, "Param is not of the right type")
end
local function test_ensureDigitString()
  local res1 = pcall(ctg.ensureDigitString, '157')
  doTest("ensureDigitString-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureDigitString, '15a3')
  doTest("ensureDigitString-false", res2 == false, "Param is not of a right type")
end
local function test_isUpperAlphaString()
  doTest("isUpperAlphaString-true", ctg.isUpperAlphaString('ABC'), "Param is not of the right type")
  doTest("isUpperAlphaString-false", ctg.isUpperAlphaString('Aa3') == false, "Param is not of the right type")
end
local function test_ensureUpperAlphaString()
  local res1 = pcall(ctg.ensureUpperAlphaString, 'ABC')
  doTest("ensureUpperAlphaString-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureUpperAlphaString, 'AbC')
  doTest("ensureUpperAlphaString-false", res2 == false, "Param is not of a right type")
end
local function test_isLowerAlphaString()
  doTest("isLowerAlphaString-true", ctg.isLowerAlphaString('abc'), "Param is not of the right type")
  doTest("isLowerAlphaString-false", ctg.isLowerAlphaString('abC') == false, "Param is not of the right type")
end
local function test_ensureLowerAlphaString()
  local res1 = pcall(ctg.ensureLowerAlphaString, 'abc')
  doTest("ensureLowerAlphaString-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureLowerAlphaString, 'AbC')
  doTest("ensureLowerAlphaString-false", res2 == false, "Param is not of a right type")
end
local function test_isAlphaString()
  doTest("isAlphaString-true", ctg.isAlphaString('aBc'), "Param is not of the right type")
  doTest("isAlphaString-false", ctg.isAlphaString('ab1') == false, "Param is not of the right type")
end
local function test_ensureAlphaString()
  local res1 = pcall(ctg.ensureAlphaString, 'aBc')
  doTest("ensureAlphaString-true", res1 == true, "Param is not of a right type")
  local res2 = pcall(ctg.ensureAlphaString, 'Ab1')
  doTest("ensureAlphaString-false", res2 == false, "Param is not of a right type")
end
-- Test collection
local function test_makeMapIterator ()
  local dup = coll.makeMapIterator({1,2,3}, function(x) return x * 2 end)
  local res = {}
  for val in dup do
    table.insert(res, #res + 1, val)
  end
  doTest("collection.MapIterator", #res == 3 and res[1] == 2 and res[3] == 6, "res must be equal {2,4,6} ")
end
local function test_makeReverseMapIterator ()
  local dup = coll.makeReverseMapIterator({1,2,3}, function(x) return x * 2 end)
  local res = {}
  for val in dup do
    table.insert(res, #res + 1, val)
  end
  doTest("collection.makeReverseMapIterator", #res == 3 and res[3] == 2 and res[1] == 6, "res must be equal {6,4,2} ")
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
  test_isDigitChar()
  test_ensureDigtiChar()
  test_isUpperAlphaChar()
  test_ensureUpperAlphaChar()
  test_isLowerAlphaChar()
  test_ensureLowerAlphaChar()
  test_isAlphaChar()
  test_ensureAlphaChar()
  test_isUpperAlphaNumericChar()
  test_ensureUpperAlphaNumericChar()
  test_isLowerAlphaNumericChar()
  test_ensureLowerAlphaNumericChar()
  test_isAlphaNumericChar()
  test_ensureAlphaNumericChar()
  test_isDigitString()
  test_ensureDigitString()
  test_isUpperAlphaString()
  test_ensureUpperAlphaString()
  test_isLowerAlphaString()
  test_ensureLowerAlphaString()
  test_makeMapIterator()
  test_makeReverseMapIterator()
  test_isAlphaString()
  test_ensureAlphaString()
end
main()
