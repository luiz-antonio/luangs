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
---verifies a param type
-- @name makeEnsureType - Makes a function that veriverifies a param typefies a param type
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
---
-- @name isNil - Verifies if a value is nil
-- @param val (any) A value
-- @return a boolean indicating if the value is nil
local function isNil (val) return type(val) == 'nil' end
---
-- @name ensureNil - Function that returns param if param is nil else error
-- @param val (any) A value
-- @return val (any)
--
local function ensureNil (val) 
  if isNil(val) then
    return nil
  else
    error("The value is not nil.", 2)
  end
end
---
-- @name isNumber - Verifies if a value is number
-- @param val (any) A value
-- @return a boolean indicating if the value is a number
local function isNumber (val) return type(val) == 'number' end

---
-- @name ensureNumber - Function that returns param if param is number else error
-- @param val (any) A value
-- @return val(any)
local function ensureNumber (val) 
  if isNumber(val) then
    return val
  else
    error("The value is not a number.", 2)
  end
end

---
-- @name isString - Verifies if a value is a string
-- @param val (any) A value
-- @return a boolean indicating if the value is a string
local function isString (val) return type(val) == 'string' end

---
-- @name ensureString - Function that returns param if param is a string else error
-- @param val (any) A value
-- @return val(any)
local function ensureString (val) 
  if isString(val) then
    return val
  else
    error("The value is not a string.", 2)
  end
end

---
-- @name isString - Verifies if a value is a string
-- @param val (any) A value
-- @return a boolean indicating if the value is a boolean
local function isBoolean (val) return type(val) == 'boolean' end

---
-- @name ensureBoolean - Function that returns param if param is a boolean else error
-- @param val (any) A value
-- @return val(any)
local function ensureBoolean (val) 
  if isBoolean(val) then
    return val
  else
    error("The value is not a boolean.", 2)
  end
end

---
-- @name isUserdata - Verifies if a value is a userdata
-- @param val (any) A value
-- @return a boolean indicating if the value is a userdata
local function isUserdata (val) return type(val) == 'userdata' end

---
-- @name ensureUserdata - Function that returns param if param is a userdata else error
-- @param val (any) A value
-- @return val(any)
local function ensureUserdata (val) 
  if isUserdata(val) then
    return val
  else
    error("The value is not a userdata.", 2)
  end
end

---
-- @name isTable - Verifies if a value is a table
-- @param val (any) A value
-- @return a boolean indicating if the value is a table
local function isTable (val) return type(val) == 'table' end

---
-- @name ensureTable - Function that returns param if param is a table else error
-- @param val (any) A value
-- @return val(any)
local function ensureTable (val) 
  if isTable(val) then
    return val
  else
    error("The value is not a table.", 2)
  end
end

---
-- @name isFunction - Verifies if a value is a function
-- @param val (any) A value
-- @return a boolean indicating if the value is a table
local function isFunction(val) return type(val) == 'function' end

---
-- @name ensureFunction - Function that returns param if param is a function else error
-- @param val (any) A value
-- @return val (any)
local function ensureFunction(val)
  if isFunction(val) then
    return val
  else
    error("The value is not a function.",2)
  end
end

---
-- @name isInteger - Verifies if a value is a integer
-- @param val (any) A value
-- @return a boolean indicating if the value is a integer number
local function isInteger(val) 
  if isNumber(val) then
    return math.floor(val) == val  
  else
    return false
  end
end

---
-- @name ensureInteger - Function that returns param if param is a integer else error
-- @param val (any) A value
-- @return val(any)
local function ensureInteger(val)
  if isInteger(val) then
    return val
  else
    error("The value is not an integer.",2)
  end
end

---
-- @name isChar - Verifies if a value is a char
-- @param val (any) A value
-- @return a boolean indicating if the value is a char
local function isChar(val) 
  if isString(val) then
    return string.len(val) == 1  
  else
    return false
  end
end

---
-- @name ensureChar - Function that returns param if param is a char else error
-- @param val (any) A value
-- @return val(any)
local function ensureChar(val)
  if isChar(val) then
    return val
  else
    error("The value is not an character string.", 2)
  end
end

---
-- @name isDigitChar - Verifies if a value is a digit
-- @param val (any) A value
-- @return a boolean indicating if the value is a char
local function isDigitChar(val) 
  if isChar(val) then
    return val >= '0' and val <= '9'  
  else
    return false
  end
end

---
-- @name ensureDigitChar - Function that returns param if param is a digit char else error
-- @param val (any) A value
-- @return val(any)
local function ensureDigitChar(val)
  if isDigitChar(val) then
    return val
  else
    error("The value is not an digit character string.",2)
  end
end

---
-- @name isUpperAlphaChar - Verifies if a value is upper alpha char
-- @param val (any) A value
-- @return a boolean indicating if the value is a upper alpha char
local function isUpperAlphaChar(val)
  if isChar(val) then
    local cod = string.byte(val)
    return cod >= 65 and cod <= 90   
  else
    return false
  end
end

---
-- @name ensureUpperAlphaChar - Function that returns param if param is a upper alpha char else error
-- @param val (any) A value
-- @return val(any)
local function ensureUpperAlphaChar(val)
  if isUpperAlphaChar(val) then
    return val
  else
    error("The value is not an upper alphabetic character string.",2)
  end
end

---
-- @name isLowerAlphaChar - Verifies if a value is lower alpha char
-- @param val (any) A value
-- @return a boolean indicating if the value is a lower alpha char
local function isLowerAlphaChar(val)
  if isChar(val) then
     local cod = string.byte(val)
     return cod >= 97 and cod <= 122  
  else
    return false
  end
end

---
-- @name ensureLowerAlphaChar - Function that returns param if param is a lower alpha char else error
-- @param val (any) A value
-- @return val(any)
local function ensureLowerAlphaChar(val)
  if isLowerAlphaChar(val) then
    return val
  else
    error("The value is not a lower alphabetic character string.",2)
  end
end

---
-- @name isAlphaChar - Verifies if a value is an alpha char
-- @param val (any) A value
-- @return a boolean indicating if the value is an alpha char
local function isAlphaChar(val)
  return isLowerAlphaChar(val) or isUpperAlphaChar(val)
end

---
-- @name ensureAlphaChar - Function that returns param if param is an alpha char else error
-- @param val (any) A value
-- @return val(any)
local function ensureAlphaChar(val)
  if isAlphaChar(val) then
    return val
  else
    error("The value is not an alphabetic character string.",2)
  end
end

---
-- @name isAlphaChar - Verifies if a value is an upper alphanumeric char
-- @param val (any) A value
-- @return a boolean indicating if the value is an alpha char
local function isUpperAlphaNumericChar(val)
  return isUpperAlphaChar(val) or isDigitChar(val)
end

---
-- @name ensureUpperAlphaNumericChar - Function that returns param if param is an upper alphanumeric char else error
-- @param val (any) A value
-- @return val(any)
local function ensureUpperAlphaNumericChar(val)
  if isUpperAlphaNumericChar(val) then
    return val
  else
    error("The value is not an uppercase valalphanumeric character string.",2)
  end
end
---
-- @name isLowerAlphaNumericChar - Verifies if a value is an lower alphanumeric char
-- @param val (any) A value
-- @return a boolean indicating if the value is an alpha char
local function isLowerAlphaNumericChar(val)
  return isLowerAlphaChar(val) or isDigitChar(val)
end
---
-- @name ensureLowerAlphaNumericChar - Function that returns param if param is an lower alphanumeric char else error
-- @param val (any) A value
-- @return val(any)
local function ensureLowerAlphaNumericChar(val)
  if isLowerAlphaNumericChar(val) then
    return val
  else
    error("The value is not a lowercase alphanumeric character string.",2)
  end
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

---
-- @name ensureUpperAlphaNumericString - Function that returns param if param is an upper alphanueric char else error
-- @param val (any) A value
-- @return val(any)
local function ensureUpperAlphaNumericString(val)
  if isUpperAlphaNumericString(val) then
    return val
  else
    error("The value is not an upper alphanumeric string.",2)
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
  isChar = isChar,
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
  ensureChar = ensureChar,
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
  isUpperAlphaNumericChar = isUpperAlphaNumericChar,
  ensureUpperAlphaNumericChar = ensureUpperAlphaNumericChar,
  isLowerAlphaNumericChar = isLowerAlphaNumericChar,
  ensureLowerAlphaNumericChar = ensureLowerAlphaNumericChar
}