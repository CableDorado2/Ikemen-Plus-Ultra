local loadLuaModule = true
local includeLuaMatch = true --This module will be loaded during a match.

--[[Can't use roundstate() == 2 because it will affect stuff that already use it,
like abyss hits count in match.lua loop() function..]]

--Checks functions uses the CNS triggers
local function trophyTaunt()
	if player(1) and ailevel() == 0 and anim() == 195 then
		if not data.trophies.achievement1.clear then
			data.trophies.achievement1.clear = true
			f_saveAchievements()
			f_unlock(false)
			f_updateUnlocks()
		end
	end
end

function f_checkAchievements() --Need to be inside a loop
	trophyTaunt()
	achievements() --To display the achievements unlocked
end