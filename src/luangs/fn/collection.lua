--- --------------------------------------------------------------------------
-- @name luangs.fn.collection
-- 
-- @description Collection library
--   
--  http://www.lags.pro.br
--
--  @author Luiz Antonio Garcia Simoes (LAGS)
--
--  This file is free for use of any kind and is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
--
-- 
--  --------------------------------------------------------------------------
-- TODO: http://matthewcarriere.com/2008/06/23/using-select-reject-collect-inject-and-detect/

---
-- @name makeMapIterator - Make an iterator to Apply a function in each elements of an array.
-- @param tb table an array to be processed.
-- @param function a function to be execute in each element.
-- @return function an iterator function to execute as a collection in a generic for. 
local function makeMapIterator(tb, fn)
  local cr = coroutine.create(
    function()
      local n = #tb
      local i = 1
      while i <= n do  coroutine.yield(fn(tb[i])); i = i + 1  end
    end
  )
  local fn = function () code, res = coroutine.resume(cr); return res end
  return fn
end
---
-- @name makeReverseMapIterator - Make an iterator to Apply a function reverselly in elements of an array.
-- @param tb table an array to be processed.
-- @param function a function to execute in each element.
-- @return function a function to execute as a collection in a generic for. 
local function makeReverseMapIterator(tb, fn)
  local cr = coroutine.create(
    function()
      local n = 1
      local i = #tb
      while n <= i do  coroutine.yield(fn(tb[i])); i = i - 1  end
    end
  )
  local fn = function () code, res = coroutine.resume(cr); return res end
  return fn
end
return {
  makeMapIterator = makeMapIterator,
  makeReverseMapIterator = makeReverseMapIterator
}