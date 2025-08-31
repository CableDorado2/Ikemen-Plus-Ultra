--Checks functions uses the CNS triggers
local function trophyTaunt()
	if teamside() == 1 and anim() == 195 then
		if not data.trophies.achievement1.clear then
			data.trophies.achievement1.clear = true
			f_saveAchievements()
			f_unlock(false)
			f_updateUnlocks()
		end
	end
end

local function trophyPerfectWin()
	
end

local function trophyAkuma()
	if teamside() == 1 and anim() == 4001 then
		if not data.trophies.achievement3.clear then
			data.trophies.achievement3.clear = true
			f_saveAchievements()
			f_unlock(false)
		end
	end
end

local function trophyKyo()
	
end

function f_checkAchievements() --Need to be inside a loop
	trophyTaunt()
	trophyPerfectWin()
	trophyAkuma()
	trophyKyo()
	achievements() --To display the achievements unlocked
end