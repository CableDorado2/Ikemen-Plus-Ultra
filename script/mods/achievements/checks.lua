--Checks functions uses the CNS triggers
local function trophyTaunt()
	if player(1) and ailevel() == 0 and roundstate() == 2 and anim() == 195 then
		if not data.trophies.achievement1.clear then
			data.trophies.achievement1.clear = true
			f_saveAchievements()
			f_unlock(false)
			f_updateUnlocks()
		end
	end
end

local function trophyPerfectWin()
	if player(2) and ailevel() >=2 then
		if player(1) and winperfect() then
			if not data.trophies.achievement2.clear then
				data.trophies.achievement2.clear = true
				f_saveAchievements()
				f_unlock(false)
			end
		end
	end
end

local function trophyAkuma()
	if gamemode() == "arcade" and player(1) and win() and name() == "Shin Gouki" and anim() == 4001 then
		if not data.trophies.achievement3.clear then
			data.trophies.achievement3.clear = true
			f_saveAchievements()
			f_unlock(false)
		end
	end
end

local function trophyKyo()
	if player(2) and gethitvar("hitcount") == 6 then
		if player(1) and name() == "Kyo Kusanagi" and anim() == 3010 then
			if not data.trophies.achievement4.clear then
				data.trophies.achievement4.clear = true
				f_saveAchievements()
				f_unlock(false)
			end
		end
	end
end

function f_checkAchievements() --Need to be inside a loop
	trophyTaunt()
	trophyPerfectWin()
	trophyAkuma()
	trophyKyo()
	achievements() --To display the achievements unlocked
end