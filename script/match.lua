--This file is loaded when a match starts. Here, all CNS triggers defined in trigger-script.ssz will be usable.
inMatch = true
assert(loadfile("script/common.lua"))() --Load stuff shared with main menu (options data, screenpack assets, functions, etc..)
require("script.pause")
--[[
- assert(loadfile)) will cause that overwrites global variables every time it is called.
- require() Injects global variables only the first time it runs

Should replace above assert(loadfile()) with require()?
]]

--[[Load External Lua Modules FOR MATCH
To load a lua file as an external module during match:
1- Need to be in any of the paths defined in "luaModulesPath" screnpack.lua table
2- Due optimization purposes, need contains at the beginning the following text:
local includeLuaMatch = true --This module will be loaded during a match.

NOTE: Any data loaded OUTSIDE of scripts loaded at the beginning of this file, will not be available (main.lua and loader.lua for example).
]]
f_loadLuaMods(inMatch)
--;===========================================================
--; DEBUG HOTKEYS DEFINITION
--;===========================================================
--Debug Hotkeys Structure: ('Key', CTRL, ALT, SHIFT, 'Function()')
if data.debugMode and not netplay() then
--Match Actions
addHotkey('F1', false, false, false, 'kill(1); kill(2); kill(3); kill(4); kill(5); kill(6); kill(7); kill(8)') --F1: Sets Double KO
addHotkey('F1', true, false, false, 'kill(1); kill(3); kill(5); kill(7)') --CTRL+F1: Sets Player 1's life to zero
addHotkey('F1', false, false, true, 'kill(2); kill(4); kill(6); kill(8)') --SHIFT+F1: Player 2's life to zero

addHotkey('F2', false, false, false, 'kill(1,1); kill(2,1); kill(3,1); kill(4,1); kill(5,1); kill(6,1); kill(7,1); kill(8,1)') --F2: Sets all Players life to 1
addHotkey('F2', true, false, false, 'kill(1,1); kill(3,1); kill(5,1); kill(7,1)') --CTRL+F2: Sets Player 1's life to 1
addHotkey('F2', false, false, true, 'kill(2,1); kill(4,1); kill(6,1); kill(8,1)') --SHIFT+F2: Sets Player 2's life to 1

addHotkey('F3', false, false, false, 'setTime(0)') --F3: Sets Time Over
addHotkey('F3', true, false, false, 'setTime(getRoundTime())') --CTRL+F3: Reset Round Time
addHotkey('F3', false, false, true, 'setTime(-1)') --SHIFT+F3: Sets Infinite Time

addHotkey('F4', false, false, false, 'roundReset()') --F4: Reset the round
addHotkey('F4', false, false, true, 'reload()') --SHIFT+F4: Reloads stage, characters and fight data

addHotkey('F5', false, false, false, 'lifeMax(1); lifeMax(2); lifeMax(3); lifeMax(4); lifeMax(5); lifeMax(6); lifeMax(7); lifeMax(8)') --F5: Gives to all Players Full Life
addHotkey('F5', true, false, false, 'lifeMax(1); lifeMax(3); lifeMax(5); lifeMax(7)') --CTRL+F5: Gives Player 1's Full Life
addHotkey('F5', false, false, true, 'lifeMax(2); lifeMax(4); lifeMax(6); lifeMax(8)') --SHIFT+F5: Gives Player 2's Full Life

addHotkey('F6', false, false, false, 'powMax(1); powMax(2); powMax(3); powMax(4); powMax(5); powMax(6); powMax(7); powMax(8)') --F6: Gives to all Players Full Power
addHotkey('F6', true, false, false, 'barAdd(1)') --CTRL+F6: Increases Player 1's Power Level to 1
addHotkey('F6', false, false, true, 'barAdd(2)') --SHIFT+F6: Increases Player 2's Power Level to 1
--[[
addHotkey('F7', false, false, false, 'guardMax(1); guardMax(2); guardMax(3); guardMax(4); guardMax(5); guardMax(6); guardMax(7); guardMax(8)') --F7: Gives to all Players Full Guard
addHotkey('F7', true, false, false, 'guardMax(1); guardMax(3); guardMax(5), guardMax(7)') --CTRL+F7: Gives Player 1's full Guard
addHotkey('F7', false, false, true, 'guardMax(2); guardMax(4); guardMax(6); guardMax(8)') --SHIFT+F7: Gives Player 2's full Guard

addHotkey('F8', false, false, false, 'dizzyMin(1); dizzyMin(2); dizzyMin(3); dizzyMin(4); dizzyMin(5); dizzyMin(6); dizzyMin(7); dizzyMin(8)') --F8: Reset all Players Stunbar
addHotkey('F8', true, false, false, 'dizzyMin(1); dizzyMin(3); dizzyMin(5), dizzyMin(7)') --CTRL+F8: Reset Player 1's Stunbar
addHotkey('F8', false, false, true, 'dizzyMin(2); dizzyMin(4); dizzyMin(6); dizzyMin(8)') --SHIFT+F8: Gives Player 2's Stunbar
]]
addHotkey('SPACE', false, false, false, 'full(1); full(2); full(3); full(4); full(5); full(6); full(7); full(8); setTime(getRoundTime())') --SPACE KEY: Restores full life and power to all Players
addHotkey('SCROLLLOCK', false, false, false, 'step()') --???
addHotkey('KP_PLUS', true, false, false, 'changeSpeed(1)') --CTRL+KP PLUS: Increase Game Speed
addHotkey('KP_MINUS', true, false, false, 'changeSpeed(-1)') --CTRL+KP MINUS: Decrease Game Speed
addHotkey('s', true, false, false, 'changeSpeed()') --CTRL+S: Change Game Speed
addHotkey('i', true, false, false, 'stand(1); stand(2); stand(3); stand(4); stand(5); stand(6); stand(7); stand(8)') --CTRL+I: Forces all Players into stand state
addHotkey('l', true, false, false, 'toggleStatusDraw()') --CTRL+L: Toggles display of the life and power bars
--Debug Info
addHotkey('c', true, false, false, 'toggleClsnDraw()') --CTRL+C: Toggles display of collision boxes, target data (including remaining juggle points) and NotHitBy attributes
addHotkey('d', true, false, false, 'toggleDebugDraw()') --CTRL+D: Toggles debug information display
--Quick Playback Actions
addHotkey('r', true, false, false, 'toggleRecord(sndIkemen)') --CTRL+R: Record Dummy Actions for Playback
addHotkey('e', true, false, false, 'toggleRecordEnd(sndIkemen)') --CTRL+E: Stop Recording Dummy Actions for Playback
addHotkey('p', true, false, false, 'togglePlayback(sndIkemen)') --CTRL+P: Playback Dummy Actions
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
--Attract Mode Actions
if data.attractMode then
	addHotkey('1', false, false, false, 'f_addCoin()') --Insert Coin
	addHotkey('2', false, false, false, 'f_addCoin()') --Insert Coin
	addHotkey('9', false, false, false, 'f_attractCfgMenu()') --Open Config Menu
	addHotkey('0', false, false, false, 'f_resetEngine()') --Reset Engine
end
--Miscellaneous Actions
if getGameMode() ~= "demo" then
	--addHotkey('PAUSE', false, false, false, 'togglePause()') --Pause the game as MUGEN way
	addHotkey('ESCAPE', false, false, false, 'togglePauseMenu(1)') --Pause the game as IKEMEN way
end
addHotkey('PRINTSCREEN', false, false, false, 'f_screenShot()') --Takes a screenshot and saves it to "screenshots" folder (during netplay only works for the player that press the button)
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
--; MATCH LOOP FUNCTIONS
--;===========================================================
playerLeftSide = true
if getPlayerSide() == "p1right" or getPlayerSide() == "p2right" then
	playerLeftSide = false --Player is on Right Side
end
	
local function f_handicapSet()
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
local function f_abyssStatsSet()
--For each Left Side Player Selected
	for i=1, #p1Dat do
		if player(p1Dat[i].pn) then
			local residualLife = lifemax() - getLifePersistence()
			setLifeMax(lifemax() + (p1Dat[i].life * 10))
			if abyssdepth() > 1 then setLife(lifemax() - residualLife) end
			setPower(p1Dat[i].power * 10)
			setAttack(attack() + (p1Dat[i].attack * 10))
			setDefence(defence() + (p1Dat[i].defence * 10))
		end
	end
--For each Right Side Player Selected
	for i=1, #p2Dat do
		if player(p2Dat[i].pn) then
			setLifeMax(lifemax() + (p2Dat[i].life * 10))
			setPower(p2Dat[i].power * 10)
			setAttack(attack() + (p2Dat[i].attack * 10))
			setDefence(defence() + (p2Dat[i].defence * 10))
		end
	end
	abyssStatsReady = true
end

local function f_applyToSide(side, atrib, val)
	local side = side or ""
	local atrib = atrib or ""
	local val = val or nil
	for p=1,8 do
		if p%2 == 0 then --Is an Even Player Number (Right Side)
			if side == "right" then
				if player(p) then
					if atrib == "-life" then
						setLife(life() - val)
					elseif atrib == "powerset" then
						setPower(val)
					end
				end
			end
		else --Is an Odd Player Number (Left Side)
			if side == "left" then
				if player(p) then
					if atrib == "-life" then
						setLife(life() - val)
					elseif atrib == "powerset" then
						setPower(val)
					end
				end
			end
		end
	end
end

--Player Special Items Assignment
local regenItem = false
local regenItemTime = 0
local poisonItem = false
local poisonItemTime = 0
local poisonItemTimeTarget = 0
local specialItemDone = false
local damagex2Item = false
local damageReceived = 0
local function f_abyssItemsSet()
	local oldid = id()
	for i=1, 1 do --#p1Dat do
		for slot=1, #p1Dat[i].itemslot do
		--Affects Player Side
			if player(p1Dat[i].pn) then
			--Restore Life after round win
				if roundstate() == 4 and time() == 0 then
					if p1Dat[i].itemslot[slot] == txt_abyssShopLifeRestore.."1" then setLife(life() + math.floor(lifemax() / 4))
					elseif p1Dat[i].itemslot[slot] == txt_abyssShopLifeRestore.."2" then setLife(life() + math.floor(lifemax() / 2))
					elseif p1Dat[i].itemslot[slot] == txt_abyssShopLifeRestore.."MAX" then setLife(life() + (lifemax() - 50))
					end
				end
				if roundstate() == 2 then --During fight (after characters intros)
				--Timer Items
					if regenItemTime < 20 then
					--Life Regen
						if p1Dat[i].itemslot[slot] == txt_abyssShopLifeRegeneration.."1" then setLife(life() + 1) regenItem = true
						elseif p1Dat[i].itemslot[slot] == txt_abyssShopLifeRegeneration.."2" then setLife(life() + 2) regenItem = true
						elseif p1Dat[i].itemslot[slot] == txt_abyssShopLifeRegeneration.."MAX" then setLife(life() + 3) regenItem = true
						end
					--Power Regen
						if p1Dat[i].itemslot[slot] == txt_abyssShopPowerRegeneration.."1" then setPower(power() + 10) regenItem = true
						elseif p1Dat[i].itemslot[slot] == txt_abyssShopPowerRegeneration.."2" then setPower(power() + 20) regenItem = true
						elseif p1Dat[i].itemslot[slot] == txt_abyssShopPowerRegeneration.."MAX" then setPower(power() + 30) regenItem = true
						end
					elseif regenItemTime >= 200 then
						regenItemTime = 0 --Reset
					end
				--One-time Items
					if not specialItemDone then
					--Autoguard
						if p1Dat[i].itemslot[slot] == txt_abyssShopAutoguard then setAutoguard(p1Dat[i].pn, true) end
					--No Dizzy
						--if p1Dat[i].itemslot[slot] == txt_abyssShopNoDizzy then setDizzy(-1) end
					--Power Max
						if p1Dat[i].itemslot[slot] == txt_abyssShopPowerMax then setPower(powermax()) end
					--Depth Speed
						if p1Dat[i].itemslot[slot] == txt_abyssShopDepthSpeed then abyssHitTarget = 1 end
					--Time Control
						if p1Dat[i].itemslot[slot] == txt_abyssShopTimeControl then setTime(getRoundTime() / 2) end
					--After Check all Slots
						if slot == #p1Dat[i].itemslot then specialItemDone = true end
					end
				--Time Stats
					if p1Dat[i].itemslot[slot] == txt_abyssShopTimeStats and (timeremaining() == (getRoundTime() / 3)) then
						setAttack(attack() + 10)
						setDefence(defence() + 10)
					end
				--Damage X2
					if p1Dat[i].itemslot[slot] == txt_abyssShopDamageX2 and (life() < math.floor(lifemax() / 3)) and not damagex2Item then
						setAttack(attack() * 2)
						damagex2Item = true
					end
				--Constant Items
				--Infinite Guard Gauge
					--if p1Dat[i].itemslot[slot] == txt_abyssShopGuardInfinite then setGuard(guardmax()) end
				end
			end
		--Affects CPU Side
			if roundstate() == 2 then
			--Poison to CPU
				if p1Dat[i].itemslot[slot] == txt_abyssShopPoison.."1" or p1Dat[i].itemslot[slot] == txt_abyssShopPoison.."2" or p1Dat[i].itemslot[slot] == txt_abyssShopPoison.."MAX" then
				--During 5 Seconds
					if p1Dat[i].itemslot[slot] == txt_abyssShopPoison.."1" then
						poisonItemTimeTarget = 100
				--During 15 Seconds
					elseif p1Dat[i].itemslot[slot] == txt_abyssShopPoison.."2" then
						poisonItemTimeTarget = 300
				--During 20 Seconds
					elseif p1Dat[i].itemslot[slot] == txt_abyssShopPoison.."MAX" then
						poisonItemTimeTarget = 400
					end
				--Poison Status
					if poisonItemTime < poisonItemTimeTarget then
						poisonItem = true
					elseif poisonItemTime > poisonItemTimeTarget then
						poisonItem = false
					end
				end
			--Damage Curse
				if p1Dat[i].itemslot[slot] == txt_abyssShopCurse.."1" or p1Dat[i].itemslot[slot] == txt_abyssShopCurse.."MAX" then
					if player(1) then
						damageReceived = gethitvar("damage") --Get Total Damage received from the Enemy
					end
					if p1Dat[i].itemslot[slot] == txt_abyssShopCurse.."1" then damageReceived = damageReceived / 2 end --Reduce to half
					--f_applyToSide("right", "-life", damageReceived)
					for p=1, 8 do
						if p%2 == 0 then
							if player(p) then setLife(life() - damageReceived) end
						end
					end
				end
			--No CPU Power
				if p1Dat[i].itemslot[slot] == txt_abyssShopNoPowerCPU then
					--f_applyToSide("right", "powerset", 0)
					for p=1, 8 do
						if p%2 == 0 then
							if player(p) then setPower(0) end
						end
					end
				end
			--[[No CPU Guard
				if p1Dat[i].itemslot[slot] == txt_abyssShopNoGuardCPU then
					--f_applyToSide("right", "guardset", 0)
					for player = 1, 8 do
						if player % 2 == 0 then
							setGuard(0)
						end
					end
				end
			]]
			end
		end
		playerid(oldid)
	end
--Timers
	if not script.pause.pauseMenuActive then
		if regenItem then regenItemTime = regenItemTime + 1 end
		if poisonItem and gethitvar("hitcount") >= 1 and teamside() == 2 then
			poisonItemTime = poisonItemTime + 1
			--f_applyToSide("right", "-life", 1) --Replace below with this
			for p=1, 8 do
				if p%2 == 0 then --Is an Even Player Number
					if player(p) then setLife(life() - 1) end
				end
			end
		end
	end
	if roundstate() ~= 2 then
		regenItem = false
		poisonItem = false
	end
end

--CPU Special Items Assignment
local regenItemCPU = false
local regenItemTimeCPU = 0
local poisonItemCPU = false
local poisonItemTimeCPU = 0
local poisonItemTimeTargetCPU = 0
local specialItemDoneCPU = false
local damagex2ItemCPU = false
local damageReceivedCPU = 0
local function f_abyssItemsSetCPU()
	local oldid = id()
	local i = 1 --for i=1, #p2Dat do
		for slot=1, #p2Dat[i].itemslot do
		--Affects CPU Side
			if player(p2Dat[i].pn) then
				if roundstate() == 2 then --During fight (after characters intros)
				--Timer Items
					if regenItemTimeCPU < 20 then
					--CPU Life Regen
						if p2Dat[i].itemslot[slot] == txt_abyssShopLifeRegeneration.."1" then setLife(life() + 1) regenItemCPU = true
						elseif p2Dat[i].itemslot[slot] == txt_abyssShopLifeRegeneration.."2" then setLife(life() + 2) regenItemCPU = true
						elseif p2Dat[i].itemslot[slot] == txt_abyssShopLifeRegeneration.."MAX" then setLife(life() + 3) regenItemCPU = true
						end
					--CPU Power Regen
						if p2Dat[i].itemslot[slot] == txt_abyssShopPowerRegeneration.."1" then setPower(power() + 10) regenItemCPU = true
						elseif p2Dat[i].itemslot[slot] == txt_abyssShopPowerRegeneration.."2" then setPower(power() + 20) regenItemCPU = true
						elseif p2Dat[i].itemslot[slot] == txt_abyssShopPowerRegeneration.."MAX" then setPower(power() + 30) regenItemCPU = true
						end
					elseif regenItemTimeCPU >= 200 then
						regenItemTimeCPU = 0 --Reset
					end
				--One-time Items
					if not specialItemDoneCPU then
					--CPU Autoguard
						if p2Dat[i].itemslot[slot] == txt_abyssShopAutoguard then setAutoguard(p2Dat[i].pn, true) end
					--CPU Power Max
						if p2Dat[i].itemslot[slot] == txt_abyssShopPowerMax then setPower(powermax()) end
					--After Check all Slots
						if slot == #p2Dat[i].itemslot then specialItemDoneCPU = true end
					end
				--CPU Time Stats
					if p2Dat[i].itemslot[slot] == txt_abyssShopTimeStats and (timeremaining() == (getRoundTime() / 3)) then
						setAttack(attack() + 10)
						setDefence(defence() + 10)
					end
				--CPU Damage X2
					if p2Dat[i].itemslot[slot] == txt_abyssShopDamageX2 and (life() < math.floor(lifemax() / 3)) and not damagex2ItemCPU then
						setAttack(attack() * 2)
						damagex2ItemCPU = true
					end
				end
			end
		--Affects Player Side
			if roundstate() == 2 then
			--Poison
				if p2Dat[i].itemslot[slot] == txt_abyssShopPoison.."1" or p2Dat[i].itemslot[slot] == txt_abyssShopPoison.."2" or p2Dat[i].itemslot[slot] == txt_abyssShopPoison.."MAX" then
				--During 5 Seconds
					if p2Dat[i].itemslot[slot] == txt_abyssShopPoison.."1" then
						poisonItemTimeTargetCPU = 100
				--During 15 Seconds
					elseif p2Dat[i].itemslot[slot] == txt_abyssShopPoison.."2" then
						poisonItemTimeTargetCPU = 300
				--During 20 Seconds
					elseif p2Dat[i].itemslot[slot] == txt_abyssShopPoison.."MAX" then
						poisonItemTimeTargetCPU = 400
					end
				--Poison Status
					if poisonItemTimeCPU < poisonItemTimeTargetCPU then
						poisonItemCPU = true
					elseif poisonItemTimeCPU > poisonItemTimeTargetCPU then
						poisonItemCPU = false
					end
				end
			--Damage Curse
				if p2Dat[i].itemslot[slot] == txt_abyssShopCurse.."1" or p2Dat[i].itemslot[slot] == txt_abyssShopCurse.."MAX" then
					if player(2) then
						damageReceivedCPU = gethitvar("damage") --Get Total Damage received from the Player
					end
					if p2Dat[i].itemslot[slot] == txt_abyssShopCurse.."1" then damageReceivedCPU = damageReceivedCPU / 2 end --Reduce to half
					--f_applyToSide("left", "-life", damageReceivedCPU)
					for p=1, 8 do
						if p%2 == 0 then
							
						else
							if player(p) then setLife(life() - damageReceivedCPU) end
						end
					end
				end
			--No Player Power
				if p2Dat[i].itemslot[slot] == txt_abyssShopNoPowerCPU then
					--f_applyToSide("left", "powerset", 0)
					for p=1, 8 do
						if p%2 == 0 then
						
						else
							if player(p) then setPower(0) end
						end
					end
				end
			end
		end
		playerid(oldid)
	--end
--Timers
	if not script.pause.pauseMenuActive then
		if regenItemCPU then regenItemTimeCPU = regenItemTimeCPU + 1 end
		if poisonItemCPU and gethitvar("hitcount") >= 1 and teamside() == 1 then
			poisonItemTimeCPU = poisonItemTimeCPU + 1
			--f_applyToSide("left", "-life", 1) --Replace below with this
			for p=1, 8 do
				if p%2 == 0 then --Is an Even Player Number
					
				else
					if player(p) then setLife(life() - 1) end
				end
			end
		end
	end
	if roundstate() ~= 2 then
		regenItemCPU = false
		poisonItemCPU = false
	end
end

local function f_abyssSaveInit()
	abyssPause = false
	abyssSaveDone = false
	abyssSaveButton = false
	abyssSaveMenu = 1
	abyssSaveTime = 0
end
f_abyssSaveInit()

local function f_abyssSaveInfo()
	if abyssSaveTime < 105 and getAbyssFinalDepth() == 0 then --Time to use save button until end match
		cmdInput()
		abyssSaveTime = abyssSaveTime + 1
		animDraw(abyssSaveInfoBG)
		drawBattleInputHintsP1("e","264,218")
		f_drawQuickText(txt_allowSave, font2, 0, -1, ":SAVE", 315, 230)
		if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then abyssSaveButton = true end
	end
end

local function f_abyssSaveEnd()
	if abyssSaveDone then
		data.saveAbyss = true
		f_saveTemp()
		exitMatch()
	else
		abyssPause = false
		togglePause(0)
		setSysCtrl(0) --Swap to Game Controls
		abyssSaveButton = false
	end
end

local function f_abyssSave()
	cmdInput()
--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sndSys, 100, 0)
		abyssSaveMenu = abyssSaveMenu - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sndSys, 100, 0)
		abyssSaveMenu = abyssSaveMenu + 1
	end
	if abyssSaveMenu < 1 then
		abyssSaveMenu = 2
	elseif abyssSaveMenu > 2 then
		abyssSaveMenu = 1
	end
--Draw Fade BG
	animDraw(fadeWindowBG)
--Draw Menu BG
	animDraw(abyssConfirmWindowBG)
--Draw Title
	textImgSetText(txt_abyssDatConfirmTitle, "SAVE PROGRESS AND EXIT?")
	textImgDraw(txt_abyssDatConfirmTitle)
--Draw Table Text
	for i=1, #t_confirmMenu do
		if i == abyssSaveMenu then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_confirmMenu[i].id, jgFnt, bank, 0, t_confirmMenu[i].text, 159, 120+i*13))
	end
--Draw Cursor
	animSetWindow(cursorBox, 66.35,123+(abyssSaveMenu-1)*13, 188,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
--Draw Input Hints Panel
	drawConfirmInputHints()
--Actions
	if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sndSys, 100, 2)
		f_abyssSaveEnd()
	elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
	--YES (Exit to Save Data)
		if abyssSaveMenu == 1 then
			sndPlay(sndSys, 100, 1)
			abyssSaveDone = true
	--NO
		else
			sndPlay(sndSys, 100, 2)
		end
		f_abyssSaveEnd()
	end
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
	cmdInput()
--Actions
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
		sndPlay(sndSys, 100, 0)
		rewardMenu = rewardMenu - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
		sndPlay(sndSys, 100, 0)
		rewardMenu = rewardMenu + 1
	elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
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
	--Exclusive Boss Reward Item
		elseif t_abyssBossRewards[rewardMenu].exclusiveitem then
			if player(1) then
			--Add Life
				if t_abyssBossRewards[rewardMenu].text == "Maximum HP" then setLife(lifemax())
				elseif t_abyssBossRewards[rewardMenu].text == "Half-HP" then setLife(life() + lifemax() / 2)
				end
			end
			itemDone = true
	--Special Items Assign
		else
		--Special Items Slots are Full
			if abyssDat.nosave.itemslot[#abyssDat.nosave.itemslot] ~= "" then
				sndPlay(sndIkemen, 200, 0)
		--At least there is 1 Special Items Slot free
			else
				for slot=1, #abyssDat.nosave.itemslot do
					if abyssDat.nosave.itemslot[slot] == "" then
						abyssDat.nosave.itemslot[slot] = t_abyssBossRewards[rewardMenu].text
						break --Exit the loop once the assignment has been made for 1 slot (this avoid asign same item to all slots)
					end
				end
				itemDone = true
			end
		end
	--Save Data
		if itemDone then
			sndPlay(sndSys, 100, 1)
			f_setAbyssItems()
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
	animPosDraw(abyssSelInfoBG, -56, 195)
	f_textRender(txt_abyssRewardInfo, t_abyssBossRewards[rewardMenu].info, 0, 159, 206, 10, 0, 40)
	f_abyssProfile(true) --Draw Char Profile Box
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
end

function pauseMenu(p, st, esc)
	script.pause.f_pauseMain(p, st, esc)
end

local abyssHitCnt = 0
abyssHitTarget = 3 --Amount of Hits to Increase Depth

local tutoi = 0
local tutoDiag = 1
local tutoClearCnt = 0
local tutoClearAlphaS = 0
local tutoClearAlphaD = 255
local tutoClearX = 0
local tutoClearAction = false

local bgmState = 0
local bgmChanged = false
local bgmDisplayTime = 0
local bgmBGalphaS = 0
local bgmBGalphaD = 255
local bgmTxTalphaS = 0
local bgmTxTalphaD = 255

local function f_setStageMusic()
	if bgmState == 1 then
		playBGM(bgmIntro)
		bgmState = 0
	end
	if roundstate() == 0 and bgmChanged then bgmDisplayTime = 0 end --Reset BGM Display Timer
	if data.bgmDisplay and roundstate() == 2 then
		if bgmDisplayTime < 200 then
			bgmDisplayTime = bgmDisplayTime + 1
		--Display BGM Text BG
			if bgmDisplayTime < 100 then --Fade In
				if bgmBGalphaS < 20 then bgmBGalphaS = bgmBGalphaS + 5 end
				if bgmBGalphaS > 20 then bgmBGalphaS = 20 end --Correction
				if bgmBGalphaD > 50 then bgmBGalphaD = bgmBGalphaD - 5 end
				if bgmBGalphaD < 50 then bgmBGalphaD = 50 end --Correction
			else --Fade Out
				if bgmBGalphaS > 0 then bgmBGalphaS = bgmBGalphaS - 5 end
				if bgmBGalphaS < 0 then bgmBGalphaS = 0 end --Correction
				if bgmBGalphaD < 255 then bgmBGalphaD = bgmBGalphaD + 5 end
				if bgmBGalphaD > 255 then bgmBGalphaD = 255 end --Correction
			end
			animSetAlpha(stgBGMInfoBG, bgmBGalphaS, bgmBGalphaD)
			animDraw(stgBGMInfoBG)
			animUpdate(stgBGMInfoBG)
		--Display BGM Text
			if bgmDisplayTime < 100 then --Fade In
				if bgmTxTalphaS < 255 then bgmTxTalphaS = bgmTxTalphaS + 5 end
				if bgmTxTalphaS > 255 then bgmTxTalphaS = 255 end --Correction
				if bgmTxTalphaD > 0 then bgmTxTalphaD = bgmTxTalphaD - 5 end
				if bgmTxTalphaD < 0 then bgmTxTalphaD = 0 end --Correction
			else --Fade Out
				if bgmTxTalphaS > 0 then bgmTxTalphaS = bgmTxTalphaS - 5 end
				if bgmTxTalphaS < 0 then bgmTxTalphaS = 0 end --Correction
				if bgmTxTalphaD < 255 then bgmTxTalphaD = bgmTxTalphaD + 5 end
				if bgmTxTalphaD > 255 then bgmTxTalphaD = 255 end --Correction
			end
			f_drawQuickText(txt_roundSndName, font2, 0, 1, "BGM: "..data.stgBGM, 0, 64, 1, 1, bgmTxTalphaS, bgmTxTalphaD)
		end
	end
end

local function f_demoSkip()
	cmdInput()
--Exit when you press start or esc
	if esc() or btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
		data.tempBack = true
		f_saveTemp()
		exitMatch()
	end
end

local function f_setMatchTexts()
	local stg = ""
--Set Stage
	if matchno() == getLastMatch() then stg = txt_MatchFinalFight else stg = txt_MatchFight..matchno() end
	textImgSetText(txt_MatchFightCfg, stg)
--Set CPU Level
	if (playerLeftSide and player(2) or not playerLeftSide and player(1)) then
		textImgSetText(txt_AiLevelFightCfg, txt_AiLevelFight..ailevel())
	end
--Set Survival Wins
	if playerLeftSide then
		textImgSetText(txt_SurvivalCountP1FightCfg, matchno()-1 ..txt_SurvivalCountFight)
	else
		textImgSetText(txt_SurvivalCountP2FightCfg, matchno()-1 ..txt_SurvivalCountFight)
	end
--Set VS Wins	
	local matchsFinished = getP1matchWins() + getP2matchWins()
	textImgSetText(txt_WinCountP1FightCfg, txt_WinCountFight.."("..getP1matchWins().."/"..matchsFinished..")")
	textImgSetText(txt_WinCountP2FightCfg, txt_WinCountFight.."("..getP2matchWins().."/"..matchsFinished..")")
--Set Tournament Wins	
	textImgSetText(txt_TourneyWinCountP1FightCfg, getP1matchWins())
	textImgSetText(txt_TourneyWinCountP2FightCfg, getP2matchWins())
	textImgSetText(txt_TourneyFTFightCfg, txt_TourneyFTFight..getFTNo())
	textImgSetText(txt_TourneyStateFightCfg, getTourneyState())
end
f_setMatchTexts() --Load when match start

local scoreActive = false
local function f_addBonusScore()
--Add Bonus Score when player wins
	if scoreActive and roundstate() == 4 and (playerLeftSide and player(1) or not playerLeftSide and player(2)) and time() == 0 then
		if life() ~= lifemax() then
			setScore(getScore() + life()*10) --Life remains add score
		else
			setScore(getScore() + 30000) --Full Life Bonus
		end
		if getRoundTime() ~= -1 then setScore(getScore() + (getRoundTime()/60)*100) end --Time remains add score
		--if consecutivewins() > 1 then setScore(getScore() + consecutivewins() * 1000) end
		--if firstattack() then setScore(getScore() + 1500) end
		if winperfecthyper() then setScore(getScore() + 25000)
		elseif winperfectthrow() then setScore(getScore() + 20000)
		elseif winperfectspecial() then setScore(getScore() + 15000)
		elseif winperfect() then setScore(getScore() + 10000)
		elseif winhyper() then setScore(getScore() + 8000)
		elseif winthrow() then setScore(getScore() + 3000)
		elseif winspecial() then setScore(getScore() + 1000)
		end
	end
end

local scoreattackfactor = 1
if getGameMode() == "scoreattack" or getGameMode() == "scoreattackcoop" then scoreattackfactor = 10 end
local function f_drawScore()
	if roundstate() == 2 and getScore() >= 0 then
		scoreActive = true
		local pts = 0
		if (playerLeftSide and player(2) or not playerLeftSide and player(1)) and time() == 0 then
			pts = gethitvar("hitcount") * 100 --(gethitvar("damage")*10) + (gethitvar("hitcount") * 100)
		end
		setScore(getScore() + pts*scoreattackfactor)
		if playerLeftSide then
			textImgSetText(txt_ScoreP1FightCfg, getScore())
			textImgDraw(txt_ScoreP1FightCfg)
		else
			textImgSetText(txt_ScoreP2FightCfg, getScore())
			textImgDraw(txt_ScoreP2FightCfg)
		end
	end
end

--Function called during match
function loop() --The code for this function should be thought of as if it were always inside a while true do
--During Demo Mode
	if getGameMode() == "demo" then
		textImgDraw(txt_DemoFightCfg)
		animDraw(demoLogo)
		f_demoSkip()
--During Arcade Mode
	elseif getGameMode() == "arcade" or getGameMode() == "arcadecoop" or getGameMode() == "arcadecpu" then
		if roundstate() == 2 then
			textImgDraw(txt_AiLevelFightCfg)
			textImgDraw(txt_MatchFightCfg)
		end
	elseif getGameMode() == "practice" then
		--
--During VS Mode
	elseif getGameMode() == "vs" then
		if roundstate() == 2 then
			textImgDraw(txt_WinCountP1FightCfg)
			textImgDraw(txt_WinCountP2FightCfg)
		end
		if roundno() == 2 and roundstate() == 0 then bgmState = 1 end
		if roundstate() < 2 then
			f_handicapSet()
		end
--During Tournament Mode
	elseif getGameMode() == "tourney" or getGameMode() == "tourneyAI" then
		if matchover() then f_setMatchTexts() end --Refresh Win Count Text
		textImgDraw(txt_TourneyWinCountP1FightCfg)
		textImgDraw(txt_TourneyWinCountP2FightCfg)
		
		textImgDraw(txt_TourneyFTFightCfg)
		textImgDraw(txt_TourneyStateFightCfg)
--During Score Attack Mode
	elseif getGameMode() == "scoreattack" or getGameMode() == "scoreattackcoop" then
		if roundstate() == 2 then
			textImgDraw(txt_MatchFightCfg)
		end
--During Survival Mode
	elseif getGameMode() == "survival" or getGameMode() == "survivalcoop" then
		if roundstate() == 2 then
			textImgDraw(txt_SurvivalCountP1FightCfg)
			textImgDraw(txt_SurvivalCountP2FightCfg)
		end
		if roundstate() == 4 and (winnerteam() == 1 and playerLeftSide) or (winnerteam() == 2 and not playerLeftSide) then
			if (playerLeftSide and player(1) or not playerLeftSide and player(2)) then
				setLifePersistence(life())
				if data.debugMode then f_drawQuickText(txt_lifp, font14, 0, 1, "Life Bar State: "..getLifePersistence(), 95, 150) end
			end
		end
--During Abyss Mode
	elseif getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then
	--Increase Abyss Depth Counter
		if abyssbossfight() == 0 and roundstate() == 2 then
			if (playerLeftSide and player(2) or not playerLeftSide and player(1)) and gethitvar("hitcount") >= 1 and time() == 0 then
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
		if abyssHitCnt == abyssHitTarget and time() == 0 then
			setAbyssDepth(abyssdepth() + 1)
			sndPlay(sndIkemen, 610, 0)
			abyssHitCnt = 0 --Reset Hit Cnt
		end
		if data.debugMode then
			f_drawQuickText(txt_abycnt, font14, 0, 1, "Abyss Hit Cnt: "..abyssHitCnt, 95, 50)
			f_drawQuickText(txt_abyreget, font14, 0, 1, "Regeneration Time: "..regenItemTime, 95, 170, 0.7, 0.7)
			f_drawQuickText(txt_abypoison, font14, 0, 1, "Poison Time: "..poisonItemTime, 95, 190, 0.7, 0.7)
			
			f_drawQuickText(txt_abyregetCPU, font14, 0, 1, "CPU Regeneration Time: "..regenItemTimeCPU, 95, 200, 0.7, 0.7)
			f_drawQuickText(txt_abypoisonCPU, font14, 0, 1, "CPU Poison Time: "..poisonItemTimeCPU, 95, 220, 0.7, 0.7)
		end
	--Set Abyss Stats
		if roundno() == 1 and roundstate() == 2 then --Because some OHMSY chars don't apply Power Stat at roundstate() < 2 --roundstate() == 0 and gametime() == 1 then
			if not abyssStatsReady then f_abyssStatsSet() end
		end
	--Set Abyss Special Items
		f_abyssItemsSet()
		f_abyssItemsSetCPU()
	--Boss Challenger Intermission
		if abyssdepth() == abyssdepthboss() or abyssdepth() == abyssdepthbossspecial() then
			if (playerLeftSide and player(1) or not playerLeftSide and player(2)) then setLifePersistence(life()) end --Get Current Player Life
			data.challengerAbyss = true
			f_saveTemp()
			exitMatch()
		end
	--Save Progress
		if (abyssbossfight() == 1 and abyssRewardDone) or (abyssbossfight() == 0 and roundstate() == 4) then
			if (winnerteam() == 1 and playerLeftSide) or (winnerteam() == 2 and not playerLeftSide) then
				if abyssSaveButton then
					if not abyssPause then
						togglePause(1)
						setSysCtrl(10) --Swap to Menu Controls
						abyssPause = true
					else
						f_abyssSave() --Show Save Question
					end
				else
					f_abyssSaveInfo() --Show Save Button Info
				end
			end
		end
	--Boss Rewards
		if abyssbossfight() == 1 and roundstate() == 4 and not abyssRewardDone then
			if (winnerteam() == 1 and playerLeftSide) or (winnerteam() == 2 and not playerLeftSide) then
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
	--Store Player Life when Match is finished
		if (abyssbossfight() == 0 or (abyssbossfight() == 1 and abyssRewardDone)) and roundstate() == 4 and (winnerteam() == 1 and playerLeftSide) or (winnerteam() == 2 and not playerLeftSide) then
			if (playerLeftSide and player(1) or not playerLeftSide and player(2)) then
				setLifePersistence(life())
				if data.debugMode then f_drawQuickText(txt_lifp, font14, 0, 1, "Life Bar State: "..getLifePersistence(), 95, 150) end
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
	f_drawScore()
	f_addBonusScore()
--When Attract Mode is Enabled
	if data.attractMode then
		if getGameMode() == "demo" then
			drawAttractStatus()
		else
			drawAttractStatus(2, 224, 9, -1, 0.6, 0.6)
		end
		f_attractCredits(318, 238, -1)
	end
	f_checkAchievements()
end

function f_nextTutoText()
	cmdInput()
	local nextText = false
	local revealTime = 10
	local clearSpeedX = 5
	if t_tutorialDiag[tutoDiag].btntonext then --Select Button will show the next text
	--Draw Down Arrow Animation
		animDraw(tutorialNext)
		animUpdate(tutorialNext)
		drawTutorialInputHints()
		if commandGetState(p1Cmd, 'e') then nextText = true end --Select Button to advance
	else --A player action will show the next text
		local conditionFunc = t_tutorialDiag[tutoDiag].condition
	--Call and check the function stored in t_tutorialDiag[tutoDiag].condition
		if conditionFunc ~= "" and _G[conditionFunc] and _G[conditionFunc]() and not tutoClearAction then
			tutoClearAction = true --Activate Clear Animation
		end
	end
	if tutoClearAction and tutoClearCnt <= 100 then --Draw During these Ticks
		if tutoClearCnt == 0 then sndPlay(sndTutorial, 1, 0) end --Play Clear SFX
		--
		if tutoClearAlphaS < 255 then tutoClearAlphaS = tutoClearAlphaS + revealTime end
		if tutoClearAlphaS > 255 then tutoClearAlphaS = 255 end --Correction
		if tutoClearAlphaD > 0 then tutoClearAlphaD = tutoClearAlphaD - revealTime end
		if tutoClearAlphaD < 0 then tutoClearAlphaD = 0 end --Correction
		animSetAlpha(tutorialClear, tutoClearAlphaS, tutoClearAlphaD)
		--
		if tutoClearX < 45 then tutoClearX = tutoClearX + clearSpeedX end
		if tutoClearX > 45 then tutoClearX = 45 end
		animSetPos(tutorialClear, tutoClearX, 120)
		--
		animDraw(tutorialClear)
		animUpdate(tutorialClear)
		tutoClearCnt = tutoClearCnt + 1
	elseif tutoClearAction and tutoClearCnt >= 100 then --Disable Clear Animation and Restart Vars
		tutoClearAction = false
		tutoClearCnt = 0
		tutoClearAlphaS = 0
		tutoClearAlphaD = 255
		tutoClearX = 0
		nextText = true
	end
--Go to the next Dialogue
	if nextText then
		f_resetTutoVars()
		tutoi = 0
		tutoDiag = tutoDiag + 1
		nextText = false
	end
end