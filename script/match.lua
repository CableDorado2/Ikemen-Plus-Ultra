--;===========================================================
--; GLOBAL MATCH ACCESS FUNCTIONS
--;===========================================================
assert(loadfile("script/common.lua"))() --For load options data, screenshot sfx, data_sav, screenpack assets, etc.
require("script.pause")
f_loadLuaMods() --Load External Lua Modules (Becareful with load big sff files from modules, is better load them in screenpack.lua)
--;===========================================================
--; DEBUG HOTKEYS DEFINITION
--;===========================================================
--Debug Hotkeys Structure: ('Key', CTRL, ALT, SHIFT, 'Function()')
if data.debugMode == true then
--Match Actions
addHotkey('F1', false, false, false, 'kill(1); kill(2); kill(3); kill(4); kill(5); kill(6); kill(7); kill(8)') --F1: Sets Double KO
addHotkey('F1', true, false, false, 'kill(1); kill(3); kill(5); kill(7)') --CTRL+F1: Sets Player 1's life to zero
addHotkey('F1', false, false, true, 'kill(2); kill(4); kill(6); kill(8)') --SHIFT+F1: Player 2's life to zero
addHotkey('F2', false, false, false, 'kill(1,1); kill(2,1); kill(3,1); kill(4,1); kill(5,1); kill(6,1); kill(7,1); kill(8,1)') --F2: Sets both players' life to 1
addHotkey('F2', true, false, false, 'kill(1,1); kill(3,1); kill(5,1); kill(7,1)') --CTRL+F2: Sets Player 1's life to 1
addHotkey('F2', false, false, true, 'kill(2,1); kill(4,1); kill(6,1); kill(8,1)') --SHIFT+F2: Sets Player 2's life to 1
addHotkey('F3', false, false, false, 'setTime(0)') --F3: Sets Time Over
addHotkey('F3', true, false, false, 'setTime(getRoundTime())') --CTRL+F3: Reset Round Time
addHotkey('F3', false, false, true, 'setTime(-1)') --SHIFT+F3: Sets Infinite Time
addHotkey('F4', false, false, false, 'roundReset()') --F4: Reset the round
addHotkey('F4', false, false, true, 'reload()') --SHIFT+F4: Reloads stage, characters and fight data
addHotkey('F5', false, false, false, 'full(1); full(2); full(3); full(4); full(5); full(6); full(7); full(8); setTime(getRoundTime())') --F5: Restores full life and power to all players
addHotkey('F6', false, false, false, 'lifeMax(1); lifeMax(2); lifeMax(3); lifeMax(4); lifeMax(5); lifeMax(6); lifeMax(7); lifeMax(8)') --F6: Gives Players' full life
addHotkey('F6', true, false, false, 'lifeMax(1); lifeMax(3); lifeMax(5); lifeMax(7)') --CTRL+F6: Gives Player 1's full life
addHotkey('F6', false, false, true, 'lifeMax(2); lifeMax(4); lifeMax(6); lifeMax(8)') --SHIFT+F6: Gives Player 2's full life
addHotkey('F7', false, false, false, 'powMax(1); powMax(2); powMax(3); powMax(4); powMax(5); powMax(6); powMax(7); powMax(8)') --F7: Gives both players full power
addHotkey('F7', true, false, false, 'barAdd(1)') --CTRL+F7: Increases Player 1's power to 1
addHotkey('F7', false, false, true, 'barAdd(2)') --SHIFT+F7: Increases Player 2's power to 1
--Engine Actions
addHotkey('SCROLLLOCK', false, false, false, 'step()') --???
addHotkey('KP_PLUS', true, false, false, 'changeSpeed(1)') --CTRL+KP PLUS: Increase Game Speed
addHotkey('KP_MINUS', true, false, false, 'changeSpeed(-1)') --CTRL+KP MINUS: Decrease Game Speed
addHotkey('s', true, false, false, 'changeSpeed()') --CTRL+S: Change Game Speed
addHotkey('i', true, false, false, 'stand(1); stand(2); stand(3); stand(4); stand(5); stand(6); stand(7); stand(8)') --CTRL+I: Forces both players into stand state
addHotkey('l', true, false, false, 'toggleStatusDraw()') --CTRL+L: Toggles display of the life and power bars
--Debug Info
addHotkey('c', true, false, false, 'toggleClsnDraw()') --CTRL+C: Toggles display of collision boxes, target data (including remaining juggle points) and NotHitBy attributes
addHotkey('d', true, false, false, 'toggleDebugDraw()') --CTRL+D: Toggles debug information display
--Quick Playback Actions
addHotkey('r', true, false, false, 'toggleRecord(sndSys)') --CTRL+R: Record Dummy Actions for Playback
addHotkey('e', true, false, false, 'toggleRecordEnd(sndSys)') --CTRL+E: Stop Recording Dummy Actions for Playback
addHotkey('p', true, false, false, 'togglePlayback(sndSys)') --CTRL+P: Playback Dummy Actions
--Ctrl-# (where # is from 1-8) Toggles AI for the #th player OR Ctrl-Alt-# (where # is from 1-8) Enables/Disables the player
addHotkey('1', true, false, false, 'toggleAI(1)')
addHotkey('2', true, false, false, 'toggleAI(2)')
addHotkey('3', true, false, false, 'toggleAI(3)')
addHotkey('4', true, false, false, 'toggleAI(4)')
addHotkey('5', true, false, false, 'toggleAI(5)')
addHotkey('6', true, false, false, 'toggleAI(6)')
addHotkey('7', true, false, false, 'toggleAI(7)')
addHotkey('8', true, false, false, 'toggleAI(8)')
end
--Miscellaneous Actions
--addHotkey('PAUSE', false, false, false, 'togglePause()') --Pause the game as MUGEN way
addHotkey('ESCAPE', false, false, false, 'togglePauseMenu(1)') --Pause the game as IKEMEN way
addHotkey('PRINTSCREEN', false, false, false, 'f_screenShot()') --Takes a screenshot and saves it to "screenshots" folder
--;===========================================================
--; DEBUG HOTKEYS FUNCTIONS
--;===========================================================
local speedMul = 1
local speedAdd = 0
function changeSpeed(add)
	if add ~= nil then
		speedAdd = speedAdd + add / 100
	elseif speedMul >= 4 then
		speedMul = 0.25
	else
		speedMul = speedMul * 2
	end
	setAccel(math.max(0.01, speedMul + speedAdd))
end

function toggleAI(p)
local oldid = id()
	if player(p) then
		if ailevel() > 0 then
			setAILevel(0)
		else
			setAILevel(8)
		end
		playerid(oldid)
	end
end

function kill(p, ...)
local oldid = id()
	if player(p) then
		local n = ...
		if not n then n = 0 end
		setLife(n)
		--setRedLife(0)
		playerid(oldid)
	end
end

function lifeMax(p)
local oldid = id()
	if player(p) then
		setLife(lifemax())
		playerid(oldid)
	end
end

function powMax(p)
local oldid = id()
	if player(p) then
		setPower(powermax())
		playerid(oldid)
	end
end

function barAdd(p)
local oldid = id()
	if player(p) then
		setPower(power()+1000)
		playerid(oldid)
	end
end

function full(p)
local oldid = id()
	if player(p) then
		setLife(lifemax())
		--setRedLife(lifemax())
		setPower(powermax())
		playerid(oldid)
	end
end

function stand(p)
local oldid = id()
	if player(p) then
		selfState(0)
		playerid(oldid)
	end
end
--;===========================================================
--; DEBUG STATUS INFO
--;===========================================================
function statusInfo(p)
local oldid = id()
	if not player(p) then return false end
	local ret = string.format(
		'P%d(%d) LIF:%5d POW:%5d ATK:%5d DEF:%5d PAL:%d AI:%d TEAM:%d HITCNT:%d',
		playerno(), id(), life(), power(), attack(), defence(), palno(), ailevel(), teamside(), gethitvar("hitcount")
	)
	playerid(oldid)
	return ret
end
--;===========================================================
--; DEBUG PLAYER/HELPER INFO
--;===========================================================
function actionInfo(p)
local oldid = id()
	if not player(p) then return false end
	local ret = string.format(
		'ActionID:%d(P%d) Time:%d ElemNo:%d ElemTime:%d Pos:%.3f,%.3f Vel:%.3f,%.3f', 
		anim(), animOwner(), animtime(), animelemno(0), animelemtime(animelemno(0)), posX(), posY(), velX(), velY()
	)
	playerid(oldid)
	return ret
end

function stateInfo(p)
local oldid = id()
	if not player(p) then return false end
	local ret = string.format(
		'StateNo:%d>%d(P%d) Type:%s MoveType:%s Physics:%s Time:%d', 
		prevstateno(), stateno(), stateOwner(), statetype(), movetype(), physics(), time()-1
	)
	playerid(oldid)
	return ret
end

--[[DEFAULT
function stateInfo(p)
local oldid = id()
	if not player(p) then return false end
	local ret = string.format(
		'STA:%s%s%s%6d(%d) ANI:%6d(%d)%2d',
		statetype(), movetype(), physics(), stateno(), stateOwner(), anim(), animOwner(), animelemno(0)
	)
	playerid(oldid)
	return ret
end
]]

--[[UNUSED
function playerInfo(p)
--Action Info
puts(string.format(
	'ActionID:%d %d ElemNo:%d %d Pos:%.3f,%.3f Vel:%.3f,%.3f', 
	anim(), animtime(), animelemno(0), animelemtime(animelemno(0)), posX(), posY(), velX(), velY())
)
--State Info
puts(string.format(
	'%s %d StateNo:%d>%d %s MoveType:%s Physics:%s Time:%d', 
	name(), id(), prevstateno(), stateno(), statetype(), movetype(), physics(), time()-1)
)
end
]]
--;===========================================================
--; MATCH LOOP
--;===========================================================
local function f_handicapSet() --Maybe not gonna work in online or replays because debug-script.ssz functions have conditions
	for side=1, 2 do
		local pDat = nil
		if side == 1 then pDat = p1Dat elseif side == 2 then pDat = p2Dat end
		for i=1, #pDat do
		--For each Player Selected
			if player(pDat[i].pn) then
			--Life Handicaps (Based in Street Fighter 4)
				if t_handicapSelect[pDat[i].handicap].service == "life" then
				--Instakill
					if t_handicapSelect[pDat[i].handicap].val == nil then
						setLife(lifemax() / lifemax())
				--HP at 75%, 50%, 25%...
					else
						setLife(lifemax() / t_handicapSelect[pDat[i].handicap].val)
					end
			--Power Handicaps (Based in KOF XIII)
				elseif t_handicapSelect[pDat[i].handicap].service == "power" and roundno() == 1 and gametime() == 1 then
				--Power at MAX
					if t_handicapSelect[pDat[i].handicap].val == nil then
						setPower(powermax())
				--Power at Specific value level
					else
						setPower(t_handicapSelect[pDat[i].handicap].val)
					end
			--Armor Handicaps (Based in Guilty Gear Xrd Rev 2)
				elseif t_handicapSelect[pDat[i].handicap].service == "armor" and roundno() == 1 and gametime() == 1 then
				--Armor/Defence at 75%, 50%, 25%...
					if t_handicapSelect[pDat[i].handicap].val ~= nil then
						setDefence(math.floor(defence() / t_handicapSelect[pDat[i].handicap].val))
					end
				end
			end
		end
	end
end

local abyssStatsReady = false

local function f_abyssStatsSet() --Maybe not gonna work in online or replays because debug-script.ssz functions have conditions
--For each Left Side Player Selected
	for i=1, #p1Dat do
		if player(p1Dat[i].pn) then
			setLifeMax(lifemax() + (p1Dat[i].life * 100))
			setPower(p1Dat[i].power * 100)
			setAttack(attack() + (p1Dat[i].attack * 100))
			setDefence(defence() + (p1Dat[i].defence * 100))
		end
	end
--For each Right Side Player Selected
	for i=1, #p2Dat do
		if player(p2Dat[i].pn) then
			setLifeMax(lifemax() + (p2Dat[i].life * 100))
			setPower(p2Dat[i].power * 100)
			setAttack(attack() + (p2Dat[i].attack * 100))
			setDefence(defence() + (p2Dat[i].defence * 100))
		end
	end
	abyssStatsReady = true
end

local function f_abyssRewardsInit()
	abyssPause = false
	abyssRewardDone = false
	cursorPosY = 1
	moveTxt = 0
	rewardMenu = 1
	bufu = 0
	bufd = 0
	bufr = 0
	bufl = 0
	maxItems = 10
	itemDone = false
end
f_abyssRewardsInit()

local function f_abyssBossReward()
	--while true do
	--Actions
		if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			rewardMenu = rewardMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			rewardMenu = rewardMenu + 1
		elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
		--Attack +
			if t_abyssBossRewards[rewardMenu].attack then
				itemDone = true
				setAbyssAttack(getAbyssAttack() + t_abyssBossRewards[rewardMenu].val)
		--Defence +
			elseif t_abyssBossRewards[rewardMenu].defence then
				itemDone = true
				setAbyssDefence(getAbyssDefence() + t_abyssBossRewards[rewardMenu].val)
		--Power +
			elseif t_abyssBossRewards[rewardMenu].power then
				itemDone = true
				setAbyssPower(getAbyssPower() + t_abyssBossRewards[rewardMenu].val)
		--Life +
			elseif t_abyssBossRewards[rewardMenu].life then
				itemDone = true
				setAbyssLife(getAbyssLife() + t_abyssBossRewards[rewardMenu].val)
		--All +
			elseif t_abyssBossRewards[rewardMenu].allstats then
				itemDone = true
				local rewardValue = t_abyssBossRewards[rewardMenu].val
				setAbyssLife(getAbyssLife() + rewardValue)
				setAbyssPower(getAbyssPower() + rewardValue)
				setAbyssAttack(getAbyssAttack() + rewardValue)
				setAbyssDefence(getAbyssDefence() + rewardValue)
		--Depth +
			elseif t_abyssBossRewards[rewardMenu].depth then
				itemDone = true
				setAbyssDepth(getAbyssDepth() + t_abyssBossRewards[rewardMenu].val)
		--Reward +
			elseif t_abyssBossRewards[rewardMenu].reward then
				itemDone = true
				setAbyssReward(getAbyssReward() + t_abyssBossRewards[rewardMenu].val)
		--Exclusive Boss Reward Item (TODO)
			elseif t_abyssBossRewards[rewardMenu].exclusiveitem then
				itemDone = true
				--a = t_abyssBossRewards[rewardMenu].text
		--Special Items Assign (TODO)
			else
			--Special Items Slots are Full
				if abyssDat.nosave.sp3 ~= "" then
					sndPlay(sndSys, 100, 5)
			--At least there is 1 Special Items Slot free
				else
					if abyssDat.nosave.sp1 == "" then abyssDat.nosave.sp1 = t_abyssBossRewards[rewardMenu].text
					elseif abyssDat.nosave.sp2 == "" then abyssDat.nosave.sp2 = t_abyssBossRewards[rewardMenu].text
					elseif abyssDat.nosave.sp3 == "" then abyssDat.nosave.sp3 = t_abyssBossRewards[rewardMenu].text
					end
					itemDone = true
				end
			end
		--Save Data
			if itemDone then
				sndPlay(sndSys, 100, 1)
				itemDone = false
				togglePause(0)
				setSysCtrl(0) --Swap to Game Controls
				abyssRewardDone = true
				return
			end
		end
		if rewardMenu < 1 then
			rewardMenu = #t_abyssBossRewards
			if #t_abyssBossRewards > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_abyssBossRewards
			end
		elseif rewardMenu > #t_abyssBossRewards then
			rewardMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (rewardMenu - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (rewardMenu - 1) * 15
		end	
		if #t_abyssBossRewards <= maxItems then
			maxrewardMenu = #t_abyssBossRewards
		elseif rewardMenu - cursorPosY > 0 then
			maxrewardMenu = rewardMenu + maxItems - cursorPosY
		else
			maxrewardMenu = maxItems
		end
	--Draw Title
		animPosDraw(abyssRewardTitleBG, -56, 0)
		textImgDraw(txt_abyssRewardMain)
	--Draw Menu Items BG
		animSetScale(abyssRewardTBG, 240, maxrewardMenu*15)
		animSetWindow(abyssRewardTBG, 2,20, 165,155)
		animDraw(abyssRewardTBG)
	--Draw Cursor
		animSetWindow(cursorBox, 2,10+cursorPosY*15, 165,15)
		f_dynamicAlpha(cursorBox, 20,200,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Menu Items Text
		for i=1, maxrewardMenu do
			if i > rewardMenu - cursorPosY then
				if t_abyssBossRewards[i].id ~= nil then
					textImgDraw(f_updateTextImg(t_abyssBossRewards[i].id, font2, 0, 1, t_abyssBossRewards[i].text, 5, 20+i*15-moveTxt))
				end
			end
		end
	--Draw Info Text Stuff
		animPosDraw(abyssSelInfoBG, -56, 185)
		f_textRender(txt_abyssRewardInfo, t_abyssBossRewards[rewardMenu].info, 0, 159, 196, 10, 0, 40)
		f_abyssProfile(0, 0, true) --Draw Char Profile Box
		if maxrewardMenu > maxItems then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_abyssBossRewards > maxItems and maxrewardMenu < #t_abyssBossRewards then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		drawAbyssRewardInputHints()
		if commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		cmdInput()
		--refresh()
	--end
end

function pauseMenu(p, st, esc)
	if not abyssPause or abyssRewardDone then
		script.pause.f_pauseMain(p, st, esc)
	end
end

local bgmstate = 0
local abyssHitCnt = 0
local tutoi = 0
local tutoDiag = 1

local function f_setStageMusic()
	if bgmstate == 1 then
		playBGM(bgmIntro)
		bgmstate = 0
	end
end

--Function called during match
function loop() --The code for this function should be thought of as if it were always inside a while true do
--During VS Mode
	if getGameMode() == "vs" then
		if roundno() == 2 and roundstate() == 0 then bgmstate = 1 end
		if roundstate() < 2 then
			f_handicapSet()
		end
--During Abyss Mode
	elseif getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then
	--Increase Abyss Depth Counter
		if abyssbossfight() == 0 and roundstate() == 2 then
			if gethitvar("hitcount") >= 1 and time() == 0 and (teamside() == 2 and (getPlayerSide() == "p1left" or getPlayerSide() == "p2left")) or (teamside() == 1 and (getPlayerSide() == "p1right" or getPlayerSide() == "p2right")) then
				abyssHitCnt = abyssHitCnt + 1
			end
		end
	--[[
		According to BlazBlue Continuum Shift Extend:
		While fighting enemies in this mode, a "Depth Counter" will steadily increase
		depending on the number of successful hits, including Astral Heats.
		On most occasions, depth will increase every 2 successful hits.

		Note: Depth is not accumulated during a Boss Fight.
	]]
		if abyssHitCnt == 2 and time() == 0 then
			setAbyssDepth(abyssdepth() + 1)
			sndPlay(sndSys, 201, 0)
			abyssHitCnt = 0 --Reset Hit Cnt
		end
		if data.debugMode then f_drawQuickText(txt_abycnt, font14, 0, 1, "Abyss Hit Cnt: "..abyssHitCnt, 95, 50) end
	--Set Abyss Stats
		if roundno() == 1 and roundstate() == 2 then --Because some OHMSY chars don't apply Power Stat at roundstate() < 2 --roundstate() == 0 and gametime() == 1 then
			if not abyssStatsReady then f_abyssStatsSet() end
		end
	--Boss Challenger Intermission
		if abyssdepth() == abyssdepthboss() or abyssdepth() == abyssdepthbossspecial() then
			data.challengerAbyss = true
			f_saveTemp()
			exitMatch()
		end
	--Boss Rewards
		if abyssbossfight() == 1 and roundstate() == 4 and not abyssRewardDone then
			if (winnerteam() == 1 and (getPlayerSide() == "p1left" or getPlayerSide() == "p2left")) or (winnerteam() == 2 and (getPlayerSide() == "p1right" or getPlayerSide() == "p2right")) then
				if not abyssPause then
					togglePause(1)
					setSysCtrl(10) --Swap to Menu Controls
					f_resetAbyss2ArrowsPos()
					f_generateAbyssRewards() --Generate abyss rewards table (coded in screenpack.lua)
					abyssPause = true
				else
					f_abyssBossReward()
				end
			end
		end
--During Tutorial Mode
	elseif getGameMode() == "tutorial" then
		if roundstate() == 0 and gametime() == 1 then
			full(1) --Player 1 Full Life and Power
			full(2)
		elseif roundstate() == 2 then
		--Draw Window Assets
			if not t_tutorialDiag[tutoDiag].hidediag then
				animDraw(tutorialWindow)
				animDraw(kfmTutoPortrait)
			end
		--Next Text Logic
			if not script.pause.pauseMenuActive and tutoDiag < #t_tutorialDiag then
				f_nextTutoText()
			end
			if not t_tutorialDiag[tutoDiag].infight then
			--Draw Text
				tutoi = tutoi + 1
				f_textRender(txt_tutoDiag, t_tutorialDiag[tutoDiag].txt, tutoi, 20, 18, 15, 1.4, 43)
			--Draw Input Display Guide
				if t_tutorialDiag[tutoDiag].inputhint and not script.pause.pauseMenuActive then
					f_tutoInputDisplay(t_tutorialDiag[tutoDiag].inputhint)
				end
			--Set Life
				lifeMax(1)
				lifeMax(2)
			--Set Power
				powMax(1)
			else --A fight started
				if player(2) then --Activate CPU for Player 2
					setAILevel(8)
				end
				lifeMax(1)
			end
		end
	end
	f_setStageMusic()
end

function f_nextTutoText()
	local nextText = false
	if t_tutorialDiag[tutoDiag].btntonext then --Select Button will show the next text
	--Draw Down Arrow Animation
		animDraw(tutorialNext)
		animUpdate(tutorialNext)
		if commandGetState(p1Cmd, 'e') then nextText = true end --Select Button to advance
	else --A player action will show the next text
		local conditionFunc = t_tutorialDiag[tutoDiag].condition
	--Call and check the function stored in t_tutorialDiag[tutoDiag].condition
		if conditionFunc ~= "" and _G[conditionFunc] and _G[conditionFunc]() then
			nextText = true
		end
	end
	if nextText then
		tutoi = 0
		tutoDiag = tutoDiag + 1
		nextText = false
	end
	cmdInput()
end