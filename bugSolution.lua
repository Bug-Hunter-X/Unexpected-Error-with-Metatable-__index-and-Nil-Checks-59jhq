local function foo(a)
  local success, result = pcall(function()
    return a.x
  end)
  if success then
    print(result)
  else
    print("Failed to access a.x")
  end
end

foo({}) -- This will work fine
foo(nil) -- This will also work fine

local b = setmetatable({}, {__index = function(t,k)
  print("accessing " .. k)
  return nil
end})
foo(b) -- This will now work correctly!