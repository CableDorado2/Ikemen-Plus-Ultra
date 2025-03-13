--;===========================================================
--; TUTORIAL MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_practiceMenu,3,{id = textImgNew(), text = "TUTORIAL", gotomenu = "f_tutorial()"}) --Insert new item to t_practiceMenu table loaded by screenpack.lua
--[[
- tutorial
Set the paramvalue to 1 to predefined this character as a tutorial char.
If more than 1 character have setting tutorial parameter
the tutorial character will be randomly chosen.

;SPECIFIC TUTORIAL DUMMY CHARACTER EXAMPLE:
Kfm, tutorial=1, exclude=1, excludetourney=1, order=-1
]]
--;===========================================================
--; TUTORIAL MODE (Learn Game Rules and Battle Tactics)
--;===========================================================
function f_tutorial()
	f_default()
	setGameMode('tutorial')
	--data.gameMode = "training"
	--data.rosterMode = "training"
	setRoundTime(-1) --round time disabled
	data.versusScreen = false --versus screen disabled
	data.victoryscreen = false --victory screen disabled
	data.stage = "stages/HD TEST/Training Room(Scale).def" --predefined custom stage
	data.bgm = "sound/System/Tutorial.mp3" --predefined custom song route
	data.p1TeamMenu = {mode = 0, chars = 1} --predefined P1 team mode as Single, 1 Character				
	data.p2TeamMenu = {mode = 0, chars = 1} --predefined P2 team mode as Single, 1 Character
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	--sndPlay(sndSys, 100, 1)
	if #t_tutorialChar ~= 0 then --If a tutorial char is detected in select.def with tutorial=1 paramvalue
		data.p2In = 2
		data.p2Char = {t_selChars[t_tutorialChar[math.random(#t_tutorialChar)]+1].char} --pick a random tutorial char from the table
	else --Tutorial Char will be selected in char select if there is not tutorial chars detected in select.def with tutorial=1 paramvalue
		data.p2In = 1
		data.p2Faces = true
	end
	textImgSetText(txt_mainSelect, "TUTORIAL MODE")
	f_selectSimple()
end