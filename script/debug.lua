--;===========================================================
--; MATCH ACCESS FUNCTIONS
--;===========================================================
assert(loadfile("script/common.lua"))() --For load options data, screenshot sfx, data_sav, screenpack assets, etc.
require("script.pause")

if data.debugMode == true then
--Keys definition on lib/alpha/sdlpluing.ssz
addHotkey('F1', false, false, false, 'kill(1);kill(2);kill(3);kill(4);kill(5);kill(6);kill(7);kill(8)') --Sets Double KO
addHotkey('F1', true, false, false, 'kill(2);kill(4);kill(6);kill(8)') --Ctrl+F1: Sets Player 2's life to zero
addHotkey('F1', false, false, true, 'kill(1);kill(3);kill(5);kill(7)') --Shift+F1: Player 1's life to zero
addHotkey('F2', false, false, false, 'kill(1,1);kill(2,1);kill(3,1);kill(4,1);kill(5,1);kill(6,1);kill(7,1);kill(8,1)') --Sets both players' life to 1
addHotkey('F2', true, false, false, 'kill(2,1);kill(4,1);kill(6,1);kill(8,1)') --Ctrl+F2: Sets Player 2's life to 1
addHotkey('F2', false, false, true, 'kill(1,1);kill(3,1);kill(5,1);kill(7,1)') --Shift+F2: Sets Player 1's life to 1
addHotkey('F3', false, false, false, 'setTime(0)') --Sets Time Over
addHotkey('F4', false, false, false, 'roundReset()') --Reset the round
addHotkey('F4', false, false, true, 'reload()') --Shift+F4: Reloads stage, characters and fight data
addHotkey('F5', false, false, false, 'lifeMax(1);lifeMax(2);lifeMax(3);lifeMax(4);lifeMax(5);lifeMax(6);lifeMax(7);lifeMax(8)') --Gives Players' full life
addHotkey('F5', true, false, false, 'lifeMax(2);lifeMax(4);lifeMax(6);lifeMax(8)') --Ctrl+F5: Gives Player 2's full life
addHotkey('F5', false, false, true, 'lifeMax(1);lifeMax(3);lifeMax(5);lifeMax(7)') --Shift+F5: Gives Player 1's full life
addHotkey('F6', false, false, false, 'powMax(1);powMax(2);powMax(3);powMax(4);powMax(5);powMax(6);powMax(7);powMax(8)') --Gives both players full power
addHotkey('F6', true, false, false, 'barAdd(2)') --Ctrl+F6: Increases Player 2's power to 1
addHotkey('F6', false, false, true, 'barAdd(1)') --Shift+F6: Increases Player 1's power to 1
addHotkey('F7', false, false, false, 'full(1);full(2);full(3);full(4);full(5);full(6);full(7);full(8);setTime(getRoundTime())') --Restores full life and power to all players
--Engine functions
addHotkey('F8', false, false, false, 'changeSpeed()') --Run the game as fast as possible
addHotkey('SCROLLLOCK', false, false, false, 'step()') --???
--Debug Info
addHotkey('c', true, false, false, 'toggleClsnDraw()') --CTRL+C: Toggles display of collision boxes, target data (including remaining juggle points) and NotHitBy attributes
addHotkey('d', true, false, false, 'toggleDebugDraw()') --CTRL+D: Toggles debug information display
addHotkey('l', true, false, false, 'toggleStatusDraw()') --CTRL+L: Toggles display of the life and power bars
addHotkey('i', true, false, false, 'stand(1);stand(2);stand(3);stand(4)') --CTRL+I: Forces both players into stand state
--Quick Playback Actions
addHotkey('r', true, false, false, 'toggleRecord(sndSys)') --CTRL+R: Record Dummy Actions for Playback
addHotkey('e', true, false, false, 'toggleRecordEnd(sndSys)') --CTRL+E: Stop Recording Dummy Actions for Playback
addHotkey('p', true, false, false, 'togglePlayback(sndSys)') --CTRL+P: Playback Dummy Actions
--Ctrl-# (where # is from 1-4) Toggles AI for the #th player OR Ctrl-Alt-# (where # is from 1-4) Enables/Disables the player
addHotkey('1', true, false, false, 'toggleAI(1)')
addHotkey('2', true, false, false, 'toggleAI(2)')
addHotkey('3', true, false, false, 'toggleAI(3)')
addHotkey('4', true, false, false, 'toggleAI(4)')
addHotkey('5', true, false, false, 'toggleAI(5)')
addHotkey('6', true, false, false, 'toggleAI(6)')
addHotkey('7', true, false, false, 'toggleAI(7)')
addHotkey('8', true, false, false, 'toggleAI(8)')
end
--Miscellaneous functions
--addHotkey('PAUSE', false, false, false, 'togglePause()') --Pause the game as MUGEN way
addHotkey('ESCAPE', false, false, false, 'togglePauseMenu(1)') --Pause the game as IKEMEN way
addHotkey('PRINTSCREEN', false, false, false, 'f_screenShot()') --Takes a screenshot and saves it to "screenshots" folder

function pauseMenu(p, st, esc)
	script.pause.f_pauseMain(p, st, esc)
end

function abyssBossChallenger()
	if getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then
		data.challengerAbyss = true
		f_saveTemp()
		exitMatch()
	end
end

function abyssBossReward()
	if getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then
		
	end
end

speed = 1.0

function changeSpeed()
	if speed >= 4 then
		speed = 0.25
	else
		speed = speed*2.0
	end
	setAccel(speed)
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

function handicapSet(p) --Maybe not gonna work in online or replays because debug-script.ssz functions have conditions
	if getGameMode() == "vs" then
		for side=1, 2 do
			local pDat = nil
			if side == 1 then pDat = p1Dat elseif side == 2 then pDat = p2Dat end
			for i=1, #pDat do
			--For each Player Selected
				if player(pDat[i].pn) then
				--Life Handicaps
					if t_handicapSelect[pDat[i].handicap].service == "life" then --and RoundState() < 2
					--Instakill
						if t_handicapSelect[pDat[i].handicap].val == nil then
							setLife(lifemax()/lifemax())
					--HP at 75%, 50%, 25%...
						else
							setLife(lifemax()/t_handicapSelect[pDat[i].handicap].val)
						end
				--Power Handicaps
					elseif t_handicapSelect[pDat[i].handicap].service == "power" then
					--Power at MAX
						if t_handicapSelect[pDat[i].handicap].val == nil then
							setPower(powermax())
					--Power at Specific value level
						else
							setPower(t_handicapSelect[pDat[i].handicap].val)
						end
					end
				end
			end
		end
	end
end

function statsSet(p) --Maybe not gonna work in online or replays because debug-script.ssz functions have conditions
	if getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then
	--For each Left Side Player Selected
		for i=1, #p1Dat do
			if player(p1Dat[i].pn) then
				--setNewLife(life()+p1Dat[i].life)
				setPower(power()+p1Dat[i].power)
				setAttack(attack()+p1Dat[i].attack)
				setDefence(defence()+p1Dat[i].defence)
			end
		end
	--For each Right Side Player Selected
		for i=1, #p2Dat do
			if player(p2Dat[i].pn) then
				--setNewLife(life()+p2Dat[i].life)
				setPower(power()+p2Dat[i].power)
				setAttack(attack()+p2Dat[i].attack)
				setDefence(defence()+p2Dat[i].defence)
			end
		end
	end
end

--Test
addHotkey('F9', true, false, false, 'lifeAdd(2)') --Ctrl+F9: Increases Player 2's lifemax
addHotkey('F9', false, false, true, 'lifeAdd(1)') --Shift+F9: Increases Player 1's lifemax

function lifeAdd(p)
local oldid = id()
	if player(p) then
		setNewLife(life()+1000)
		playerid(oldid)
	end
end
--Test

function status(p)
local oldid = id()
if not player(p) then return false end
local ret = string.format(
	'P%d(%d) LIF:%5d POW:%5d ATK:%5d DEF:%5d PAL:%d AI:%d',
	playerno(), id(), life(), power(), attack(), defence(), palno(), ailevel()
)
	playerid(oldid)
	return ret;
end

function actioninfo(p)
local oldid = id()
if not player(p) then return false end
local ret = string.format(
	'ActionID:%d(P%d) Time:%d ElemNo:%d ElemTime:%d Pos:%.3f,%.3f Vel:%.3f,%.3f', 
	anim(), animOwner(), animtime(), animelemno(0), animelemtime(animelemno(0)), posX(), posY(), velX(), velY()
)
	playerid(oldid)
	return ret;
end


function stateinfo(p)
local oldid = id()
if not player(p) then return false end
local ret = string.format(
	'StateNo:%d>%d(P%d) Type:%s MoveType:%s Physics:%s Time:%d', 
	prevstateno(), stateno(), stateOwner(), statetype(), movetype(), physics(), time()
)
	playerid(oldid)
	return ret;
end

--[[DEFAULT
STA:%s%s%s%6d(%d) ANI:%6d(%d)%2d
statetype(), movetype(), physics(), stateno(), stateOwner(), anim(), animOwner(), animelemno(0)
]]

--[[UNUSED
function info(p)
--Action Info
puts(string.format(
	'ActionID:%d %d ElemNo:%d %d Pos:%.3f,%.3f Vel:%.3f,%.3f', 
	anim(), animtime(), animelemno(0), animelemtime(animelemno(0)), posX(), posY(), velX(), velY())
)
--State Info
puts(string.format(
	'%s %d StateNo:%d>%d %s MoveType:%s Physics:%s Time:%d', 
	name(), id(), prevstateno(), stateno(), statetype(), movetype(), physics(), time())
)
end
]]