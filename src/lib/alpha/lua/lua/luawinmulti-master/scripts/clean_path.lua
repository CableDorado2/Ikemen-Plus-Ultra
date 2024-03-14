-- commandline script that cleans a PATH variable by removing duplicates.
-- this belongs to 'setlua.bat' in case it is ran multiple times.
-- call as: "lua setlua_clean.lua <env-var-name>"

-- NOTE: this code must be able to run on ALL Lua versions

local var = assert(arg[1], "Name of environment variable to clean was not specified on the command line")
local path_value = os.getenv(var)
if path_value then
  local entries = {}
  local s,e
  s = 1
  e = path_value:find(";", s)
  while s do
    local entry = path_value:sub(s, (e or 0))
    s = e
    if s then s = s + 1 end
    if not entries[entry] then
      entries[entry] = true
      entries[#entries+1] = entry
    end
    e = path_value:find(";", s)
  end
  print(table.concat(entries))
end
