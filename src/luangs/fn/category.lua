--- --------------------------------------------------------------------------
-- @name luangs.fn.type
-- 
-- @description Type library
--   
--  http://www.lags.pro.br
--
--  @author Luiz Antonio Garcia Simões (LAGS)
--
--  This file is free for use of any kind and is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
--
-- 
--  --------------------------------------------------------------------------
--

---
-- @name function - Same as id function. Returns the first parameter.
-- @param val any value
-- @return val
local function ensureAny(val) return val end

---
-- @name makeTypeVerifier - Makes a function that verifies a param type
-- @param aType (string) A valid Lua type name
-- @return a function thate verifies the given type
local function makeTypeVerifier(aType)
  if aType ~= "nil"    and aType ~= "number"   and aType ~= "boolean" and 
     aType ~= "string" and aType ~= "function" and aType ~= "userdata" and
     aType ~= "thread" and aType ~= "table" 
  then
    error("The type '".. aType .. "' is not valid ", 2 )     
  end
  local function ret(val) return type(val) == aType end 
  return ret
end
---
-- @name makeEnsureType - Makes a function that verifies a param type
-- @param aType (string) A valid Lua type name
-- @return a function thate verifies the given type
local function makeEnsureType(aType)
  local  verifier = makeTypeVerifier(aType) 
  local function ret(val)
    if verifier(val) then
      return val
    else
      if val then
        error(val ..  " is a '" .. type(val) .. "', not a '" .. aType .."'",2)
      else
        error("nil value ', not a '" .. aType .."'", 2)
      end
    end
  end
  return ret
end
--[[ is[Type] function - ask if a value [type] 
* @author   LAGS luiz@lags.pro.br
* 
* @param {any} val.
* @return {boolean} returns true or false.
--]]
local function isNil (val) return type(val) == 'nil' end
local function isNumber (val) return type(val) == 'number' end
local function isString (val) return type(val) == 'string' end
local function isBoolean (val) return type(val) == 'boolean' end
local function isUserdata (val) return type(val) == 'userdata' end
local function isTable (val) return type(val) == 'table' end
local function isFunction(val) return type(val) == 'function' end

local function isInteger(val) 
  if isNumber(val) then
    return (val % 0) == 0  
  else
    return false
  end
end

local function isChar(val) 
  if isString(val) then
    return string.len(val) == 1  
  else
    return false
  end
end

local function isDigitChar(val) 
  if isChar(val) then
    return val >= '0' and val <= '9'  
  else
    return false
  end
end

local function isUpperAlphaChar(val)
  if isChar(val) then
    return val >= 'A' and val <= 'Z'  
  else
    return false
  end
end

local function isLowerAlphaChar(val)
  if isChar(val) then
    return val >= 'a' and val <= 'z'  
  else
    return false
  end
end

local function isAlphaChar(val)
  return isLowerAlphaChar(val) or isUpperAlphaChar(val)
end

local function isUpperAlphaNumericChar(val)
  return isUpperAlphaChar(val) or isDigitChar(val)
end

local function isLowerAlphaNumericChar(val)
  return isLowerAlphaChar(val) or isDigitChar(val)
end

local function isAlphaNumericChar(val)
  return isLowerAlphaNumericChar(val) or isUpperAlphaNumericChar(val)
end

local function isDigitString(val) 
  if isString(val) then
    for cnt = 1, string.len(val) do
      local chr = string.sub(val, cnt, cnt)
      if not isDigitChar(chr) then return false end
    end
    return true
  else
    return false
  end
end

local function isUpperAlphaString(val)
  if isString(val) then
    for cnt = 1, string.len(val) do
      local chr = string.sub(val, cnt, cnt)
      if not isUpperAlphaChar(chr) then return false end
    end
    return true
  else
    return false
  end
end

local function isLowerAlphaString(val)
  if isString(val) then
    for cnt = 1, string.len(val) do
      local chr = string.sub(val, cnt, cnt)
      if not isLowerAlphaChar(chr) then return false end
    end
    return true
  else
    return false
  end
end

local function isAlphaString(val)
  if isString(val) then
    for cnt = 1, string.len(val) do
      local chr = string.sub(val, cnt, cnt)
      if not isAlphaChar(chr) then return false end
    end
    return true
  else
    return false
  end
end

local function isLowerAlphaNumericString(val)
  if isString(val) then
    for cnt = 1, string.len(val) do
      local chr = string.sub(val, cnt, cnt)
      if not isLowerAlphaNumericChar(chr) then return false end
    end
    return true
  else
    return false
  end
end

local function isUpperAlphaNumericString(val)
  if isString(val) then
    for cnt = 1, string.len(val) do
      local chr = string.sub(val, cnt, cnt)
      if not isUpperAlphaNumericChar(chr) then return false end
    end
    return true
  else
    return false
  end
end

local function isAlphaNumericString(val)
  if isString(val) then
    for cnt = 1, string.len(val) do
      local chr = string.sub(val, cnt, cnt)
      if not isAlphaNumericChar(chr) then return false end
    end
    return true
  else
    return false
  end
end

local function isEmptyString(val) 
  if isString(val) then
    return string.len(val) == 0  
  else
    return false
  end
end

local function isNotEmptyString(val) 
  if isString(val) then
    return string.len(val) ~= 0  
  else
    return false
  end
end

local function makeIsLessThan(val)
  local function ret (other) return other <  val end
  return ret
end

local function makeIsLessEqualThan(val)
  local function ret(other) return other <=  val end
  return ret
end

local function makeIsGreaterThan(val)
  local function ret(other) return other > val end
  return ret
end

local function makeIsGreaterEqualThan(val)
  local function ret(other) return other >=  val end
  return ret
end

local function makeIsEqualThan(val)
  local function ret(other) return other == val end
  return ret
end

local function makeIsNotEqualThan(val)
  local function ret(other) return other ~= val end
  return ret
end

local function makeIsBetweenThan(a, b)
  local function ret(other) return other <= b and other >= a   end
  return ret
end

local function isOctet(val)
  return isNumber(val) and makeIsBetweenThan(0, 255)(val)
end

local function isIPV4(val)
  if isString(val) then
    local tb = val.split(val, '.')
    if #tb ~= 4 then return false end
    for k, v in tb do 
      if not isOctet(tonumber(v)) then return false end
    end
    return true
  else
    return false
  end
end

local function makeIsNot(anIsTypeFunc)
  if isFunction(anIsTypeFunc) then
    local function ret(val)
      if not anIsTypeFunc(val) then
        return true
      else
        return false
      end
    end
    return ret
  else
    error("Param is not a function.", 2)
  end
end

local isNotNil = makeIsNot(isNil)

local function makeIsNilOr(anIsTypeFunc)
  if isFunction(anIsTypeFunc) then
    local function ret(val) 
      if isNil(val) then 
        return true 
      else
        return anIsTypeFunction(val)
      end
    end
    return ret
  else
    error("Param is not a function.", 2)
  end
end

local function makeIsSatifying(...)
  local isNotFun = makeIsNot(isFunction)
  local fns = ipairs({...})
  for i, fn in fns do
    if isNotFun(fn) then
      error("The parameter of order " .. i .. " is not a function.",  2)
    end
  end
  local function ret(val)
    local res = {}
    for i, fn in fns do
      local itRes = fns[i](val)
      if isBoolean(itRes) then 
        table.insert(res, itRes)
      else
        error("The function of order " .. i .. " does not returns boolean.",  2)
      end
    end
    return unpack(res)
  end
  return ret
end

local function makeIsSatifyingAll(...)
  local fn = makeIsSatifying({...})
  local function ret(val) 
    local res = {fn(val)}
    for i, v in res do
      if not v then return false end
    end
    return true
  end
  return ret
end

local function makeKeyValueTypeCheck(k, fnIsTypeOf)
  if isNotEmptyString(k) then
    if isFunction(fnIsTypeOf) then
      local function ret(tbl)
        if isTable(tbl) then
          if isNotNil(tbl[k]) then
            return fnIsTypeOf(tbl[k])
          else
            return false
          end
        else
          error("The param is not a table.", 2)
        end  
      end
      return ret
    else
      error("The param function is not a function.", 2)
    end
  else
    error("The param key is not an not empty string.", 2)
  end
end
--[[ ensure[Type] function - asunpk if a value [type] functo
* @author   LAGS luiz@lags.pro.br
* np
* @param {any} val.
* @return {any} returns val or error if not of atype.
--]]

local function ensureNil (val) 
  if isNil(val) then
    return nil
  else
    error("The value is not nil.", 2)
  end
end

local function ensureNumber (val) 
  if isNumber(val) then
    return val
  else
    error("The value is not a number.", 2)
  end
end

local function ensureString (val) 
  if isString(val) then
    return val
  else
    error("The value is not a string.", 2)
  end
end

local function ensureBoolean (val) 
  if isBoolean(val) then
    return val
  else
    error("The value is not a boolean.", 2)
  end
end

local function ensureUserdata (val) 
  if isUserdata(val) then
    return val
  else
    error("The value is not a userdata.", 2)
  end
end

local function ensureTable (val) 
  if isTable(val) then
    return val
  else
    error("The value is not a table.", 2)
  end
end

local function ensureFunction(val)
  if isFunction(val) then
    return val
  else
    error("The value is not a function.",2)
  end
end

local function ensureInteger(val)
  if isInteger(val) then
    return val
  else
    error("The value is not an integer.",2)
  end
end

local function ensureChar(val)
  if isChar(val) then
    return val
  else
    error("The value is not an character string.", 2)
  end
end

local function ensureDigitChar(val)
  if isDigitChar(val) then
    return val
  else
    error("The value is not an digit character string.",2)
  end
end

local function ensureUpperAlphaChar(val)
  if isUpperAlphaChar(val) then
    return val
  else
    error("The value is not an upper alphabetic character string.",2)
  end
end

local function ensureLowerAlphaChar(val)
  if isLowerAlphaChar(val) then
    return valval
  else
    error("The value is not a lower alphabetic character string.",2)
  end
end

local function ensureAlphaChar(val)
  if isAlphaChar(val) then
    return val
  else
    error("The value is not an alphabetic character string.",2)
  end
end

local function ensureUpperAlphaNumericChar(val)
  if isUpperAlphaNumericChar(val) then
    return val
  else
    error("The value is not an uppercase valalphanumeric character string.",2)
  end
end

local function ensureLowerAlphaNumericChar(val)
  if isLowerAlphaNumericChar(val) then
    return val
  else
    error("The value is not a lowercase alphanumeric character string.",2)
  end
end

local function ensureAlphaNumericChar(val)
  if isAlphaNumericChar(val) then
    return val
  else
    error("The value is not a lowercase alphanumeric character string.",2)
  end
end

local function ensureDigitString(val)
  if isDigitString(val) then
    return val
  else
    error("The value is not a digit string.",2)
  end
end

local function ensureUpperAlphaString(val)
  if isUpperAlphaString(val) then
    return val
  else
    error("The value is not an upper alphabetic string.",2)
  end
end

local function ensureLowerAlphaString(val)
  if isLowerAlphaString(val) then
    return val
  else
    error("The value is not a lower alphabetic string.",2)
  end
end

local function ensureAlphaString(val)
  if isLowerString(val) then
    return val
  else
    error("The value is not an alphabetic string.",2)
  end
end

local function ensureUpperAlphaNumericString(val)
  if isUpperAlphaNumericString(val) then
    return val
  else
    error("The value is not an upper alphanumeric string.",2)
  end
end

local function ensureLowerAlphaNumericString(val)
  if isLowerAlphaNumericString(val) then
    return val
  else
    error("The value is not a lower alphanumeric string.",2)
  end
end

local function ensureAlphaNumericString(val)
  if isAlphaNumericString(val) then
    return val
  else
    error("The value is not an alphabetic string.",2)
  end
end

local function ensureEmptyString(val)
  if isEmptyString(val) then
    return val
  else
    error("The value is not an empty string.",2)
  end
end

local function ensureNotEmptyString(val)
  if isNotEmptyString(val) then
    return val
  else
    error("The value is an empty string.",2)
  end
end

local function makeEnsureLessThan(val)
  local function ret(other) 
    if other < val then
      return other
    else
      error(other .. " is not less than " .. val, 2)
    end
   end
   return ret
end

local function makeEnsureLessEqualThan(val)
  local function ret(other) 
    if other <=  val then
      return other
    else
      error(other .. " is not less or rqual than " .. val, 2)
    end
  end
  return ret
end

local function makeEnsureGreaterThan(val)
  local function ret(other) 
    if other > val then
      return other
    else
      error(other .. " is not greater than " .. val, 2)
    end
  end
  return ret
end

local function makeEnsureGreaterEqualThan(val)
  local function ret(other) 
    if other >=  val then
      return other
    else
      error(other .. " is not greater or equal than " .. val, 2)
    end
  end
  return ret
end

local function makeEnsureEqualThan(val)
  local function ret(other) 
    if other == val then
      return other
    else
      error(other .. " is not equal " .. val, 2)
    end
  end
  return ret
end

local function makeEnsureNotEqualThan(val)
  local function ret(other) 
    if other ~= val  then
      return other
    else
      error(other .. " is equal " .. val, 2)
    end
  end
  return ret
end

local function makeEnsureBetweenThan(a, b)
  local function ret(other) makeTypeVerifier(aType)
    if other <= b and other >= a then  
      return other
    else
      error(other .. " is not between " .. a .. " and " .. b, 2)
    end
  end
  return ret
end

local function ensureIPV4(val)
  if isIPV4(val) then 
    return val
  else

    error(val .. " is not a IPV4 string", 2)
  end
end

local function makeEnsureNot(anIsTypeFunc)
  local function ret(val)
    if makeIsNot(anIsTypeFunc)(val) then
      return val
    else
       error("The value is incompatible (EnsureNot).")
    end
  end
  return ret
end

local function makeEnsureNilOr(anIsTypeFunc)
  local function ret(val)
    if makeIsNilOr(anIsTypeFunc)(val) then
      return val
    else
      error("The value is incompatible (EnsureNilOr).")
    end
  end
  return ret

end

local function ensureIsSatifyingAll(...)
  local fnSat = makeIsSatifyingAll(...)
  local function ret(val)
    if fnSat(val) then

      return val
    else
      error("The value is incompatible with (ensureIsSatifyingAll).",2)
    end
  end
  return ret

end

return {
  ensureAny = ensureAny,
  makeTypeVerifier = makeTypeVerifier,
  makeEnsureType = makeEnsureType,
  isNil = isNil,
  isNumber =  isNumber,
  isString = isString,
  isBoolean = isBoolean,
  isUserdata = isUserdata,
  isTable = isTable,
  isFunction = isFunction,
  isInteger = isInteger,
  isDigitChar = isDigitChar,
  isUpperAlphaChar = isUpperAlphaChar,
  isLowerAlphaChar = isLowerAlphaChar,
  isAlphaChar = isAlphaChar,
  isUpperAlphanumericChar = isUpperAlphanumericChar,
  isLowerAlphanumericChar = isLowerAlphanumericChar,
  isAlphanumericChar = isAlphanumericChar,
  isDigitString = isDigitString,
  isUpperAlphaString = isUpperAlphaString,
  isLowerAlphaString = isLowerAlphaString,
  isAlphaString = isAlphaString,
  isLowerAlphanumericString = isLowerAlphanumericString,
  isUpperAlphanumericString = isUpperAlphanumericString,
  isAlphanumericString =  isAlphanumericString,
  ensureNil = ensureNil,
  ensureNumber =  ensureNumber,
  ensureString = ensureString,
  ensureBoolean = ensureBoolean,
  ensureUserdata = ensureUserdata,
  ensureTable = ensureTable,
  ensureFunction = ensureFunction,
  ensureInteger = ensureInteger,
  ensureDigitChar = ensureDigitChar,
  ensureUpperAlphaChar = ensureUpperAlphaChar,
  ensureLowerAlphaChar = ensureLowerAlphaChar,
  ensureAlphaChar = ensureAlphaChar,
  ensureUpperAlphanumericChar = ensureUpperAlphanumericChar,
  ensureLowerAlphanumericChar = ensureLowerAlphanumericChar,
  ensureAlphanumericChar = ensureAlphanumericChar,
  ensureDigitString = ensureDigitString,
  ensureUpperAlphaString = ensureUpperAlphaString,
  ensureLowerAlphaString = ensureLowerAlphaString,
  ensureAlphaString = ensureAlphaString,
  ensureLowerAlphanumericString = ensureLowerAlphanumericString,
  ensureUpperAlphanumericString = ensureUpperAlphanumericString,
  ensureAlphanumericString =  ensureAlphanumericString,
}