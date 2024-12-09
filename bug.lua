local function foo(a)
  if a == nil then return end
  print(a.x)
end

foo({}) -- This will work fine
foo(nil) -- This will also work fine, as expected

local b = setmetatable({}, {__index = function(t,k)
  print("accessing " .. k)
  return nil
end})
foo(b) -- This will throw an error!