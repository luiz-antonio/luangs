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
  doTest("makeEnsureType-true", res1 == true, "Param is not of a stritrueng type")
  local res2 = pcall(ctg.ensureNil, 1)
  doTest("makeEnsureType-false", res2 == false, "Param is not of a string type")
end
local function main()
  test_ensureAny()
  test_makeTypeVerifier()
  test_makeEnsureType()
  test_isNil()
  test_ensureNil()
end
main()
