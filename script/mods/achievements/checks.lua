local loadLuaModule = true
local includeLuaMatch = true --This module will be loaded during a match.

--In-Match Achievements can use CNS triggers as conditions
local function trophyTaunt()
	if (playerLeftSide and player(1) or not playerLeftSide and player(2)) and ailevel() == 0 and anim() == 195 then
		if not data.trophies.achievement1.clear then
			data.trophies.achievement1.clear = true
			f_saveAchievements()
			f_unlock(false)
			f_updateUnlocks()
		end
	end
end

local function trophyEKFM()
	if stats.modes ~= nil and stats.modes.mission ~= nil and stats.modes.mission.mission1 ~= nil and stats.modes.mission.mission1.clear == true then
		if not data.trophies.achievement2.clear then
			data.trophies.achievement2.clear = true
			f_saveAchievements()
			f_unlock(false)
			f_updateUnlocks()
		end
	end
end

function f_checkAchievements() --To work, it need to be placed inside a loop
--Check Achievements In-Match
	if inMatch then
		trophyTaunt()
	end
--Check Achievements in any place
	trophyEKFM()
	achievements() --To display the achievements unlocked
end