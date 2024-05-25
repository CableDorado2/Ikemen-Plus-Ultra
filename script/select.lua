
module(..., package.seeall)

--;===========================================================
--; GENERAL CONFIG
--;===========================================================
--Default turns/simul count after starting the game
p1numTurns = 2
p2numTurns = 2
p1numSimul = 2
p2numSimul = 2
--default team mode after starting the game (0 - Single, 1 - Simul, 2 - Turns)
p1teamMode = 0
p2teamMode = 0
--let cursor wrap around
wrappingX = true
wrappingY = true

--;===========================================================
--; GLOBAL FUNCTIONS
--;===========================================================
function f_rosterReset()
	--When you play in multiplayer the roster is divided into 2 and the 2nd player can choose without the screen being cut:
	if data.p2Faces or data.selectType == "Fixed" then
		selectColumns = 5 --Number of Character Select Columns
		selectRows = 2 --Number of Character Select Rows
		offsetRows = 1 --Number of Character Select Hidden Slots below
		setSelColRow(selectColumns, selectRows)
		setRandomSpr(sysSff, 151, 0, 1, 1) --Random Icon
		setSelCellSize(27+2, 27+2) --Slot Size
		setSelCellScale(1, 1) --Slot Scale
		if data.p2Faces then --When you play in a Multiplayer Mode
			p1FaceX = 10
			p1FaceY = 170
			p2FaceX = 169
			p2FaceY = 170
		elseif data.selectType == "Fixed" then --When you play in a Single Mode
			p1FaceX = 90
			p1FaceY = 170
			if not data.p1SelectMenu then
				p2FaceX = 90
				p2FaceY = 170
			end
		end
	--When data.p2Faces is false and you play in 1P you will see an expanded roster, as there is no 2P to select it will not be cut:
	elseif data.selectType == "Variable" then
		selectColumns = 11
        selectRows = 2
        offsetRows = 0
		setSelColRow(selectColumns, selectRows)
		setRandomSpr(sysSff, 151, 0, 1, 1)
		setSelCellSize(27+2, 27+2)
		setSelCellScale(1, 1)
		--Position of the character boxes for P1
		p1FaceX = 2.5
		p1FaceY = 170
		--Position of the character boxes for P2
		if not data.p1SelectMenu then
			p2FaceX = 2.5
			p2FaceY = 170
		end
	end
end

function f_p1sideReset()
p1Cell = nil
p1Portrait = nil
p1memberPreview = nil
f_p1randomReset()
data.t_p1selected = {}
p1TeamEnd = false
p1CharEnd = false --To use in Modern Palette Select
p1PalEnd = true
p1SelEnd = false
p1BG = false
p1SelBack = false
p1TeamBack = true
p1palSelect = 1
p1movePal = 1
randomP1Rematch = false
end

function f_p1randomReset()
p1member1Random = false
p1member2Random = false
p1member3Random = false
p1member4Random = false
end

function f_p2sideReset()
p2coopReady = false
p2Cell = nil
p2Portrait = nil
p2memberPreview = nil
f_p2randomReset()
data.t_p2selected = {}
p2TeamEnd = false
p2CharEnd = false --To use in Modern Palette Select
p2PalEnd = true
p2SelEnd = false
p2BG = false
p2SelBack = false
p2TeamBack = true
p2palSelect = 1
p2movePal = 1
randomP2Rematch = false
end

function f_p2randomReset()
p2coopRandom = false
p2member1Random = false
p2member2Random = false
p2member3Random = false
p2member4Random = false
end

function f_stageSelectReset()
stageMenuActive = false
exclusiveStageMenu = false
stageChosen = false
stageSelect = true
songSelect = false
p1stage = false
p2stage = false
p1autoSlot = false
p2autoSlot = false
p1song = false
p2song = false
stageAnnouncer = false
announcerTimer = 0
randomStageRematch = false
end

function f_selectReset()
	commandBufReset(p1Cmd)
	commandBufReset(p2Cmd)
	f_rosterReset()
	f_p1sideReset()
	f_p2sideReset()
	selectStart()
	f_stageSelectReset()
	if data.p2In == 1 then
		p2TeamEnd = true
		p2SelEnd = true
	end
	if data.p1In == 2 and data.p2In == 2 then
		p1TeamEnd = true
		p1SelEnd = true
	end
	--if not data.p1SelectMenu then
		--p1SelEnd = true
	--end
	if not data.p2SelectMenu then
		p2SelEnd = true
	end
	keepLSide = false
	keepRSide = false
	selScreenEnd = false
	stageEnd = false
	charSelect = true
	p1numChars = 1
	p2numChars = 1
	p1teamMode = 0
	p2teamMode = 0
	p1numTurns = 2
	p2numTurns = 2
	p1numSimul = 2
	p2numSimul = 2
	matchNo = 0
	setMatchNo(matchNo)
	rematchEnd = false
	battleOption = 0
	battleOption2 = 0
	backScreen = false
	back = false
	serviceBack = false
end

function f_selectInit()
	p1SelX = 0
	p1SelY = 0
	p2SelX = 4 --Cursor position after choosing the Team Mode (Single, Team or Turns), this is used to put p2 in the 4th slot
	p2SelY = 0
	p1FaceOffset = 0
	p2FaceOffset = 0
	p1OffsetRow = 0
	p2OffsetRow = 0
	back = false
	--Quick Scrolling
	bufTmu = 0
	bufTmd = 0
	bufTmr = 0
	bufTml = 0
	bufTm2u = 0
	bufTm2d = 0
	bufTm2r = 0
	bufTm2l = 0
	bufSelu = 0
	bufSeld = 0
	bufSelr = 0
	bufSell = 0
	bufSel2u = 0
	bufSel2d = 0
	bufSel2r = 0
	bufSel2l = 0
	bufPalu = 0
	bufPald = 0
	bufPalr = 0
	bufPall = 0
	bufPal2u = 0
	bufPal2d = 0
	bufPal2r = 0
	bufPal2l = 0
	bufStageu = 0
	bufStaged = 0
	bufStager = 0
	bufStagel = 0
	--Timers
	selectSeconds = data.selectTime
	stageSeconds = data.stageTime
	rematchSeconds = data.rematchTime
	serviceSeconds = data.serviceTime
	destinySeconds = data.destinyTime
	selectTimer = selectSeconds*gameTick --Set time for Character Select
	stageTimer = stageSeconds*gameTick --Set time for Stage Select
	rematchTimer = rematchSeconds*gameTick --Set time for Rematch Option
	serviceTimer = serviceSeconds*gameTick --Set time for Service Option
	destinyTimer = destinySeconds*gameTick --Set time for Tower/Destiny Select
	if data.rosterAdvanced == true and data.stageMenu == false then
		--For Advanced Modes without Stage Select
	else
		stageList = 0
	end
	musicList = 0
	gameNo = 0
	bossNo = 0
	bonusNo = 0
	p1Wins = 0
	p2Wins = 0
	winner = 0
	winCnt = 0
	looseCnt = 0
	clearTime = 0
	matchTime = 0
	waitingTowerSel = false
end

function f_setRounds()
	local roundsToWin = data.roundsNum --Use default rounds saved in settings
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
	--Set New Rounds To Win from select.def chars section
		if t_selChars[data.t_p1selected[1].cel+1].rounds ~= nil then
			roundsToWin = t_selChars[data.t_p1selected[1].cel+1].rounds
		end
	else
		if t_selChars[data.t_p2selected[1].cel+1].rounds ~= nil then
			roundsToWin = t_selChars[data.t_p2selected[1].cel+1].rounds
		end
	end
	setRoundsToWin(roundsToWin)
end

function f_setRoundTime()
	local roundTime = data.roundTime --Use default time saved in settings
	--Set New Time from select.def ExtraStages section
	--if t_selStages[stageNo].roundtime ~= nil then
		--roundTime = t_selChars[stageNo].roundtime
	--end
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
	--Set New Time from select.def chars section
		if t_selChars[data.t_p1selected[1].cel+1].roundtime ~= nil then
			roundTime = t_selChars[data.t_p1selected[1].cel+1].roundtime
		end
	else
		if t_selChars[data.t_p2selected[1].cel+1].roundtime ~= nil then
			roundTime = t_selChars[data.t_p2selected[1].cel+1].roundtime
		end
	end
	setRoundTime(roundTime * 60)
end

function f_setZoom()
	local zoom = data.zoomActive
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
		if t_selChars[data.t_p1selected[1].cel+1].zoom ~= nil then
			if t_selChars[data.t_p1selected[1].cel+1].zoom == 1 then
				zoom = true
			else
				zoom = false
			end
		elseif t_selStages[stageNo].zoom ~= nil then
			if t_selChars[stageNo].zoom == 1 then
				zoom = true
			else
				zoom = false
			end
		end
	else
		if t_selChars[data.t_p2selected[1].cel+1].zoom ~= nil then
			if t_selChars[data.t_p2selected[1].cel+1].zoom == 1 then
				zoom = true
			else
				zoom = false
			end
		elseif t_selStages[stageNo].zoom ~= nil then
			if t_selChars[stageNo].zoom == 1 then
				zoom = true
			else
				zoom = false
			end
		end
	end
	setZoom(zoom)
	local zoomMin = data.zoomMin
	if t_selStages[stageNo].zoommin ~= nil then
		zoomMin = t_selStages[stageNo].zoommin
	end
	setZoomMin(zoomMin)
	local zoomMax = data.zoomMax
	if t_selStages[stageNo].zoommax ~= nil then
		zoomMax = t_selStages[stageNo].zoommax
	end
	setZoomMax(zoomMax)
	local zoomSpeed = data.zoomSpeed
	if t_selStages[stageNo].zoomspeed ~= nil then
		zoomSpeed = t_selStages[stageNo].zoomspeed
	end
	setZoomSpeed(zoomSpeed)
end

function f_makeRoster()
	t_roster = {}
	local t = {}
	local cnt = 0
	--Arcade
	if data.gameMode == "arcade" then
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			if p1teamMode == 0 then --Single
				t = t_selOptions.arcademaxmatches
			else --Team
				t = t_selOptions.teammaxmatches
			end
		else
			if p2teamMode == 0 then --Single
				t = t_selOptions.arcademaxmatches
			else --Team
				t = t_selOptions.teammaxmatches
			end
		end
		for i=1, #t do --for each order number
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				cnt = t[i] * p1numChars --set amount of matches to get from the table
			else
				cnt = t[i] * p2numChars --set amount of matches to get from the table
			end
			if cnt > 0 and t_orderChars[i] ~= nil then --if it's more than 0 and there are characters with such order
				while cnt > 0 do --do the following until amount of matches for particular order is reached
					f_shuffleTable(t_orderChars[i]) --randomize characters table
					for j=1, #t_orderChars[i] do --loop through chars associated with that particular order
						t_roster[#t_roster+1] = t_orderChars[i][j] --and add such character into new table
						cnt = cnt - 1
						if cnt == 0 then --but only if amount of matches for particular order has not been reached yet
							break
						end
					end
				end
			end
		end
	--Survival / Boss Rush / Bonus Rush / All Roster / Endless
	else
		if data.gameMode == "survival" then
			t = t_randomChars
			cnt = #t
			local i = 0
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				while cnt / p1numChars ~= math.ceil(cnt / p1numChars) do --not integer
					i = i + 1
					cnt = #t + i
				end
			else
				while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do --not integer
					i = i + 1
					cnt = #t + i
				end
			end
		elseif data.gameMode == "bossrush" then
			t = t_bossChars
			cnt = #t
			local i = 0
			if (data.p1In == 2 and data.p2In == 2) then
				while cnt / p1numChars ~= math.ceil(cnt / p1numChars) do
					i = i + 1
					cnt = #t + i
				end
			else
				while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do
					i = i + 1
					cnt = #t + i
				end
			end
		elseif data.gameMode == "bonusrush" then
			t = t_bonusChars
			cnt = #t
			local i = 0
			if (data.p1In == 2 and data.p2In == 2) then
				while cnt / p1numChars ~= math.ceil(cnt / p1numChars) do
					i = i + 1
					cnt = #t + i
				end
			else
				while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do
					i = i + 1
					cnt = #t + i
				end
			end
		elseif data.gameMode == "endless" then
			t = t_randomChars
			if (data.p1In == 2 and data.p2In == 2) then
				cnt = 999 * p1numChars
			else
				cnt = 999 * p2numChars
			end
		elseif data.gameMode == "allroster" then
			t = t_randomChars
			cnt = #t
			local i = 0
			if (data.p1In == 2 and data.p2In == 2) then
				while cnt / p1numChars ~= math.ceil(cnt / p1numChars) do --not integer
					i = i + 1
					cnt = #t + i
				end
			else
				while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do --not integer
					i = i + 1
					cnt = #t + i
				end
			end
		end
		while cnt > 0 do
			f_shuffleTable(t)
			for i=1, #t do
				t_roster[#t_roster+1] = t[i]
				cnt = cnt - 1
				if cnt == 0 then
					break
				end
			end
		end
	end
	if data.debugLog then f_printTable(t_roster, "save/debug/t_roster.txt") end
end

function f_aiRamp()
	local start_match = 0
	local start_diff = 0
	local end_match = 0
	local end_diff = 0
	t_aiRamp = {}
	--Arcade
	if data.gameMode == "arcade" or data.gameMode == "tower" then
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			if p1teamMode == 0 then --Single
				start_match = t_selOptions.arcadestart.wins
				start_diff = t_selOptions.arcadestart.offset
				end_match =  t_selOptions.arcadeend.wins
				end_diff = t_selOptions.arcadeend.offset
			else --Team
				start_match = t_selOptions.teamstart.wins
				start_diff = t_selOptions.teamstart.offset
				end_match =  t_selOptions.teamend.wins
				end_diff = t_selOptions.teamend.offset
			end
		else
			if p2teamMode == 0 then --Single
				start_match = t_selOptions.arcadestart.wins
				start_diff = t_selOptions.arcadestart.offset
				end_match =  t_selOptions.arcadeend.wins
				end_diff = t_selOptions.arcadeend.offset
			else --Team
				start_match = t_selOptions.teamstart.wins
				start_diff = t_selOptions.teamstart.offset
				end_match =  t_selOptions.teamend.wins
				end_diff = t_selOptions.teamend.offset
			end
		end
	elseif data.gameMode == "survival" then
		start_match = t_selOptions.survivalstart.wins
		start_diff = t_selOptions.survivalstart.offset
		end_match =  t_selOptions.survivalend.wins
		end_diff = t_selOptions.survivalend.offset
	end
	local startAI = data.difficulty + start_diff
	if startAI > 8 then
		startAI = 8
	elseif startAI < 1 then
		startAI = 1
	end
	local endAI = data.difficulty + end_diff
	if endAI > 8 then
		endAI = 8
	elseif endAI < 1 then
		endAI = 1
	end
	for i=1, lastMatch do
		if i-1 <= start_match then
			t_aiRamp[#t_aiRamp+1] = startAI
		elseif i-1 <= end_match then
			local curMatch = i - (start_match + 1)
			t_aiRamp[#t_aiRamp+1] = math.floor(curMatch * (endAI - startAI) / (end_match - start_match) + startAI)
		else
			t_aiRamp[#t_aiRamp+1] = endAI
		end
	end
	if data.debugLog then f_printTable(t_aiRamp, "save/debug/t_aiRamp.txt") end
end

function f_difficulty(player, offset)
	local t = {}
	if player % 2 ~= 0 then --odd value
		pos = math.floor(player / 2 + 0.5)
		t = t_selChars[data.t_p1selected[pos].cel+1]
	else --even value
		pos = math.floor(player / 2)
		t = t_selChars[data.t_p2selected[pos].cel+1]
	end
	if t.ai ~= nil then
		return t.ai
	else
		return data.difficulty + offset
	end
end

function f_tagMode(player, tagset)
	local t = {}
	if player % 2 ~= 0 then --odd value
		pos = math.floor(player / 2 + 0.5)
		t = t_selChars[data.t_p1selected[pos].cel+1]
	else --even value
		pos = math.floor(player / 2)
		t = t_selChars[data.t_p2selected[pos].cel+1]
	end
	if t.tag ~= nil then
		return t.tag
	else
		return data.tagmode + tagset
	end
end

function f_aiLevel()
	--Offset
	local offset = 0
	local tagset = 0
	--[[
	local tagSystem = 0
		if tagSystem == 0 then
			setTag(1, f_tagMode(1, tagset))
			setTag(2, f_tagMode(2, tagset))
			setTag(3, f_tagMode(3, tagset))
			setTag(4, f_tagMode(4, tagset))
		end
	]]
	if data.aiRamping and data.gameMode == "arcade" or data.gameMode == "tower" or data.gameMode == "survival" then
		offset = t_aiRamp[matchNo] - data.difficulty
	end
	--Coop
	if data.coop then
		setCom(1, 0)
		setCom(2, f_difficulty(2, offset))
		setCom(3, 0)
		setTag(1, f_tagMode(1, tagset))
		setTag(2, f_tagMode(2, tagset))
		setTag(3, f_tagMode(3, tagset))
		if not restoreTeam then
			setCom(4, f_difficulty(4, offset))
			setTag(4, f_tagMode(4, tagset))
		end
	else
		--Player 1
		if p1teamMode == 0 then --Single
			if data.p1In == 1 and not data.aiFight then
				setCom(1, 0)
				setTag(1, f_tagMode(1, tagset))
			else
				setCom(1, f_difficulty(1, offset))
				setTag(1, f_tagMode(1, tagset))
			end
		elseif p1teamMode == 1 then --Simul
			if data.simulType == "Tag" then
				for i=1, p1numChars*2 do
					if i % 2 ~= 0 then --odd value
						if data.p1In == 1 and data.aiFight == false and data.tagmode == 1 then
							setCom(i, 0)
							remapInput(i,1)
							setTag(i, f_tagMode(i, tagset))
						else
							setCom(1, f_difficulty(i, offset))
							setCom(i, f_difficulty(i, offset))
							setTag(i, f_tagMode(i, tagset))
						end
					end
				end
			else --data.simulType == "Assist"
				if data.p1In == 1 and not data.aiFight then
					setCom(1, 0)
					setTag(1, f_tagMode(1, tagset))
				else
					setCom(1, f_difficulty(1, offset))
					setTag(1, f_tagMode(1, tagset))
				end
				for i=3, p1numChars*2 do
					if i % 2 ~= 0 then
						setCom(i, f_difficulty(i, offset))
						setTag(i, f_tagMode(i, tagset))
					end
				end
			end
		elseif p1teamMode == 2 then --Turns
			for i=1, p1numChars*2 do
				if i % 2 ~= 0 then
					if data.p1In == 1 and not data.aiFight then
						setCom(i, 0)
						setTag(i, f_tagMode(i, tagset))
					else
						setCom(i, f_difficulty(i, offset))
						setTag(i, f_tagMode(i, tagset))
					end
				end
			end
		end
		--Player 2
		if p2teamMode == 0 then --Single
			if data.p2In == 2 and not data.aiFight then
				setCom(2, 0)
				setTag(2, f_tagMode(2, tagset))
			else
				setCom(2, f_difficulty(2, offset))
				setTag(2, f_tagMode(2, tagset))
			end
		elseif p2teamMode == 1 then --Simul
			if data.simulType == "Tag" then
				for i=2, p2numChars*2 do
					if i % 2 == 0 then --even value
						if data.p2In == 2 and not data.aiFight and data.tagmode == 1 then
							setCom(i, 0)
							remapInput(i,2)
							setTag(i, f_tagMode(i, tagset))
						else
							setCom(i, f_difficulty(i, offset))
							setTag(i, f_tagMode(i, tagset))
						end
					end
				end
			else --data.simulType == "Assist"
				if data.p2In == 2 and not data.aiFight then
					setCom(2, 0)
					setTag(2, f_tagMode(2, tagset))
				else
					setCom(2, f_difficulty(2, offset))
					setTag(2, f_tagMode(2, tagset))
				end
				for i=4, p2numChars*2 do
					if i % 2 == 0 then
						setCom(i, f_difficulty(i, offset))
						setTag(i, f_tagMode(i, tagset))
					end
				end
			end
		elseif p2teamMode == 2 then --Turns --and not data.gameMode == "bossrush" then
			for i=2, p2numChars*2 do
				if i % 2 == 0 then
					if data.p2In == 2 and not data.aiFight then
						setCom(i, 0)
						--setTag(i, f_tagMode(i, tagset))
					else
						setCom(i, f_difficulty(i, offset))
						--setTag(i, f_tagMode(i, tagset))
					end
				end
			end
		end
	end
end

function f_selectChar(player, t)
	for i=1, #t do
		selectChar(player, t[i].cel, t[i].pal)
	end
end

function f_findCelYAdd(selY, faceOffset, offsetRow)
	selY = selY + 1
	if selY >= selectRows+offsetRows then
		if wrappingY then
			faceOffset = 0
			offsetRow = 0
			selY = 0
		else
			selY = selY - 1
		end
	elseif selY >= selectRows+offsetRow then
		faceOffset = faceOffset + selectColumns
		offsetRow = offsetRow + 1
	end
	return selY, faceOffset, offsetRow
end

function f_findCelYSub(selY, faceOffset, offsetRow)
	selY = selY - 1
	if selY < 0 then
		if wrappingY then
			faceOffset = offsetRows * selectColumns
			offsetRow = offsetRows
			selY = selectRows + offsetRows - 1
		else
			selY = selY + 1
		end
	elseif selY < offsetRow then
		faceOffset = faceOffset - selectColumns
		offsetRow = offsetRow - 1
	end
	return selY, faceOffset, offsetRow
end

function f_findCelXAdd(selX, wrapX)
	selX = selX + 1
	if selX >= selectColumns then
		if wrapX then
			selX = 0
		else
			selX = selX - 1
		end
	end
	return selX
end

function f_findCelXSub(selX, wrapX)
	selX = selX - 1
	if selX < 0 then
		if wrapX then
			selX = selectColumns - 1
		else
			selX = selX + 1
		end
	end
	return selX
end

function f_winCoins()
	if onlinegame == false then	
		if coinSystem == true then
			data.coins = data.coins + 5 --Earn 5 Coins by Win :)
			--sndPlay(sysSnd, 200, 0) --Coin Earned Song
			f_saveProgress()
		elseif coinSystem == false then
			--Do nothing and don't lose or win coins
		end
	elseif onlinegame == true then
		--Do nothing and don't lose or win coins
	end
end

function f_loseCoins()
	if coinSystem == true then
		if data.coins < 1 then
			data.coins = 0
		elseif data.coins >= 1 then
			data.coins = data.coins - 1 --Lose 1 Coin by be defeated :c
			f_saveProgress()
		end
	elseif coinSystem == false then
		--Do nothing and don't lose or win coins
	end
end

--;===========================================================
--; BACK TO MAIN MENU
--;===========================================================
txt_backquestion = createTextImg(jgFnt, 1, 0, "BACK TO MAIN MENU?", 160.5, 110,0.9,0.9)

--Back Window BG
backWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(backWindowBG, 83.5, 97)
animUpdate(backWindowBG)
animSetScale(backWindowBG, 1, 1)

t_backMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

function f_backMenu()
	cmdInput()
	--Cursor position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sysSnd, 100, 0)
		backMenu = backMenu - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sysSnd, 100, 0)
		backMenu = backMenu + 1
	end
	if backMenu < 1 then
		backMenu = #t_backMenu
		if #t_backMenu > 4 then
			cursorPosYBack = 4
		else
			cursorPosYBack = #t_backMenu-1
		end
	elseif backMenu > #t_backMenu then
		backMenu = 1
		cursorPosYBack = 0
	elseif (commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) and cursorPosYBack > 0 then
		cursorPosYBack = cursorPosYBack - 1
	elseif (commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) and cursorPosYBack < 4 then
		cursorPosYBack = cursorPosYBack + 1
	end
	if cursorPosYBack == 4 then
		moveTxtBack = (backMenu - 5) * 13
	elseif cursorPosYBack == 0 then
		moveTxtBack = (backMenu - 1) * 13
	end
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(backWindowBG)
	animUpdate(backWindowBG)
	--Draw Title
	textImgDraw(txt_backquestion)
	--Draw Table Text
	for i=1, #t_backMenu do
		if i == backMenu then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_backMenu[i].id, jgFnt, bank, 0, t_backMenu[i].text, 159, 120+i*13-moveTxtBack))
	end
	--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYBack*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Actions
	if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--YES
		if backMenu == 1 then
			sndPlay(sysSnd, 100, 2)
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			if waitingTowerSel then
				data.tempBack = true
			else
				setService("")
				back = true
			end
		--NO
		else
			sndPlay(sysSnd, 100, 1)
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
			if waitingTowerSel then
				
			else
				if data.gameMode == "arcade" or data.gameMode == "tower" then --Fixed issue in Back Menu from Character Select when selecting NO option in Arcade Mode: https://user-images.githubusercontent.com/18058378/260328520-85c78494-7586-4bfe-acd1-cd703d9e3548.png
					--f_rosterReset() --Delete?
					if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
						p2Cell = nil
						p2Portrait = nil
						data.t_p2selected = {}
						p2PalEnd = true
						p2SelEnd = false
					else
						p1Cell = nil
						p1Portrait = nil
						data.t_p1selected = {}
						p1PalEnd = true
						p1SelEnd = false
					end
					if data.coop then
						p2Cell = nil
						p2Portrait = nil
						data.t_p2selected = {}
						p2PalEnd = true
						p2SelEnd = false
					end
				else
					f_selectReset()
				end
				if data.rosterAdvanced == true and data.stageMenu == false then stageEnd = true end
			end
			back = false
		end
		f_backReset()
	end
	cmdInput()
end

function f_backReset()
	backScreen = false
	moveTxtBack = 0
	--Cursor pos in YES
	cursorPosYBack = 0
	backMenu = 1
end

function f_exitOnline()
	while true do
		back = true
		break
		cmdInput()
		refresh()
	end
end

function f_resetMenuAssets()
	if data.rosterMode == "event" then
		--playBGM("")
	else
		if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
	end
	backtomenu = false --Restart special back for Challenger Mode
	data.tempBack = false
	f_saveTemp()
	f_resetMenuInputs()
end

function f_exitSelect() --For Simple/Story Select
--Right Side have control in Char Select (CPU Vs Human)
	if (data.p1In == 2 and data.p2In == 2) then
		if p2TeamBack == true then
			if backScreen == false then sndPlay(sysSnd, 100, 2) end
			backScreen = true
		end
--Left Side have control in Char Select (Human Vs CPU)
	elseif (data.p2In == 1 or data.p2In == 0) then
		if p1TeamBack == true then
			if backScreen == false then sndPlay(sysSnd, 100, 2) end
			backScreen = true
		end
--Left Side and Right Side have control in Char Select (Human Vs Human)
	elseif data.p1In == 1 and data.p2In == 2 then
		if p1TeamBack == true and p2TeamBack == true then
			if backScreen == false then sndPlay(sysSnd, 100, 2) end
			backScreen = true
		end
	end
end

function f_exitSelect2() --For Advanced Select
--Right Side have control in Char Select (CPU Vs Human)
	if (data.p1In == 2 and data.p2In == 2) then
		if p2TeamBack == true then
			if backScreen == false then sndPlay(sysSnd, 100, 2) end
			backScreen = true
		end
--Left Side have control in Char Select (Human Vs CPU)
	else
		if p1TeamBack == true then
			if backScreen == false then sndPlay(sysSnd, 100, 2) end
			backScreen = true
		end
	end
end

function f_exitSelect3() --For Advanced Select after Continue Screen
	if backScreen == false then sndPlay(sysSnd, 100, 2) end
	backScreen = true
end

function f_exitToMainMenu() --For Advanced Select
	data.tempBack = false
	f_saveTemp()
	if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
	f_resetMenuInputs()
end

--;===================================================================================================
--; SIMPLE MODES (VERSUS, TRAINING, RANDOM, MISSIONS, EVENTS, SINGLE BONUS/BOSSES LIST)
--;===================================================================================================
function f_selectSimple()
	f_unlocksCheck() --Check For Unlocked Content
	f_backReset()
	f_selectInit()
	cmdInput()
	while true do
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		if data.rosterMode == "challenger" then f_challengerMusic()
		elseif data.gameMode == "singleboss" then playBGM(bgmSelectBoss)
		elseif data.rosterMode == "event" then --playBGM("")
		elseif data.gameMode == "quick match" then --playBGM("")
		elseif data.gameMode == "intermission" then --playBGM("")
		elseif data.gameMode == "demo" then --playBGM("")
		else f_selectMusic()
		end
		if winner < 1 then
			f_selectReset()
		else
			selectStart()
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		end
		while not selScreenEnd do
			if onlinegame == false then
				if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect() end
			elseif onlinegame == true then
				if esc() then f_exitOnline() end
			end
			f_selectScreen()
		--Return to Main Menu
			assert(loadfile("save/temp_sav.lua"))()
			if back == true or data.tempBack == true then
				f_resetMenuAssets()
				return
			end
		end
		if winner > 0 then
			--Victory Screen
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				if t_selChars[data.t_p1selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p1selected[1].cel+1].victoryscreen == 1 then
					f_selectWin()
				end
			else
				if t_selChars[data.t_p2selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p2selected[1].cel+1].victoryscreen == 1 then
					f_selectWin()
				end
			end
			if data.gameMode == "versus" then
				--BACK TO MAIN MENU
				if battleOption == 4 or battleOption2 == 4 then
					f_favoriteChar() --Store Favorite Character (WIP)
					f_favoriteStage() --Store Favorite Stage (WIP)
					if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
					f_resetMenuInputs()
					break
				--BACK TO STAGE SELECT
				elseif battleOption == 3 or battleOption2 == 3 then
					f_selectMusic()
					f_randomRematch()
					f_stageSelectReset()
					--selectStart()
					selScreenEnd = false
					stageEnd = false
					charSelect = true
					rematchEnd = false
					battleOption = 0
					battleOption2 = 0
					--backScreen = false
					--back = false
					while not selScreenEnd do
						if onlinegame == true then
							if esc() then f_exitOnline() end
						end
						f_selectScreen()
						if back == true then
							f_resetMenuAssets()
							return
						end
					end
				--BACK TO CHARACTER SELECT
				elseif battleOption == 2 or battleOption2 == 2 then
					if data.challengerScreen == false then
						f_selectMusic() --and don't show the screen
					elseif data.challengerScreen == true then
						f_selectChallenger()
						f_challengerMusic()
					else
						f_selectMusic() --play original char select song instead of challenger song
					end
					f_selectReset()
					while not selScreenEnd do
						if onlinegame == false then
							if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect() end
						elseif onlinegame == true then
							if esc() then f_exitOnline() end
						end
						f_selectScreen()
						if back == true then
							f_resetMenuAssets()
							return
						end
					end
				--REMATCH
				elseif battleOption == 1 and battleOption2 == 1 then
					rematchEnd = false
					battleOption = 0 --Reset Rematch Battle Option
					battleOption2 = 0
					f_randomRematch()
					f_loadStage()
					f_loadSong()
				end
			--For Challenger Route in Arcade Mode
			elseif data.gameMode == "challenger" then
				return
			--For Missions, Events, Quick Match or intermission Modes
			elseif data.gameMode == "demo" or data.gameMode == "quick match" or data.gameMode == "intermission" or data.rosterMode == "mission" or data.rosterMode == "event" then
				if data.gameMode == "demo" then
					--Don't playBGM
				else
					if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
				end
				f_resetMenuInputs()
				return
			--For Single Boss/Bonus
			else
				f_selectReset()
				while not selScreenEnd do
					if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect() end
					f_selectScreen()
					if back == true then
						f_resetMenuAssets()
						return
					end
				end
			end
		end
		f_aiLevel()
		assert(loadfile("save/training_sav.lua"))()
		if data.gameMode == "training" then
			if data.dummyMode == 1 then
				setCom(2, data.AIlevel)
			else
				setCom(2, 0) --Not computer is controlling P2 side, only the human for training dummy
			end
		end
		f_matchInfo()
		f_orderSelect()
		--Versus Screen
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			if t_selChars[data.t_p1selected[1].cel+1].vsscreen == nil or t_selChars[data.t_p1selected[1].cel+1].vsscreen == 1 then
				f_selectVersus()
			end
		else
			if t_selChars[data.t_p2selected[1].cel+1].vsscreen == nil or t_selChars[data.t_p2selected[1].cel+1].vsscreen == 1 then
				f_selectVersus()
			end
		end
		sndStop()
		f_loading()
		f_setZoom()
		matchTime = os.clock()
		f_assignMusic()
		winner = game()
		matchTime = os.clock() - matchTime
		clearTime = clearTime + matchTime
		selectTimer = selectSeconds*gameTick
		stageTimer = stageSeconds*gameTick
		rematchTimer = rematchSeconds*gameTick
		serviceTimer = serviceSeconds*gameTick
		if data.rosterMode == "training" then f_modeplayTime() end --Store Training Time
		f_favoriteChar() --Store Favorite Character (WIP)
		f_favoriteStage() --Store Favorite Stage (WIP)
		f_unlocksCheck() --Check For Unlocked Content
		playBGM("")
		cmdInput()
		refresh()
	end
end

--;===================================================================
--; COMMON SIDE ACTIONS
--;===================================================================
function f_arcadeEnd()
	if data.rosterMode == "arcade" then
		data.arcadeClear = true --Progress
		if getPlayerSide() == "p1right" then --Player 1 in Right Side
			unlockTarget = data.t_p2selected
		else --Player 1 in Left Side
			unlockTarget = data.t_p1selected
		end
		if unlockTarget[1].displayname == "Suave Dude" then	data.reika = true end --Character Unlock
		f_saveProgress()
		unlockTarget = "" --Reset Var
	elseif data.rosterMode == "tower" then
		data.towerClear = true
		f_saveProgress()
	end
	--Intermissions Access
	if data.rosterMode == "arcade" and t_intermissionChars ~= nil and (p1teamMode == 0 and p2teamMode == 0) then --TODO enable intermissions in co-op mode
		data.intermission = true
	end
	f_playCredits()
	f_storyboard("data/screenpack/gameover.def")
	f_mainOpening()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
	f_resetMenuInputs()
end

function f_noContinue()
	--f_mainOpening()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
	f_resetMenuInputs()
end

function f_advancedEnd()
	if data.rosterMode == "survival" then
		data.survivalClear = true
		f_saveProgress()
	elseif data.rosterMode == "boss" then
		data.bossrushClear = true
		f_saveProgress()
	end
	f_storyboard("data/screenpack/gameover.def")
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
	f_resetMenuInputs()
end

function f_winAdvanced()
	f_records() --Save Stats
	f_result('win')
end

function f_loseAdvanced()
	f_records() --Save Stats
	f_result('lost')
	f_gameOver()
	--f_mainOpening()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
	f_resetMenuInputs()
end

function f_editLeftSide()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if serviceTeam == true then p1TeamEnd = false end
	data.t_p1selected = {}
	p1Portrait = nil
	p1SelEnd = false
	if data.coop then
		p2SelEnd = false
	end
end

function f_editRightSide()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if serviceTeam == true then p2TeamEnd = false end
	data.t_p2selected = {}
	p2Portrait = nil
	p2SelEnd = false
	if data.coop then
		p1SelEnd = false
	end
end

function f_1stStageSel()
	--Load first stage selected for all next matches
	if data.stageMenu == true then
		f_loadStage()
		f_loadSong()
	end
end

function f_nextMatch()
	matchNo = matchNo + 1
	f_1stStageSel()
end

--;=====================================================================================================
--; ADVANCED MODES (ARCADE, TOWER, SURVIVAL, BOSS/BONUS RUSH, SUDDEN DEATH, TIME ATTACK, ENDLESS)
--;=====================================================================================================
function f_selectAdvance()
	f_unlocksCheck() --Check For Unlocked Content
	data.rosterAdvanced = true
	f_backReset()
	f_selectInit()
	f_selectReset()
	if data.stageMenu == false then stageEnd = true end
	cmdInput()
	while true do
		if data.gameMode == "bossrush" or data.rosterMode == "suddendeath" then playBGM(bgmSelectBoss)
		elseif data.rosterMode == "challenger" then f_challengerMusic()
		elseif data.gameMode == "tower" then playBGM(bgmTower)
		else f_selectMusic()
		end
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		selectStart()
		while not selScreenEnd do
			if onlinegame == false then
				if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect2() end
			elseif onlinegame == true then
				if esc() then f_exitOnline() end
			end
			f_selectScreen()
			assert(loadfile("save/temp_sav.lua"))()
			if back == true or data.tempBack == true then
				f_resetMenuAssets()
				return
			end
		end
	--FIRST MATCH
		if matchNo == 0 then
			--Arcade Intro
			if data.arcadeIntro == true then
				if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
					storyBoardSide = t_selChars[data.t_p2selected[1].cel+1]
				else
					storyBoardSide = t_selChars[data.t_p1selected[1].cel+1]
				end
				local tPos = storyBoardSide
				if tPos.intro ~= nil and io.open(tPos.intro or '','r') ~= nil then
					f_storyboard(tPos.intro)
				elseif tPos.intro2 ~= nil and io.open(tPos.intro2 or '','r') ~= nil then
					playVideo(tPos.intro2)
				end
			end
			if data.gameMode == "tower" then
				f_selectDestiny() --Tower Select (Choose Your Destiny Screen)
				if data.tempBack == true then
					f_exitToMainMenu()
					return
				end
				lastMatch = #t_selTower[destinySelect].kombats --get roster selected in tower mode
			else
				--generate roster for other modes (arcade, survival, etc)
				f_makeRoster()
				if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
					lastMatch = #t_roster / p1numChars
				else
					lastMatch = #t_roster / p2numChars
				end
			end
			matchNo = 1
			f_aiRamp() --generate AI ramping table
	--Player exit the match via ESC in Endless or All Roster modes (BOTH SIDES)
		elseif winner == -1 and (data.gameMode == "endless" or data.gameMode == "allroster") then
			looseCnt = looseCnt + 1
			assert(loadfile("save/temp_sav.lua"))()
			if data.tempBack == true then
				f_exitToMainMenu()
				return
			end
			f_records() --Save Stats
			f_result('lost')
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff) --reset title screen fading
			if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
			f_resetMenuInputs()
			return
	--Endless or All Roster modes (BOTH SIDES)
		elseif data.gameMode == "endless" or data.gameMode == "allroster" then
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				if winner == 2 then
					winCnt = winCnt + 1
				else
					looseCnt = looseCnt + 1
				end
			else
				if winner == 1 then
					winCnt = winCnt + 1
				else --only true in Endless or All Roster modes
					looseCnt = looseCnt + 1
				end
			end
			--No More Matches Left
			if matchNo == lastMatch then
				f_winAdvanced()
				f_storyboard("data/screenpack/gameover.def")
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
				f_resetMenuInputs()
				return
			--Next Match Available
			else
				f_nextMatch()
			end
	--LEFT SIDE ACTIONS
		elseif winner == 1 then
			--Player 1 (IN RIGHT SIDE):
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				--Lose in Survival, Boss/Bonus Rush or don't have coins to continue in (Arcade with Attract Mode)
				if data.gameMode == "survival" or data.gameMode == "bossrush" or data.gameMode == "bonusrush" or (data.attractMode == true and data.attractCoins == 0) then --if data.coins == 0 or data.gameMode == "survival" or data.gameMode == "bossrush" or data.gameMode == "bonusrush" or (data.attractMode == true and data.attractCoins == 0) then
					looseCnt = looseCnt + 1
					--Victory screen
					if data.gameMode == "arcade" or data.gameMode == "tower" then
						if winner >= 1 and (t_selChars[data.t_p1selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p1selected[1].cel+1].victoryscreen == 1) then
							f_selectWin()
						end
					end
					assert(loadfile("save/temp_sav.lua"))()
					if data.tempBack == true then
						f_exitToMainMenu()
						return
					end
					f_loseAdvanced()
					return
				--Lose BUT can Continue (Arcade)
				else
					looseCnt = looseCnt + 1
					assert(loadfile("save/temp_sav.lua"))()
					if data.tempBack == true then
						f_exitToMainMenu()
						return
					end
					f_records()
					--Victory Screen
					if winner >= 1 and (t_selChars[data.t_p1selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p1selected[1].cel+1].victoryscreen == 1) then
						f_selectWin()
					end
					--Continue Screen
					f_continue()
					if data.continue == 2 then --Continue = NO
						f_noContinue()
						return
					end
					--Quick Arcade Continue option disable (Character can be Changed after Continue/Services)
					if not data.quickCont then
						f_editRightSide()
						f_rosterReset()
						selScreenEnd = false
						while not selScreenEnd do
							if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect3() end
							f_selectScreen()
							if back == true then
								f_resetMenuAssets()
								return
							end
						end
					--Exit
					elseif commandGetState(p1Cmd, 'e') then
						data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 2)
						if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
						f_resetMenuInputs()
						return
					end
					f_1stStageSel()
				end
			--Player 1 (IN LEFT SIDE):
			else
				--Wins in (Arcade, Survival, Boss/Bonus Rush)
				if winner == 1 then
					winCnt = winCnt + 1
				else
					looseCnt = looseCnt + 1
				end
				--Victory Screen
				if data.gameMode == "arcade" or data.gameMode == "tower" then
					if t_selChars[data.t_p2selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p2selected[1].cel+1].victoryscreen == 1 then
						f_selectWin()
					end
				end
				--No More Matches Left
				if matchNo == lastMatch then
					--Arcade Ending
					if data.arcadeEnding == true then
						local tPos = t_selChars[data.t_p1selected[1].cel+1]
						if tPos.ending ~= nil and io.open(tPos.ending or '','r') ~= nil then
							f_storyboard(tPos.ending)
						elseif tPos.ending2 ~= nil and io.open(tPos.ending2 or '','r') ~= nil then
							playVideo(tPos.ending2)
						end
					end
					f_winAdvanced()
					if data.gameMode == "arcade" or data.gameMode == "tower" then
						f_arcadeEnd()
						return
					else
						f_advancedEnd()
						return
					end
				--Next Match Available
				else
					f_nextMatch()
				end
			end
	--RIGHT SIDE
		elseif winner == 2 then
			--Player 1 (IN RIGHT SIDE):
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				--Wins in (Arcade, Survival, Boss/Bonus Rush)
				if winner == 2 then
					winCnt = winCnt + 1
				else
					looseCnt = looseCnt + 1
				end
				--Victory Screen
				if data.gameMode == "arcade" or data.gameMode == "tower" then
					if t_selChars[data.t_p1selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p1selected[1].cel+1].victoryscreen == 1 then
						f_selectWin()
					end
				end
				--No More Matches Left
				if matchNo == lastMatch then
					--Arcade Ending
					if data.arcadeEnding == true then
						local tPos = t_selChars[data.t_p2selected[1].cel+1]
						if tPos.ending ~= nil and io.open(tPos.ending or '','r') ~= nil then
							f_storyboard(tPos.ending)
						elseif tPos.ending2 ~= nil and io.open(tPos.ending2 or '','r') ~= nil then
							playVideo(tPos.ending2)
						end
					end
					f_winAdvanced()
					if data.gameMode == "arcade" or data.gameMode == "tower" then
						f_arcadeEnd()
						return
					else
						f_advancedEnd()
						return
					end
				--Next Match Available
				else
					f_nextMatch()
				end
			--Player 1 (IN LEFT SIDE):
			else
				--Lose in Survival, Boss/Bonus Rush or don't have coins to continue in (Arcade with Attract Mode)
				if data.gameMode == "survival" or data.gameMode == "bossrush" or data.gameMode == "bonusrush" or (data.attractMode == true and data.attractCoins == 0) then --if data.coins == 0 or data.gameMode == "survival" or data.gameMode == "bossrush" or data.gameMode == "bonusrush" or (data.attractMode == true and data.attractCoins == 0) then
					looseCnt = looseCnt + 1
					--Victory Screen
					if data.gameMode == "arcade" or data.gameMode == "tower" then
						if winner >= 1 and (t_selChars[data.t_p2selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p2selected[1].cel+1].victoryscreen == 1) then
							f_selectWin()
						end
					end
					assert(loadfile("save/temp_sav.lua"))()
					if data.tempBack == true then
						f_exitToMainMenu()
						return
					end
					f_loseAdvanced()
					return
				--Lose BUT can Continue (Arcade)
				else
					looseCnt = looseCnt + 1
					assert(loadfile("save/temp_sav.lua"))()
					if data.tempBack == true then
						f_exitToMainMenu()
						return
					end
					f_records() --Save Stats
					--Victory Screen
					if winner >= 1 and (t_selChars[data.t_p2selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p2selected[1].cel+1].victoryscreen == 1) then
						f_selectWin()
					end
					--Continue Screen
					f_continue()
					if data.continue == 2 then --Continue = NO
						f_noContinue()
						return
					end
					--Quick Arcade Continue option disable (Character can be Changed after Continue/Services)
					if not data.quickCont then
						f_editLeftSide()
						f_rosterReset()
						selScreenEnd = false
						while not selScreenEnd do
							if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect3() end
							f_selectScreen()
							if back == true then
								f_resetMenuAssets()
								return
							end
						end
					--Exit
					elseif commandGetState(p1Cmd, 'e') then
						data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 2)
						if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
						f_resetMenuInputs()
						return
					end
					f_1stStageSel()
				end
			end
		--BOTH SIDES - NO WINNER (player exit the match via ESC in Arcade, Survival, Boss/Bonus Rush)
		else
			--Lose Screen for: Survival, Boss/Bonus Rush when GIVE UP option is selected in Pause Menu
			if data.gameMode == "survival" or data.gameMode == "bossrush" or data.gameMode == "bonusrush" or (data.attractMode == true and data.attractCoins == 0) then --if data.coins == 0 or data.gameMode == "survival" or data.gameMode == "bossrush" or data.gameMode == "bonusrush" or (data.attractMode == true and data.attractCoins == 0) then
				looseCnt = looseCnt + 1
				if data.gameMode == "arcade" or data.gameMode == "tower" then --Attract Arcade
					if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
						if winner >= 1 and (t_selChars[data.t_p1selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p1selected[1].cel+1].victoryscreen == 1) then
							f_selectWin()
						end
					else
						if winner >= 1 and (t_selChars[data.t_p2selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p2selected[1].cel+1].victoryscreen == 1) then
							f_selectWin()
						end
					end
				end
				assert(loadfile("save/temp_sav.lua"))()
				if data.tempBack == true then
					f_exitToMainMenu()
					return
				end
				f_loseAdvanced()
				return
			--Continue Screen for Arcade when GIVE UP option is selected in Pause Menu
			else
				assert(loadfile("save/temp_sav.lua"))()
			--Here comes a New Challenger Route
				if data.challengerMode then
					data.challengerMode = false
					f_saveTemp()
				--Backup Arcade Data
					t_p1selectedTemp = data.t_p1selected --Get a copy of loaded chars to restore arcade after challenger battle
					t_p2selectedTemp = data.t_p2selected
					p1RestoreTeamMode = p1teamMode --Get a copy of team mode selected
					p2RestoreTeamMode = p2teamMode
					p1RestoreCharsNo = p1numChars --Get a copy of amount of chars selected
					p2RestoreCharsNo = p2numChars
					restoreMatchNo = matchNo --Get a copy of matchNo where arcade was cut
					if data.debugLog then f_printTable(t_p1selectedTemp, "save/debug/t_p1selectedTemp.txt") end
					if data.debugLog then f_printTable(t_p2selectedTemp, "save/debug/t_p2selectedTemp.txt") end
				--Load Side Player Data
					if getPlayerSide() == "p1left" or getPlayerSide() == "p2left" then
						keepLSide = true
					elseif getPlayerSide() == "p1right" or getPlayerSide() == "p2right" then
						keepRSide = true
					end
				--Go to VS Challenger Mode
					f_challengerVS() --Load Select Config
					backtomenu = false
					f_selectSimple() --Start Char Select
				--Read Winner results from f_selectSimple()
					if getPlayerSide() == "p1right" then --Player 1 in Right Side
						if winner == 1 then --Player 2 in Left Side Wins
							challengerEnd = true
							matchSetting = "humanvscpu"
							P2overP1 = true
						elseif winner == 2 then --Player 1 in Right Side Wins
							challengerEnd = true
							matchSetting = "cpuvshuman"
							P2overP1 = false
						else --No winner (maybe you use pause menu to exit) but what will happen if you come from a draw game?
							backtomenu = true
						end
					else --Player 1 in Left Side
						if winner == 1 then --Player 1 in Left Side Wins
							challengerEnd = true
							matchSetting = "humanvscpu"
							P2overP1 = false
						elseif winner == 2 then --Player 2 in Right Side Wins
							challengerEnd = true
							matchSetting = "cpuvshuman"
							P2overP1 = true
						else --No winner (maybe you use pause menu to exit) but what will happen if you come from a draw game?
							backtomenu = true
						end
					end
				--Restore Arcade Data when f_selectSimple() end
					if challengerEnd then
						if data.gameMode == "arcade" then
							arcadeCfg()
							textImgSetText(txt_mainSelect, "ARCADE")
						elseif data.gameMode == "tower" then
							towerCfg()
							textImgSetText(txt_mainSelect, "TOWER")
						end
						if matchSetting == "humanvscpu" then --is a copy frmo function arcadeHumanvsCPU()
							if P2overP1 then
								remapInput(1, 2)
								setPlayerSide('p2left')
							else
								setPlayerSide('p1left')
							end
							data.p2In = 1
							data.p2SelectMenu = false
						elseif matchSetting == "cpuvshuman" then --is a copy from function arcadeCPUvsHuman()
							remapInput(1, 2)
							if not P2overP1 then
								remapInput(2, 1)
								setPlayerSide('p1right')
							else
								setPlayerSide('p2right')
							end
							data.p1In = 2
							data.p2In = 2
							data.p1SelectMenu = false
						end
						p1teamMode = p1RestoreTeamMode --Restore team mode
						p2teamMode = p2RestoreTeamMode
						p1numChars = p1RestoreCharsNo --Restore chars amount
						p2numChars = p2RestoreCharsNo
						matchNo = restoreMatchNo --Restore matchNo
						challengerEnd = false
						matchSetting = ""
					end
			--Normal Give Up Route
				else
					looseCnt = looseCnt + 1
					if data.tempBack == true then
						f_exitToMainMenu()
						return
					end
					f_records()
					if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
						if winner >= 1 and (t_selChars[data.t_p1selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p1selected[1].cel+1].victoryscreen == 1) then
							f_selectWin()
						end
					else
						if winner >= 1 and (t_selChars[data.t_p2selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p2selected[1].cel+1].victoryscreen == 1) then
							f_selectWin()
						end
					end
					f_continue()
					if data.continue == 2 then
						f_noContinue()
						return
					end
					if not data.quickCont then
						if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
							f_editRightSide()
						else
							f_editLeftSide()
						end
						f_rosterReset()
						selScreenEnd = false
						while not selScreenEnd do
							if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect3() end
							f_selectScreen()
							if back == true then
								f_resetMenuAssets()
								return
							end
						end
					elseif commandGetState(p1Cmd, 'e') then
						data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 2)
						if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
						f_resetMenuInputs()
						return
					end
					if data.stageMenu == true then
						f_loadStage()
						f_loadSong()
					end
				end
			--If you exit in char select from challenger mode then back to main menu
				if back == true or backtomenu == true then
					f_resetMenuAssets()
					return
				end
			end
		end
	--Assign enemy team for AI in Player 1 (LEFT SIDE)
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			data.t_p1selected = {}
			shuffle = true --was local function
			for i=1, p1numChars do
				if i == 1 and data.gameMode == "arcade" and t_selChars[data.t_p2selected[1].cel+1][matchNo] ~= nil then --Force Arcade Path Fight according to match number: 1, 2, (...)
					p1Cell = t_charAdd[t_selChars[data.t_p2selected[1].cel+1][matchNo]]
					shuffle = false
				else
					if data.gameMode == "tower" then
						p1Cell = t_selTower[destinySelect].kombats[matchNo]
					else
						p1Cell = t_roster[matchNo*p1numChars-i+1]
					end
				end
				if data.aipal == "Default" then
					p1Pal = 1
				elseif data.aipal == "Random" then
					p1Pal = math.random(1,12)
				end
				local updateAnim = true
				for j=1, #data.t_p1selected do
					if data.t_p1selected[j].cel == p1Cell then 
						updateAnim = false
					end
				end
				data.t_p1selected[#data.t_p1selected+1] = {['cel'] = p1Cell, ['name'] = t_selChars[p1Cell+1].name, ['displayname'] = t_selChars[p1Cell+1].displayname, ['path'] = t_selChars[p1Cell+1].char, ['pal'] = p1Pal, ['up'] = updateAnim, ['rand'] = false}
				if shuffle then
					f_shuffleTable(data.t_p1selected)
				end
			end
			--Team conversion to Single match if single or bonus paramvalue on any opponents is detected in select.def
			restoreTeam = false
			teamMode = p1teamMode --was local function
			numChars = p1numChars --was local function
			if p1numChars > 1 then
				for i=1, #data.t_p1selected do
					if t_selChars[data.t_p1selected[i].cel+1].bonus ~= nil and t_selChars[data.t_p1selected[i].cel+1].bonus == 1 then
						--setHUD(false) --It Disable HUD for All Bonus Games in Co-Op Mode but if you are playing in arcade in next match HUD still disable...
						p1teamMode = 0
						p1numChars = 1
						setTeamMode(1, 0, 2) --OR (1, 0, 1) ?
						p1Cell = t_charAdd[t_selChars[data.t_p1selected[i].cel+1].char]
						data.t_p1selected = {}
						data.t_p1selected[1] = {['cel'] = p1Cell, ['name'] = t_selChars[p1Cell+1].name, ['displayname'] = t_selChars[p1Cell+1].displayname, ['path'] = t_selChars[p1Cell+1].char, ['pal'] = p1Pal, ['up'] = true, ['rand'] = false}
						restoreTeam = true
						break
					elseif t_selChars[data.t_p1selected[i].cel+1].single ~= nil and t_selChars[data.t_p1selected[i].cel+1].single == 1 then
						p1teamMode = 0
						p1numChars = 1
						setTeamMode(1, 0, 2) --OR (1, 0, 1) ?
						p1Cell = t_charAdd[t_selChars[data.t_p1selected[i].cel+1].char]
						data.t_p1selected = {}
						data.t_p1selected[1] = {['cel'] = p1Cell, ['name'] = t_selChars[p1Cell+1].name, ['displayname'] = t_selChars[p1Cell+1].displayname, ['path'] = t_selChars[p1Cell+1].char, ['pal'] = p1Pal, ['up'] = true, ['rand'] = false}
						restoreTeam = true
						break
					end
				end
			end
	--Assign enemy team for AI in Player 2 (RIGHT SIDE)
		else
			data.t_p2selected = {}
			shuffle = true --was local function
			for i=1, p2numChars do
				if i == 1 and data.gameMode == "arcade" and t_selChars[data.t_p1selected[1].cel+1][matchNo] ~= nil then
					p2Cell = t_charAdd[t_selChars[data.t_p1selected[1].cel+1][matchNo]]
					shuffle = false
				else
					if data.gameMode == "tower" then
						p2Cell = t_selTower[destinySelect].kombats[matchNo]
					else
						p2Cell = t_roster[matchNo*p2numChars-i+1]
					end
				end
				if data.aipal == "Default" then
					p2Pal = 1
				elseif data.aipal == "Random" then
					p2Pal = math.random(1,12)
				end
				local updateAnim = true
				for j=1, #data.t_p2selected do
					if data.t_p2selected[j].cel == p2Cell then 
						updateAnim = false
					end
				end
				data.t_p2selected[#data.t_p2selected+1] = {['cel'] = p2Cell, ['name'] = t_selChars[p2Cell+1].name, ['displayname'] = t_selChars[p2Cell+1].displayname, ['path'] = t_selChars[p2Cell+1].char, ['pal'] = p2Pal, ['up'] = updateAnim, ['rand'] = false}
				if shuffle then
					f_shuffleTable(data.t_p2selected)
				end
			end
			--Team conversion to Single match if single or bonus paramvalue on any opponents is detected in select.def
			restoreTeam = false
			teamMode = p2teamMode
			numChars = p2numChars --was local function
			if p2numChars > 1 then
				for i=1, #data.t_p2selected do
					if t_selChars[data.t_p2selected[i].cel+1].bonus ~= nil and t_selChars[data.t_p2selected[i].cel+1].bonus == 1 then
						--setHUD(false) --It Disable HUD for All Bonus Games in Co-Op Mode but if you are playing in arcade in next match HUD still disable...
						p2teamMode = 0
						p2numChars = 1
						setTeamMode(2, 0, 1)
						p2Cell = t_charAdd[t_selChars[data.t_p2selected[i].cel+1].char]
						data.t_p2selected = {}
						data.t_p2selected[1] = {['cel'] = p2Cell, ['name'] = t_selChars[p2Cell+1].name, ['displayname'] = t_selChars[p2Cell+1].displayname, ['path'] = t_selChars[p2Cell+1].char, ['pal'] = p2Pal, ['up'] = true, ['rand'] = false}
						restoreTeam = true
						break
					elseif t_selChars[data.t_p2selected[i].cel+1].single ~= nil and t_selChars[data.t_p2selected[i].cel+1].single == 1 then
						p2teamMode = 0
						p2numChars = 1
						setTeamMode(2, 0, 1)
						p2Cell = t_charAdd[t_selChars[data.t_p2selected[i].cel+1].char]
						data.t_p2selected = {}
						data.t_p2selected[1] = {['cel'] = p2Cell, ['name'] = t_selChars[p2Cell+1].name, ['displayname'] = t_selChars[p2Cell+1].displayname, ['path'] = t_selChars[p2Cell+1].char, ['pal'] = p2Pal, ['up'] = true, ['rand'] = false}
						restoreTeam = true
						break
					end
				end
			end
		end
		setMatchNo(matchNo)
		f_aiLevel()
		if data.stageMenu == false then f_selectStage() end --Load specific stage and music for roster characters
		f_matchInfo()
		f_orderSelect()
		if data.gameMode == "tower" then f_battlePlan() end --Battle Plan Screen
		--Versus Screen
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			if t_selChars[data.t_p1selected[1].cel+1].vsscreen == nil or t_selChars[data.t_p1selected[1].cel+1].vsscreen == 1 then
				f_selectVersus()
			end
		else
			if t_selChars[data.t_p2selected[1].cel+1].vsscreen == nil or t_selChars[data.t_p2selected[1].cel+1].vsscreen == 1 then
				f_selectVersus()
			end
		end
		if data.rosterMode == "arcade" or data.rosterMode == "tower" or data.rosterMode == "cpu" then
			f_setRoundTime() --Set Round Time for specific characters
			f_setRounds() --Set Rounds to Win for specific characters
		end
		f_setZoom()
		--inputs
		if data.coop then
			remapInput(3,2) --P2 controls assigned to P3 character
			--remapInput(2,3) --P3 controls assigned to P2 character
		end
		sndStop()
		f_loading()
		matchTime = os.clock()
		f_assignMusic()
		winner = game()
		playBGM("")
		matchTime = os.clock() - matchTime
		clearTime = clearTime + matchTime
		selectTimer = selectSeconds*gameTick
		stageTimer = stageSeconds*gameTick
		rematchTimer = rematchSeconds*gameTick
		serviceTimer = serviceSeconds*gameTick
		destinyTimer = destinySeconds*gameTick
		f_modeplayTime() --Store Favorite Game Mode
		f_favoriteChar() --Store Favorite Character (WIP)
		f_records() --save record progress
		f_unlocksCheck() --Check For Unlocked Content
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			--restore P1 Team settings if needed
			if restoreTeam then
				p1teamMode = teamMode
				p1numChars = numChars
				setTeamMode(1, p1teamMode, p1numChars)
			end
		else
			--restore P2 Team settings if needed
			if restoreTeam then
				p2teamMode = teamMode
				p2numChars = numChars
				setTeamMode(2, p2teamMode, p2numChars)
			end
		end
		cmdInput()
		refresh()
	end
end

--;==============================================================================
--; STORY MODE
--;==============================================================================
function f_selectStory()
	f_unlocksCheck() --Check For Unlocked Content
	f_backReset()
	f_selectInit()
	cmdInput()
	while true do
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		--f_selectMusic()
		if winner < 1 then
			f_selectReset()
		else
			selectStart()
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		end
		while not selScreenEnd do
			if onlinegame == false then
				if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then f_exitSelect() end
			elseif onlinegame == true then
				if esc() then f_exitOnline() end
			end
			f_selectScreen()
			assert(loadfile("save/temp_sav.lua"))()
			--Back from Pause Menu
			if data.tempBack == true then
				if data.rosterMode == "story" then
					playBGM(bgmStory)
				else
					if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
				end
				data.tempBack = false
				f_saveTemp()
				f_resetMenuInputs()
				return
			end
			--Back from Char Select
			if back == true then return end
		end
		if winner > 0 then
			--Victory Screen
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				if t_selChars[data.t_p1selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p1selected[1].cel+1].victoryscreen == 1 then
					f_selectWin()
				end
			else
				if t_selChars[data.t_p2selected[1].cel+1].victoryscreen == nil or t_selChars[data.t_p2selected[1].cel+1].victoryscreen == 1 then
					f_selectWin()
				end
			end
			if data.rosterMode == "story" then
				playBGM(bgmStory)
			else
				if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
			end
			f_resetMenuInputs()
			return
		end
		f_aiLevel()
		f_matchInfo()
		f_orderSelect()
		--Versus Screen
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			if t_selChars[data.t_p1selected[1].cel+1].vsscreen == nil or t_selChars[data.t_p1selected[1].cel+1].vsscreen == 1 then
				f_selectVersus()
			end
		else
			if t_selChars[data.t_p2selected[1].cel+1].vsscreen == nil or t_selChars[data.t_p2selected[1].cel+1].vsscreen == 1 then
				f_selectVersus()
			end
		end
		sndStop()
		f_loading()
		f_setZoom()
		matchTime = os.clock()
		if data.songSelect then f_assignMusic() end
		winner = game()
		matchTime = os.clock() - matchTime
		clearTime = clearTime + matchTime
		selectTimer = selectSeconds*gameTick
		stageTimer = stageSeconds*gameTick
		rematchTimer = rematchSeconds*gameTick
		serviceTimer = serviceSeconds*gameTick
		--f_favoriteChar() --Store Favorite Character (WIP)
		--f_favoriteStage() --Store Favorite Stage (WIP)
		f_unlocksCheck() --Check For Unlocked Content
		playBGM("")
		cmdInput()
		refresh()
	end
end

--;=================================================================================================
--; TOWER DESTINY SCREENPACK
--;=================================================================================================
txt_towerSelect = createTextImg(font35, 0, 0, "CHOOSE YOUR DESTINY", 159, 13, 0.5, 0.5)

--Destiny Select BG
destinyBG = animNew(towerSff, [[
1,0, 0,0, -1
]])
animAddPos(destinyBG, -55, 0)
animUpdate(destinyBG)
animSetScale(destinyBG, 1.1, 1)

--Destiny Cursor
destinyCursor = animNew(towerSff, [[
2,0, 0,0, 3
2,1, 0,0, 3
2,2, 0,0, 3
2,3, 0,0, 3
2,4, 0,0, 3
2,5, 0,0, 3
2,6, 0,0, 3
2,7, 0,0, 3
2,8, 0,0, 3
2,9, 0,0, 3
2,10, 0,0, 3
2,11, 0,0, 3
2,12, 0,0, 3
2,13, 0,0, 3
2,14, 0,0, 3
2,15, 0,0, 3
2,16, 0,0, 3
2,17, 0,0, 3
2,18, 0,0, 3
2,19, 0,0, 3
2,20, 0,0, 3
2,21, 0,0, 3
2,22, 0,0, 3
2,23, 0,0, 3
]])
animSetScale(destinyCursor, 0.135, 0.135)
animSetAlpha(destinyCursor, 188, 0)
animUpdate(destinyCursor)

--Tower Left Arrow
towerLeftArrow = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(towerLeftArrow, 0, 215)
animUpdate(towerLeftArrow)
animSetScale(towerLeftArrow, 0.6, 0.6)

--Tower Right Arrow
towerRightArrow = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(towerRightArrow, 310, 215)
animUpdate(towerRightArrow)
animSetScale(towerRightArrow, 0.6, 0.6)

--Tower Slot
towerSlot = animNew(sysSff, [[230,1, 0,0,]])
animSetScale(towerSlot, 0.5, 0.5)
animUpdate(towerSlot)

--;=================================================================================================
--; TOWER DESTINY SELECT
--;=================================================================================================
function f_selectDestiny()
	waitingTowerSel = true
	destinySelect = 1
	local cursorPosX = 1
	local moveTower = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local selection = 0
	local startCount = false
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if data.arcadeIntro then playBGM(bgmTower) end
	if t_selTower.data.snd ~= nil then --Choose your Destiny SFX
		twSfx = sndNew(t_selTower.data.snd) --Load snd File
		local data = t_selTower.data.sfxannouncer
		local sfxGroup, sfxIndex = data:match('^([^,]-)%s*,%s*(.-)$')
		sndPlay(twSfx, sfxGroup, sfxIndex)
	end
	f_backReset()
	cmdInput()
	while true do
		--Actions
		if selection == 0 and not backScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sysSnd, 100, 2)
				backScreen = true
			end
			if commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
				sndPlay(sysSnd, 100, 0)
				destinySelect = destinySelect - 1
			elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
				sndPlay(sysSnd, 100, 0)
				destinySelect = destinySelect + 1
			elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) or destinyTimer == 0 then
				sndStop()
				sndPlay(sysSnd, 100, 1)
				if t_selTower.data.snd ~= nil then f_playTWsfx() end
				startCount = true
			end
			--Cursor position calculation
			if destinySelect < 1 then
				destinySelect = #t_selTower
				if #t_selTower > 3 then
					cursorPosX = 3
				else
					cursorPosX = #t_selTower
				end
			elseif destinySelect > #t_selTower then
				destinySelect = 1
				cursorPosX = 1
			elseif ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30)) and cursorPosX > 1 then
				cursorPosX = cursorPosX - 1
			elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30)) and cursorPosX < 3 then
				cursorPosX = cursorPosX + 1
			end
			if cursorPosX == 3 then
				moveTower = (destinySelect - 3) * 105 --Set how many space will move diffcult text
			elseif cursorPosX == 1 then
				moveTower = (destinySelect - 1) * 105
			end
			if #t_selTower <= 3 then
				maxDestiny = #t_selTower
			elseif destinySelect - cursorPosX > 0 then
				maxDestiny = destinySelect + 3 - cursorPosX
			else
				maxDestiny = 3
			end
		elseif selection > 150 then --End Destiny Select
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
			startCount = false
			break
		end
		if data.tempBack then break end --back to main menu
		if startCount then selection = selection + 1 end --Start End Destiny Select count
	--Draw BG
		animDraw(f_animVelocity(selectHardBG0, -1, -1))
		--animDraw(destinyBG)
	--Set Towers Scroll Logic
		for i=1, maxDestiny do
			if i > destinySelect - cursorPosX then
			--Draw Towers Assets
				for length=#t_selTower[i].kombats, 1, -1 do
					animPosDraw(towerSlot, -85+100*i-moveTower, 250-32*length) --Draw Towers BG According to his size via kombats sub-table
					--if t_selChars[t_selTower[i].kombats[length][1]].stage ~= nil then
						--drawStagePortrait(t_selChars[t_selTower[i].kombats[length][1]].stage, -83+100*i-moveTower, 253-32*length, 0.056, 0.036) --Draw Stages Preview Portraits
					--else
						--random portrait
					--end
					drawPortrait(t_selTower[i].kombats[length], -83+100*i-moveTower, 253-32*length, 0.18, 0.18) --Draw Chars Preview Portraits
				end
				if i == destinySelect then
				--Draw Cursor Icon
					animPosDraw(destinyCursor, -72+i*105-moveTower, 194)
				--Draw Difficulty Text for Tower Table
					if t_selTower[i].ID ~= nil then
						textImgDraw(f_updateTextImg(t_selTower[i].ID, font31, 0, 0, t_selTower[i].displayname:upper(), -52+i*105-moveTower, 219,0.85,0.85))
					end
				end
			end
		end
	--Draw Title
		textImgDraw(txt_towerSelect)
	--Draw Left Animated Cursor
		if maxDestiny > 3 then
			animDraw(towerLeftArrow)
			animUpdate(towerLeftArrow)
		end
	--Draw Right Animated Cursor
		if #t_selTower > 3 and maxDestiny < #t_selTower then
			animDraw(towerRightArrow)
			animUpdate(towerRightArrow)
		end
	--Destiny Select Timer
		--txt_destinyTime = createTextImg(jgFnt, 0, 0, (destinyTimer/gameTick), 160, 28)
		destinyTimeNumber = destinyTimer/gameTick
		nodecimalDestinyTime = string.format("%.0f",destinyTimeNumber)
		txt_destinyTime = createTextImg(jgFnt, 0, 0, nodecimalDestinyTime, 160, 28)
		if destinyTimer > 0 then
			destinyTimer = destinyTimer - 0.5 --Activate Tower Select Timer
			textImgDraw(txt_destinyTime)
		else --when destinyTimer <= 0
			
		end
		if data.debugMode then f_drawQuickText(txt_selectionTime, font3, 0, 0, selection, 163.5, 168) end --For Debug Purposes
		if backScreen then f_backMenu() end --Open Back Menu Question
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
		end
		cmdInput()
		refresh()
	end
end

function f_playTWsfx()
local data = t_selTower[destinySelect].sfxplay
local sfxGroup, sfxIndex = data:match('^([^,]-)%s*,%s*(.-)$')
sndPlay(twSfx, sfxGroup, sfxIndex)
end

function f_setTowerStage() --Unfinished
	if not data.stageMenu then
		if t_selChars[t_selTower[i].kombats[length]].stage ~= nil then
			data.stage = math.random(1,#t_selChars[t_selTower[i].kombats[length]].stage) --if there are more than 1 stage assigned for that character, pick 1 of them via randomizer
			data.stage = t_selChars[t_selTower[i].kombats[length]].stage[data.stage]
		end
	end
end

--;=================================================================================================
--; TOWER BATTLE PLAN
--;=================================================================================================
txt_towerPlan = createTextImg(jgFnt, 0, 0, "BATTLE PLAN", 159, 13)
txt_towerDifficult = createTextImg(jgFnt, 0, 1, "", 2, 40, 0.7, 0.7)

--Final Destiny BG
destinyFinalBG = animNew(towerSff, [[
1,1, 0,0, -1
]])
animAddPos(destinyFinalBG, 0, 0)
animUpdate(destinyFinalBG)
--animSetScale(destinyFinalBG, 1., 1.)

--Tower Slot
battleSlot = animNew(sysSff, [[230,2, 0,0,]])
animSetScale(battleSlot, 1.3, 1.3)
animUpdate(battleSlot)

function f_battlePlan()
	startKombat = false
	towerPlanTimer = 0
	towerPlanTimeLimit = 100
	battlePreviewTimer = 0
	local loopSfx = 0
	local scroll = 0
	local scrollDown = 0
	local scrollUp = 0
	local HumanslotPosX = 87
	local CPUslotPosX = 170
	local CPUslotPosY = 170
	local CPUslotSpacingY = 85
	local matchNo = 1 --2 --temp var
	twSfx = sndNew("data/screenpack/tower.snd") --temp load
	local CPUslotPosYInit = CPUslotPosY --get initial first battle pos
	if matchNo == 1 then
		CPUslotPosY = CPUslotPosY+(CPUslotSpacingY*#t_selTower[destinySelect].kombats)-CPUslotSpacingY --Portraits Y pos starts in the top of the tower
	else
		--playBGM(bgmTower)
		CPUslotPosY = CPUslotPosY+(CPUslotSpacingY*matchNo)-CPUslotSpacingY --Portraits Y pos starts in the lastest battle
	end
	--data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	cmdInput()
	while true do
		if startKombat then break end --Go to next Screen
		if matchNo == 1 then --Battle Plan Presentation
			if towerPlanTimer < towerPlanTimeLimit then --Intro Time
				towerPlanTimer = towerPlanTimer + 1
			else --when introTime is over. Start Down Scroll
				if CPUslotPosY > CPUslotPosYInit then
					if loopSfx > 45 then --reset sfx loop (time is in ticks)
						loopSfx = 0
					end
					if loopSfx == 0 then sndPlay(twSfx, 1, 0) end --Play Scroll Down Sfx
					loopSfx = loopSfx + 1
					--Scroll Logic
					CPUslotPosY = CPUslotPosY - 2
					if (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then --Skip Battle Plan Preview
						sndStop()
						CPUslotPosY = CPUslotPosYInit
					end
				else --when down scroll finish
					f_battlePreview()
				end
			end
		else --Battle Plan Prosecution
			scroll = scrollUp
			if towerPlanTimer < towerPlanTimeLimit then --Intro Time
				towerPlanTimer = towerPlanTimer + 1
			else
				if scrollUp < CPUslotSpacingY then --when introTime is over. Start Up Scroll
					if scroll == 0 then sndPlay(twSfx, 1, 1) end --Play Scroll Up Sfx
					scrollUp = scrollUp + 0.8
					if (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then --Skip Battle Plan Preview
						sndStop()
						scrollUp = CPUslotSpacingY
					end
				else
					f_battlePreview()
				end
			end
		end
		--draw background on top
		animDraw(f_animVelocity(selectTowerBG0, 0, 1.5))
		--Draw Towers Assets
		for length=#t_selTower[destinySelect].kombats, 1, -1 do
			--Draw Tower Slot According to his size
			animPosDraw(battleSlot, CPUslotPosX, CPUslotPosY-CPUslotSpacingY*length+scroll)
			--TODO Stage Portraits
			
			--draw CPU character portraits
			drawPortrait(t_selTower[destinySelect].kombats[length], CPUslotPosX+61.5, CPUslotPosY+7-CPUslotSpacingY*length+scroll, -0.48, 0.48) --Draw Chars Preview Portraits
		end
		--draw HUMAN Player Portrait
		if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
			--Left Side
			animPosDraw(battleSlot, 3, CPUslotPosYInit-CPUslotSpacingY)
			drawPortrait(data.t_p1selected[1].cel, HumanslotPosX, CPUslotPosYInit-CPUslotSpacingY+7, 0.48, 0.48)
			--Right Side
			--drawPortrait(data.t_p2selected[1].cel, 300, CPUslotPosYInit, -0.48, 0.48)
		end
		--[[
		--draw HUMAN Player Animations
		if data.charPresentation == "Sprite" then
			--Left Side
			for j=#data.t_p1selected, 1, -1 do
				f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 139 - (2*j-1) * 18, 168, data.t_p1selected[j].up)
			end
			--Right Side
			for j=#data.t_p2selected, 1, -1 do
				f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimWin', 180 + (2*j-1) * 18, 168, data.t_p2selected[j].up)
			end
		end
		]]
		--draw HUMAN Player Name
		
		--draw title info
		textImgDraw(txt_towerPlan)
		--textImgSetText(txt_towerDifficult, "DIFFICULTY: "..t_selTower[destinySelect].displayname:upper())
		--textImgDraw(txt_towerDifficult)
		--animDraw(data.fadeTitle)
		--animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

function f_battlePreview()
	if battlePreviewTimer == 0 then sndPlay(twSfx, 1, 2) end --Play Stop Sfx
	battlePreviewTimer = battlePreviewTimer + 1 --Time to show VS preview
	if battlePreviewTimer == 250 or (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
		commandBufReset(p1Cmd)
		commandBufReset(p2Cmd)
		sndStop()
		startKombat = true
	end
end

--;=================================================================================================
--; TOURNAMENT MODE (WIP)
--;=================================================================================================
tourney16 = animNew(sysSff, [[
666,0, 0,0, -1
]])
animAddPos(tourney16, -10, -5)
animUpdate(tourney16)
animSetScale(tourney16, 1.059, 1.041)

tourney8 = animNew(sysSff, [[
666,1, 0,0, -1
]])
animAddPos(tourney8, -10, -5)
animUpdate(tourney8)
animSetScale(tourney8, 1.059, 1.041)

tourney4 = animNew(sysSff, [[
666,2, 0,0, -1
]])
animAddPos(tourney4, -10, -5)
animUpdate(tourney4)
animSetScale(tourney4, 1.059, 1.041)

function f_selectTourney()
--TODO
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	playBGM(bgmTourney)
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			f_comingSoon()
			if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
			f_resetMenuInputs()
			break
		end
		animDraw(f_animVelocity(selectBG0, -1, -1))
		animDraw(f_animVelocity(selectBG2a, -1, 0))
		animDraw(f_animVelocity(selectBG2b, -3, 0))
		animDraw(f_animVelocity(selectBG2c, -6, 0))
		if data.gameMode == "tourney16" then animDraw(tourney16)
		elseif data.gameMode == "tourney8" then animDraw(tourney8)
		elseif data.gameMode == "tourney4" then animDraw(tourney4) end
		textImgDraw(txt_mainSelect)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;=================================================================================================
--; ADVENTURE MODE (WIP)
--;=================================================================================================
adventureMap = animNew(sysSff, [[
2000,0, 0,0, -1
]])
animAddPos(adventureMap, -55, 0)
animUpdate(adventureMap)
animSetScale(adventureMap, 0.335, 0.335)

function f_selectAdventure()
--TODO
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	playBGM(bgmAdventure)
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			f_comingSoon()
			if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
			f_resetMenuInputs()
			break
		end
		animDraw(adventureMap)
	    animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CHARACTER SELECT SCREENPACK
--;===========================================================
--Scrolling background
selectBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(selectBG0, 160, 0)
animSetTile(selectBG0, 1, 1) --Makes the image repeat
animSetColorKey(selectBG0, -1)

--Hardcore Scrolling background
selectHardBG0 = animNew(sysSff, [[
101,0, 0,0, -1
]])
animAddPos(selectHardBG0, 160, 0)
animSetTile(selectHardBG0, 1, 1)
animSetColorKey(selectHardBG0, -1)

--Tower Scrolling background
selectTowerBG0 = animNew(towerSff, [[
0,0, 0,0, -1
]])
animAddPos(selectTowerBG0, 160, 0)
animSetTile(selectTowerBG0, 1, 1)
animSetColorKey(selectTowerBG0, -1)
animSetAlpha(selectTowerBG0, 150, 0)

--Dark Box (Player1 side)
selectBG1a = animNew(sysSff, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1a, 160, 0)
animSetTile(selectBG1a, 1, 0)
animSetWindow(selectBG1a, 5, 0, 151, 239) --The first values ​​are the location of the sprite on the screen and the last values ​​are the extension of the sprite

--Dark Box (Player2 side)
selectBG1b = animNew(sysSff, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1b, 160, 0)
animSetTile(selectBG1b, 1, 0)
animSetWindow(selectBG1b, 164, 0, 151, 239)

--Dark Box (when Player2 side is not displayed)
selectBG1c = animNew(sysSff, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1c, 160, 0)
animSetTile(selectBG1c, 1, 0)
--animSetWindow(selectBG1c, 0, 0, 351, 239)

--Title background
selectBG2a = animNew(sysSff, [[
102,0, 0,2, -1, 0, s
]])
animAddPos(selectBG2a, 160, 0)
animSetTile(selectBG2a, 1, 0)

--Title background B
selectBG2b = animNew(sysSff, [[
102,1, 0,2, -1, 0, a
]])
animAddPos(selectBG2b, 160, 0)
animSetTile(selectBG2b, 1, 0)

--Title background C
selectBG2c = animNew(sysSff, [[
102,2, 0,2, -1, 0, a
]])
animAddPos(selectBG2c, 160, 0)
animSetTile(selectBG2c, 1, 0)

--Cell background
selectCell = animNew(sysSff, [[
150,0, 0,0, -1
]])

--P1 active cursor
p1ActiveCursor = animNew(sysSff, [[
160,0, 0,0, -1
]])

--P2 active cursor
p2ActiveCursor = animNew(sysSff, [[
170,0, 0,0, -1
]])

--nothing but changed to fade if needed
data.fadeSelect = animNew(sysSff, [[
-1,-1, 0,0, -1
]])

--Char Screen (left portrait background)
charBG2 = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(charBG2, 160, 0)
animSetTile(charBG2, 1, 1)
animSetWindow(charBG2, 0, 20, 120, 140)

--Char Screen (right portrait background)
charBG3 = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(charBG3, 160, 0)
animSetTile(charBG3, 1, 1)
animSetWindow(charBG3, 200, 20, 120, 140)

--Up Arrows 1 for Muti Roster 1 (Left Side) [Fixed Type]
arrowsUMR = animNew(sysSff, [[
222,5, 0,0, 10
222,6, 0,0, 10
222,7, 0,0, 10
222,8, 0,0, 10
222,9, 0,0, 10
222,8, 0,0, 10
222,7, 0,0, 10
222,6, 0,0, 10
222,5, 0,0, 10
]])
animAddPos(arrowsUMR, 5, 160)
animUpdate(arrowsUMR)
animSetScale(arrowsUMR, 0.95, 0.95)

--Down Arrows 1 for Muti Roster 1 (Left Side) [Fixed Type]
arrowsDMR = animNew(sysSff, [[
222,0, 0,0, 10
222,1, 0,0, 10
222,2, 0,0, 10
222,3, 0,0, 10
222,4, 0,0, 10
222,3, 0,0, 10
222,2, 0,0, 10
222,1, 0,0, 10
222,0, 0,0, 10
]])
animAddPos(arrowsDMR, 5, 223)
animUpdate(arrowsDMR)
animSetScale(arrowsDMR, 0.95, 0.95)

--Up Arrows 1 for Muti Roster 2 (Right Side) [Fixed Type]
arrowsUMR2 = animNew(sysSff, [[
222,5, 0,0, 10
222,6, 0,0, 10
222,7, 0,0, 10
222,8, 0,0, 10
222,9, 0,0, 10
222,8, 0,0, 10
222,7, 0,0, 10
222,6, 0,0, 10
222,5, 0,0, 10
]])
animAddPos(arrowsUMR2, 307, 160)
animUpdate(arrowsUMR2)
animSetScale(arrowsUMR2, 0.95, 0.95)

--Down Arrows 2 for Muti Roster 2 (Right Side) [Fixed Type]
arrowsDMR2 = animNew(sysSff, [[
222,0, 0,0, 10
222,1, 0,0, 10
222,2, 0,0, 10
222,3, 0,0, 10
222,4, 0,0, 10
222,3, 0,0, 10
222,2, 0,0, 10
222,1, 0,0, 10
222,0, 0,0, 10
]])
animAddPos(arrowsDMR2, 307, 223)
animUpdate(arrowsDMR2)
animSetScale(arrowsDMR2, 0.95, 0.95)

--Up Arrows for Single Roster (Variable Type)
arrowsUSR = animNew(sysSff, [[
222,5, 0,0, 10
222,6, 0,0, 10
222,7, 0,0, 10
222,8, 0,0, 10
222,9, 0,0, 10
222,8, 0,0, 10
222,7, 0,0, 10
222,6, 0,0, 10
222,5, 0,0, 10
]])
animAddPos(arrowsUSR, 156, 160)
animUpdate(arrowsUSR)
animSetScale(arrowsUSR, 0.95, 0.95)

--Down Arrows for Single Roster (Variable Type)
arrowsDSR = animNew(sysSff, [[
222,0, 0,0, 10
222,1, 0,0, 10
222,2, 0,0, 10
222,3, 0,0, 10
222,4, 0,0, 10
222,3, 0,0, 10
222,2, 0,0, 10
222,1, 0,0, 10
222,0, 0,0, 10
]])
animAddPos(arrowsDSR, 156, 223)
animUpdate(arrowsDSR)
animSetScale(arrowsDSR, 0.95, 0.95)

--Cell Lock
cellLock = animNew(sysSff, [[
108,0, 0,0,
]])
animSetScale(cellLock, 0.07, 0.07)
animUpdate(cellLock)

--Cell Locked Fade Window
cellLockWindowBG = animNew(sysSff, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetScale(cellLockWindowBG, 91.5, 51)
animUpdate(cellLockWindowBG)

--;===========================================================
--; CHARACTER SELECT SCREEN
--;===========================================================
txt_p1Wins = createTextImg(font6, 0, 1, "", 2, 13)
txt_p2Wins = createTextImg(font6, 0, -1, "", 318, 13)
txt_palHint = createTextImg(font1, 0, 0, "", 157, 239)
txt_palHintC = "PRESS A,B,C,X,Y OR Z BUTTON TO SELECT A COLOR PALETTE FOR THE CHARACTERS"
txt_palHintM = "PRESS MENU BUTTON TO SELECT A COLOR PALETTE FOR THE CHARACTERS"

function f_selectScreen()
--Draw Character Select Last Match Backgrounds
	if matchNo == lastMatch then
		animDraw(f_animVelocity(selectHardBG0, -1, -1)) --Draw Red BG for Final Battle
--Draw Character Select Normal Matchs Backgrounds
	else
		--Draw Black BG only for Tower Mode
		if data.gameMode == "tower" then
			animDraw(f_animVelocity(selectTowerBG0, -1, -1))
		--Draw Red BG for Special Modes
		elseif data.gameMode == "bossrush" or data.gameMode == "singleboss" or data.rosterMode == "suddendeath" or data.gameMode == "intermission" then
			animDraw(f_animVelocity(selectHardBG0, -1, -1))
		--Draw Blue BG for Normal Modes
		else
			animDraw(f_animVelocity(selectBG0, -1, -1))
		end
	end
	if not stageMenuActive then
		if data.p2Faces then
			animDraw(f_animVelocity(selectBG1a, -1, 0))
			animSetWindow(selectBG1a, 5, 0, 151, 239)
			animDraw(f_animVelocity(selectBG1b, -1, 0))
			animSetWindow(selectBG1b, 164, 0, 151, 239)
		else
			animDraw(f_animVelocity(selectBG1c, -1, 0))
			if data.selectType == "Fixed" then
				animSetWindow(selectBG1c, 85, 0, 151, 239)
			elseif data.selectType == "Variable" then
				animSetWindow(selectBG1c, -2, 0, 324, 239)
			end
		end
	end
	animDraw(f_animVelocity(selectBG2a, -1, 0))
	animDraw(f_animVelocity(selectBG2b, -3, 0))
	animDraw(f_animVelocity(selectBG2c, -6, 0))
	if not exclusiveStageMenu then
		textImgSetPos(txt_mainSelect, 159, 13)
		textImgDraw(txt_mainSelect)
	end
	if not stageMenuActive then
		drawFace(p1FaceX, p1FaceY, p1FaceOffset) --Draw Character Face Portrait
		p1charSlot = p1SelX + selectColumns*p1SelY+1 --Slot Location
		for i=0, selectColumns-1 do
			for j=0, selectRows-1 do
				animPosDraw(selectCell, p1FaceX+i*(27+2), p1FaceY+j*(27+2)) --Draw cell sprite for each selectColumns and selectRow
				if t_selChars[p1charSlot].unlock == 0 and not onlinegame then
					--animPosDraw(cellLock, p1FaceX+i*(27+3), p1FaceY+i*(27+1)) --Draw Lock Icon if the character is locked
				end
			end
		end
		--f_drawQuickText(txt_testVar, font3, 0, 0, t_selChars[p1charSlot].unlock, 163.5, 168)
		if data.p2Faces or not data.p1SelectMenu then
			drawFace(p2FaceX, p2FaceY, p2FaceOffset)
			for i=0, selectColumns-1 do
				for j=0, selectRows-1 do
					animPosDraw(selectCell, p2FaceX+i*(27+2), p2FaceY+j*(27+2))
				end
			end
		end
	end
	--Character Select Timer
	if data.gameMode == "arcade" or data.gameMode == "tower" or data.ftcontrol > 0 or data.attractMode == true then
		--txt_charTime = createTextImg(jgFnt, 0, 0, (selectTimer/gameTick), 160, 70) --Original Decimal Timer
		charTimeNumber = selectTimer/gameTick --Convert Ticks to Seconds
		nodecimalCharTime = string.format("%.0f",charTimeNumber) --Delete Decimals
		txt_charTime = createTextImg(jgFnt, 0, 0, nodecimalCharTime, 160, 70)
		if selectTimer > 0 then
			selectTimer = selectTimer - 0.5 --Activate Character Select Timer
			textImgDraw(txt_charTime)
		else --when selectTimer <= 0
			
		end
	end
	--Player1		
	if not p1TeamEnd then
		f_p1TeamMenu()
	elseif data.p1In > 0 or data.p1Char ~= nil then
		f_p1SelectMenu()
		if (data.p1In == 2 and data.p2In == 2) then
			--Draw VS Single Bosses Portraits if you are playing in Right Side
			if data.gameMode == "singleboss" then
				if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
					animDraw(f_animVelocity(charBG2, 2, 0))
					drawPortrait(data.t_p1selected[1].cel, 0, 20, 1, 1)
				end
				if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
					for j=#data.t_p1selected, 1, -1 do
						--f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimStand', 100, 158, data.t_p1selected[j].up) --Stand Animation
						f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 100, 158, data.t_p1selected[j].up) --Selected/Win Animation
					end
				end
				--Draw Author Info Text
				if data.charInfo == "Author" then
					if t_selChars[data.t_p1selected[1].cel+1].author ~= nil then
						textImgSetText(txt_p1Author, txt_authorText..t_selChars[data.t_p1selected[1].cel+1].author)
						textImgDraw(txt_p1Author)
					end
				end
			end
			--Draw VS Single Bonus Portraits
			if data.gameMode == "singlebonus" then
				if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
					animDraw(f_animVelocity(charBG2, 2, 0))
					drawPortrait(data.t_p1selected[1].cel, 0, 20, 1, 1)
				end
				--Draw Author Info Text
				if data.charInfo == "Author" then
					if t_selChars[data.t_p1selected[1].cel+1].author ~= nil then
						textImgSetText(txt_p1Author, txt_authorText..t_selChars[data.t_p1selected[1].cel+1].author)
						textImgDraw(txt_p1Author)
					end
				end
			end
		end
	end
	--Player2
	if not p2TeamEnd then
		f_p2TeamMenu()
	elseif data.p2In > 0 or data.p2Char ~= nil then
		f_p2SelectMenu()
		if (data.p1In ~= 2 and data.p2In ~= 2) then
			--Draw VS Single Bosses Portraits if you are playing in Left Side
			if data.gameMode == "singleboss" then
				if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
					animDraw(f_animVelocity(charBG3, 2, 0))
					drawPortrait(data.t_p2selected[1].cel, 320, 20, -1, 1)
				end
				if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
					for j=#data.t_p2selected, 1, -1 do
						--f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimStand', 220, 158, data.t_p2selected[j].up) --Stand Animation
						f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimWin', 220, 158, data.t_p2selected[j].up) --Selected/Win Animation
					end
				end
				--Draw Author Info Text
				if data.charInfo == "Author" then
					if t_selChars[data.t_p2selected[1].cel+1].author ~= nil then
						textImgSetText(txt_p2Author, txt_authorText..t_selChars[data.t_p2selected[1].cel+1].author)
						textImgDraw(txt_p2Author)
					end
				end
			end
			--Draw VS Single Bonus Portraits
			if data.gameMode == "singlebonus" then
				if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
					animDraw(f_animVelocity(charBG3, 2, 0))
					drawPortrait(data.t_p2selected[1].cel, 320, 20, -1, 1)
				end
				--Draw Author Info Text
				if data.charInfo == "Author" then
					if t_selChars[data.t_p2selected[1].cel+1].author ~= nil then
						textImgSetText(txt_p2Author, txt_authorText..t_selChars[data.t_p2selected[1].cel+1].author)
						textImgDraw(txt_p2Author)
					end
				end
			end
		end
	end
	--Win Count
	if data.gameMode == "versus" and data.vsDisplayWin == true then
		textImgSetText(txt_p1Wins, "WINS: " .. p1Wins)
		textImgSetText(txt_p2Wins, "WINS: " .. p2Wins)
		textImgDraw(txt_p1Wins)
		textImgDraw(txt_p2Wins)
	end
	--Draw Palette Select Hint
	if data.palType == "Classic" then
		textImgSetText(txt_palHint, txt_palHintC)
	elseif data.palType == "Modern" then
		textImgSetText(txt_palHint, txt_palHintM)
	end
	if p1TeamEnd or p2TeamEnd then
		if (p1PalEnd and p2PalEnd) and not stageMenuActive then
			textImgDraw(txt_palHint)
		end
	end
	--Palette Select
	if data.palType == "Modern" then
		--Player1
		if not p1PalEnd then
			f_p1palList()
		end
		--Player2
		if not p2PalEnd then
			f_p2palList()
		end
	end
	--Stage select
	if p1SelEnd and p2SelEnd then
		charSelect = false
		selectTimer = 0 --Disappear Char Select Timer to don't disturb Stage Timer
		if not stageEnd then
			f_selectStage()
		else
			stageMenuActive = false
			exclusiveStageMenu = false
			selScreenEnd = true
		end
	end
	--Activate Stage Announcer Timer
	if stageAnnouncer == true then
		announcerTimer = announcerTimer + 1
	end
	--Deselect Character for Left Side
	if data.coop then
		if commandGetState(p1Cmd, 'e') and p1SelEnd then
			sndPlay(sysSnd, 100, 2)
			p1SelEnd = false
			data.t_p1selected = {}
			p1memberPreview = 1
			f_p1randomReset()
		end
	else
		--[[
		if commandGetState(p1Cmd, 'e') and p1SelEnd and charSelect == true then
			sndPlay(sysSnd, 100, 2)
			p1SelEnd = false
			data.t_p1selected = {}
			p1memberPreview = 1
			f_p1randomReset()
			if data.p2In == 1 then
				p2TeamEnd = true
				p2SelEnd = true
				p2Portrait = nil
				p2memberPreview = 1
				f_p2randomReset()
			end
		end
		]]
	end
	--Deselect Character for Right Side
	if data.p2In == 2 then
		if data.coop then
			if commandGetState(p2Cmd, 'e') and p2SelEnd then
				sndPlay(sysSnd, 100, 2)
				--if data.p2In == 2 then
					p2SelEnd = false
				--end
				data.t_p2selected = {}
				--p2memberPreview = 1
				f_p2randomReset()
				p2coopReady = false
			end
		else
			--[[
			if commandGetState(p2Cmd, 'e') and p2SelEnd and charSelect == true then 
				sndPlay(sysSnd, 100, 2)
				--if data.p2In == 2 then
					p2SelEnd = false
				--end
				data.t_p2selected = {}
				p2memberPreview = 1
				f_p2randomReset()
			end
			]]
		end
	end
	--Show Back Menu
	if backScreen == true then
		if onlinegame == false then
			f_backMenu()
		elseif onlinegame == true then
			f_exitOnline()
		end
	end
	animDraw(data.fadeSelect)
	animUpdate(data.fadeSelect)
	animDraw(data.fadeTitle)
	animUpdate(data.fadeTitle)
	cmdInput()
	refresh()
end

--;===========================================================
--; PLAYER 1 TEAM SELECT SCREENPACK
--;===========================================================
--P1 Team cursor
p1TmCursor = animNew(sysSff, [[
180,0, 0,0, -1
]])

--P1 Team icon
p1TmIcon = animNew(sysSff, [[
181,0, 0,0, -1
]])

--P1 Empty Team (icon 1)
p1EmptyIcon = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon, 81, 66)
animUpdate(p1EmptyIcon)

--P1 Empty Team (icon 2)
p1EmptyIcon2 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon2, 87, 66)
animUpdate(p1EmptyIcon2)

--P1 Empty Team (icon 3)
p1EmptyIcon3 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon3, 93, 66)
animUpdate(p1EmptyIcon3)

--P1 Empty Team (icon 4)
p1EmptyIcon4 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon4, 99, 66)
animUpdate(p1EmptyIcon4)

--P1 Empty Turns (icon 1)
p1EmptyIcon5 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon5, 81, 81)
animUpdate(p1EmptyIcon5)

--P1 Empty Turns (icon 2)
p1EmptyIcon6 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon6, 87, 81)
animUpdate(p1EmptyIcon6)

--P1 Empty Turns (icon 3)
p1EmptyIcon7 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon7, 93, 81)
animUpdate(p1EmptyIcon7)

--P1 Empty Turns (icon 4)
p1EmptyIcon8 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon8, 99, 81)
animUpdate(p1EmptyIcon8)

--;===========================================================
--; PLAYER 1 TEAM SELECT
--;===========================================================
p1SelTmTxt = createTextImg(jgFnt, 5, 1, "TEAM MODE", 20, 30)
IASelTmTxt = createTextImg(jgFnt, 5, 1, "CPU MODE", 20, 30)

t_p1selTeam = {
	{id = '', text = "SINGLE"},
	{id = '', text = "SIMUL"},
	{id = '', text = "TURNS"},
}
for i=1, #t_p1selTeam do
	t_p1selTeam[i].id = createTextImg(jgFnt, 0, 1, t_p1selTeam[i].text, 20, 35+i*15)
end

function f_p1TeamMenu()
	if data.coop then --Simul coop
		p1teamMode = 1
		p1numChars = 2
		setTeamMode(1, p1teamMode, p1numChars)
		p1TeamEnd = true
		p1BG = true
		p1memberPreview = 1
	elseif data.p1TeamMenu ~= nil then
		p1numChars = data.p1TeamMenu.chars
		p1teamMode = data.p1TeamMenu.mode
		setTeamMode(1, p1teamMode, p1numChars)
		p1TeamEnd = true
		p1BG = true
		p1memberPreview = 1
	else
		--Back logic when you are selecting CPU Team Mode in CPU Vs Human
		if commandGetState(p2Cmd, 'e') and (data.p1In == 2 and data.p2In == 2) then --p2Cmd because human is in right side
			if p1TeamBack == true then
				if (data.p1In == 2 and data.p2In == 2) then
					sndPlay(sysSnd, 100, 2)
					f_p1sideReset()
					p1TeamEnd = true
					p1SelEnd = true
					f_p2sideReset()
					p2TeamEnd = true
					p2BG = true
					p2memberPreview = 1
					p2SelBack = true
					p2TeamBack = false
				end
			end
		end
		if backScreen == false then
			if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufTmu >= 30) then
				sndPlay(sysSnd, 100, 0)
				p1teamMode = p1teamMode - 1
				if p1teamMode < 0 then p1teamMode = #t_p1selTeam-1 end
				if bufTml then bufTml = 0 end
				if bufTmr then bufTmr = 0 end
			elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufTmd >= 30) then
				sndPlay(sysSnd, 100, 0)
				p1teamMode = p1teamMode + 1
				if p1teamMode > #t_p1selTeam-1 then p1teamMode = 0 end
				if bufTml then bufTml = 0 end
				if bufTmr then bufTmr = 0 end
			elseif p1teamMode == 1 then --Simul
				if commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufTml >= 30) then
					if commandGetState(p1Cmd, 'l') and p1numSimul > 2 then sndPlay(sysSnd, 100, 0) end
					p1numSimul = p1numSimul - 1
					if p1numSimul < 2 then p1numSimul = 2 end
					if bufTmu then bufTmu = 0 end
					if bufTmd then bufTmd = 0 end
				elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufTmr >= 30) then
					if commandGetState(p1Cmd, 'r') and p1numSimul < data.numSimul then sndPlay(sysSnd, 100, 0) end
					p1numSimul = p1numSimul + 1
					if p1numSimul > data.numSimul then p1numSimul = data.numSimul end
					if bufTmu then bufTmu = 0 end
					if bufTmd then bufTmd = 0 end
				end
				if commandGetState(p1Cmd, 'holdr') then
					bufTml = 0
					bufTmr = bufTmr + 1
				elseif commandGetState(p1Cmd, 'holdl') then
					bufTmr = 0
					bufTml = bufTml + 1
				else
					bufTmr = 0
					bufTml = 0
				end
			elseif p1teamMode == 2 then --Turns
				if commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufTml >= 30) then
					if commandGetState(p1Cmd, 'l') and p1numTurns > 2 then sndPlay(sysSnd, 100, 0) end
					p1numTurns = p1numTurns - 1
					if p1numTurns < 2 then p1numTurns = 2 end
					if bufTmu then bufTmu = 0 end
					if bufTmd then bufTmd = 0 end
				elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufTmr >= 30) then
					if commandGetState(p1Cmd, 'r') and p1numTurns < data.numTurns then sndPlay(sysSnd, 100, 0) end
					p1numTurns = p1numTurns + 1
					if p1numTurns > data.numTurns then p1numTurns = data.numTurns end
					if bufTmu then bufTmu = 0 end
					if bufTmd then bufTmd = 0 end
				end
				if commandGetState(p1Cmd, 'holdr') then
					bufTml = 0
					bufTmr = bufTmr + 1
				elseif commandGetState(p1Cmd, 'holdl') then
					bufTmr = 0
					bufTml = bufTml + 1
				else
					bufTmr = 0
					bufTml = 0
				end
			end
			if commandGetState(p1Cmd, 'holdu') then
				bufTmd = 0
				bufTmu = bufTmu + 1
			elseif commandGetState(p1Cmd, 'holdd') then
				bufTmu = 0
				bufTmd = bufTmd + 1
			else
				bufTmu = 0
				bufTmd = 0
			end
		end
		if data.p1In == 2 then
			textImgDraw(IASelTmTxt)
		elseif data.rosterMode == "cpu" then
			textImgDraw(IASelTmTxt)
		else
			textImgDraw(p1SelTmTxt)
		end
		for i=1, #t_p1selTeam do
			if i == p1teamMode + 1 then
				textImgSetBank(t_p1selTeam[i].id, 3)
			else
				textImgSetBank(t_p1selTeam[i].id, 0)
			end
			textImgDraw(t_p1selTeam[i].id)
		end
		--Only appears until you select a team mode
		animUpdate(p1TmIcon)
		animDraw(p1EmptyIcon)
	    animUpdate(p1EmptyIcon)
	    animDraw(p1EmptyIcon2)
		animUpdate(p1EmptyIcon2)
		animDraw(p1EmptyIcon3)
		animUpdate(p1EmptyIcon3)
		animDraw(p1EmptyIcon4)
		animUpdate(p1EmptyIcon4)
		animDraw(p1EmptyIcon5)
		animUpdate(p1EmptyIcon5)
		animDraw(p1EmptyIcon6)
		animUpdate(p1EmptyIcon6)
		animDraw(p1EmptyIcon7)
		animUpdate(p1EmptyIcon7)
		animDraw(p1EmptyIcon8)
		animUpdate(p1EmptyIcon8)
		for i=1, p1numSimul do
			animPosDraw(p1TmIcon, 74 + i*6, 66)
		end
		for i=1, p1numTurns do
			animPosDraw(p1TmIcon, 74 + i*6, 81)
		end
		animUpdate(p1TmCursor)
		animPosDraw(p1TmCursor, 10, 50 + p1teamMode*15)
		if btnPalNo(p1Cmd) > 0 or selectTimer == 0 then
			sndPlay(sysSnd, 100, 1)
			if p1teamMode == 0 then --Single
				p1numChars = 1
			elseif p1teamMode == 1 then --Simul
				p1numChars = p1numSimul
			elseif p1teamMode == 2 then --Turns
				p1numChars = p1numTurns
			end
			setTeamMode(1, p1teamMode, p1numChars)
			p1TeamEnd = true
			p1BG = true
			p1memberPreview = 1
			p1SelBack = true
			p1TeamBack = false
			cmdInput()
		end
	end
end

--;===========================================================
--; PLAYER 1 PALETTE SELECT
--;===========================================================
txt_palText = "PALETTE:"
txt_p1Pal = createTextImg(jgFnt, 5, 1, txt_palText, 5, 237)
txt_p1PalNo = createTextImg(font14, 0, 0, "", 95, 237) --draw palette limit numbers text
	
--Left Arrow for Player 1 Palette Select
arrowsPL = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(arrowsPL, 67, 228.5)
animUpdate(arrowsPL)
animSetScale(arrowsPL, 0.45, 0.45)

--Right Arrow for Player 1 Palette Select
arrowsPR = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(arrowsPR, 115, 228.5)
animUpdate(arrowsPR)
animSetScale(arrowsPR, 0.45, 0.45)

function f_p1palList()
	cmdInput()
	if (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufPalu >= 30) or (commandGetState(p1Cmd, 'holdr') and bufPalr >= 30)) and p1movePal <= 11 then --p1movePal <= Number of your Palette List Limit
		sndPlay(sysSnd, 100, 0)
		p1movePal = p1movePal + 1
	elseif (commandGetState(p1Cmd, 'l') or commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufPald >= 30) or (commandGetState(p1Cmd, 'holdl') and bufPall >= 30)) and p1movePal > 1 then --Keep in palette 1 when press left until finish
		sndPlay(sysSnd, 100, 0)
		p1movePal = p1movePal - 1
	end
	if commandGetState(p1Cmd, 'holdu') then
		bufPald = 0
		bufPalu = bufPalu + 1
	elseif commandGetState(p1Cmd, 'holdd') then
		bufPalu = 0
		bufPald = bufPald + 1
	elseif commandGetState(p1Cmd, 'holdr') then
		bufPall = 0
		bufPalr = bufPalr + 1
	elseif commandGetState(p1Cmd, 'holdl') then
		bufPalr = 0
		bufPall = bufPall + 1
	else
		bufPalu = 0
		bufPald = 0
		bufPalr = 0
		bufPall = 0
	end
	p1palSelect = p1movePal --Uses menu position to show palette in these order
	textImgDraw(txt_p1Pal)
	textImgSetText(txt_p1PalNo, p1palSelect.."/12")
	textImgDraw(txt_p1PalNo)
	if p1movePal > 1 then
		animDraw(arrowsPL)
		animUpdate(arrowsPL)
	end
	if p1movePal <= 11 then
		animDraw(arrowsPR)
		animUpdate(arrowsPR)
	end
	if btnPalNo(p1Cmd) > 0 then
		sndPlay(sysSnd, 100, 1)
		p1PalEnd = true
		cmdInput()
	elseif commandGetState(p1Cmd, 'e') or selectTimer == 0 then
		p1PalEnd = true
	end
end

--;===========================================================
--; PLAYER 1 CHARACTER SELECT
--;===========================================================
txt_p1Name = createTextImg(jgFnt, 4, 1, "", 0, 0, 0.8, 0.8)
txt_p1Author = createTextImg(jgFnt, 0, 1, "", 0, 20, 0.65, 0.65)
txt_authorText = "AUTHOR: "

--P1 Random Portrait
p1randomPortrait = animNew(sysSff, [[151,1, 0,0,]])

--P1 Random Sprite
p1randomSprite = animNew(sysSff, [[151,2, 0,0,]])

--P1 Big Portrait Lock
p1portraitLock = animNew(sysSff, [[108,0, 0,0,]])

--P1 Big Portrait Locked Fade Window
p1portraitLockWindowBG = animNew(sysSff, [[3,0, 0,0, -1, 0]])

function f_p1charAnnouncer()
	if f_getName(p1Cell) == "Kung Fu Man" then
		sndPlay(announcerSnd, 1, 0)
	--elseif f_getName(p1Cell) == "Your Character Name" then
		--sndPlay(announcerSnd, 1, 1)
	end
end

function f_p1SelectMenu()
	if data.p1Char ~= nil then
		local t = {}
		for i=1, #data.p1Char do
			local updateAnim = false
			if t[data.p1Char[i]] == nil then
				updateAnim = true
				t[data.p1Char[i]] = ''
			end
			if data.p1Pal ~= nil then --Set Manual Palette
				data.t_p1selected[i] = {['cel'] = data.p1Char[i], ['pal'] = data.p1Pal, ['up'] = updateAnim, ['name'] = t_selChars[data.p1Char[i]+1].name, ['displayname'] = t_selChars[data.p1Char[i]+1].displayname, ['path'] = t_selChars[data.p1Char[i]+1].char, ['author'] = t_selChars[data.p1Char[i]+1].author}
			else
				data.t_p1selected[i] = {['cel'] = data.p1Char[i], ['pal'] = math.random(1,12), ['up'] = updateAnim, ['name'] = t_selChars[data.p1Char[i]+1].name, ['displayname'] = t_selChars[data.p1Char[i]+1].displayname, ['path'] = t_selChars[data.p1Char[i]+1].char, ['author'] = t_selChars[data.p1Char[i]+1].author}
			end
			if data.debugLog then f_printTable(data.t_p1selected, "save/debug/data.t_p1selected.txt") end
		end
		p1Portrait = data.p1Char[1]
		--local numChars = p1numChars
		--if data.coop then numChars = 1 end
		p1SelEnd = true
	elseif not data.p1SelectMenu then
		if data.gameMode == "challenger" then
			data.t_p1selected = t_p1selectedTemp --Get previous arcade selected characters
			if data.debugLog then f_printTable(data.t_p1selected, "save/debug/data.t_p1selected.txt") end
		end
		p1SelEnd = true
	else
		if not exclusiveStageMenu then
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				if p1BG == true then animDraw(f_animVelocity(charBG2, -2, 0)) end --Draw P1 Portrait BG
			end
		end
		local numChars = p1numChars
		local alphaS = 200
		if data.coop then numChars = 1 end
		if p1Cell then
		--Waiting Selection
			if numChars ~= #data.t_p1selected then
				local updateAnim = true
				for i=1, #data.t_p1selected do
					if data.t_p1selected[i].cel == p1Cell then 
						updateAnim = false
					end
				end
			--Cursor in Random Select Slot
				if getCharName(p1Cell) == "Random" then
					--sndPlay(sysSnd, 100, 0) --Play Cursor SFX...
				--DRAW RANDOM PORTRAITS
					if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						--drawPortrait(t_randomChars[math.random(#t_randomChars)], 0+60*(#data.t_p1selected-1), 20, 1, 1) --Draw P1 RANDOM PREVIEW Portrait with automatic X position for all members (instead of use p1numChars logic)
					--SINGLE MODE
						if p1numChars == 1 then
							if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
								f_drawQuickSpr(p1randomPortrait, 0, 20)
							elseif data.randomPortrait == "Roulette" then --Draw P1 RANDOM PREVIEW Portrait (showing all characters loaded)
								drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 20, 1, 1)
							end
					--TEAM MODE WITH 2 MEMBERS
						elseif p1numChars == 2 then
						--Draw P1 Member 1 RANDOM PREVIEW Portrait
							if p1memberPreview == 1 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									if data.charPresentation == "Portrait" then
										f_drawQuickSpr(p1randomPortrait, 0, 20, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										f_drawQuickSpr(p1randomPortrait, 0, 20, 0.5, 0.5)
									end
								elseif data.randomPortrait == "Roulette" then
									if data.charPresentation == "Portrait" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 20, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 20, 0.5, 0.5)
									end
								end
							end
						--Draw P1 Member 2 RANDOM PREVIEW Portrait
							if p1memberPreview == 2 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									if data.charPresentation == "Portrait" then
										f_drawQuickSpr(p1randomPortrait, 0, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										f_drawQuickSpr(p1randomPortrait, 0, 90, 0.5, 0.5)
									end
								elseif data.randomPortrait == "Roulette" then
									if data.charPresentation == "Portrait" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 90, 0.5, 0.5)
									end
								end
							end
					--TEAM MODE WITH 3 MEMBERS
						elseif p1numChars == 3 then
						--Draw P1 Member 1 RANDOM PREVIEW Portrait
							if p1memberPreview == 1 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									if data.charPresentation == "Portrait" then
										f_drawQuickSpr(p1randomPortrait, 0, 20, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										f_drawQuickSpr(p1randomPortrait, 30, 20, 0.5, 0.5)
									end
								elseif data.randomPortrait == "Roulette" then
									if data.charPresentation == "Portrait" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 20, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 30, 20, 0.5, 0.5)
									end
								end
							end
						--Draw P1 Member 2 RANDOM PREVIEW Portrait
							if p1memberPreview == 2 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomPortrait, 0, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 90, 0.5, 0.5)
								end
							end
						--Draw P1 Member 3 RANDOM PREVIEW Portrait
							if p1memberPreview == 3 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomPortrait, 60, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 60, 90, 0.5, 0.5)
								end
							end
					--TEAM MODE WITH 4 MEMBERS
						elseif p1numChars == 4 then
						--Draw P1 Member 1 RANDOM PREVIEW Portrait
							if p1memberPreview == 1 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomPortrait, 0, 20, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 20, 0.5, 0.5)
								end
							end
						--Draw P1 Member 2 RANDOM PREVIEW Portrait
							if p1memberPreview == 2 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomPortrait, 60, 20, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 60, 20, 0.5, 0.5)
								end
							end
						--Draw P1 Member 3 RANDOM PREVIEW Portrait
							if p1memberPreview == 3 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomPortrait, 0, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 90, 0.5, 0.5)
								end
							end
						--Draw P1 Member 4 RANDOM PREVIEW Portrait
							if p1memberPreview == 4 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomPortrait, 60, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 60, 90, 0.5, 0.5)
								end
							end
					--TEAM MODE WITH MORE THAN 4 MEMBERS (UNUSED)
						--[[
						else
							if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
								f_drawQuickSpr(p1randomPortrait, 125, 16, 0.5, 0.5)
							elseif data.randomPortrait == "Roulette" then
								drawPortrait(t_randomChars[math.random(#t_randomChars)], 125, 16, 0.5, 0.5) --Draw RANDOM portrait preview out of BG Position
							end
						]]
						end
					end
				--DRAW RANDOM SPRITE ANIMATIONS
					if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
						if data.charPresentation == "Sprite" then
							if data.coop then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomSprite, 20, 75)
								elseif data.randomPortrait == "Roulette" then
									f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 40, 164, true)
								end
							else
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p1randomSprite, 20 + 28*#data.t_p1selected, 75)
								elseif data.randomPortrait == "Roulette" then
									--Draw P1 RANDOM PREVIEW stand animation with automatic X position for all members (instead of use p1numChars logic)
									f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 40 + 28*#data.t_p1selected, 164, true)
								end
							end
						elseif data.charPresentation == "Mixed" then
							if data.randomPortrait == "Roulette" then
							--SINGLE MODE
								if p1numChars == 1 then
									f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 30, 158, true) --Draw P1 RANDOM PREVIEW stand anim (true means that always will be in a loop updateAnim)
							--TEAM MODE WITH 2 MEMBERS
								elseif p1numChars == 2 then
									if p1memberPreview == 1 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 90, 90, true, 0.5, 0.5) end --0.5,0.5 is the animation scale
									if p1memberPreview == 2 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 90, 158, true, 0.5, 0.5) end --Draw P1 Member 2 RANDOM PREVIEW Stand Anim
							--TEAM MODE WITH 3 MEMBERS
								elseif p1numChars == 3 then
									if p1memberPreview == 1 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 40, 89, true, 0.5, 0.5) end --Draw P1 Member 1 RANDOM PREVIEW Stand Anim
									if p1memberPreview == 2 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 10, 158, true, 0.5, 0.5) end --Draw P1 Member 2 RANDOM PREVIEW Stand Anim
									if p1memberPreview == 3 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 70, 158, true, 0.5, 0.5) end --Draw P1 Member 3 RANDOM PREVIEW Stand Anim
							--TEAM MODE WITH 4 MEMBERS
								elseif p1numChars == 4 then
									if p1memberPreview == 1 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 10, 89, true, 0.5, 0.5) end --Draw P1 Member 1 RANDOM PREVIEW Stand Anim
									if p1memberPreview == 2 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 70, 89, true, 0.5, 0.5) end --Draw P1 Member 2 RANDOM PREVIEW Stand Anim
									if p1memberPreview == 3 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 10, 158, true, 0.5, 0.5) end --Draw P1 Member 3 RANDOM PREVIEW Stand Anim
									if p1memberPreview == 4 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 70, 158, true, 0.5, 0.5) end --Draw P1 Member 4 RANDOM PREVIEW Stand Anim
							--TEAM MODE WITH MORE THAN 4 MEMBERS (UNUSED)
								--else
									--f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 132, 85, true, 0.5, 0.5) --Draw RANDOM Stand Animation preview out of BG Position
								end
							end
						end
					end
			--Cursor in Character Slot
				else
				--DRAW PORTRAITS
					if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						if p1Portrait then --To avoid issues when draw Portrait after continue/service screen
							--drawPortrait(p1Portrait, 0+60*(#data.t_p1selected-1), 20, 1, 1) --Draw P1 PREVIEW Portrait with automatic X position for all members (instead of use p1numChars logic)
						--SINGLE MODE
							if p1numChars == 1 then
								drawPortrait(p1Portrait, 0, 20, 1, 1) --Draw P1 Member 1 PREVIEW Portrait
						--TEAM MODE WITH 2 MEMBERS
							elseif p1numChars == 2 then
							--Draw P1 Member 1 PREVIEW Portrait
								if p1memberPreview == 1 then
									if data.charPresentation == "Portrait" then
										drawPortrait(p1Portrait, 0, 20, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(p1Portrait, 0, 20, 0.5, 0.5)
									end
								end
							--Draw P1 Member 2 PREVIEW Portrait
								if p1memberPreview == 2 then
									if data.charPresentation == "Portrait" then
										drawPortrait(p1Portrait, 0, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(p1Portrait, 0, 90, 0.5, 0.5)
									end
								end
						--TEAM MODE WITH 3 MEMBERS
							elseif p1numChars == 3 then
							--Draw P1 Member 1 PREVIEW Portrait
								if p1memberPreview == 1 then
									if data.charPresentation == "Portrait" then
										drawPortrait(p1Portrait, 0, 20, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(p1Portrait, 30, 20, 0.5, 0.5)
									end
								end
								if p1memberPreview == 2 then drawPortrait(p1Portrait, 0, 90, 0.5, 0.5) end --Draw P1 Member 2 PREVIEW Portrait
								if p1memberPreview == 3 then drawPortrait(p1Portrait, 60, 90, 0.5, 0.5) end --Draw P1 Member 3 PREVIEW Portrait
						--TEAM MODE WITH 4 MEMBERS
							elseif p1numChars == 4 then
								if p1memberPreview == 1 then drawPortrait(p1Portrait, 0, 20, 0.5, 0.5) end --Draw P1 Member 1 PREVIEW Portrait
								if p1memberPreview == 2 then drawPortrait(p1Portrait, 60, 20, 0.5, 0.5) end --Draw P1 Member 2 PREVIEW Portrait
								if p1memberPreview == 3 then drawPortrait(p1Portrait, 0, 90, 0.5, 0.5) end --Draw P1 Member 3 PREVIEW Portrait
								if p1memberPreview == 4 then drawPortrait(p1Portrait, 60, 90, 0.5, 0.5) end --Draw P1 Member 4 PREVIEW Portrait
						--TEAM MODE WITH MORE THAN 4 MEMBERS (UNUSED)
							--else
								--drawPortrait(p1Portrait, 125, 16, 0.5, 0.5) --Draw portrait preview out of BG Position
							end
						end
					end
				--DRAW SPRITE ANIMATIONS
					if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
						if data.charPresentation == "Sprite" then
							if data.coop then
								f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 40, 164, true)
							else
								--Draw P1 Member 1 PREVIEW Stand Animation with automatic X position for all members (instead of use p1numChars logic)
								f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 40 + 28*#data.t_p1selected, 164, true)
							end
						elseif data.charPresentation == "Mixed" then
						--SINGLE MODE
							if p1numChars == 1 then
								f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 30, 158, true, 1, 1) --Draw P1 Member 1 PREVIEW Stand Anim
						--TEAM MODE WITH 2 MEMBERS
							elseif p1numChars == 2 then
								if p1memberPreview == 1 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 90, 90, true, 0.5, 0.5) end --Draw P1 Member 1 PREVIEW Stand Anim
								if p1memberPreview == 2 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 90, 158, true, 0.5, 0.5) end --Draw P1 Member 2 PREVIEW Stand Anim
						--TEAM MODE WITH 3 MEMBERS
							elseif p1numChars == 3 then
								if p1memberPreview == 1 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 40, 89, true, 0.5, 0.5) end --Draw P1 Member 1 PREVIEW Stand Anim
								if p1memberPreview == 2 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 10, 158, true, 0.5, 0.5) end --Draw P1 Member 2 PREVIEW Stand Anim
								if p1memberPreview == 3 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 70, 158, true, 0.5, 0.5) end --Draw P1 Member 3 PREVIEW Stand Anim
						--TEAM MODE WITH 4 MEMBERS
							elseif p1numChars == 4 then
								if p1memberPreview == 1 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 10, 89, true, 0.5, 0.5) end --Draw P1 Member 1 PREVIEW Stand Anim
								if p1memberPreview == 2 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 70, 89, true, 0.5, 0.5) end --Draw P1 Member 2 PREVIEW Stand Anim
								if p1memberPreview == 3 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 10, 158, true, 0.5, 0.5) end --Draw P1 Member 3 PREVIEW Stand Anim
								if p1memberPreview == 4 then f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 70, 158, true, 0.5, 0.5) end --Draw P1 Member 4 PREVIEW Stand Anim
						--TEAM MODE WITH MORE THAN 4 MEMBERS (UNUSED)
							--else
								--f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 132, 85, true, 0.5, 0.5) --Draw Stand Animation preview out of BG Position
							end
						end
					end
				--DRAW LOCKED CHAR STUFF
					if t_selChars[p1Cell+1].unlock == 0 and not onlinegame then --If the character is locked draw special stuff
						if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						--SINGLE MODE
							if p1numChars == 1 then
								f_drawQuickSpr(p1portraitLockWindowBG, 0, 20, 120, 140, 256, 102)
								f_drawQuickSpr(p1portraitLock, 24.5, 50, 0.20, 0.20)
						--TEAM MODE WITH 2 MEMBERS
							elseif p1numChars == 2 then
								if p1memberPreview == 1 then
									f_drawQuickSpr(p1portraitLockWindowBG, 0, 20, 120, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 42, 36, 0.10, 0.10)
								elseif p1memberPreview == 2 then
									f_drawQuickSpr(p1portraitLockWindowBG, 0, 90, 120, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 42, 106, 0.10, 0.10)
								end
						--TEAM MODE WITH 3 MEMBERS
							elseif p1numChars == 3 then
								if p1memberPreview == 1 then
									f_drawQuickSpr(p1portraitLockWindowBG, 0, 20, 120, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 42, 36, 0.10, 0.10)
								elseif p1memberPreview == 2 then
									f_drawQuickSpr(p1portraitLockWindowBG, 0, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 12, 106, 0.10, 0.10)
								elseif p1memberPreview == 3 then
									f_drawQuickSpr(p1portraitLockWindowBG, 60, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 72, 106, 0.10, 0.10)
								end
						--TEAM MODE WITH 4 MEMBERS
							elseif p1numChars == 4 then
								if p1memberPreview == 1 then
									f_drawQuickSpr(p1portraitLockWindowBG, 0, 20, 60, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 12, 36, 0.10, 0.10)
								elseif p1memberPreview == 2 then
									f_drawQuickSpr(p1portraitLockWindowBG, 60, 20, 60, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 72, 36, 0.10, 0.10)
								elseif p1memberPreview == 3 then
									f_drawQuickSpr(p1portraitLockWindowBG, 0, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 12, 106, 0.10, 0.10)
								elseif p1memberPreview == 4 then
									f_drawQuickSpr(p1portraitLockWindowBG, 60, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 72, 106, 0.10, 0.10)
								end
							end
						elseif data.charPresentation == "Sprite" then
							f_drawQuickSpr(p1portraitLock, 20 + 28*#data.t_p1selected, 75, 0.15, 0.15)
						end
					end
				end
			end
		--When a Character is Selected
			for j=#data.t_p1selected, 1, -1 do
			--DRAW PORTRAITS
				if not exclusiveStageMenu then
					if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						--drawPortrait(data.t_p1selected[j].cel, 0+60*(j-1), 20, 1, 1) --Draw P1 SELECTED Portrait with automatic X position for all members (instead of use p1numChars logic)
					--SINGLE MODE
						if p1numChars == 1 then
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								f_drawQuickSpr(p1randomPortrait, 0, 20)
							else
								drawPortrait(data.t_p1selected[1].cel, 0, 20, 1, 1)
							end
					--TEAM MODE WITH 2 MEMBERS
						elseif p1numChars == 2 then
						--Draw P1 Member 2 SELECTED Portrait
							if j == 2 then
								if data.randomPortrait == "Fixed" and p1member2Random == true then
									if data.charPresentation == "Portrait" then
										f_drawQuickSpr(p1randomPortrait, 0, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										f_drawQuickSpr(p1randomPortrait, 0, 90, 0.5, 0.5)
									end
								else
									if data.charPresentation == "Portrait" then
										drawPortrait(data.t_p1selected[2].cel, 0, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(data.t_p1selected[2].cel, 0, 90, 0.5, 0.5)
									end
								end
							end
							--remember that lastest draw have priority on screen
						--Draw P1 Member 1 SELECTED Portrait
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								if data.charPresentation == "Portrait" then
									f_drawQuickSpr(p1randomPortrait, 0, 20, 1, 0.5)
								elseif data.charPresentation == "Mixed" then
									f_drawQuickSpr(p1randomPortrait, 0, 20, 0.5, 0.5)
								end
							else
								if data.charPresentation == "Portrait" then
									drawPortrait(data.t_p1selected[1].cel, 0, 20, 1, 0.5)
								elseif data.charPresentation == "Mixed" then
									drawPortrait(data.t_p1selected[1].cel, 0, 20, 0.5, 0.5)
								end
							end
					--TEAM MODE WITH 3 MEMBERS
						elseif p1numChars == 3 then
						--Draw P1 Member 3 SELECTED Portrait
							if j == 3 then
								if data.randomPortrait == "Fixed" and p1member3Random == true then
									f_drawQuickSpr(p1randomPortrait, 60, 90, 0.5, 0.5)
								else
									drawPortrait(data.t_p1selected[3].cel, 60, 90, 0.5, 0.5)
								end
							end
						--Draw P1 Member 2 SELECTED Portrait
							if j == 2 then
								if data.randomPortrait == "Fixed" and p1member2Random == true then
									f_drawQuickSpr(p1randomPortrait, 0, 90, 0.5, 0.5)
								else
									drawPortrait(data.t_p1selected[2].cel, 0, 90, 0.5, 0.5)
								end
							end
						--Draw P1 Member 1 SELECTED Portrait
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								if data.charPresentation == "Portrait" then
									f_drawQuickSpr(p1randomPortrait, 0, 20, 1, 0.5)
								elseif data.charPresentation == "Mixed" then
									f_drawQuickSpr(p1randomPortrait, 30, 20, 0.5, 0.5)
								end
							else
								if data.charPresentation == "Portrait" then
									drawPortrait(data.t_p1selected[1].cel, 0, 20, 1, 0.5)
								elseif data.charPresentation == "Mixed" then
									drawPortrait(data.t_p1selected[1].cel, 30, 20, 0.5, 0.5)
								end
							end
					--TEAM MODE WITH 4 MEMBERS
						elseif p1numChars == 4 then
						--Draw P1 Member 4 SELECTED Portrait
							if j == 4 then
								if data.randomPortrait == "Fixed" and p1member4Random == true then
									f_drawQuickSpr(p1randomPortrait, 60, 90, 0.5, 0.5)
								else
									drawPortrait(data.t_p1selected[4].cel, 60, 90, 0.5, 0.5)
								end
							end
						--Draw P1 Member 3 SELECTED Portrait
							if j == 3 then
								if data.randomPortrait == "Fixed" and p1member3Random == true then
									f_drawQuickSpr(p1randomPortrait, 0, 90, 0.5, 0.5)
								else
									drawPortrait(data.t_p1selected[3].cel, 0, 90, 0.5, 0.5)
								end
							end
						--Draw P1 Member 2 SELECTED Portrait
							if j == 2 then
								if data.randomPortrait == "Fixed" and p1member2Random == true then
									f_drawQuickSpr(p1randomPortrait, 60, 20, 0.5, 0.5)
								else
									drawPortrait(data.t_p1selected[2].cel, 60, 20, 0.5, 0.5)
								end
							end
						--Draw P1 Member 1 SELECTED Portrait
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								f_drawQuickSpr(p1randomPortrait, 0, 20, 0.5, 0.5)
							else
								drawPortrait(data.t_p1selected[1].cel, 0, 20, 0.5, 0.5)
							end
						end
					end
				--DRAW SPRITE ANIMATIONS
					if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
						if data.charPresentation == "Sprite" then
							if data.coop then
								f_drawCharAnim(t_selChars[data.t_p1selected[1].cel+1], 'p1AnimWin', 40, 164, data.t_p1selected[1].up, 1, 1, alphaS) --200 is the alphas value
							else
							--Draw P1 Member 4 SELECTED Animation
								if j == 4 then
									if data.randomPortrait == "Fixed" and p1member4Random == true then
										f_drawQuickSpr(p1randomSprite, 104, 75)
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[4].cel+1], 'p1AnimWin', 124, 164, data.t_p1selected[4].up, 1, 1, alphaS)
									end
								end
							--Draw P1 Member 3 SELECTED Animation
								if j == 3 then
									if data.randomPortrait == "Fixed" and p1member3Random == true then
										f_drawQuickSpr(p1randomSprite, 76, 75)
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[3].cel+1], 'p1AnimWin', 96, 164, data.t_p1selected[3].up, 1, 1, alphaS)
									end
								end
							--Draw P1 Member 2 SELECTED Animation
								if j == 2 then
									if data.randomPortrait == "Fixed" and p1member2Random == true then
										f_drawQuickSpr(p1randomSprite, 48, 75)
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[2].cel+1], 'p1AnimWin', 68, 164, data.t_p1selected[2].up, 1, 1, alphaS)
									end
								end
							--Draw P1 Member 1 SELECTED Animation
								if data.randomPortrait == "Fixed" and p1member1Random == true then
									f_drawQuickSpr(p1randomSprite, 20, 75)
								else
									f_drawCharAnim(t_selChars[data.t_p1selected[1].cel+1], 'p1AnimWin', 40, 164, data.t_p1selected[1].up, 1, 1, alphaS)
								end
								--Draw P1 SELECTED/Win Animation with automatic X position for all members (instead of use p1numChars logic)
								--f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 40 + 28*(j-1), 164, data.t_p1selected[j].up, 1, 1, alphaS)
							end
						elseif data.charPresentation == "Mixed" then
						--SINGLE MODE
							if p1numChars == 1 then
								if data.randomPortrait == "Fixed" and p1member1Random == true then
									--You can put your own sprite for random select but as also we are using the portrait logic is not necessary
								else
									f_drawCharAnim(t_selChars[data.t_p1selected[1].cel+1], 'p1AnimWin', 30, 158, data.t_p1selected[1].up, 1, 1, alphaS)
								end
						--TEAM MODE WITH 2 MEMBERS
							elseif p1numChars == 2 then
							--Draw P1 Member 2 SELECTED Animation
								if j == 2 then
									if data.randomPortrait == "Fixed" and p1member2Random == true then
										
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[2].cel+1], 'p1AnimWin', 90, 158, data.t_p1selected[2].up, 0.5, 0.5, alphaS)
									end
								end
							--Draw P1 Member 1 SELECTED Animation
								if data.randomPortrait == "Fixed" and p1member1Random == true then
									
								else
									f_drawCharAnim(t_selChars[data.t_p1selected[1].cel+1], 'p1AnimWin', 90, 90, data.t_p1selected[1].up, 0.5, 0.5, alphaS) --The lastest f_drawCharAnim have draw priority on screen
								end
						--TEAM MODE WITH 3 MEMBERS
							elseif p1numChars == 3 then
							--Draw P1 Member 3 SELECTED Animation
								if j == 3 then
									if data.randomPortrait == "Fixed" and p1member3Random == true then
										
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[3].cel+1], 'p1AnimWin', 70, 158, data.t_p1selected[3].up, 0.5, 0.5, alphaS)
									end
								end
							--Draw P1 Member 2 SELECTED Animation
								if j == 2 then
									if data.randomPortrait == "Fixed" and p1member2Random == true then
										
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[2].cel+1], 'p1AnimWin', 10, 158, data.t_p1selected[2].up, 0.5, 0.5, alphaS)
									end
								end
							--Draw P1 Member 1 SELECTED Animation
								if data.randomPortrait == "Fixed" and p1member1Random == true then
									
								else
									f_drawCharAnim(t_selChars[data.t_p1selected[1].cel+1], 'p1AnimWin', 40, 89, data.t_p1selected[1].up, 0.5, 0.5, alphaS)
								end
						--TEAM MODE WITH 4 MEMBERS
							elseif p1numChars == 4 then
							--Draw P1 Member 4 SELECTED Animation
								if j == 4 then
									if data.randomPortrait == "Fixed" and p1member4Random == true then
										
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[4].cel+1], 'p1AnimWin', 70, 158, data.t_p1selected[4].up, 0.5, 0.5, alphaS)
									end
								end
							--Draw P1 Member 3 SELECTED Animation
								if j == 3 then
									if data.randomPortrait == "Fixed" and p1member3Random == true then
										
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[3].cel+1], 'p1AnimWin', 10, 158, data.t_p1selected[3].up, 0.5, 0.5, alphaS)
									end
								end
							--Draw P1 Member 2 SELECTED Animation
								if j == 2 then
									if data.randomPortrait == "Fixed" and p1member2Random == true then
										
									else
										f_drawCharAnim(t_selChars[data.t_p1selected[2].cel+1], 'p1AnimWin', 70, 89, data.t_p1selected[2].up, 0.5, 0.5, alphaS)
									end
								end
							--Draw P1 Member 1 SELECTED Animation
								if data.randomPortrait == "Fixed" and p1member1Random == true then
									
								else
									f_drawCharAnim(t_selChars[data.t_p1selected[1].cel+1], 'p1AnimWin', 10, 89, data.t_p1selected[1].up, 0.5, 0.5, alphaS)
								end
							end
						end
					end
				end
			end
		end
		for j=#data.t_p1selected, 1, -1 do --Again to set priority over sprites
		--DRAW CHARACTER NAMES
			if not exclusiveStageMenu then
				if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				--SINGLE MODE
					if p1numChars == 1 then
						if data.randomPortrait == "Fixed" and p1member1Random == true then
							f_drawQuickText(txt_p1RandomMember1, jgFnt, 5, 1, "RANDOM SELECT 1", 10, 165, 0.8, 0.8)
						else
							f_drawSelectName(txt_p1Name, data.t_p1selected[1], 10, 165)
						end
				--TEAM MODE WITH 2 MEMBERS
					elseif p1numChars == 2 then
					--Draw P1 Member 2 SELECTED Name
						if j == 2 then
							if data.charPresentation == "Portrait" then
								if data.randomPortrait == "Fixed" and p1member2Random == true then
									f_drawQuickText(txt_p1RandomMember2, jgFnt, 5, 1, "RANDOM SELECT 2", 2, 100, 0.8, 0.8)
								else
									f_drawSelectName(txt_p1Name, data.t_p1selected[2], 2, 100)
								end
							elseif data.charPresentation == "Mixed" then
								if data.randomPortrait == "Fixed" and p1member2Random == true then
									f_drawQuickText(txt_p1RandomMember2, jgFnt, 5, 1, "RANDOM SELECT 2", 66, 100, 0.5, 0.5)
								else
									f_drawSelectName(txt_p1Name, data.t_p1selected[2], 66, 100, 0.5, 0.5)
								end
							end
						end
					--Draw P1 Member 1 SELECTED Name
						if data.charPresentation == "Portrait" then
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								f_drawQuickText(txt_p1RandomMember1, jgFnt, 5, 1, "RANDOM SELECT 1", 2, 88, 0.8, 0.8)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[1], 2, 88)
							end
						elseif data.charPresentation == "Mixed" then
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								f_drawQuickText(txt_p1RandomMember1, jgFnt, 5, 1, "RANDOM SELECT 1", 66, 30, 0.5, 0.5)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[1], 66, 30, 0.5, 0.5)
							end
						end
				--TEAM MODE WITH 3 MEMBERS
					elseif p1numChars == 3 then
					--Draw P1 Member 3 SELECTED Name
						if j == 3 then
							if data.randomPortrait == "Fixed" and p1member3Random == true then
								f_drawQuickText(txt_p1RandomMember3, jgFnt, 5, 1, "RANDOM SELECT 3", 66, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[3], 66, 100, 0.5, 0.5)
							end
						end
					--Draw P1 Member 2 SELECTED Name
						if j == 2 then
							if data.randomPortrait == "Fixed" and p1member2Random == true then
								f_drawQuickText(txt_p1RandomMember2, jgFnt, 5, 1, "RANDOM SELECT 2", 0, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[2], 0, 100, 0.5, 0.5)
							end
						end
					--Draw P1 Member 1 SELECTED Name
						if data.charPresentation == "Portrait" then
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								f_drawQuickText(txt_p1RandomMember1, jgFnt, 5, 1, "RANDOM SELECT 1", 2, 88, 0.8, 0.8)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[1], 2, 88)
							end
						elseif data.charPresentation == "Mixed" then
							if data.randomPortrait == "Fixed" and p1member1Random == true then
								f_drawQuickText(txt_p1RandomMember1, jgFnt, 5, 1, "RANDOM SELECT 1", 30, 30, 0.5, 0.5)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[1], 30, 30, 0.5, 0.5)
							end
						end
				--TEAM MODE WITH 4 MEMBERS
					elseif p1numChars == 4 then
					--Draw P1 Member 4 SELECTED Name
						if j == 4 then
							if data.randomPortrait == "Fixed" and p1member4Random == true then
								f_drawQuickText(txt_p1RandomMember4, jgFnt, 5, 1, "RANDOM SELECT 4", 66, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[4], 66, 100, 0.5, 0.5)
							end
						end
					--Draw P1 Member 3 SELECTED Name
						if j == 3 then
							if data.randomPortrait == "Fixed" and p1member3Random == true then
								f_drawQuickText(txt_p1RandomMember3, jgFnt, 5, 1, "RANDOM SELECT 3", 0, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[3], 0, 100, 0.5, 0.5)
							end
						end
					--Draw P1 Member 2 SELECTED Name
						if j == 2 then
							if data.randomPortrait == "Fixed" and p1member2Random == true then
								f_drawQuickText(txt_p1RandomMember2, jgFnt, 5, 1, "RANDOM SELECT 2", 66, 30, 0.5, 0.5)
							else
								f_drawSelectName(txt_p1Name, data.t_p1selected[2], 66, 30, 0.5, 0.5)
							end
						end
					--Draw P1 Member 1 SELECTED Name
						if data.randomPortrait == "Fixed" and p1member1Random == true then
							f_drawQuickText(txt_p1RandomMember1, jgFnt, 5, 1, "RANDOM SELECT 1", 0, 30, 0.5, 0.5)
						else
							f_drawSelectName(txt_p1Name, data.t_p1selected[1], 0, 30, 0.5, 0.5)
						end
					end
				elseif data.charPresentation == "Sprite" then
				--Draw P1 Member 4 SELECTED Name
					if j == 4 then
						if data.randomPortrait == "Fixed" and p1member4Random == true then
							f_drawQuickText(txt_p1RandomMember4, jgFnt, 5, 1, "RANDOM SELECT 4", 12, 166, 0.8, 0.8)
						else
							f_drawSelectName(txt_p1Name, data.t_p1selected[4], 12, 166)
						end
					end
				--Draw P1 Member 3 SELECTED Name
					if j == 3 then
						if data.randomPortrait == "Fixed" and p1member3Random == true then
							f_drawQuickText(txt_p1RandomMember3, jgFnt, 5, 1, "RANDOM SELECT 3", 8, 160, 0.8, 0.8)
						else
							f_drawSelectName(txt_p1Name, data.t_p1selected[3], 8, 160)
						end
					end
				--Draw P1 Member 2 SELECTED Name
					if j == 2 then
						if data.randomPortrait == "Fixed" and p1member2Random == true then
							f_drawQuickText(txt_p1RandomMember2, jgFnt, 5, 1, "RANDOM SELECT 2", 4, 154, 0.8, 0.8)
						else
							f_drawSelectName(txt_p1Name, data.t_p1selected[2], 4, 154)
						end
					end
				--Draw P1 Member 1 SELECTED Name
					if data.randomPortrait == "Fixed" and p1member1Random == true then
						f_drawQuickText(txt_p1RandomMember1, jgFnt, 5, 1, "RANDOM SELECT 1", 0, 148, 0.8, 0.8)
					else
						f_drawSelectName(txt_p1Name, data.t_p1selected[1], 0, 148)
					end
				end
			--DRAW AUTHOR INFO TEXT
				if data.charInfo == "Author" then
					if t_selChars[p1Cell+1].author ~= nil or getCharName(p1Cell) == "Random" then
						if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						--SINGLE MODE
							if p1numChars == 1 then
								if data.randomPortrait == "Fixed" and p1member1Random == true then
									--Keep random author as: ???
								else
									textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[1].author) --Reveal Random Author
								end
								textImgDraw(txt_p1Author)
						--TEAM MODE WITH 2 MEMBERS
							elseif p1numChars == 2 then
								--Draw P1 Member 2 SELECTED Author
									if j == 2 then
										if data.randomPortrait == "Fixed" and p1member2Random == true then
										--
										else
											textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[2].author)
											
										end
										textImgScalePosDraw(txt_p1Author, 0, 165, 0.65, 0.65)
									end
								--Draw P1 Member 1 SELECTED Author
									if j == 1 then
										if data.randomPortrait == "Fixed" and p1member1Random == true then
										--
										else
											textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[1].author)
											
										end
										textImgScalePosDraw(txt_p1Author, 0, 20, 0.65, 0.65)
									end
						--TEAM MODE WITH 3 MEMBERS
							elseif p1numChars == 3 then
							--Draw P1 Member 3 SELECTED Author
								if j == 3 then
									if data.randomPortrait == "Fixed" and p1member3Random == true then
									--
									else
										textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[3].author)
										
									end
									textImgScalePosDraw(txt_p1Author, 60, 95, 0.5, 0.5)
								end
							--Draw P1 Member 2 SELECTED Author
								if j == 2 then
									if data.randomPortrait == "Fixed" and p1member2Random == true then
									--
									else
										textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[2].author)
										
									end
									textImgScalePosDraw(txt_p1Author, 0, 165, 0.5, 0.5)
								end
							--Draw P1 Member 1 SELECTED Author
								if j == 1 then
									if data.randomPortrait == "Fixed" and p1member1Random == true then
									--
									else
										textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[1].author)
									end
									textImgScalePosDraw(txt_p1Author, 0, 25, 0.5, 0.5)
								end
						--TEAM MODE WITH 4 MEMBERS
							elseif p1numChars == 4 then
							--Draw P1 Member 4 SELECTED Author
								if j == 4 then
									if data.randomPortrait == "Fixed" and p1member4Random == true then
									--
									else
										textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[4].author)
										
									end
									textImgScalePosDraw(txt_p1Author, 60, 95, 0.5, 0.5)
								end
							--Draw P1 Member 3 SELECTED Author
								if j == 3 then
									if data.randomPortrait == "Fixed" and p1member3Random == true then
									--
									else
										textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[3].author)
										
									end
									textImgScalePosDraw(txt_p1Author, 0, 165, 0.5, 0.5)
								end
							--Draw P1 Member 2 SELECTED Author
								if j == 2 then
									if data.randomPortrait == "Fixed" and p1member2Random == true then
									--
									else
										textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[2].author)
										
									end
									textImgScalePosDraw(txt_p1Author, 60, 89, 0.5, 0.5)
								end
							--Draw P1 Member 1 SELECTED Author
								if j == 1 then
									if data.randomPortrait == "Fixed" and p1member1Random == true then
									--
									else
										textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[1].author)
										
									end
									textImgScalePosDraw(txt_p1Author, 0, 25, 0.5, 0.5)
								end
							end
						elseif data.charPresentation == "Sprite" then
							if data.randomPortrait == "Fixed" and p1member1Random == true then
							--
							else
								textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[j].author)
							end
							textImgPosDraw(txt_p1Author, 0, 20+10*(j-1), 0.65, 0.65)
						end
					end
				end
			end
		end
		if not p1SelEnd then
			local tmpCelX = p1SelX
			local tmpCelY = p1SelY
			if backScreen == false and p1PalEnd then
				if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufSelu >= 30) then
					local foundCel = false
					while true do
						if foundCel then
							break
						end
						p1SelY, p1FaceOffset, p1OffsetRow = f_findCelYSub(p1SelY, p1FaceOffset, p1OffsetRow)
						if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then
							foundCel = true
						else
							for i=0, tmpCelX do
								p1SelX = f_findCelXSub(p1SelX, false)
								if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then
									foundCel = true
									break
								end
							end
							if not foundCel then
								p1SelX = tmpCelX
								for i=1, selectColumns-tmpCelX do
									p1SelX = f_findCelXAdd(p1SelX, false)
									if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then
										foundCel = true
										break
									end
								end
								if not foundCel then
									p1SelX = tmpCelX
								end
							end
						end
					end
					if tmpCelY ~= p1SelY or tmpCelX ~= p1SelX then
						sndPlay(sysSnd, 100, 0)
					end
				elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufSeld >= 30) then
					local foundCel = false
					while true do
						if foundCel then
							break
						end
						p1SelY, p1FaceOffset, p1OffsetRow = f_findCelYAdd(p1SelY, p1FaceOffset, p1OffsetRow)
						if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then
							foundCel = true
						else
							for i=1, selectColumns-tmpCelX do
								p1SelX = f_findCelXAdd(p1SelX, false)
								if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then
									foundCel = true
									break
								end
							end
							if not foundCel then
								p1SelX = tmpCelX
								for i=0, tmpCelX do
									p1SelX = f_findCelXSub(p1SelX, false)
									if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then
										foundCel = true
										break
									end
								end
								if not foundCel then
									p1SelX = tmpCelX
								end
							end
						end
					end
					if tmpCelY ~= p1SelY or tmpCelX ~= p1SelX then
						sndPlay(sysSnd, 100, 0)
					end
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufSell >= 30) then
					while true do
						p1SelX = f_findCelXSub(p1SelX, wrappingX)
						if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then break end
					end
					if tmpCelX ~= p1SelX then
						sndPlay(sysSnd, 100, 0)
					end
				elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufSelr >= 30) then
					while true do
						p1SelX = f_findCelXAdd(p1SelX, wrappingX)
						if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then break end
					end
					if tmpCelX ~= p1SelX then
						sndPlay(sysSnd, 100, 0)
					end
				end
				if commandGetState(p1Cmd, 's') then --Start Button Activates Palette Select
					if data.palType == "Modern" then
						sndPlay(sysSnd, 100, 3)
						p1PalEnd = false
					end
				end
				if commandGetState(p1Cmd, 'holdu') then
					bufSeld = 0
					bufSelu = bufSelu + 1
				elseif commandGetState(p1Cmd, 'holdd') then
					bufSelu = 0
					bufSeld = bufSeld + 1
				elseif commandGetState(p1Cmd, 'holdr') then
					bufSell = 0
					bufSelr = bufSelr + 1
				elseif commandGetState(p1Cmd, 'holdl') then
					bufSelr = 0
					bufSell = bufSell + 1
				else
					bufSelu = 0
					bufSeld = 0
					bufSelr = 0
					bufSell = 0
				end
			end
			p1Cell = p1SelX + selectColumns*p1SelY
			p1Portrait = p1Cell
			--Draw Hidden Rows Cursors
			if offsetRows >= 1 and not data.p2Faces then
				animDraw(arrowsUSR)
				animUpdate(arrowsUSR)
				animDraw(arrowsDSR)
				animUpdate(arrowsDSR)
			elseif offsetRows >= 1 and data.p2Faces then
				animDraw(arrowsUMR)
				animUpdate(arrowsUMR)
				animDraw(arrowsDMR)
				animUpdate(arrowsDMR)
			end
		--Draw Author Info Text Preview
			if data.charInfo == "Author" then
				if t_selChars[p1Cell+1].author ~= nil or getCharName(p1Cell) == "Random" then
					if t_selChars[p1Cell+1].author ~= nil then
						textImgSetText(txt_p1Author, txt_authorText..t_selChars[p1Cell+1].author)
					else --Set Text for Random Select
						textImgSetText(txt_p1Author, txt_authorText.."???")
					end
					textImgScalePosDraw(txt_p1Author, 0, 20, 0.65, 0.65) --Restart text pos
					--textImgDraw(txt_p1Author)
				end
			end
		--Set Preview Character Name
			textImgSetBank(txt_p1Name, 0) --Restart color for not selected character
			textImgSetText(txt_p1Name, f_getName(p1Cell))
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				--For Single Mode
				if p1numChars == 1 then
					textImgScalePosDraw(txt_p1Name, 10, 165, 0.8, 0.8)
				--For Team Mode with 2 Players
				elseif p1numChars == 2 then
					if p1memberPreview == 1 then
						if data.charPresentation == "Portrait" then
							textImgScalePosDraw(txt_p1Name, 2, 88, 0.8, 0.8)
						elseif data.charPresentation == "Mixed" then
							textImgScalePosDraw(txt_p1Name, 66, 30, 0.5, 0.5)
						end
					end
					if p1memberPreview == 2 then
						if data.charPresentation == "Portrait" then
							textImgScalePosDraw(txt_p1Name, 2, 100, 0.8, 0.8)
						elseif data.charPresentation == "Mixed" then
							textImgScalePosDraw(txt_p1Name, 66, 100, 0.5, 0.5)
						end
					end
				--For Team Mode with 3 Players
				elseif p1numChars == 3 then
					if p1memberPreview == 1 then
						if data.charPresentation == "Portrait" then
							textImgScalePosDraw(txt_p1Name, 2, 88, 0.8, 0.8)
						elseif data.charPresentation == "Mixed" then
							textImgScalePosDraw(txt_p1Name, 30, 30, 0.5, 0.5)
						end
					end
					if p1memberPreview == 2 then textImgScalePosDraw(txt_p1Name, 0, 100, 0.5, 0.5) end
					if p1memberPreview == 3 then textImgScalePosDraw(txt_p1Name, 66, 100, 0.5, 0.5) end
				--For Team Mode with 4 Players
				elseif p1numChars == 4 then
					if p1memberPreview == 1 then textImgScalePosDraw(txt_p1Name, 0, 30, 0.5, 0.5) end
					if p1memberPreview == 2 then textImgScalePosDraw(txt_p1Name, 66, 30, 0.5, 0.5) end
					if p1memberPreview == 3 then textImgScalePosDraw(txt_p1Name, 0, 100, 0.5, 0.5) end
					if p1memberPreview == 4 then textImgScalePosDraw(txt_p1Name, 66, 100, 0.5, 0.5) end
				end
			elseif data.charPresentation == "Sprite" then
				if p1memberPreview == 1 then
					textImgPosDraw(txt_p1Name, 0, 148)
				elseif p1memberPreview == 2 then
					textImgPosDraw(txt_p1Name, 4, 154)
				elseif p1memberPreview == 3 then
					textImgPosDraw(txt_p1Name, 8, 160)
				elseif p1memberPreview == 4 then
					textImgPosDraw(txt_p1Name, 12, 166)
				end
			end
			animPosDraw(p1ActiveCursor, p1FaceX+p1SelX*(27+2), p1FaceY+(p1SelY-p1OffsetRow)*(27+2))
		--Back to Team Menu Logic
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				if commandGetState(p2Cmd, 'e') and p1SelBack == true and not data.coop then
					sndPlay(sysSnd, 100, 2)
					f_p1sideReset()
				end
			else
				if commandGetState(p1Cmd, 'e') then
					if serviceBack == true then
						f_p1sideReset()
						p1TeamEnd = true
						p1BG = true
						p1memberPreview = 1
					elseif p1SelBack == true then
						sndPlay(sysSnd, 100, 2)
						f_p1sideReset()
					end
				end
			end
			if btnPalNo(p1Cmd) > 0 then
				if t_selChars[p1Cell+1].unlock == nil or t_selChars[p1Cell+1].unlock == 1 or onlinegame then --This character is unlocked
					f_p1Selection()
				elseif t_selChars[p1Cell+1].unlock == 0 and not onlinegame then --Character locked if unlock=0 paramvalue is in Character section of select.def
					sndPlay(sysSnd, 100, 5)
				end
			elseif selectTimer == 0 then
				if t_selChars[p1Cell+1].unlock == 0 and not onlinegame then --Select random character to prevent issues when time to select is over
					p1Cell = t_randomChars[math.random(#t_randomChars)]
				end
				f_p1Selection()
			end
			if data.debugLog then f_printTable(data.t_p1selected, "save/debug/data.t_p1selected.txt") end
		end
	end
end

--Actions when you select a Character
function f_p1Selection()
	sndPlay(sysSnd, 100, 1)
	local cel = p1Cell
	if getCharName(cel) == "Random" then
		randomP1Rematch = true
		cel = t_randomChars[math.random(#t_randomChars)] --include exclude chars: cel = math.random(1, #t_randomChars)-1
		if p1memberPreview == 1 then p1member1Random = true	end
		if p1memberPreview == 2 then p1member2Random = true	end
		if p1memberPreview == 3 then p1member3Random = true	end
		if p1memberPreview == 4 then p1member4Random = true	end
	else
		f_p1charAnnouncer() --Character Voice when is selected Example for Player 1 Side
	end
	--Change p1memberPreview on each char selection
	if p1numChars > 1 and not data.coop then --For Team Modes
		if p1memberPreview == 1 then p1memberPreview = 2
		elseif p1memberPreview == 2 then p1memberPreview = 3
		elseif p1memberPreview == 3 then p1memberPreview = 4
		elseif p1memberPreview == 4 then p1memberPreview = 1 --To Restart
		end
	end
	local updateAnim = true
	for i=1, #data.t_p1selected do
		if data.t_p1selected[i].cel == p1Cell then 
			updateAnim = false
		end
	end
	if data.palType == "Classic" then
		p1palSelect = btnPalNo(p1Cmd)
		if selectTimer == 0 then p1palSelect = 1 end --Avoid freeze when Character Select timer is over and there is not are a palette selected
	elseif data.palType == "Modern" then
		p1palSelect = p1palSelect
	end
	if data.coop then
		data.t_p1selected[1] = {['cel'] = cel, ['name'] = t_selChars[cel+1].name, ['displayname'] = t_selChars[cel+1].displayname, ['path'] = t_selChars[cel+1].char, ['pal'] = p1palSelect, ['up'] = updateAnim, ['author'] = t_selChars[cel+1].author}
		p1SelEnd = true
	else
		data.t_p1selected[#data.t_p1selected+1] = {['cel'] = cel, ['name'] = t_selChars[cel+1].name, ['displayname'] = t_selChars[cel+1].displayname, ['path'] = t_selChars[cel+1].char, ['pal'] = p1palSelect, ['up'] = updateAnim, ['author'] = t_selChars[cel+1].author}
		if #data.t_p1selected == p1numChars then
			if data.p2In == 1 and matchNo == 0 then
				p2TeamEnd = false
				p2SelEnd = false
				--commandBufReset(p2Cmd)
			end
			p1SelEnd = true
		end
	end
	cmdInput()
end

--;===========================================================
--; PLAYER 2 TEAM SELECT SCREENPACK
--;===========================================================
--P2 Team cursor
p2TmCursor = animNew(sysSff, [[
190,0, 0,0, -1
]])

--P2 Team icon
p2TmIcon = animNew(sysSff, [[
191,0, 0,0, -1
]])

--P2 Empty Team (icon 1)
p2EmptyIcon = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon, 239, 66)
animUpdate(p2EmptyIcon)

--P2 Empty Team (icon 2)
p2EmptyIcon2 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon2, 233, 66)
animUpdate(p2EmptyIcon2)

--P2 Empty Team (icon 3)
p2EmptyIcon3 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon3, 227, 66)
animUpdate(p2EmptyIcon3)

--P2 Empty Team (icon 4)
p2EmptyIcon4 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon4, 221, 66)
animUpdate(p2EmptyIcon4)

--P2 Empty Turns (icon 1)
p2EmptyIcon5 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon5, 239, 81)
animUpdate(p2EmptyIcon5)

--P2 Empty Turns (icon 2)
p2EmptyIcon6 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon6, 233, 81)
animUpdate(p2EmptyIcon6)

--P2 Empty Turns (icon 3)
p2EmptyIcon7 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon7, 227, 81)
animUpdate(p2EmptyIcon7)

--P2 Empty Turns (icon 4)
p2EmptyIcon8 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon8, 221, 81)
animUpdate(p2EmptyIcon8)

--;===========================================================
--; PLAYER 2 TEAM SELECT
--;===========================================================
p2SelTmTxt = createTextImg(jgFnt, 5, -1, "TEAM MODE", 300, 30)
IASelTmTxt2 = createTextImg(jgFnt, 5, -1, "CPU MODE", 300, 30)

t_p2selTeam = {
	{id = '', text = t_p1selTeam[1].text}, --Get text from player 1 team table
	{id = '', text = t_p1selTeam[2].text},
	{id = '', text = t_p1selTeam[3].text},
}
for i=1, #t_p2selTeam do
	t_p2selTeam[i].id = createTextImg(jgFnt, 0, -1, t_p2selTeam[i].text, 300, 35+i*15)
end

function f_p2TeamMenu()
	if data.coop then --Simul co-op
		if data.coopenemy == "Single" then --CPU Co-op Players uses Co-Op CPU Team Mode setting.
			p2teamMode = 0
			p2numChars = 2 --Fix AI Fight Error When p2numChars = 1 (Take reference of Arcade Bonus in co-op)
		elseif data.coopenemy == "Simul" then
			p2teamMode = 1
			p2numChars = 2
		elseif data.coopenemy == "Turns" then
			p2teamMode = 2
			p2numChars = 3
		end
		setTeamMode(2, p2teamMode, p2numChars)
		p2TeamEnd = true
		--p2BG = true
		--p2memberPreview = 1
	elseif data.p2TeamMenu ~= nil then
		p2numChars = data.p2TeamMenu.chars
		p2teamMode = data.p2TeamMenu.mode
		setTeamMode(2, p2teamMode, p2numChars)
		p2TeamEnd = true
		p2BG = true
		p2memberPreview = 1
	else
		--Back logic when you are selecting CPU Team Mode in Human Vs CPU
		if commandGetState(p1Cmd, 'e') and (data.p1In ~= 2 and data.p2In ~= 2) then --p1Cmd because Human is in left side
			if p2TeamBack == true then
				if data.p2In == 1 then
					sndPlay(sysSnd, 100, 2)
					f_p2sideReset()
					p2TeamEnd = true
					p2SelEnd = true
					f_p1sideReset()
					p1TeamEnd = true
					p1BG = true
					p1memberPreview = 1
					p1SelBack = true
					p1TeamBack = false
				end
			end
		end
		if backScreen == false then	
			if commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufTm2u >= 30) then
				sndPlay(sysSnd, 100, 0)
				p2teamMode = p2teamMode - 1
				if p2teamMode < 0 then p2teamMode = #t_p2selTeam-1 end
				if bufTm2l then bufTm2l = 0 end
				if bufTm2r then bufTm2r = 0 end
			elseif commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufTm2d >= 30) then
				sndPlay(sysSnd, 100, 0)
				p2teamMode = p2teamMode + 1
				if p2teamMode > #t_p2selTeam-1 then p2teamMode = 0 end
				if bufTm2l then bufTm2l = 0 end
				if bufTm2r then bufTm2r = 0 end
			elseif p2teamMode == 1 then --Simul
				if commandGetState(p2Cmd, 'r') or (commandGetState(p2Cmd, 'holdr') and bufTm2r >= 30) then
					if commandGetState(p2Cmd, 'r') and p2numSimul > 2 then sndPlay(sysSnd, 100, 0) end
					p2numSimul = p2numSimul - 1
					if p2numSimul < 2 then p2numSimul = 2 end
					if bufTm2u then bufTm2u = 0 end
					if bufTm2d then bufTm2d = 0 end
				elseif commandGetState(p2Cmd, 'l') or (commandGetState(p2Cmd, 'holdl') and bufTm2l >= 30) then
					if commandGetState(p2Cmd, 'l') and p2numSimul < data.numSimul then sndPlay(sysSnd, 100, 0) end
					p2numSimul = p2numSimul + 1
					if p2numSimul > data.numSimul then p2numSimul = data.numSimul end
					if bufTm2u then bufTm2u = 0 end
					if bufTm2d then bufTm2d = 0 end
				end
				if commandGetState(p2Cmd, 'holdr') then
					bufTm2l = 0
					bufTm2r = bufTm2r + 1
				elseif commandGetState(p2Cmd, 'holdl') then
					bufTm2r = 0
					bufTm2l = bufTm2l + 1
				else
					bufTm2r = 0
					bufTm2l = 0
				end
			elseif p2teamMode == 2 then --Turns
				if commandGetState(p2Cmd, 'r') or (commandGetState(p2Cmd, 'holdr') and bufTm2r >= 30) then
					if commandGetState(p2Cmd, 'r') and p2numTurns > 2 then sndPlay(sysSnd, 100, 0) end
					p2numTurns = p2numTurns - 1
					if p2numTurns < 2 then p2numTurns = 2 end
					if bufTm2u then bufTm2u = 0 end
					if bufTm2d then bufTm2d = 0 end
				elseif commandGetState(p2Cmd, 'l') or (commandGetState(p2Cmd, 'holdl') and bufTm2l >= 30) then
					if commandGetState(p2Cmd, 'l') and p2numTurns < data.numTurns then sndPlay(sysSnd, 100, 0) end
					p2numTurns = p2numTurns + 1
					if p2numTurns > data.numTurns then p2numTurns = data.numTurns end
					if bufTm2u then bufTm2u = 0 end
					if bufTm2d then bufTm2d = 0 end
				end
				if commandGetState(p2Cmd, 'holdr') then
					bufTm2l = 0
					bufTm2r = bufTm2r + 1
				elseif commandGetState(p2Cmd, 'holdl') then
					bufTm2r = 0
					bufTm2l = bufTm2l + 1
				else
					bufTm2r = 0
					bufTm2l = 0
				end
			end
			if commandGetState(p2Cmd, 'holdu') then
				bufTm2d = 0
				bufTm2u = bufTm2u + 1
			elseif commandGetState(p2Cmd, 'holdd') then
				bufTm2u = 0
				bufTm2d = bufTm2d + 1
			else
				bufTm2u = 0
				bufTm2d = 0
			end
		end
		if data.p2In == 2 then
			textImgDraw(p2SelTmTxt)
		elseif data.rosterMode == "cpu" then
			textImgDraw(IASelTmTxt2)
		else
			textImgDraw(IASelTmTxt2)
		end
		for i=1, #t_p2selTeam do
			if i == p2teamMode + 1 then
				textImgSetBank(t_p2selTeam[i].id, 1)
			else
				textImgSetBank(t_p2selTeam[i].id, 0)
			end
			textImgDraw(t_p2selTeam[i].id)
		end
		animUpdate(p2TmIcon)
		animDraw(p2EmptyIcon)
		animUpdate(p2EmptyIcon)
		animDraw(p2EmptyIcon2)
		animUpdate(p2EmptyIcon2)
		animDraw(p2EmptyIcon3)
		animUpdate(p2EmptyIcon3)
		animDraw(p2EmptyIcon4)
		animUpdate(p2EmptyIcon4)
		animDraw(p2EmptyIcon5)
		animUpdate(p2EmptyIcon5)
		animDraw(p2EmptyIcon6)
		animUpdate(p2EmptyIcon6)
		animDraw(p2EmptyIcon7)
		animUpdate(p2EmptyIcon7)
		animDraw(p2EmptyIcon8)
		animUpdate(p2EmptyIcon8)
		for i=1, p2numSimul do
			animPosDraw(p2TmIcon, 246 - i*6, 66)
		end
		for i=1, p2numTurns do
			animPosDraw(p2TmIcon, 246 - i*6, 81)
		end
		animUpdate(p2TmCursor)
		animPosDraw(p2TmCursor, 310, 50 + p2teamMode*15)
		if btnPalNo(p2Cmd) > 0 or selectTimer == 0 then
			sndPlay(sysSnd, 100, 1)
			if p2teamMode == 0 then --Single
				p2numChars = 1
			elseif p2teamMode == 1 then --Simul
				p2numChars = p2numSimul
			elseif p2teamMode == 2 then --Turns
				p2numChars = p2numTurns
			end
			setTeamMode(2, p2teamMode, p2numChars)
			p2TeamEnd = true
			p2BG = true
			p2memberPreview = 1
			p2SelBack = true
			p2TeamBack = false
			cmdInput()
		end
	end
end

--;===========================================================
--; PLAYER 2 PALETTE SELECT
--;===========================================================
txt_p2Pal = createTextImg(jgFnt, 5, -1, txt_palText, 266, 237)
txt_p2PalNo = createTextImg(font14, 0, -1, "", 310, 237)

--Left Arrow for Player 2 Palette Select
arrowsPL2 = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(arrowsPL2, 264, 228.5)
animUpdate(arrowsPL2)
animSetScale(arrowsPL2, 0.45, 0.45)

--Right Arrow for Player 2 Palette Select
arrowsPR2 = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(arrowsPR2, 312, 228.5)
animUpdate(arrowsPR2)
animSetScale(arrowsPR2, 0.45, 0.45)

function f_p2palList()
	cmdInput()
	if (commandGetState(p2Cmd, 'r') or commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufPal2u >= 30) or (commandGetState(p2Cmd, 'holdr') and bufPal2r >= 30)) and p2movePal <= 11 then
		sndPlay(sysSnd, 100, 0)
		p2movePal = p2movePal + 1
	elseif (commandGetState(p2Cmd, 'l') or commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufPal2d >= 30) or (commandGetState(p2Cmd, 'holdl') and bufPal2l >= 30)) and p2movePal > 1 then
		sndPlay(sysSnd, 100, 0)
		p2movePal = p2movePal - 1
	end
	if commandGetState(p2Cmd, 'holdu') then
		bufPal2d = 0
		bufPal2u = bufPal2u + 1
	elseif commandGetState(p2Cmd, 'holdd') then
		bufPal2u = 0
		bufPal2d = bufPal2d + 1
	elseif commandGetState(p2Cmd, 'holdr') then
		bufPal2l = 0
		bufPal2r = bufPal2r + 1
	elseif commandGetState(p2Cmd, 'holdl') then
		bufPal2r = 0
		bufPal2l = bufPal2l + 1
	else
		bufPal2u = 0
		bufPal2d = 0
		bufPal2r = 0
		bufPal2l = 0
	end
	p2palSelect = p2movePal
	textImgDraw(txt_p2Pal)
	textImgSetText(txt_p2PalNo, p2palSelect.."/12")
	textImgDraw(txt_p2PalNo)
	if p2movePal > 1 then
		animDraw(arrowsPL2)
		animUpdate(arrowsPL2)
	end
	if p2movePal <= 11 then
		animDraw(arrowsPR2)
		animUpdate(arrowsPR2)
	end
	if btnPalNo(p2Cmd) > 0 then
		sndPlay(sysSnd, 100, 1)
		p2PalEnd = true
		cmdInput()
	elseif commandGetState(p1Cmd, 'e') or selectTimer == 0 then
		p2PalEnd = true
	end
end

--;===========================================================
--; PLAYER 2 CHARACTER SELECT
--;===========================================================
txt_p2Name = createTextImg(jgFnt, 1, -1, "", 0, 0, 0.8, 0.8)
txt_p2Author = createTextImg(jgFnt, 0, -1, "", 320, 20, 0.65, 0.65)

--P2 Random Portrait
p2randomPortrait = animNew(sysSff, [[151,1, -120,0,]])

--P2 Random Sprite
p2randomSprite = animNew(sysSff, [[151,2, 0,0,]])

--P2 Big Portrait Lock
p2portraitLock = animNew(sysSff, [[108,0, -320,0,]])

--P2 Big Portrait Locked Fade Window
p2portraitLockWindowBG = animNew(sysSff, [[3,0, -1, 0,]])

function f_p2charAnnouncer()
	if f_getName(p2Cell) == "Kung Fu Man" then
		sndPlay(announcerSnd, 2, 0)
	--elseif f_getName(p2Cell) == "Your Character Name" then
		--sndPlay(announcerSnd, 2, 1)
	end
end

function f_p2SelectMenu()
	if data.p2Char ~= nil then
		local t = {}
		for i=1, #data.p2Char do
			local updateAnim = false
			if t[data.p2Char[i]] == nil then
				updateAnim = true
				t[data.p2Char[i]] = ''
			end
			if data.p2Pal ~= nil then
				data.t_p2selected[i] = {['cel'] = data.p2Char[i], ['pal'] = data.p2Pal, ['up'] = updateAnim, ['name'] = t_selChars[data.p2Char[i]+1].name, ['displayname'] = t_selChars[data.p2Char[i]+1].displayname, ['path'] = t_selChars[data.p2Char[i]+1].char, ['author'] = t_selChars[data.p2Char[i]+1].author}
			else
				data.t_p2selected[i] = {['cel'] = data.p2Char[i], ['pal'] = math.random(1,12), ['up'] = updateAnim, ['name'] = t_selChars[data.p2Char[i]+1].name, ['displayname'] = t_selChars[data.p2Char[i]+1].displayname, ['path'] = t_selChars[data.p2Char[i]+1].char, ['author'] = t_selChars[data.p2Char[i]+1].author}
			end
			if data.debugLog then f_printTable(data.t_p2selected, "save/debug/data.t_p2selected.txt") end
		end
		p2Portrait = data.p2Char[1]
		--local numChars = p2numChars
		--local t_selected = data.t_p2selected
		--if data.coop then
			--numChars = 1
			--t_selected = {}
		--end
		p2SelEnd = true
	elseif not data.p2SelectMenu then
		if data.gameMode == "challenger" then
			data.t_p2selected = t_p2selectedTemp --Get previous arcade selected characters
			if data.debugLog then f_printTable(data.t_p2selected, "save/debug/data.t_p2selected.txt") end
		end
		p2SelEnd = true
	else
		if not exclusiveStageMenu then
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				if p2BG == true then animDraw(f_animVelocity(charBG3, 2, 0)) end
			end
		end
		local numChars = p2numChars
		local alphaS = 200
		local t_selected = data.t_p2selected
		if data.coop then
			numChars = 1
			t_selected = {} --Reset table to store p2 data to send to data.t_p1selected in co-op modes
		end
		if p2Cell then
			if numChars ~= #t_selected then
				local updateAnim = true
				for i=1, #t_selected do
					if t_selected[i].cel == p2Cell then 
						updateAnim = false
					end
				end
				if getCharName(p2Cell) == "Random" then
					--sndPlay(sysSnd, 100, 0)
					if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						--drawPortrait(t_randomChars[math.random(#t_randomChars)], 320 - 60*(#t_selected-1), 20, -1, 1)
						if p2numChars == 1 then
							if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
								f_drawQuickSpr(p2randomPortrait, 320, 20)
							elseif data.randomPortrait == "Roulette" then
								drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 20, -1, 1)
							end
						elseif p2numChars == 2 then
							if data.coop then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									if data.charPresentation == "Portrait" then
										f_drawQuickSpr(p2randomPortrait, 120, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										f_drawQuickSpr(p2randomPortrait, 60, 90, 0.5, 0.5)
									end
								elseif data.randomPortrait == "Roulette" then
									if data.charPresentation == "Portrait" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 0, 90, 0.5, 0.5)
									end
								end
							else
								if p2memberPreview == 1 then
									if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
										if data.charPresentation == "Portrait" then
											f_drawQuickSpr(p2randomPortrait, 320, 20, 1, 0.5)
										elseif data.charPresentation == "Mixed" then
											f_drawQuickSpr(p2randomPortrait, 320, 20, 0.5, 0.5)
										end
									elseif data.randomPortrait == "Roulette" then
										if data.charPresentation == "Portrait" then
											drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 20, -1, 0.5)
										elseif data.charPresentation == "Mixed" then
											drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 20, -0.5, 0.5)
										end
									end
								end
								if p2memberPreview == 2 then
									if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
										if data.charPresentation == "Portrait" then
											f_drawQuickSpr(p2randomPortrait, 320, 90, 1, 0.5)
										elseif data.charPresentation == "Mixed" then
											f_drawQuickSpr(p2randomPortrait, 320, 90, 0.5, 0.5)
										end
									elseif data.randomPortrait == "Roulette" then
										if data.charPresentation == "Portrait" then
											drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 90, -1, 0.5)
										elseif data.charPresentation == "Mixed" then
											drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 90, -0.5, 0.5)
										end
									end
								end
							end
						elseif p2numChars == 3 then
							if p2memberPreview == 1 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									if data.charPresentation == "Portrait" then
										f_drawQuickSpr(p2randomPortrait, 320, 20, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										f_drawQuickSpr(p2randomPortrait, 290, 20, 0.5, 0.5)
									end
								elseif data.randomPortrait == "Roulette" then
									if data.charPresentation == "Portrait" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 20, -1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(t_randomChars[math.random(#t_randomChars)], 290, 20, -0.5, 0.5)
									end
								end
							end
							if p2memberPreview == 2 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomPortrait, 320, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 90, -0.5, 0.5)
								end
							end
							if p2memberPreview == 3 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomPortrait, 260, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 260, 90, -0.5, 0.5)
								end
							end
						elseif p2numChars == 4 then
							if p2memberPreview == 1 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomPortrait, 320, 20, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 20, -0.5, 0.5)
								end
							end
							if p2memberPreview == 2 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomPortrait, 260, 20, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 260, 20, -0.5, 0.5)
								end
							end
							if p2memberPreview == 3 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomPortrait, 320, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 320, 90, -0.5, 0.5)
								end
							end
							if p2memberPreview == 4 then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomPortrait, 260, 90, 0.5, 0.5)
								elseif data.randomPortrait == "Roulette" then
									drawPortrait(t_randomChars[math.random(#t_randomChars)], 260, 90, -0.5, 0.5)
								end
							end
						--[[
						--else
							if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
								f_drawQuickSpr(p2randomPortrait, 195, 36, 0.5, 0.5)
							elseif data.randomPortrait == "Roulette" then
								drawPortrait(t_randomChars[math.random(#t_randomChars)], 195, 36, -0.5, 0.5)
							end
						]]
						end
					end
					if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
						if data.charPresentation == "Sprite" then
							if data.coop then
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomSprite, 110, 75)
								elseif data.randomPortrait == "Roulette" then
									f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 114, 164, true) --p1AnimStand because sprite animation will see to right
								end
							else
								if data.randomPortrait == "Simple" or data.randomPortrait == "Fixed" then
									f_drawQuickSpr(p2randomSprite, 260 - 28*#t_selected, 75)
								elseif data.randomPortrait == "Roulette" then
									f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 280 - 28*#t_selected, 164, true)
								end
							end
						elseif data.charPresentation == "Mixed" then
							if data.randomPortrait == "Roulette" then
								if p2numChars == 1 then
									f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 290, 158, true)
								elseif p2numChars == 2 then
									if data.coop then
										f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p1AnimStand', 90, 158, true, 0.5, 0.5)
									else
										if p2memberPreview == 1 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 230, 90, true, 0.5, 0.5) end
										if p2memberPreview == 2 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 230, 158, true, 0.5, 0.5) end
									end
								elseif p2numChars == 3 then
									if p2memberPreview == 1 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 280, 89, true, 0.5, 0.5) end
									if p2memberPreview == 2 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 310, 158, true, 0.5, 0.5) end
									if p2memberPreview == 3 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 250, 158, true, 0.5, 0.5) end
								elseif p2numChars == 4 then
									if p2memberPreview == 1 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 310, 89, true, 0.5, 0.5) end
									if p2memberPreview == 2 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 250, 89, true, 0.5, 0.5) end
									if p2memberPreview == 3 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 310, 158, true, 0.5, 0.5) end
									if p2memberPreview == 4 then f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 250, 158, true, 0.5, 0.5) end
								--else
									--f_drawCharAnim(t_selChars[math.random(#t_randomChars)], 'p2AnimStand', 132, 105, true, 0.5, 0.5)
								end
							end
						end
					end
				else
					if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						if p2Portrait then --To avoid issues when draw Portrait after continue/service screen
							--drawPortrait(p2Portrait, 320 - 60*(#t_selected-1), 20, -1, 1)
							if p2numChars == 1 then
								drawPortrait(p2Portrait, 320, 20, -1, 1)
							elseif p2numChars == 2 then
								if data.coop then
									if data.charPresentation == "Portrait" then
										drawPortrait(p2Portrait, 0, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(p2Portrait, 0, 90, 0.5, 0.5)
									end
								else
									if p2memberPreview == 1 then
										if data.charPresentation == "Portrait" then
											drawPortrait(p2Portrait, 320, 20, -1, 0.5)
										elseif data.charPresentation == "Mixed" then
											drawPortrait(p2Portrait, 320, 20, -0.5, 0.5)
										end
									end
									if p2memberPreview == 2 then
										if data.charPresentation == "Portrait" then
											drawPortrait(p2Portrait, 320, 90, -1, 0.5)
										elseif data.charPresentation == "Mixed" then
											drawPortrait(p2Portrait, 320, 90, -0.5, 0.5)
										end
									end
								end
							elseif p2numChars == 3 then
								if p2memberPreview == 1 then
									if data.charPresentation == "Portrait" then
										drawPortrait(p2Portrait, 320, 20, -1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(p2Portrait, 290, 20, -0.5, 0.5)
									end
								end
								if p2memberPreview == 2 then drawPortrait(p2Portrait, 320, 90, -0.5, 0.5) end
								if p2memberPreview == 3 then drawPortrait(p2Portrait, 260, 90, -0.5, 0.5) end
							elseif p2numChars == 4 then
								if p2memberPreview == 1 then drawPortrait(p2Portrait, 320, 20, -0.5, 0.5) end
								if p2memberPreview == 2 then drawPortrait(p2Portrait, 260, 20, -0.5, 0.5) end
								if p2memberPreview == 3 then drawPortrait(p2Portrait, 320, 90, -0.5, 0.5) end
								if p2memberPreview == 4 then drawPortrait(p2Portrait, 260, 90, -0.5, 0.5) end
							--else
								--drawPortrait(p2Portrait, 195, 36, -0.5, 0.5)
							end
						end
					end
					if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
						if data.charPresentation == "Sprite" then
							if data.coop then
								f_drawCharAnim(t_selChars[p2Cell+1], 'p1AnimStand', 114, 164, true)
							else
								f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 280 - 28*#t_selected, 164, true)
							end
						elseif data.charPresentation == "Mixed" then
							if p2numChars == 1 then
								f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 290, 158, true, 1, 1)
							elseif p2numChars == 2 then
								if data.coop then
									f_drawCharAnim(t_selChars[p2Cell+1], 'p1AnimStand', 90, 158, true, 0.5, 0.5)
								else
									if p2memberPreview == 1 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 230, 90, true, 0.5, 0.5) end
									if p2memberPreview == 2 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 230, 158, true, 0.5, 0.5) end
								end
							elseif p2numChars == 3 then
								if p2memberPreview == 1 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 280, 89, true, 0.5, 0.5) end
								if p2memberPreview == 2 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 310, 158, true, 0.5, 0.5) end
								if p2memberPreview == 3 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 250, 158, true, 0.5, 0.5) end
							elseif p2numChars == 4 then
								if p2memberPreview == 1 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 310, 89, true, 0.5, 0.5) end
								if p2memberPreview == 2 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 250, 89, true, 0.5, 0.5) end
								if p2memberPreview == 3 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 310, 158, true, 0.5, 0.5) end
								if p2memberPreview == 4 then f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 250, 158, true, 0.5, 0.5) end
							--else
								--f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 132, 105, true, 0.5, 0.5)
							end
						end
					end
					if t_selChars[p2Cell+1].unlock == 0 and not onlinegame then
						if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
							if p2numChars == 1 then
								f_drawQuickSpr(p2portraitLockWindowBG, 320, 20, 120, 140, 256, 102)
								f_drawQuickSpr(p2portraitLock, 295.5, 50, 0.20, 0.20)
							elseif p2numChars == 2 then
								if data.coop then
									f_drawQuickSpr(p1portraitLockWindowBG, 0, 90, 120, 70, 256, 102)
									f_drawQuickSpr(p1portraitLock, 42, 106, 0.10, 0.10)
								else
									if p2memberPreview == 1 then
										f_drawQuickSpr(p2portraitLockWindowBG, 320, 20, 120, 70, 256, 102)
										f_drawQuickSpr(p2portraitLock, 278, 36, 0.10, 0.10)
									elseif p2memberPreview == 2 then
										f_drawQuickSpr(p2portraitLockWindowBG, 320, 90, 120, 70, 256, 102)
										f_drawQuickSpr(p2portraitLock, 278, 106, 0.10, 0.10)
									end
								end
							elseif p2numChars == 3 then
								if p2memberPreview == 1 then
									f_drawQuickSpr(p2portraitLockWindowBG, 320, 20, 120, 70, 256, 102)
									f_drawQuickSpr(p2portraitLock, 278, 36, 0.10, 0.10)
								elseif p2memberPreview == 2 then
									f_drawQuickSpr(p2portraitLockWindowBG, 320, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p2portraitLock, 308, 106, 0.10, 0.10)
								elseif p2memberPreview == 3 then
									f_drawQuickSpr(p2portraitLockWindowBG, 260, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p2portraitLock, 248, 106, 0.10, 0.10)
								end
							elseif p2numChars == 4 then
								if p2memberPreview == 1 then
									f_drawQuickSpr(p2portraitLockWindowBG, 320, 20, 60, 70, 256, 102)
									f_drawQuickSpr(p2portraitLock, 308, 36, 0.10, 0.10)
								elseif p2memberPreview == 2 then
									f_drawQuickSpr(p2portraitLockWindowBG, 260, 20, 60, 70, 256, 102)
									f_drawQuickSpr(p2portraitLock, 248, 36, 0.10, 0.10)
								elseif p2memberPreview == 3 then
									f_drawQuickSpr(p2portraitLockWindowBG, 320, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p2portraitLock, 308, 106, 0.10, 0.10)
								elseif p2memberPreview == 4 then
									f_drawQuickSpr(p2portraitLockWindowBG, 260, 90, 60, 70, 256, 102)
									f_drawQuickSpr(p2portraitLock, 248, 106, 0.10, 0.10)
								end
							end
						elseif data.charPresentation == "Sprite" then
							if data.coop then
								f_drawQuickSpr(p1portraitLock, 110, 75, 0.15, 0.15)
							else
								f_drawQuickSpr(p2portraitLock, 300 - 28*#t_selected, 75, 0.15, 0.15)
							end
						end
					end
				end
			end
			for j=#t_selected, 1, -1 do
				if not exclusiveStageMenu then
					if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						--drawPortrait(t_selected[j].cel, 320 - 60*(j-1), 20, -1, 1)
						if p2numChars == 1 then
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								f_drawQuickSpr(p2randomPortrait, 320, 20)
							else
								drawPortrait(t_selected[1].cel, 320, 20, -1, 1)
							end
						elseif p2numChars == 2 then
							if j == 2 then
								if data.randomPortrait == "Fixed" and p2member2Random == true then
									if data.charPresentation == "Portrait" then
										f_drawQuickSpr(p2randomPortrait, 320, 90, 1, 0.5)
									elseif data.charPresentation == "Mixed" then
										f_drawQuickSpr(p2randomPortrait, 320, 90, 0.5, 0.5)
									end
								else
									if data.charPresentation == "Portrait" then
										drawPortrait(t_selected[2].cel, 320, 90, -1, 0.5)
									elseif data.charPresentation == "Mixed" then
										drawPortrait(t_selected[2].cel, 320, 90, -0.5, 0.5)
									end
								end
							end
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								if data.charPresentation == "Portrait" then
									f_drawQuickSpr(p2randomPortrait, 320, 20, 1, 0.5)
								elseif data.charPresentation == "Mixed" then
									f_drawQuickSpr(p2randomPortrait, 320, 20, 0.5, 0.5)
								end
							else
								if data.charPresentation == "Portrait" then
									drawPortrait(t_selected[1].cel, 320, 20, -1, 0.5)
								elseif data.charPresentation == "Mixed" then
									drawPortrait(t_selected[1].cel, 320, 20, -0.5, 0.5)
								end
							end
						elseif p2numChars == 3 then
							if j == 3 then
								if data.randomPortrait == "Fixed" and p2member3Random == true then
									f_drawQuickSpr(p2randomPortrait, 260, 90, 0.5, 0.5)
								else
									drawPortrait(t_selected[3].cel, 260, 90, -0.5, 0.5)
								end
							end
							if j == 2 then
								if data.randomPortrait == "Fixed" and p2member2Random == true then
									f_drawQuickSpr(p2randomPortrait, 320, 90, 0.5, 0.5)
								else
									drawPortrait(t_selected[2].cel, 320, 90, -0.5, 0.5)
								end
							end
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								if data.charPresentation == "Portrait" then
									f_drawQuickSpr(p2randomPortrait, 320, 20, 1, 0.5)
								elseif data.charPresentation == "Mixed" then
									f_drawQuickSpr(p2randomPortrait, 290, 20, 0.5, 0.5)
								end
							else
								if data.charPresentation == "Portrait" then
									drawPortrait(t_selected[1].cel, 320, 20, -1, 0.5)
								elseif data.charPresentation == "Mixed" then
									drawPortrait(t_selected[1].cel, 290, 20, -0.5, 0.5)
								end
							end
						elseif p2numChars == 4 then
							if j == 4 then
								if data.randomPortrait == "Fixed" and p2member4Random == true then
									f_drawQuickSpr(p2randomPortrait, 260, 90, 0.5, 0.5)
								else
									drawPortrait(t_selected[4].cel, 260, 90, -0.5, 0.5)
								end
							end
							if j == 3 then
								if data.randomPortrait == "Fixed" and p2member3Random == true then
									f_drawQuickSpr(p2randomPortrait, 320, 90, 0.5, 0.5)
								else
									drawPortrait(t_selected[3].cel, 320, 90, -0.5, 0.5)
								end
							end
							if j == 2 then
								if data.randomPortrait == "Fixed" and p2member2Random == true then
									f_drawQuickSpr(p2randomPortrait, 260, 20, 0.5, 0.5)
								else
									drawPortrait(t_selected[2].cel, 260, 20, -0.5, 0.5)
								end
							end
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								f_drawQuickSpr(p2randomPortrait, 320, 20, 0.5, 0.5)
							else
								drawPortrait(t_selected[1].cel, 320, 20, -0.5, 0.5)
							end
						end
					end
					if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
						if data.charPresentation == "Sprite" then
							if j == 4 then
								if data.randomPortrait == "Fixed" and p2member4Random == true then
									f_drawQuickSpr(p2randomSprite, 176, 75)
								else
									f_drawCharAnim(t_selChars[t_selected[4].cel+1], 'p2AnimWin', 196, 164, t_selected[4].up, 1, 1, alphaS)
								end
							end
							if j == 3 then
								if data.randomPortrait == "Fixed" and p2member3Random == true then
									f_drawQuickSpr(p2randomSprite, 204, 75)
								else
									f_drawCharAnim(t_selChars[t_selected[3].cel+1], 'p2AnimWin', 224, 164, t_selected[3].up, 1, 1, alphaS)
								end
							end
							if j == 2 then
								if data.randomPortrait == "Fixed" and p2member2Random == true then
									f_drawQuickSpr(p2randomSprite, 232, 75)
								else
									f_drawCharAnim(t_selChars[t_selected[2].cel+1], 'p2AnimWin', 252, 164, t_selected[2].up, 1, 1, alphaS)
								end
							end
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								f_drawQuickSpr(p2randomSprite, 260, 75)
							else
								f_drawCharAnim(t_selChars[t_selected[1].cel+1], 'p2AnimWin', 280, 164, t_selected[1].up, 1, 1, alphaS)
							end
							--f_drawCharAnim(t_selChars[t_selected[j].cel+1], 'p2AnimWin', 280 - 28*(j-1), 164, t_selected[j].up, 1, 1, alphaS)
						elseif data.charPresentation == "Mixed" then
							if p2numChars == 1 then
								if data.randomPortrait == "Fixed" and p2member1Random == true then
									--You can put your own sprite for random select but as also we are using the portrait logic is not necessary
								else
									f_drawCharAnim(t_selChars[t_selected[1].cel+1], 'p2AnimWin', 290, 158, t_selected[1].up, 1, 1, alphaS)
								end
							elseif p2numChars == 2 then
								if j == 2 then
									if data.randomPortrait == "Fixed" and p2member2Random == true then
										
									else
										f_drawCharAnim(t_selChars[t_selected[2].cel+1], 'p2AnimWin', 230, 158, t_selected[2].up, 0.5, 0.5, alphaS)
									end
								end
								if data.randomPortrait == "Fixed" and p2member1Random == true then
									
								else
									f_drawCharAnim(t_selChars[t_selected[1].cel+1], 'p2AnimWin', 230, 90, t_selected[1].up, 0.5, 0.5, alphaS)
								end
							elseif p2numChars == 3 then
								if j == 3 then
									if data.randomPortrait == "Fixed" and p2member3Random == true then
										
									else
										f_drawCharAnim(t_selChars[t_selected[3].cel+1], 'p2AnimWin', 250, 158, t_selected[3].up, 0.5, 0.5, alphaS)
									end
								end
								if j == 2 then
									if data.randomPortrait == "Fixed" and p2member2Random == true then
										
									else
										f_drawCharAnim(t_selChars[t_selected[2].cel+1], 'p2AnimWin', 310, 158, t_selected[2].up, 0.5, 0.5, alphaS)
									end
								end
								if data.randomPortrait == "Fixed" and p2member1Random == true then
									
								else
									f_drawCharAnim(t_selChars[t_selected[1].cel+1], 'p2AnimWin', 280, 89, t_selected[1].up, 0.5, 0.5, alphaS)
								end
							elseif p2numChars == 4 then
								if j == 4 then
									if data.randomPortrait == "Fixed" and p2member4Random == true then
										
									else
										f_drawCharAnim(t_selChars[t_selected[4].cel+1], 'p2AnimWin', 250, 158, t_selected[4].up, 0.5, 0.5, alphaS)
									end
								end
								if j == 3 then
									if data.randomPortrait == "Fixed" and p2member3Random == true then
										
									else
										f_drawCharAnim(t_selChars[t_selected[3].cel+1], 'p2AnimWin', 310, 158, t_selected[3].up, 0.5, 0.5, alphaS)
									end
								end
								if j == 2 then
									if data.randomPortrait == "Fixed" and p2member2Random == true then
										
									else
										f_drawCharAnim(t_selChars[t_selected[2].cel+1], 'p2AnimWin', 250, 89, t_selected[2].up, 0.5, 0.5, alphaS)
									end
								end
								if data.randomPortrait == "Fixed" and p2member1Random == true then
									
								else
									f_drawCharAnim(t_selChars[t_selected[1].cel+1], 'p2AnimWin', 310, 89, t_selected[1].up, 0.5, 0.5, alphaS)
								end
							end
						end
					end
				end
			end
		end
		for j=#t_selected, 1, -1 do --Again to set priority over sprites
			if not exclusiveStageMenu then
				if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
					if p2numChars == 1 then
						if data.randomPortrait == "Fixed" and p2member1Random == true then
							f_drawQuickText(txt_p2RandomMember1, jgFnt, 5, -1, "RANDOM SELECT 1", 310, 165, 0.8, 0.8)
						else
							f_drawSelectName(txt_p2Name, t_selected[1], 310, 165)
						end
					elseif p2numChars == 2 then
						if j == 2 then
							if data.charPresentation == "Portrait" then
								if data.randomPortrait == "Fixed" and p2member2Random == true then
									f_drawQuickText(txt_p2RandomMember2, jgFnt, 5, -1, "RANDOM SELECT 2", 318, 100, 0.8, 0.8)
								else
									f_drawSelectName(txt_p2Name, t_selected[2], 318, 100)
								end
							elseif data.charPresentation == "Mixed" then
								if data.randomPortrait == "Fixed" and p2member2Random == true then
									f_drawQuickText(txt_p2RandomMember2, jgFnt, 5, -1, "RANDOM SELECT 2", 254, 100, 0.5, 0.5)
								else
									f_drawSelectName(txt_p2Name, t_selected[2], 254, 100, 0.5, 0.5)
								end
							end
						end
						if data.charPresentation == "Portrait" then
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								f_drawQuickText(txt_p2RandomMember1, jgFnt, 5, -1, "RANDOM SELECT 1", 318, 88, 0.8, 0.8)
							else
								f_drawSelectName(txt_p2Name, t_selected[1], 318, 88)
							end
						elseif data.charPresentation == "Mixed" then
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								f_drawQuickText(txt_p2RandomMember1, jgFnt, 5, -1, "RANDOM SELECT 1", 254, 30, 0.5, 0.5)
							else
								f_drawSelectName(txt_p2Name, t_selected[1], 254, 30, 0.5, 0.5)
							end
						end
					elseif p2numChars == 3 then
						if j == 3 then
							if data.randomPortrait == "Fixed" and p2member3Random == true then
								f_drawQuickText(txt_p2RandomMember3, jgFnt, 5, -1, "RANDOM SELECT 3", 254, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p2Name, t_selected[3], 254, 100, 0.5, 0.5)
							end
						end
						if j == 2 then
							if data.randomPortrait == "Fixed" and p2member2Random == true then
								f_drawQuickText(txt_p2RandomMember2, jgFnt, 5, -1, "RANDOM SELECT 2", 320, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p2Name, t_selected[2], 320, 100, 0.5, 0.5)
							end
						end
						if data.charPresentation == "Portrait" then
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								f_drawQuickText(txt_p2RandomMember1, jgFnt, 5, -1, "RANDOM SELECT 1", 318, 88, 0.8, 0.8)
							else
								f_drawSelectName(txt_p2Name, t_selected[1], 318, 88)
							end
						elseif data.charPresentation == "Mixed" then
							if data.randomPortrait == "Fixed" and p2member1Random == true then
								f_drawQuickText(txt_p2RandomMember1, jgFnt, 5, -1, "RANDOM SELECT 1", 290, 30, 0.5, 0.5)
							else
								f_drawSelectName(txt_p2Name, t_selected[1], 290, 30, 0.5, 0.5)
							end
						end
					elseif p2numChars == 4 then
						if j == 4 then
							if data.randomPortrait == "Fixed" and p2member4Random == true then
								f_drawQuickText(txt_p2RandomMember4, jgFnt, 5, -1, "RANDOM SELECT 4", 254, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p2Name, t_selected[4], 254, 100, 0.5, 0.5)
							end
						end
						if j == 3 then
							if data.randomPortrait == "Fixed" and p2member3Random == true then
								f_drawQuickText(txt_p2RandomMember3, jgFnt, 5, -1, "RANDOM SELECT 3", 320, 100, 0.5, 0.5)
							else
								f_drawSelectName(txt_p2Name, t_selected[3], 320, 100, 0.5, 0.5)
							end
						end
						if j == 2 then
							if data.randomPortrait == "Fixed" and p2member2Random == true then
								f_drawQuickText(txt_p2RandomMember2, jgFnt, 5, -1, "RANDOM SELECT 2", 254, 30, 0.5, 0.5)
							else
								f_drawSelectName(txt_p2Name, t_selected[2], 254, 30, 0.5, 0.5)
							end
						end
						if data.randomPortrait == "Fixed" and p2member1Random == true then
							f_drawQuickText(txt_p2RandomMember1, jgFnt, 5, -1, "RANDOM SELECT 1", 320, 30, 0.5, 0.5)
						else
							f_drawSelectName(txt_p2Name, t_selected[1], 320, 30, 0.5, 0.5)
						end
					end
				elseif data.charPresentation == "Sprite" then
					if j == 4 then
						if data.randomPortrait == "Fixed" and p2member4Random == true then
							f_drawQuickText(txt_p2RandomMember4, jgFnt, 5, -1, "RANDOM SELECT 4", 308, 166, 0.8, 0.8)
						else
							f_drawSelectName(txt_p2Name, t_selected[4], 308, 166)
						end
					end
					if j == 3 then
						if data.randomPortrait == "Fixed" and p2member3Random == true then
							f_drawQuickText(txt_p2RandomMember3, jgFnt, 5, -1, "RANDOM SELECT 3", 312, 160, 0.8, 0.8)
						else
							f_drawSelectName(txt_p2Name, t_selected[3], 312, 160)
						end
					end
					if j == 2 then
						if data.randomPortrait == "Fixed" and p2member2Random == true then
							f_drawQuickText(txt_p2RandomMember2, jgFnt, 5, -1, "RANDOM SELECT 2", 316, 154, 0.8, 0.8)
						else
							f_drawSelectName(txt_p2Name, t_selected[2], 316, 154)
						end
					end
					if data.randomPortrait == "Fixed" and p2member1Random == true then
						f_drawQuickText(txt_p2RandomMember1, jgFnt, 5, -1, "RANDOM SELECT 1", 320, 148, 0.8, 0.8)
					else
						f_drawSelectName(txt_p2Name, t_selected[1], 320, 148)
					end
				end
				if data.charInfo == "Author" then
					if t_selChars[p2Cell+1].author ~= nil or getCharName(p2Cell) == "Random" then
						if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
							if p2numChars == 1 then
								if data.randomPortrait == "Fixed" and p2member1Random == true then
									--Keep random author as: ???
								else
									textImgSetText(txt_p2Author, txt_authorText..t_selected[1].author)
								end
								textImgDraw(txt_p2Author)
							elseif p2numChars == 2 then
								if j == 2 then
									if data.randomPortrait == "Fixed" and p2member2Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[2].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 320, 165, 0.65, 0.65)
								end
								if j == 1 then
									if data.randomPortrait == "Fixed" and p2member1Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[1].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 320, 20, 0.65, 0.65)
								end
							elseif p2numChars == 3 then
								if j == 3 then
									if data.randomPortrait == "Fixed" and p2member3Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[3].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 260, 95, 0.5, 0.5)
								end
								if j == 2 then
									if data.randomPortrait == "Fixed" and p2member2Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[2].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 320, 165, 0.5, 0.5)
								end
								if j == 1 then
									if data.randomPortrait == "Fixed" and p2member1Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[1].author)
									end
									textImgScalePosDraw(txt_p2Author, 320, 25, 0.5, 0.5)
								end
							elseif p2numChars == 4 then
								if j == 4 then
									if data.randomPortrait == "Fixed" and p2member4Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[4].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 260, 95, 0.5, 0.5)
								end
								if j == 3 then
									if data.randomPortrait == "Fixed" and p2member3Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[3].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 320, 165, 0.5, 0.5)
								end
								if j == 2 then
									if data.randomPortrait == "Fixed" and p2member2Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[2].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 260, 89, 0.5, 0.5)
								end
								if j == 1 then
									if data.randomPortrait == "Fixed" and p2member1Random == true then
									--
									else
										textImgSetText(txt_p2Author, txt_authorText..t_selected[1].author)
										
									end
									textImgScalePosDraw(txt_p2Author, 320, 25, 0.5, 0.5)
								end
							end
						elseif data.charPresentation == "Sprite" then
							if data.randomPortrait == "Fixed" and p2member1Random == true then
							--
							else
								textImgSetText(txt_p2Author, txt_authorText..t_selected[j].author)
							end
							textImgPosDraw(txt_p2Author, 320, 20+10*(j-1), 0.65, 0.65)
						end
					end
				end
			end
		end
		if p2coopReady then --Draw Player 2 Selected Assets for Co-Op Mode
			--Portrait
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				if data.randomPortrait == "Fixed" and p2coopRandom == true then
					if data.charPresentation == "Portrait" then
						f_drawQuickSpr(p1randomPortrait, 0, 90, 1, 0.5)
					elseif data.charPresentation == "Mixed" then
						f_drawQuickSpr(p1randomPortrait, 0, 90, 0.5, 0.5)
					end
				else
					if data.charPresentation == "Portrait" then
						drawPortrait(data.t_p1selected[2].cel, 0, 90, 1, 0.5)
					elseif data.charPresentation == "Mixed" then
						drawPortrait(data.t_p1selected[2].cel, 0, 90, 0.5, 0.5)
					end
				end
			end
			--Animated Sprite
			if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
				if data.charPresentation == "Sprite" then
					if data.randomPortrait == "Fixed" and p2coopRandom == true then
						f_drawQuickSpr(p1randomSprite, 48, 75)
					else
						f_drawCharAnim(t_selChars[data.t_p1selected[2].cel+1], 'p1AnimWin', 68, 164, data.t_p1selected[2].up, 1, 1, alphaS)
					end
				elseif data.charPresentation == "Mixed" then
					if data.randomPortrait == "Fixed" and p2coopRandom == true then
						--
					else
						f_drawCharAnim(t_selChars[data.t_p1selected[2].cel+1], 'p1AnimWin', 90, 158, data.t_p1selected[2].up, 0.5, 0.5, alphaS)
					end
				end
			end
			--Name
			if data.charPresentation == "Portrait" then
				if data.randomPortrait == "Fixed" and p2coopRandom == true then
					f_drawQuickText(txt_p2RandomMember2, jgFnt, 5, -1, "RANDOM SELECT 2", 116, 100, 0.8, 0.8)
				else
					f_drawSelectName(txt_p2Name, data.t_p1selected[2], 116, 100)
				end	
			elseif data.charPresentation == "Mixed" then
				if data.randomPortrait == "Fixed" and p2coopRandom == true then
					f_drawQuickText(txt_p2RandomMember2, jgFnt, 5, 1, "RANDOM SELECT 2", 66, 100, 0.5, 0.5)
				else
					f_drawSelectName(txt_p2Name, data.t_p1selected[2], 66, 100, 0.5, 0.5)
				end
			end
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				--Author
				if data.randomPortrait == "Fixed" and p2coopRandom == true then
				--
				else
					textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[2].author)
				end
				textImgScalePosDraw(txt_p1Author, 0, 165, 0.65, 0.65)
			elseif data.charPresentation == "Sprite" then
				if data.randomPortrait == "Fixed" and p2coopRandom == true then
					--
				else
					textImgSetText(txt_p1Author, txt_authorText..data.t_p1selected[j].author)
				end
				textImgScalePosDraw(txt_p1Author, 0, 30, 0.65, 0.65)
			end
		end
		if not p2SelEnd then
			local tmpCelX = p2SelX
			local tmpCelY = p2SelY
			if backScreen == false and p2PalEnd then
				if commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufSel2u >= 30) then
					local foundCel = false
					while true do
						if foundCel then
							break
						end
						p2SelY, p2FaceOffset, p2OffsetRow = f_findCelYSub(p2SelY, p2FaceOffset, p2OffsetRow)
						if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then
							foundCel = true
						else
							for i=0, tmpCelX do
								p2SelX = f_findCelXSub(p2SelX, false)
								if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then
									foundCel = true
									break
								end
							end
							if not foundCel then
								p2SelX = tmpCelX
								for i=1, selectColumns-tmpCelX do
									p2SelX = f_findCelXAdd(p2SelX, false)
									if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then
										foundCel = true
										break
									end
								end
								if not foundCel then
									p2SelX = tmpCelX
								end
							end
						end
					end
					if tmpCelY ~= p2SelY or tmpCelX ~= p2SelX then
						sndPlay(sysSnd, 100, 0)
					end
				elseif commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufSel2d >= 30) then
					local foundCel = false
					while true do
						if foundCel then
							break
						end
						p2SelY, p2FaceOffset, p2OffsetRow = f_findCelYAdd(p2SelY, p2FaceOffset, p2OffsetRow)
						if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then
							foundCel = true
						else
							for i=1, selectColumns-tmpCelX do
								p2SelX = f_findCelXAdd(p2SelX, false)
								if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then
									foundCel = true
									break
								end
							end
							if not foundCel then
								p2SelX = tmpCelX
								for i=0, tmpCelX do
									p2SelX = f_findCelXSub(p2SelX, false)
									if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then
										foundCel = true
										break
									end
								end
								if not foundCel then
									p2SelX = tmpCelX
								end
							end
						end
					end
					if tmpCelY ~= p2SelY or tmpCelX ~= p2SelX then
						sndPlay(sysSnd, 100, 0)
					end
				elseif commandGetState(p2Cmd, 'l') or (commandGetState(p2Cmd, 'holdl') and bufSel2l >= 30) then
					while true do
						p2SelX = f_findCelXSub(p2SelX, wrappingX)
						if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then break end
					end
					if tmpCelX ~= p2SelX then
						sndPlay(sysSnd, 100, 0)
					end
				elseif commandGetState(p2Cmd, 'r') or (commandGetState(p2Cmd, 'holdr') and bufSel2r >= 30) then
					while true do
						p2SelX = f_findCelXAdd(p2SelX, wrappingX)
						if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then break end
					end
					if tmpCelX ~= p2SelX then
						sndPlay(sysSnd, 100, 0)
					end
				end
				if commandGetState(p2Cmd, 's') then
					if data.palType == "Modern" then
						sndPlay(sysSnd, 100, 3)
						p2PalEnd = false
					end
				end
				if commandGetState(p2Cmd, 'holdu') then
					bufSel2d = 0
					bufSel2u = bufSel2u + 1
				elseif commandGetState(p2Cmd, 'holdd') then
					bufSel2u = 0
					bufSel2d = bufSel2d + 1
				elseif commandGetState(p2Cmd, 'holdr') then
					bufSel2l = 0
					bufSel2r = bufSel2r + 1
				elseif commandGetState(p2Cmd, 'holdl') then
					bufSel2r = 0
					bufSel2l = bufSel2l + 1
				else
					bufSel2u = 0
					bufSel2d = 0
					bufSel2r = 0
					bufSel2l = 0
				end
			end
			p2Cell = p2SelX + selectColumns*p2SelY
			p2Portrait = p2Cell
			--Draw Hidden Rows Cursors
			if offsetRows >= 1 and not data.p2Faces then
				animDraw(arrowsUSR)
				animUpdate(arrowsUSR)
				animDraw(arrowsDSR)
				animUpdate(arrowsDSR)
			elseif offsetRows >= 1 and data.p2Faces then
				animDraw(arrowsUMR2)
				animUpdate(arrowsUMR2)
				animDraw(arrowsDMR2)
				animUpdate(arrowsDMR2)
			end
			if data.charInfo == "Author" then
				if t_selChars[p2Cell+1].author ~= nil or getCharName(p2Cell) == "Random" then
					if t_selChars[p2Cell+1].author ~= nil then
						textImgSetText(txt_p2Author, txt_authorText..t_selChars[p2Cell+1].author)
					else
						textImgSetText(txt_p2Author, txt_authorText.."???")
					end
					if data.coop then
						textImgSetAlign(txt_p2Author, 1)
						if data.charPresentation == "Sprite" then
							textImgScalePosDraw(txt_p2Author, 0, 30, 0.65, 0.65)
						else
							textImgScalePosDraw(txt_p2Author, 0, 165, 0.65, 0.65)
						end
					else
						textImgSetAlign(txt_p2Author, -1)
						textImgScalePosDraw(txt_p2Author, 320, 20, 0.65, 0.65)
						--textImgDraw(txt_p2Author)
					end
				end
			end
			textImgSetBank(txt_p2Name, 0)
			textImgSetText(txt_p2Name, f_getName(p2Cell))
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				if p2numChars == 1 then
					textImgScalePosDraw(txt_p2Name, 310, 165, 0.8, 0.8)
				elseif p2numChars == 2 then
					if data.coop then
						if data.charPresentation == "Portrait" then
							textImgScalePosDraw(txt_p2Name, 116, 100, 0.8, 0.8)
						elseif data.charPresentation == "Mixed" then
							textImgScalePosDraw(txt_p2Name, 116, 100, 0.5, 0.5)
						end
					else
						if p2memberPreview == 1 then
							if data.charPresentation == "Portrait" then
								textImgScalePosDraw(txt_p2Name, 318, 88, 0.8, 0.8)
							elseif data.charPresentation == "Mixed" then
								textImgScalePosDraw(txt_p2Name, 254, 30, 0.5, 0.5)
							end
						end
						if p2memberPreview == 2 then
							if data.charPresentation == "Portrait" then
								textImgScalePosDraw(txt_p2Name, 318, 100, 0.8, 0.8)
							elseif data.charPresentation == "Mixed" then
								textImgScalePosDraw(txt_p2Name, 254, 100, 0.5, 0.5)
							end
						end
					end
				elseif p2numChars == 3 then
					if p2memberPreview == 1 then
						if data.charPresentation == "Portrait" then
							textImgScalePosDraw(txt_p2Name, 318, 88, 0.8, 0.8)
						elseif data.charPresentation == "Mixed" then
							textImgScalePosDraw(txt_p2Name, 290, 30, 0.5, 0.5)
						end
					end
					if p2memberPreview == 2 then textImgScalePosDraw(txt_p2Name, 320, 100, 0.5, 0.5) end
					if p2memberPreview == 3 then textImgScalePosDraw(txt_p2Name, 254, 100, 0.5, 0.5) end
				elseif p2numChars == 4 then
					if p2memberPreview == 1 then textImgScalePosDraw(txt_p2Name, 320, 30, 0.5, 0.5) end
					if p2memberPreview == 2 then textImgScalePosDraw(txt_p2Name, 254, 30, 0.5, 0.5) end
					if p2memberPreview == 3 then textImgScalePosDraw(txt_p2Name, 320, 100, 0.5, 0.5) end
					if p2memberPreview == 4 then textImgScalePosDraw(txt_p2Name, 254, 100, 0.5, 0.5) end
				end
			elseif data.charPresentation == "Sprite" then
				if data.coop then
					textImgPosDraw(txt_p2Name, 150, 156)
				else
					if p2memberPreview == 1 then
						textImgPosDraw(txt_p2Name, 320, 148)
					elseif p2memberPreview == 2 then
						textImgPosDraw(txt_p2Name, 316, 154)
					elseif p2memberPreview == 3 then
						textImgPosDraw(txt_p2Name, 312, 160)
					elseif p2memberPreview == 4 then
						textImgPosDraw(txt_p2Name, 308, 166)
					end
				end
			end
			animPosDraw(p2ActiveCursor, p2FaceX+p2SelX*(27+2), p2FaceY+(p2SelY-p2OffsetRow)*(27+2))
		--Back to Team Menu Logic
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				if commandGetState(p2Cmd, 'e') then
					if serviceBack == true then
						f_p2sideReset()
						p2TeamEnd = true
						p2BG = true
						p2memberPreview = 1
					elseif p2SelBack == true then
						sndPlay(sysSnd, 100, 2)
						f_p2sideReset()
					end
				end
			else
				if commandGetState(p1Cmd, 'e') and p2SelBack == true and not data.coop then
					sndPlay(sysSnd, 100, 2)
					f_p2sideReset()
				end
			end
			if btnPalNo(p2Cmd) > 0 then
				if t_selChars[p2Cell+1].unlock == nil or t_selChars[p2Cell+1].unlock == 1 or onlinegame then
					f_p2Selection()
				elseif t_selChars[p2Cell+1].unlock == 0 and not onlinegame then
					sndPlay(sysSnd, 100, 5)
				end
			elseif selectTimer == 0 then
				if t_selChars[p2Cell+1].unlock == 0 and not onlinegame then
					p2Cell = t_randomChars[math.random(#t_randomChars)]
				end
				f_p2Selection()
			end
			if data.debugLog then
				f_printTable(data.t_p2selected, "save/debug/data.t_p2selected.txt")
				f_printTable(t_selected, "save/debug/t_selected.txt")
			end
		end
	end
end

function f_p2Selection()
	sndPlay(sysSnd, 100, 1)
	local cel = p2Cell
	if getCharName(cel) == "Random" then
		randomP2Rematch = true
		cel = t_randomChars[math.random(#t_randomChars)]
		if data.coop then p2coopRandom = true end
		if p2memberPreview == 1 then p2member1Random = true	end
		if p2memberPreview == 2 then p2member2Random = true	end
		if p2memberPreview == 3 then p2member3Random = true	end
		if p2memberPreview == 4 then p2member4Random = true	end
	else
		f_p2charAnnouncer()
	end
	if p2numChars > 1 and not data.coop then
		if p2memberPreview == 1 then p2memberPreview = 2
		elseif p2memberPreview == 2 then p2memberPreview = 3
		elseif p2memberPreview == 3 then p2memberPreview = 4
		elseif p2memberPreview == 4 then p2memberPreview = 1
		end
	end
	local updateAnim = true
	if data.palType == "Classic" then
		p2palSelect = btnPalNo(p2Cmd)
		if selectTimer == 0 then p2palSelect = 1 end --Avoid freeze when Character Select timer is over and there is not are a palette selected
	elseif data.palType == "Modern" then
		p2palSelect = p2palSelect
	end
	if data.coop then
		for i=1, #data.t_p1selected do
			if data.t_p1selected[i].cel == p2Cell then 
				updateAnim = false
			end
		end
		data.t_p1selected[2] = {['cel'] = cel, ['name'] = t_selChars[cel+1].name, ['displayname'] = t_selChars[cel+1].displayname, ['path'] = t_selChars[cel+1].char, ['pal'] = p2palSelect, ['up'] = updateAnim, ['author'] = t_selChars[cel+1].author}
		p2coopReady = true
		p2SelEnd = true
	else
		for i=1, #data.t_p2selected do
			if data.t_p2selected[i].cel == p2Cell then 
				updateAnim = false
			end
		end
		data.t_p2selected[#data.t_p2selected+1] = {['cel'] = cel, ['name'] = t_selChars[cel+1].name, ['displayname'] = t_selChars[cel+1].displayname, ['path'] = t_selChars[cel+1].char, ['pal'] = p2palSelect, ['up'] = updateAnim, ['author'] = t_selChars[cel+1].author}
		if #data.t_p2selected == p2numChars then
			--
			if data.p1In == 2 and matchNo == 0 then
				p1TeamEnd = false
				p1SelEnd = false
				--commandBufReset(p1Cmd)
			end
			--
			p2SelEnd = true
		end
	end
	cmdInput()
end

--;===========================================================
--; STAGE SELECT SCREENPACK
--;===========================================================
txt_stageSelect = createTextImg(jgFnt, 0, 0, "STAGE SELECT", 159, 13)
txt_authorStageText = "AUTHOR: "
txt_locationStageText = "LOCATION: "
txt_daytimeStageText = "TIME: "

--Stage Title background
selectSBG2a = animNew(sysSff, [[
102,0, 0,2, -1, 0, s
]])
animAddPos(selectSBG2a, 160, 192)
animSetTile(selectSBG2a, 1, 0)

--Stage Title background B
selectSBG2b = animNew(sysSff, [[
102,1, 0,2, -1, 0, a
]])
animAddPos(selectSBG2b, 160, 192)
animSetTile(selectSBG2b, 1, 0)

--Stage Title background C
selectSBG2c = animNew(sysSff, [[
102,2, 0,2, -1, 0, a
]])
animAddPos(selectSBG2c, 160, 192)
animSetTile(selectSBG2c, 1, 0)

--Stage Select Title background
selectSTBG2a = animNew(sysSff, [[
102,0, 0,2, -1, 0, s
]])
animAddPos(selectSTBG2a, 160, 46)
animSetTile(selectSTBG2a, 1, 0)

--Stage Select Title background B
selectSTBG2b = animNew(sysSff, [[
102,1, 0,2, -1, 0, a
]])
animAddPos(selectSTBG2b, 160, 46)
animSetTile(selectSTBG2b, 1, 0)

--Stage Select Title background C
selectSTBG2c = animNew(sysSff, [[
102,2, 0,2, -1, 0, a
]])
animAddPos(selectSTBG2c, 160, 46)
animSetTile(selectSTBG2c, 1, 0)

--Classic Stage Select
selStage = animNew(sysSff, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStage, 83.5, 166)
animUpdate(selStage)

--Modern Stage Select
selStageM = animNew(sysSff, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStageM, 0.4, 63)
animUpdate(selStageM)
animSetScale(selStageM, 2.10, 2.10)

--Classic Stage 0 (Random Icon)
stage0 = animNew(sysSff, [[
110,3, 0,0,
]])
animAddPos(stage0, 115, 172)
animUpdate(stage0)
animSetScale(stage0, 0.98, 0.98)

--Modern Stage 0 (Random Icon)
stage0M = animNew(sysSff, [[
110,3, 0,0,
]])
animSetPos(stage0M, 66, 76)
animUpdate(stage0M)
animSetScale(stage0M, 2.09, 2.09)

--Classic Lock
stageLock = animNew(sysSff, [[
108,0, 0,0,
]])
animAddPos(stageLock, 144, 178)
animSetScale(stageLock, 0.10, 0.10)
animUpdate(stageLock)

--Modern Lock
stageMLock = animNew(sysSff, [[
108,0, 0,0,
]])
animAddPos(stageMLock, 130.5, 90)
animSetScale(stageMLock, 0.20, 0.20)
animUpdate(stageMLock)

--Classic Locked Fade Window
stageLockWindowBG = animNew(sysSff, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(stageLockWindowBG, 114, 172)
animSetScale(stageLockWindowBG, 91.5, 51)
animUpdate(stageLockWindowBG)

--Modern Locked Fade Window
stageMLockWindowBG = animNew(sysSff, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(stageMLockWindowBG, 64, 74)
animSetScale(stageMLockWindowBG, 192, 108)
animUpdate(stageMLockWindowBG)

--;===========================================================
--; STAGE SELECT MENU
--;===========================================================
function f_selectStage()
	if data.debugLog then f_printTable(data.t_p1selected, "save/debug/data.t_p1selected.txt") end
	if data.stageMenu then --If Stage Select is Enabled
		stageMenuActive = true --To Delete content from previous menu
		if data.rosterAdvanced == true then
			f_loadCharResources() --Because in selectAdvanced for some side, there's not a character loaded
		else --selectSimple game modes
		--Logic For Auto Characters Song
			p1charSong = ""
			if t_selChars[data.t_p1selected[1].cel+1].music ~= nil then
				p1charSong = math.random(1,#t_selChars[data.t_p1selected[1].cel+1].music) --if there are more than 1 song assigned for that character, pick 1 of them via randomizer
				p1charSong = t_selChars[data.t_p1selected[1].cel+1].music[p1charSong].bgmusic --data.t_p1selected[1] means that data (music) will taken from 1st char member selected in any team mode, but if you set data.t_p1selected[2] will get data from the 2nd member of a team mode.
				p1song = true
			else --If there no music assigned for left side character
				p1song = false
			end
			p2charSong = ""
			if t_selChars[data.t_p2selected[1].cel+1].music ~= nil then
				p2charSong = math.random(1,#t_selChars[data.t_p2selected[1].cel+1].music)
				p2charSong = t_selChars[data.t_p2selected[1].cel+1].music[p2charSong].bgmusic
				p2song = true
			else --If there no music assigned for right side character
				p2song = false
			end
		--Logic For Auto Characters Stage
			if t_selChars[data.t_p1selected[1].cel+1].stage ~= nil then
				p1charStage = math.random(1,#t_selChars[data.t_p1selected[1].cel+1].stage) --if there are more than 1 stage assigned for that character, pick 1 of them via randomizer
				p1charStage = t_selChars[data.t_p1selected[1].cel+1].stage[p1charStage] --data.t_p1selected[1] means that data (stage) will taken from 1st char member selected in any team mode, but if you set data.t_p1selected[2] will get data from the 2nd member of a team mode.
				p1stage = true
			else --If there no stage assigned for left side character
				p1stage = false
			end
			if t_selChars[data.t_p2selected[1].cel+1].stage ~= nil then
				p2charStage = math.random(1,#t_selChars[data.t_p2selected[1].cel+1].stage)
				p2charStage = t_selChars[data.t_p2selected[1].cel+1].stage[p2charStage]
				p2stage = true
			else
				--If there no stage assigned for right side character
				p2stage = false
			end
		end
	--Set screen Assets
		if data.stageType == "Classic" then
			--Info Text
			txt_selStage = createTextImg(jgFnt, 0, 0, "", 160, 239)
			txt_selectMusic = createTextImg(jgFnt, 0, 0, "", 158, 170.5,0.5,0.5)
			txt_stageAuthor = createTextImg(jgFnt, 0, 1, "", 206.5, 186,0.5,0.5)
			txt_stageLocation = createTextImg(jgFnt, 0, 0, "", 159, 227,0.5,0.5)
			txt_stageDayTime = createTextImg(jgFnt, 0, -1, "", 112, 186,0.5,0.5)
		elseif data.stageType == "Modern" then
			exclusiveStageMenu = true
			--Info Text
			txt_selStage = createTextImg(jgFnt, 0, 0, "", 160, 205)
			txt_selectMusic = createTextImg(jgFnt, 0, 0, "", 158, 60)
			txt_stageAuthor = createTextImg(jgFnt, 0, 0, "", 159, 235)
			txt_stageLocation = createTextImg(jgFnt, 0, 0, "", 159, 220)
			txt_stageDayTime = createTextImg(jgFnt, 0, 0, "", 159, 190)
			--Draw Stage Select Title BG
			animDraw(f_animVelocity(selectSTBG2a, -1, 0))
			animDraw(f_animVelocity(selectSTBG2b, -3, 0))
			animDraw(f_animVelocity(selectSTBG2c, -6, 0))
			--Draw Stage Name BG
			animDraw(f_animVelocity(selectSBG2a, 1, 0))
			animDraw(f_animVelocity(selectSBG2b, 3, 0))
			animDraw(f_animVelocity(selectSBG2c, 6, 0))
			--Draw Stage Title Text
			textImgDraw(txt_stageSelect)
		end
		--if stageAnnouncer == false then
			if backScreen == false and stageAnnouncer == false then
				if commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
					if stageSelect == true then
						--sndPlay(sysSnd, 100, 0)
						--TO-DO: Alternative Stage Code Like Ikemen Go Chars Slots
					end
					if songSelect == true then --Song Preview
						if stageList == 0 then
						--Do Nothing because Song Preview for Random Stage will get an Error because it can't detect which Stage will be Selected (can be resolved by adding a Song selection Menu Apart from the stage selection, it will work when a Stage was selected)
						else 
							f_musicPreview()
						end
					end
				elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
					sndPlay(sysSnd, 100, 0)
					if bufStagel then bufStagel = 0 end
					if bufStager then bufStager = 0 end
					--Allow Stage Select
					if stageSelect == true then
						stageSelect = false
					elseif stageSelect == false then
						stageSelect = true
					end
					--Allow Song Select
					if songSelect == true then
						songSelect = false
					elseif songSelect == false then
						songSelect = true
					end
				elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
					sndPlay(sysSnd, 100, 0)
					if bufStagel then bufStagel = 0 end
					if bufStager then bufStager = 0 end
					--Allow Stage Select
					if stageSelect == true then
						stageSelect = false
					elseif stageSelect == false then
						stageSelect = true
					end
					--Allow Song Select
					if songSelect == true then
						songSelect = false
					elseif songSelect == false then
						songSelect = true
					end
				elseif (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufStager >= 30) then
					sndPlay(sysSnd, 100, 0)
					if stageSelect == true then
					--Auto Right Side Stage Logic
						if stageList == 0 and not p1autoSlot then
							if p2stage == true and not p2autoSlot then --Go to Auto Stage
								p2autoSlot = true
								--stageList = 0
							elseif not p2stage then --Skip Player 2 Stage if is not assigned (Go to next stage)
								stageList = stageList + 1
							elseif p2stage == true and p2autoSlot == true then --Go to first stage loaded
								p2autoSlot = false
								stageList = stageList + 1
							end
						elseif stageList ~= 0 then --Normal scrolling between stages loaded
							if not p1autoSlot and not p2autoSlot then
								stageList = stageList + 1
							end
						end
					--Auto Left Side Stage Logic
						if stageList == data.includestage + 1 then
							if p1stage == true and not p1autoSlot then --Go to Auto Stage
								p1autoSlot = true
								stageList = 0
							elseif not p1stage then --Skip Player 1 Stage if is not assigned (Go to random select)
								--p1autoSlot = false
								stageList = 0
							end
						elseif stageList == 0 and p1autoSlot == true then --Go to random select
							p1autoSlot = false
							stageList = 0
						end
					end
					if songSelect == true then
						musicList = musicList + 1
						if musicList == #t_selMusic-1 and not p1song then musicList = musicList + 1 end --Skip Player 1 Song if is not assigned
						if musicList == 1 and not p2song then musicList = musicList + 1 end --Skip Player 2 Song if is not assigned
						if musicList > #t_selMusic-1 then musicList = 0 end
					end
				elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufStagel >= 30) then
					sndPlay(sysSnd, 100, 0)
					if stageSelect == true then
					--Auto Left Side Stage Logic
						if stageList == 0 and not p2autoSlot then
							if p1stage == true and not p1autoSlot then --Go to Auto Stage
								p1autoSlot = true
								stageList = 0
							elseif not p1stage then --Skip Player 1 Stage if is not assigned (Go to lastest stage loaded)
								stageList = data.includestage
							elseif p1stage == true and p1autoSlot == true then --Go to lastest stage loaded
								p1autoSlot = false
								stageList = data.includestage
							end
						elseif stageList ~= 0 then --Normal scrolling between stages loaded
							if not p1autoSlot and not p2autoSlot then
								stageList = stageList - 1
							end
						end
						--Auto Right Side Stage Logic
						if stageList == 0 and p2autoSlot == true then --Go to random select
							p2autoSlot = false
							stageList = 0
						elseif stageList == 0 and not p1autoSlot then
							if p2stage == true and not p2autoSlot then --Go to Auto Stage
								p2autoSlot = true
								stageList = 0
							elseif not p2stage then --Skip Player 2 Stage if is not assigned (Go to random select)
								stageList = 0
							end
						end
					end
					if songSelect == true then
						musicList = musicList - 1
						if musicList < 0 then musicList = #t_selMusic-1 end
						if musicList == #t_selMusic-1 and not p1song then musicList = musicList - 1 end
						if musicList == 1 and not p2song then musicList = musicList - 1 end
					end
				end
			end
		--end
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufStagel = 0
			bufStager = bufStager + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufStager = 0
			bufStagel = bufStagel + 1
		else
			bufStager = 0
			bufStagel = 0
		end
		if data.stageType == "Classic" then
			animUpdate(selStage)
			animDraw(selStage)
		elseif data.stageType == "Modern" then
			animUpdate(selStageM) --Because is an animation need this
			animDraw(selStageM)
		end
	--Stage Data
		if stageList == 0 then
			if p1autoSlot == true then
			--[[Draw Auto Stage Preview
				if data.stageType == "Classic" then
					animUpdate(stagep1)
					animDraw(stagep1)
				elseif data.stageType == "Modern" then
					animUpdate(stagep1M)
					animDraw(stagep1M)
				end
			]]
			--Set Auto Stage Name
				textImgSetText(txt_selStage, "STAGE: AUTO [LEFT SIDE]")
			elseif p2autoSlot == true then
				--[[
				if data.stageType == "Classic" then
					animUpdate(stagep2)
					animDraw(stagep2)
				elseif data.stageType == "Modern" then
					animUpdate(stagep2M)
					animDraw(stagep2M)
				end
				]]
				textImgSetText(txt_selStage, "STAGE: AUTO [RIGHT SIDE]")
			else --random select
				if data.randomStagePortrait == "Roulette" then
					textImgSetText(txt_selStage, "STAGE " .. math.random(1, data.includestage) .. ": " .. t_selStages[math.random(1, data.includestage)].name)
					if data.stageType == "Classic" then
						drawStagePortrait(math.random(1, data.includestage), 114.5, 172, 0.0705, 0.0699)
					elseif data.stageType == "Modern" then
						drawStagePortrait(math.random(1, data.includestage), 64.600, 74.8, 0.149, 0.148)
					end
				elseif data.randomStagePortrait == "Simple" or data.randomStagePortrait == "Fixed" then
					if data.stageType == "Classic" then
						--animUpdate(stage0)
						animDraw(stage0)
					elseif data.stageType == "Modern" then
						--animUpdate(stage0M)
						animDraw(stage0M)
					end
					textImgSetText(txt_selStage, "STAGE: RANDOM SELECT")
				end
			end
		else --Stages Added in select.def
		--Draw Stage Preview (Resolution Recommended for images: 1280x720)
			if data.stageType == "Classic" then
				drawStagePortrait(stageList-1, 114.5, 172, 0.0705, 0.0699)
				if t_selStages[stageList].unlock == 0 and not onlinegame then --Draw Lock stuff
					animDraw(stageLockWindowBG)
					animDraw(stageLock)
				end
			elseif data.stageType == "Modern" then
				drawStagePortrait(stageList-1, 64.600, 74.8, 0.149, 0.148)
				if t_selStages[stageList].unlock == 0 and not onlinegame then
					animDraw(stageMLockWindowBG)
					animDraw(stageMLock)
				end
			end
		--Set Stage Name
			textImgSetText(txt_selStage, "STAGE " .. stageList .. ": " .. t_selStages[stageList].name)
		end
	--BGM Data
		if musicList == #t_selMusic-2 then --Mute
			musicNo = ""
		elseif musicList == #t_selMusic-1 then --Auto Left Side
			musicNo = ""
		elseif musicList == 0 then --Auto Stage
			musicNo = ""
		elseif musicList == 1 then --Auto Right Side
			musicNo = ""
		elseif musicList == 2 then --Random
			musicNo = ""
		else --Loaded Folder Songs
			musicNo = " " .. musicList-2 .. ""
		end
	--Set BGM Name
		textImgSetText(txt_selectMusic, "BGM" .. musicNo .. ": " .. t_selMusic[musicList+1].bgmname)
	--Draw Info Text
		if stageSelect == true then --Draw Stage Cursor Text
			textImgSetBank(txt_selStage, 5)
			textImgSetBank(txt_selectMusic, 0)
			textImgDraw(txt_selStage)
			textImgDraw(txt_selectMusic)
		elseif songSelect == true then --Draw BGM Cursor Text
			textImgSetBank(txt_selStage, 0)
			textImgSetBank(txt_selectMusic, 5)
			textImgDraw(txt_selStage)
			textImgDraw(txt_selectMusic)
		end
	--Set Author Text
		if data.stageInfo == "Author" or data.stageInfo == "All" then
			if stageList == 0 then
				if p1autoSlot == true then --For Auto - Left Side Player Stage
					if t_selStages[p1charStage].author ~= nil and t_selStages[p1charStage].author ~= "" then textImgSetText(txt_stageAuthor, txt_authorStageText..t_selStages[p1charStage].author) end
				elseif p2autoSlot == true then --For Auto - Right Side Player Stage
					if t_selStages[p2charStage].author ~= nil and t_selStages[p2charStage].author ~= "" then textImgSetText(txt_stageAuthor, txt_authorStageText..t_selStages[p2charStage].author) end
				else --For Random Select
					--if data.randomStagePortrait == "Roulette" then
						--if t_selStages[math.random(1, data.includestage)].author ~= nil and t_selStages[math.random(1, data.includestage)].author ~= "" then
							--textImgSetText(txt_stageAuthor, txt_authorStageText..t_selStages[math.random(1, data.includestage)].author)
						--end
					--elseif data.randomStagePortrait == "Simple" or data.randomStagePortrait == "Fixed" then
						textImgSetText(txt_stageAuthor, txt_authorStageText.."???")
					--end
				end
			else --For loaded stages
				if t_selStages[stageList].author ~= nil and t_selStages[stageList].author ~= "" then textImgSetText(txt_stageAuthor, txt_authorStageText..t_selStages[stageList].author) end
			end
			if stageAnnouncer == false then textImgDraw(txt_stageAuthor) end --Draw Info Text
		end
	--Set Location Text
		if data.stageInfo == "Location" or data.stageInfo == "All" then
			if stageList == 0 then
				if p1autoSlot == true then
					if t_selStages[p1charStage].location ~= nil and t_selStages[p1charStage].location ~= "" then textImgSetText(txt_stageLocation, txt_locationStageText..t_selStages[p1charStage].location) end
				elseif p2autoSlot == true then
					if t_selStages[p2charStage].location ~= nil and t_selStages[p2charStage].location ~= "" then textImgSetText(txt_stageLocation, txt_locationStageText..t_selStages[p2charStage].location) end
				else
					--if data.randomStagePortrait == "Roulette" then
						--if t_selStages[math.random(1, data.includestage)].location ~= nil and t_selStages[math.random(1, data.includestage)].location ~= "" then
							--textImgSetText(txt_stageLocation, txt_locationStageText..t_selStages[math.random(1, data.includestage)].location)
						--end
					--elseif data.randomStagePortrait == "Simple" or data.randomStagePortrait == "Fixed" then
						textImgSetText(txt_stageLocation, txt_locationStageText.."???")
					--end
				end
			else
				if t_selStages[stageList].location ~= nil and t_selStages[stageList].location ~= "" then textImgSetText(txt_stageLocation, txt_locationStageText..t_selStages[stageList].location) end
			end
			if stageAnnouncer == false then textImgDraw(txt_stageLocation) end
		end
	--Set Time Text
		if data.stageInfo == "Time" or data.stageInfo == "All" then
			if stageList == 0 then
				if p1autoSlot == true then
					if t_selStages[p1charStage].daytime ~= nil and t_selStages[p1charStage].daytime ~= "" then textImgSetText(txt_stageDayTime, txt_daytimeStageText..t_selStages[p1charStage].daytime) end
				elseif p2autoSlot == true then
					if t_selStages[p2charStage].daytime ~= nil and t_selStages[p2charStage].daytime ~= "" then textImgSetText(txt_stageDayTime, txt_daytimeStageText..t_selStages[p2charStage].daytime) end
				else
					--if data.randomStagePortrait == "Roulette" then
						--if t_selStages[math.random(1, data.includestage)].daytime ~= nil and t_selStages[math.random(1, data.includestage)].daytime ~= "" then
							--textImgSetText(txt_stageDayTime, txt_daytimeStageText..t_selStages[math.random(1, data.includestage)].daytime)
						--end
					--elseif data.randomStagePortrait == "Simple" or data.randomStagePortrait == "Fixed" then
						textImgSetText(txt_stageDayTime, txt_daytimeStageText.."???")
					--end
				end
			else
				if t_selStages[stageList].daytime ~= nil and t_selStages[stageList].daytime ~= "" then textImgSetText(txt_stageDayTime, txt_daytimeStageText..t_selStages[stageList].daytime) end
			end
			if stageAnnouncer == false then textImgDraw(txt_stageDayTime) end
		end
		--Stage Select Timer
		if data.gameMode == "arcade" or data.gameMode == "tower" or data.ftcontrol > 0 or data.attractMode == true then
			if data.stageType == "Classic" then
				--txt_stageTime = createTextImg(jgFnt, 0, 0, (stageTimer/gameTick), 160, 70)
				stageTimeNumber = stageTimer/gameTick
				nodecimalStageTime = string.format("%.0f",stageTimeNumber)
				txt_stageTime = createTextImg(jgFnt, 0, 0, nodecimalStageTime, 160, 70)
			elseif data.stageType == "Modern" then
				--txt_stageTime = createTextImg(jgFnt, 0, 0, (stageTimer/gameTick), 160, 30)
				stageTimeNumber = stageTimer/gameTick
				nodecimalStageTime = string.format("%.0f",stageTimeNumber)
				txt_stageTime = createTextImg(jgFnt, 0, 0, nodecimalStageTime, 160, 30)
			end
			if stageTimer > 0 then
				stageTimer = stageTimer - 0.5 --Activate Stage Select Timer
				textImgDraw(txt_stageTime)
			else --when stageTimer <= 0
				
			end
		end
		--When you select the stage
		if (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or stageTimer == 0) and stageAnnouncer == false then
			if stageList == 0 then --For random or character sides stages
				stageChosen = true
			else --For visible stages
				if t_selStages[stageList].unlock == nil or t_selStages[stageList].unlock == 1 or onlinegame then --This stage is unlocked
					stageChosen = true
				elseif t_selStages[stageList].unlock == 0 and not onlinegame then  --stage locked if unlock=0 paramvalue is in ExtraStages section of select.def
					if stageTimer == 0 then --Select Random Stage to prevent issues when time to select is over
						stageList = 0
						stageChosen = true
					else
						stageChosen = false
						sndPlay(sysSnd, 100, 5)
					end
				end
			end
		--After to verifications, this is the true selection
			if stageChosen then
				stageSelect = false
				songSelect = false
				stageAnnouncer = true
				sndPlay(sysSnd, 100, 1)
				f_stageAnnouncer()
				f_loadStage()
			end
		end
		--create a timer to hear full announcer voice
		if announcerTimer > 55 then
			if data.coop == true then --To avoid issues in Stage Select with Arcade Co-Op
				p2Cell = nil
				p2Portrait = nil
				data.t_p2selected = {}
				p2PalEnd = true
				p2SelEnd = false
			end
			stageEnd = true
			cmdInput()
			--announcerTimer = 0 --Restart Stage Announcer Timer
		end
	--When stage has been selected/announcer is active:
		if stageAnnouncer == true then
			--Apply Color
			textImgSetBank(txt_selectMusic, 2)
			textImgSetBank(txt_selStage, 2)
			textImgSetBank(txt_stageAuthor, 2)
			textImgSetBank(txt_stageLocation, 2)
			textImgSetBank(txt_stageDayTime, 2)
			if stageList == 0 then --For random select
				if data.randomStagePortrait == "Simple" or data.randomStagePortrait == "Roulette" then
					textImgSetText(txt_selStage, "STAGE " .. stageNo .. ": " .. t_selStages[stageNo].name) --Load Selected Stage Name
					if t_selStages[stageNo].author ~= nil and t_selStages[stageNo].author ~= "" then textImgSetText(txt_stageAuthor, txt_authorStageText..t_selStages[stageNo].author) end --Load Selected Stage Author IF is assigned
					if t_selStages[stageNo].location ~= nil and t_selStages[stageNo].location ~= "" then textImgSetText(txt_stageLocation, txt_locationStageText..t_selStages[stageNo].location) end --Load Selected Stage Location IF is assigned
					if t_selStages[stageNo].daytime ~= nil and t_selStages[stageNo].daytime ~= "" then textImgSetText(txt_stageDayTime, txt_daytimeStageText..t_selStages[stageNo].daytime) end --Load Selected Stage Day Time IF is assigned
					if data.stageType == "Classic" then
						drawStagePortrait(stageNo-1, 114.5, 172, 0.0705, 0.0699) --Load Selected Stage Portrait
					elseif data.stageType == "Modern" then
						drawStagePortrait(stageNo-1, 64.600, 74.8, 0.149, 0.148)
					end
				end
			end
			--Re-Draw Selected Stuff
			textImgDraw(txt_selectMusic)
			textImgDraw(txt_selStage)
			if data.stageInfo == "Author" or data.stageInfo == "All" then textImgDraw(txt_stageAuthor) end
			if data.stageInfo == "Location" or data.stageInfo == "All" then textImgDraw(txt_stageLocation) end
			if data.stageInfo == "Time" or data.stageInfo == "All" then textImgDraw(txt_stageDayTime) end
		end
	else --If Stage Select is Disabled
		if data.stage == nil then --Assign Auto Stage via Select.def
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				if t_selChars[data.t_p1selected[1].cel+1].stage ~= nil then
					stageNo = math.random(1,#t_selChars[data.t_p1selected[1].cel+1].stage)
					stageNo = t_selChars[data.t_p1selected[1].cel+1].stage[stageNo]
				else
					stageNo = math.random(1, data.includestage)
				end
			else
				if t_selChars[data.t_p2selected[1].cel+1].stage ~= nil then
					stageNo = math.random(1,#t_selChars[data.t_p2selected[1].cel+1].stage)
					stageNo = t_selChars[data.t_p2selected[1].cel+1].stage[stageNo]
				else
					stageNo = math.random(1, data.includestage)
				end
			end
		else --if data.stage ~= nil then Assign Custom Stage Loaded in select.def via lua script, with data.stage
			local t = {}
			for i=1, #data.stage do
				if t[data.stage[i]] == nil then
					t[data.stage[i]] = ""
				end
				--Get stageNo + Info from table loaded (t_stageDef)
				data.stage[i] = {['cel'] = data.stage[i], ['name'] = t_selStages[data.stage[i]].name, ['path'] = t_selStages[data.stage[i]].stage, ['author'] = t_selStages[data.stage[i]].author, ['location'] = t_selStages[data.stage[i]].location, ['daytime'] = t_selStages[data.stage[i]].daytime}
			end
			if data.debugLog then f_printTable(data.stage, "save/debug/data.stage.txt") end
			--stagePortrait = data.stage[1].cel
			stageNo = data.stage[1].cel
		end
		setStage(stageNo)
		selectStage(stageNo)
		stageEnd = true
	end
end

function f_loadCharResources()
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
	--Logic For Characters Song
		p1song = false
		p2charSong = ""
		if t_selChars[data.t_p2selected[1].cel+1].music ~= nil then
			p2charSong = math.random(1,#t_selChars[data.t_p2selected[1].cel+1].music)
			p2charSong = t_selChars[data.t_p2selected[1].cel+1].music[p2charSong].bgmusic
			p2song = true
		else --If there no music assigned for right side character
			p2song = false
		end
	--Logic For Characters Stages
		p1stage = false
		if t_selChars[data.t_p2selected[1].cel+1].stage ~= nil then
			p2charStage = math.random(1,#t_selChars[data.t_p2selected[1].cel+1].stage)
			p2charStage = t_selChars[data.t_p2selected[1].cel+1].stage[p2charStage]
			p2stage = true
		else
			--If there no stage assigned for right side character
			p2stage = false
		end
	else
		p2song = false
		p1charSong = ""
		if t_selChars[data.t_p1selected[1].cel+1].music ~= nil then
			p1charSong = math.random(1,#t_selChars[data.t_p1selected[1].cel+1].music)
			p1charSong = t_selChars[data.t_p1selected[1].cel+1].music[p1charSong].bgmusic
			p1song = true
		else --If there no music assigned for left side character
			p1song = false
		end
		p2stage = false
		if t_selChars[data.t_p1selected[1].cel+1].stage ~= nil then
			p1charStage = math.random(1,#t_selChars[data.t_p1selected[1].cel+1].stage)
			p1charStage = t_selChars[data.t_p1selected[1].cel+1].stage[p1charStage]
			p1stage = true
		else --If there no stage assigned for left side character
			p1stage = false
		end
	end
end

function f_assignMusic()
	if data.bgm == nil then --Assign Stage Song via stage.def or select.def
		track = ""
		if data.stageMenu then
			if t_selStages[stageNo].music ~= nil then
				track = math.random(1,#t_selStages[stageNo].music)
				track = t_selStages[stageNo].music[track].bgmusic
			end
		else
			if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
				if t_selChars[data.t_p1selected[1].cel+1].music ~= nil then
					track = math.random(1,#t_selChars[data.t_p1selected[1].cel+1].music)
					track = t_selChars[data.t_p1selected[1].cel+1].music[track].bgmusic
				elseif t_selStages[stageNo].music ~= nil then
					track = math.random(1,#t_selStages[stageNo].music)
					track = t_selStages[stageNo].music[track].bgmusic
				end
			else
				if t_selChars[data.t_p2selected[1].cel+1].music ~= nil then
					track = math.random(1,#t_selChars[data.t_p2selected[1].cel+1].music)
					track = t_selChars[data.t_p2selected[1].cel+1].music[track].bgmusic
				elseif t_selStages[stageNo].music ~= nil then
					track = math.random(1,#t_selStages[stageNo].music)
					track = t_selStages[stageNo].music[track].bgmusic
				end
			end
			stageEnd = true
		end
	else --Assign Custom Stage Song via lua script, with data.bgm
		track = data.bgm
		stageEnd = true
	end
	if musicList == #t_selMusic-2 then --Mute Song
		playBGM(bgmNothing)
	elseif musicList == #t_selMusic-1 then --Player 1 Song
		playBGM(p1charSong)
	elseif musicList == 0 then --Auto Stage Song
		playBGM(track)
	elseif musicList == 1 then --Player 2 Song
		playBGM(p2charSong)
	elseif musicList == 2 then --Random Song
		playBGM(t_selMusic[math.random(3, #t_selMusic)].bgmfile)
	else --Sound Folder Song
		playBGM(t_selMusic[musicList+1].bgmfile)
	end
end

function f_musicPreview()
	song = ""
	if t_selStages[stageList].music ~= nil then
		song = math.random(1,#t_selStages[stageList].music)
		song = t_selStages[stageList].music[song].bgmusic
	end
	if musicList == #t_selMusic-2 then --playBGM(bgmNothing)
	elseif musicList == #t_selMusic-1 and p1song then playBGM(p1charSong)
	elseif musicList == 0 then playBGM(song)
	elseif musicList == 1 and p2song then playBGM(p2charSong)
	elseif musicList == 2 then --None because Random Preview Will be different of selected
	else
		playBGM(t_selMusic[musicList+1].bgmfile)
	end
end

function f_stageAnnouncer()
	if getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1') == "Training Room" then sndPlay(announcerSnd, 0,0) --Stage Announcer Voice Example
	elseif getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1') == "Training Room 2" then sndPlay(announcerSnd, 0,0)
	--elseif getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1') == "Your Stage Name" then sndPlay(announcerSnd, 0,1)
	end
end

function f_loadStage()
	if stageList == 0 then
		if p1autoSlot == true then stageNo = p1charStage --Auto - Left Side Player Stage
		elseif p2autoSlot == true then stageNo = p2charStage --Auto - Right Side Player Stage
		else --Random Stage
			if randomStageRematch and data.randomStageRematch == "Fixed" then
				--stageNo = stageNo --Reload Previous Random Stage Selected
			else
				stageNo = math.random(1, data.includestage) --Load a New Random Stage
				randomStageRematch = true
			end
		end
	else stageNo = stageList --Stages Loaded via select.def
	end
	setStage(stageNo)
	selectStage(stageNo)
end

function f_loadSong() --Can be replaced by f_assignMusic() ?
	if musicList == #t_selMusic-1 then playBGM(p1charSong) --Player 1 Song
	elseif musicList == 0 then f_assignMusic() --Auto Stage Song
	elseif musicList == 1 then playBGM(p2charSong) --Player 2 Song
	elseif musicList == 2 then --Random Song
		playBGM(t_selMusic[math.random(3, #t_selMusic)].bgmfile)
	end
end

--;===========================================================
--; MATCH INFO
--;===========================================================
txt_matchNo = createTextImg(font21, 0, 0, "", 160, 20)
txt_gameNo = createTextImg(font21, 0, 0, "", 160, 20)
txt_bossNo = createTextImg(font12, 0, 0, "", 160, 20)
txt_bonusNo = createTextImg(font21, 0, 0, "", 160, 20)

function f_matchInfo() --Not draws! only prepare the info for use in versus screen
--Match Info Vars
	gameNo = gameNo+1
	bossNo = bossNo+1
	bonusNo = bonusNo+1
--Set Match Info Texts
	if data.gameMode == "arcade" and matchNo == data.rivalMatch then textImgSetText(txt_matchNo, "RIVAL MATCH") --Set rival match text
	elseif data.gameMode == "arcade" and matchNo ~= lastMatch then textImgSetText(txt_matchNo, "STAGE: "..matchNo) --Set Arcade Match Text
	elseif data.gameMode == "tower" and matchNo == 1 then textImgSetText(txt_matchNo, "LOW LEVEL") --Set Tower 1st Match Text
	elseif data.gameMode == "tower" and matchNo ~= lastMatch then textImgSetText(txt_matchNo, "FLOOR: "..matchNo-1) --Set Tower Match Text
	end
	if data.gameMode == "survival" or data.gameMode == "allroster" then textImgSetText(txt_gameNo, "REMAINING MATCHES: "..(lastMatch - gameNo)) --Set All Roster Match Text
	elseif data.gameMode == "bossrush" then textImgSetText(txt_bossNo, "REMAINING BOSSES: "..(lastMatch - bossNo)) --Set Boss Rush Match Text
	elseif data.gameMode == "bonusrush" then textImgSetText(txt_bonusNo, "BONUS: "..bonusNo) --Set Bonus Rush Match Text
	elseif data.gameMode == "intermission" then textImgSetText(txt_gameNo, "EXTRA STAGE") --Set Intermission Match Text
	else textImgSetText(txt_gameNo, "MATCH: "..gameNo) --Set Versus Match Text
	end
--Set Final Matchs Text
	if data.gameMode == "arcade" and matchNo == lastMatch then textImgSetText(txt_matchNo, "FINAL STAGE") --Set Arcade Final Match Text
	elseif data.gameMode == "tower" and matchNo == lastMatch then textImgSetText(txt_matchNo, "LAST FLOOR") --Set Tower Final Match Text
	end
	if (data.gameMode == "survival" or data.gameMode == "allroster") and (lastMatch - gameNo == 0) then textImgSetText(txt_gameNo, "FINAL MATCH") --Set All Roster Final Match Text
	elseif data.gameMode == "bossrush" and (lastMatch - bossNo == 0) then textImgSetText(txt_bossNo, "FINAL BOSS") --Set Boss Rush Final Match Text
	elseif data.gameMode == "bonusrush" and (lastMatch - bonusNo == 0) then textImgSetText(txt_bonusNo, "LAST GAME") --Set Bonus Rush Final Match Text
	end
end

--;===========================================================
--; ORDER SELECT AND VERSUS SCREEN COMMON SCREENPACK
--;===========================================================
txt_hints = createTextImg(font5, 0, 0, "", 160, 239)

function f_resetVersusLogo()
--VS Logo
vsLogo = animNew(sysSff, [[
200,4, 0,0, 1
200,3, 0,0, 2
200,2, 0,0, 3
200,1, 0,0, 4
200,0, 0,0, 8
200,5, 0,0, 3
200,6, 0,0, 3
200,7, 0,0, 3
200,8, 0,0, 3
200,0, 0,0, -1
]])
animAddPos(vsLogo, 160, 95)
end

--Background Footer
footerBG = animNew(sysSff, [[
300,0, 0,128, -1
]])
animSetScale(footerBG, 1.2, 1.8)
animAddPos(footerBG, 160, 0)
animSetTile(footerBG, 1, 0)
animUpdate(footerBG)

--;===========================================================
--; ORDER SELECT SCREENPACK
--;===========================================================
txt_orderSelect = createTextImg(font14, 0, 0, "ORDER SELECT", 160, 10)
txt_p1State = createTextImg(jgFnt, 0, 0, "", 78, 25)
txt_p2State = createTextImg(jgFnt, 0, 0, "", 241, 25)
txt_waitingOrder = "WAITING ORDER"
txt_orderFinished = "READY!"

txt_p1NameOrder = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_p2NameOrder = createTextImg(jgFnt, 0, 0, "", 0, 0)

txt_p1OrderNo = createTextImg(jgFnt, 0, 0, "", 9.2, 180)
txt_p2OrderNo = createTextImg(jgFnt, 0, 0, "", 310.2, 180)

--Order Window (left portrait background)
orderWindowL = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(orderWindowL, 160, 0)
animSetTile(orderWindowL, 1, 1)
animSetWindow(orderWindowL, 0, 30, 140, 140)

--Order Window (right portrait background)
orderWindowR = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(orderWindowR, 160, 0)
animSetTile(orderWindowR, 1, 1)
animSetWindow(orderWindowR, 180, 30, 140, 140)

--P1 Order cursor
p1OrderCursor = animNew(sysSff, [[
195,0, 0,0, -1
]])
animSetScale(p1OrderCursor, 0.10, 0.10)
animUpdate(p1OrderCursor)

--P2 Order cursor
p2OrderCursor = animNew(sysSff, [[
195,1, 0,0, -1
]])
animSetScale(p2OrderCursor, 0.10, 0.10)
animUpdate(p2OrderCursor)

t_orderHints = {
	{text = "PRESS LEFT OR RIGHT TO EDIT THE CHARACTERS ORDER"},
	{text = "PRESS UP OR DOWN TO CHOOSE A CHARACTER"},
	{text = "RESS ENTER TO CONFIRM THE ORDER SELECTED"},
	{text = "ADD YOUR HINTS HERE"},
	{text = "ADD YOUR HINTS HERE"},
}

function f_getOrderHint()
	textImgSetText(txt_hints, t_orderHints[math.random(1, #t_orderHints)].text) --Get Random Hint from above Table
end

--;===========================================================
--; ORDER SELECT
--;===========================================================
function f_orderSelect()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	local i = 0
--Order Select OFF
	if not data.orderSelect then
		while true do
			if i == 0 then
				--f_selectChar(1, data.t_p1selected)
				--f_selectChar(2, data.t_p2selected)
			elseif i == 10 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end
--[[
--Order Select OFF when playing in CO-OP Mode
	elseif data.coop == true then
		while true do
			if i == 0 then
				--f_selectChar(1, data.t_p1selected)
				--f_selectChar(2, data.t_p2selected)
			elseif i == 10 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end
]]
--Order Select OFF when P1 and P2 playing in Single Team Mode
	elseif p1teamMode == 0 and p2teamMode == 0 then
		while true do
			if i == 0 then
				--f_selectChar(1, data.t_p1selected)
				--f_selectChar(2, data.t_p2selected)
			elseif i == 10 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end
--Order Select ON
	else
		local bufOrderu = 0
		local bufOrderd = 0
		local bufOrderr = 0
		local bufOrderl = 0
		local bufOrder2u = 0
		local bufOrder2d = 0
		local bufOrder2r = 0
		local bufOrder2l = 0
		local p1Confirmed = false
		local p2Confirmed = false
		local p1Row = 1
		local p2Row = 1
		local t_tmp = {}
		local sndNumber = -1
		local sndTime = 0
		local hintTime = 0
		local seconds = data.orderTime
		local orderTime = seconds*gameTick --Set time for Order Select
		local p1Anim = "p1AnimStand"
		local p2Anim = "p2AnimStand"
		local charDataL = nil
		local charDataR = nil
		local scaleDataL = nil
		local scaleDataR = nil
		local xPortScaleL, yPortScaleL = nil
		local xPortScaleR, yPortScaleR = nil
		textImgSetBank(txt_p1State, 0) --Reset Text Color
		textImgSetBank(txt_p2State, 0)
	--Set Order Select Music
		if matchNo == lastMatch then
			playBGM(bgmSelectOrderFinal)
		else	
			playBGM(bgmSelectOrder)
		end
		f_getOrderHint() --Load First Hint
		f_resetVersusLogo()
	--Set order time
		if data.p1In == 1 and data.p2In == 2 and (#data.t_p1selected > 1 or #data.t_p2selected > 1) or data.coop == true then
			--orderTime = math.max(#data.t_p1selected, #data.t_p2selected) * 60 --Order Time is setting by the amount of characters selected
		elseif #data.t_p1selected > 1 or data.coop == true then
			--orderTime = #data.t_p1selected * 60 --Order Time is setting by the amount of characters selected
		else
			--f_selectChar(1, data.t_p1selected)
			p1Confirmed = true
			--f_selectChar(2, data.t_p2selected)
			--p2Confirmed = true --Activate to don't order CPU characters in team modes
		end
		--Portraits Scale Logic
		for j=#data.t_p1selected, 1, -1 do
			charDataL = t_selChars[data.t_p1selected[j].cel+1]
			if charDataL.orderSprScale ~= nil then
				scaleDataL = charDataL.orderSprScale
			else
				scaleDataL = "1.0,1.0"
			end
			xPortScaleL, yPortScaleL = scaleDataL:match('^([^,]-)%s*,%s*(.-)$')
		end
		for j=#data.t_p2selected, 1, -1 do
			charDataR = t_selChars[data.t_p2selected[j].cel+1]
			if charDataR.orderSprScale ~= nil then
				scaleDataR = charDataR.orderSprScale
			else
				scaleDataR = "1.0,1.0"
			end
			xPortScaleR, yPortScaleR = scaleDataR:match('^([^,]-)%s*,%s*(.-)$')
		end
		cmdInput()
		while true do
			--txt_orderTime = createTextImg(jgFnt, 0, 0, (orderTime/gameTick), 160, 70)
			orderTimeNumber = orderTime/gameTick
			nodecimalOrderTime = string.format("%.0f",orderTimeNumber)
			txt_orderTime = createTextImg(jgFnt, 0, 0, nodecimalOrderTime, 160, 70)
		--Draw Order Select Last Match Backgrounds
			if matchNo == lastMatch then
				animDraw(f_animVelocity(selectHardBG0, -1, -1)) --Draw Red BG for Final Battle
		--Draw Order Select Normal Matchs Backgrounds
			else
				--Draw Black BG only for Tower Mode
				if data.gameMode == "tower" then
					animDraw(f_animVelocity(selectTowerBG0, -1, -1))
				--Draw Red BG for Special Modes
				elseif data.gameMode == "bossrush" or data.gameMode == "singleboss" or data.rosterMode == "suddendeath" or data.gameMode == "intermission" then
					animDraw(f_animVelocity(selectHardBG0, -1, -1))
				--Draw Blue BG for Normal Modes
				else
					animDraw(f_animVelocity(selectBG0, -1, -1))
				end
			end
		--Draw Window Portraits
			animDraw(f_animVelocity(orderWindowL, -2, 0))
			animDraw(f_animVelocity(orderWindowR, 2, 0))
		--Set Order Status Assets
			if p1Confirmed == false then
				--textImgSetBank(txt_p1State, 3) --Set Blue Color
				textImgSetText(txt_p1State, txt_waitingOrder) --Set Text
			else
				textImgSetBank(txt_p1State, 5)
				textImgSetText(txt_p1State, txt_orderFinished)
				p1Anim = "p1AnimWin" --Change Anim when Order Select is complete
			end
			if p2Confirmed == false then
				--textImgSetBank(txt_p2State, 1) --Set Red Color
				textImgSetText(txt_p2State, txt_waitingOrder)
			else
				textImgSetBank(txt_p2State, 5)
				textImgSetText(txt_p2State, txt_orderFinished)
				p2Anim = "p2AnimWin"
			end
		--Draw Order Status Text
			textImgDraw(txt_p1State)
			textImgDraw(txt_p2State)
		--Both Sides are Ready
			if p1Confirmed == true and p2Confirmed == true then
				orderTime = 0
				animSetWindow(cursorBox, 20, 14, 120, 16)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
			i = i + 1
			if sndTime > 0 then
				sndTime = sndTime - 1
			end
			sndNumber = -1
			--Adjust characters order if timer is > 0
			if orderTime > 0 then
				orderTime = orderTime - 0.5 --Activate Order Select Timer
				textImgDraw(txt_orderTime)
				
			else --when orderTime <= 0
				
			end
		--if Player 1 has not confirmed the order yet
			if not p1Confirmed and data.p1In ~= 2 then
				if btnPalNo(p1Cmd) > 0 then
					if not p1Confirmed then
						sndNumber = 1
						--f_selectChar(1, data.t_p1selected)
						p1Confirmed = true
						commandBufReset(p1Cmd)
					end
					if data.p2In ~= 2 and p2numChars == 1 then --Necessary for Single Boss Mode
						if not p2Confirmed then
							--f_selectChar(2, data.t_p2selected)
							p2Confirmed = true
						end
					end
				elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufOrderu >= 30) then
					if #data.t_p1selected > 1 then
						sndNumber = 0
						p1Row = p1Row - 1
						if p1Row == 0 then p1Row = #data.t_p1selected end
					end
				elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufOrderd >= 30) then
					if #data.t_p1selected > 1 then
						sndNumber = 0
						p1Row = p1Row + 1
						if p1Row > #data.t_p1selected then p1Row = 1 end
					end
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufOrderl >= 30) then
					if p1Row-1 > 0 then
						sndNumber = 0
						p1Row = p1Row - 1
						t_tmp = {}
						t_tmp[p1Row] = data.t_p1selected[p1Row+1]
						for i=1, #data.t_p1selected do
							for j=1, #data.t_p1selected do
								if t_tmp[j] == nil and i ~= p1Row+1 then
									t_tmp[j] = data.t_p1selected[i]
									break
								end
							end
						end
						data.t_p1selected = t_tmp
					end
				elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufOrderr >= 30) then
					if p1Row+1 <= #data.t_p1selected then
						sndNumber = 0
						p1Row = p1Row + 1
						t_tmp = {}
						t_tmp[p1Row] = data.t_p1selected[p1Row-1]
						for i=1, #data.t_p1selected do
							for j=1, #data.t_p1selected do
								if t_tmp[j] == nil and i ~= p1Row-1 then
									t_tmp[j] = data.t_p1selected[i]
									break
								end
							end
						end
						data.t_p1selected = t_tmp
					end
				end
				animSetWindow(cursorBox, 0,157+p1Row*14, 140,14.5)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
		--if Player 1 has not confirmed the order yet and IS controlled by IA (CPU VS P1)
			if not p1Confirmed and data.p1In == 2 and p2Confirmed == true then
				if btnPalNo(p1Cmd) > 0 then
					if not p1Confirmed then
						sndNumber = 1
						--f_selectChar(1, data.t_p1selected)
						p1Confirmed = true
						commandBufReset(p1Cmd)
					end
					if data.p2In ~= 2 and p2numChars == 1 then --Necessary for Single Boss Mode
						if not p2Confirmed then
							--f_selectChar(2, data.t_p2selected)
							p2Confirmed = true
						end
					end
				elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufOrderu >= 30) then
					if #data.t_p1selected > 1 then
						sndNumber = 0
						p1Row = p1Row - 1
						if p1Row == 0 then p1Row = #data.t_p1selected end
					end
				elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufOrderd >= 30) then
					if #data.t_p1selected > 1 then
						sndNumber = 0
						p1Row = p1Row + 1
						if p1Row > #data.t_p1selected then p1Row = 1 end
					end
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufOrderl >= 30) then
					if p1Row-1 > 0 then
						sndNumber = 0
						p1Row = p1Row - 1
						t_tmp = {}
						t_tmp[p1Row] = data.t_p1selected[p1Row+1]
						for i=1, #data.t_p1selected do
							for j=1, #data.t_p1selected do
								if t_tmp[j] == nil and i ~= p1Row+1 then
									t_tmp[j] = data.t_p1selected[i]
									break
								end
							end
						end
						data.t_p1selected = t_tmp
					end
				elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufOrderr >= 30) then
					if p1Row+1 <= #data.t_p1selected then
						sndNumber = 0
						p1Row = p1Row + 1
						t_tmp = {}
						t_tmp[p1Row] = data.t_p1selected[p1Row-1]
						for i=1, #data.t_p1selected do
							for j=1, #data.t_p1selected do
								if t_tmp[j] == nil and i ~= p1Row-1 then
									t_tmp[j] = data.t_p1selected[i]
									break
								end
							end
						end
						data.t_p1selected = t_tmp
					end
				end
				animSetWindow(cursorBox, 0,157+p1Row*14, 140,14.5)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
		--if Player2 has not confirmed the order yet and IS controlled by IA (P1 VS CPU)
			if not p2Confirmed and data.p2In == 1 and p1Confirmed == true then
				if btnPalNo(p1Cmd) > 0 then
					if not p2Confirmed then
						sndNumber = 1
						--f_selectChar(2, data.t_p2selected)
						p2Confirmed = true
					end
				elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufOrderu >= 30) then
					if #data.t_p2selected > 1 then
						sndNumber = 0
						p2Row = p2Row - 1
						if p2Row == 0 then p2Row = #data.t_p2selected end
					end
				elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufOrderd >= 30) then
					if #data.t_p2selected > 1 then
						sndNumber = 0
						p2Row = p2Row + 1
						if p2Row > #data.t_p2selected then p2Row = 1 end
					end
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufOrderl >= 30) then
					if p2Row+1 <= #data.t_p2selected then
						sndNumber = 0
						p2Row = p2Row + 1
						t_tmp = {}
						t_tmp[p2Row] = data.t_p2selected[p2Row-1]
						for i=1, #data.t_p2selected do
							for j=1, #data.t_p2selected do
								if t_tmp[j] == nil and i ~= p2Row-1 then
									t_tmp[j] = data.t_p2selected[i]
									break
								end
							end
						end
						data.t_p2selected = t_tmp
					end
				elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufOrderr >= 30) then
					if p2Row-1 > 0 then
						sndNumber = 0
						p2Row = p2Row - 1
						t_tmp = {}
						t_tmp[p2Row] = data.t_p2selected[p2Row+1]
						for i=1, #data.t_p2selected do
							for j=1, #data.t_p2selected do
								if t_tmp[j] == nil and i ~= p2Row+1 then
									t_tmp[j] = data.t_p2selected[i]
									break
								end
							end
						end
						data.t_p2selected = t_tmp
					end
				end
				animSetWindow(cursorBox, 180,157+p2Row*14, 140,14.5)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
		--if Player2 has not confirmed the order yet and is not controlled by Player 1 (P1 VS P2)
			if not p2Confirmed and data.p2In ~= 1 then
				if btnPalNo(p2Cmd) > 0 then
					if not p2Confirmed then
						sndNumber = 1
						--f_selectChar(2, data.t_p2selected)
						p2Confirmed = true
					end
				elseif commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufOrder2u >= 30) then
					if #data.t_p2selected > 1 then
						sndNumber = 0
						p2Row = p2Row - 1
						if p2Row == 0 then p2Row = #data.t_p2selected end
					end
				elseif commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufOrder2d >= 30) then
					if #data.t_p2selected > 1 then
						sndNumber = 0
						p2Row = p2Row + 1
						if p2Row > #data.t_p2selected then p2Row = 1 end
					end
				elseif commandGetState(p2Cmd, 'l') or (commandGetState(p2Cmd, 'holdl') and bufOrder2l >= 30) then
					if p2Row+1 <= #data.t_p2selected then
						sndNumber = 0
						p2Row = p2Row + 1
						t_tmp = {}
						t_tmp[p2Row] = data.t_p2selected[p2Row-1]
						for i=1, #data.t_p2selected do
							for j=1, #data.t_p2selected do
								if t_tmp[j] == nil and i ~= p2Row-1 then
									t_tmp[j] = data.t_p2selected[i]
									break
								end
							end
						end
						data.t_p2selected = t_tmp
					end
				elseif commandGetState(p2Cmd, 'r') or (commandGetState(p2Cmd, 'holdr') and bufOrder2r >= 30) then
					if p2Row-1 > 0 then
						sndNumber = 0
						p2Row = p2Row - 1
						t_tmp = {}
						t_tmp[p2Row] = data.t_p2selected[p2Row+1]
						for i=1, #data.t_p2selected do
							for j=1, #data.t_p2selected do
								if t_tmp[j] == nil and i ~= p2Row+1 then
									t_tmp[j] = data.t_p2selected[i]
									break
								end
							end
						end
						data.t_p2selected = t_tmp
					end
				end
				animSetWindow(cursorBox, 180,157+p2Row*14, 140,14.5)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
		--sndPlay separated to not play more than 1 sound at once
			if sndNumber ~= -1 then
				sndPlay(sysSnd, 100, sndNumber)
				sndTime = 30
			end
		--Order Time Over
			if orderTime == 0 then
				if not p1Confirmed then
					--f_selectChar(1, data.t_p1selected)
					p1Confirmed = true
				end
				if not p2Confirmed then
					--f_selectChar(2, data.t_p2selected)
					p2Confirmed = true
				end
				if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
					if i < 120 then i = 120 end
				end
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				break
			end
		--Draw Character Portraits
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				for j=#data.t_p1selected, 1, -1 do
					drawOrderPortrait(data.t_p1selected[j].cel, 124 - (2*j-1) * 17.9, 30, xPortScaleL, yPortScaleL)
				end
				for j=#data.t_p2selected, 1, -1 do
					drawOrderPortrait(data.t_p2selected[j].cel, 195 + (2*j-1) * 17.9, 30, -xPortScaleR, yPortScaleR)
				end
			end
		--Draw Character Sprite Animations
			if data.charPresentation == "Sprite" or data.charPresentation == "Mixed" then
			--Left Side
				for j=#data.t_p1selected, 1, -1 do
					f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], p1Anim, 139 - (2*j-1) * 18, 168, data.t_p1selected[j].up)
				end
			--Right Side
				for j=#data.t_p2selected, 1, -1 do
					f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], p2Anim, 180 + (2*j-1) * 18, 168, data.t_p2selected[j].up)
				end
			end
		--Draw Names
			f_drawNameList(txt_p1NameOrder, 5, data.t_p1selected, 78, 180, 0, 14, p1Row, 0)
			f_drawNameList(txt_p2NameOrder, 5, data.t_p2selected, 241, 180, 0, 14, p2Row, 0)
		--Draw Order Number Assets
			--Left Side
			for n=#data.t_p1selected, 1, -1 do
				animPosDraw(p1OrderCursor, 1, 158+14*n) --Draw Order Icon
				textImgSetText(txt_p1OrderNo, n) --Set Order Number Text
				textImgPosDraw(txt_p1OrderNo, 9, 166+14*n) --Draw Order Number Text
			end
			--Right Side
			for n=#data.t_p2selected, 1, -1 do
				animPosDraw(p2OrderCursor, 305, 158+14*n)
				textImgSetText(txt_p2OrderNo, n)
				textImgPosDraw(txt_p2OrderNo, 310, 166+14*n)
			end
		--Draw Title
			textImgDraw(txt_orderSelect)
		--Draw Assets
			animUpdate(vsLogo)
			animDraw(vsLogo)
			animDraw(footerBG)
			if hintTime > 150 then --Time to load a new random hint
				f_getOrderHint() --Update Hint
				hintTime = 0 --Restart timer for a new random hint
			end
			textImgDraw(txt_hints) --Draw Hints
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			hintTime = hintTime + 1 --Start timer for randoms hints
			if commandGetState(p1Cmd, 'holdu') then
				bufOrderd = 0
				bufOrderu = bufOrderu + 1
			elseif commandGetState(p1Cmd, 'holdd') then
				bufOrderu = 0
				bufOrderd = bufOrderd + 1
			elseif commandGetState(p1Cmd, 'holdr') then
				bufOrderl = 0
				bufOrderr = bufOrderr + 1
			elseif commandGetState(p1Cmd, 'holdl') then
				bufOrderr = 0
				bufOrderl = bufOrderl + 1
			elseif commandGetState(p2Cmd, 'holdu') then
				bufOrder2d = 0
				bufOrder2u = bufOrder2u + 1
			elseif commandGetState(p2Cmd, 'holdd') then
				bufOrder2u = 0
				bufOrder2d = bufOrder2d + 1
			elseif commandGetState(p2Cmd, 'holdr') then
				bufOrder2l = 0
				bufOrder2r = bufOrder2r + 1
			elseif commandGetState(p2Cmd, 'holdl') then
				bufOrder2r = 0
				bufOrder2l = bufOrder2l + 1
			else
				bufOrderu = 0
				bufOrderd = 0
				bufOrderr = 0
				bufOrderl = 0
				bufOrder2u = 0
				bufOrder2d = 0
				bufOrder2r = 0
				bufOrder2l = 0
			end
			cmdInput()
			refresh()
		end
	end
end

--;===========================================================
--; VERSUS SCREENPACK
--;===========================================================
txt_p1NameVS = createTextImg(jgFnt, 0, 0, "", 0, 0)
txt_p2NameVS = createTextImg(jgFnt, 0, 0, "", 0, 0)

--VS Window (left portrait background)
vsWindowL = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(vsWindowL, 160, 0)
animSetTile(vsWindowL, 1, 1)
animSetWindow(vsWindowL, 20, 30, 120, 140)

--VS Window (right portrait background)
vsWindowR = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(vsWindowR, 160, 0)
animSetTile(vsWindowR, 1, 1)
animSetWindow(vsWindowR, 180, 30, 120, 140)

t_vsHints = {
	{text = "KEEP START IN CHAR SELECT AND PRESS C or Z BUTTON"},
	{text = "WHEN CHARS GETTING BUG PRESS F4 TO RELOAD THE MATCH"},
	{text = "PRESS THE IMPR PANT KEY TO TAKE A SCREENSHOT"},
	--{text = "PRESS (RIGHT OR LEFT)+ Y + A TO CHANGE BETWEEN THE CHARACTERS IN TAG MODE"},
	--{text = "WHILE YOU FIGHT, PRESS Y + A TO ACTIVATE THE PARTNER ASSIST IN TAG MODE"},
	{text = "ADD YOUR HINTS HERE"},
	{text = "ADD YOUR HINTS HERE"},
}

function f_getVSHint()
	textImgSetText(txt_hints, t_vsHints[math.random(1, #t_vsHints)].text)
end

--;===========================================================
--; VERSUS SCREEN
--;===========================================================
function f_selectVersus()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	local i = 0
	if not data.versusScreen then
		while true do
			if i == 0 then
				--f_selectChar(1, data.t_p1selected)
				--f_selectChar(2, data.t_p2selected)
			elseif i == 30 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end
	else
		local colorToName = 1
		local screenTime = 0
		local hintTime = 0
		local timeLimit = 150
	--Set Versus Screen Music
		if data.gameMode == "bossrush" or data.gameMode == "singleboss" or data.rosterMode == "suddendeath" or matchNo == lastMatch then
			playBGM(bgmVSFinal)
		elseif data.gameMode == "intermission" then
			playBGM(bgmVSSpecial)
			timeLimit = 350
		else
			playBGM(bgmVS)
		end
		f_getVSHint() --Load First Hint
		f_resetVersusLogo()
		--Portraits Scale Logic
		local charDataL = t_selChars[data.t_p1selected[1].cel+1]
		local charDataR = t_selChars[data.t_p2selected[1].cel+1]
		if charDataL.vsSprScale ~= nil then
			scaleDataL = charDataL.vsSprScale
		else
			scaleDataL = "1.0,1.0"
		end
		if charDataR.vsSprScale ~= nil then
			scaleDataR = charDataR.vsSprScale
		else
			scaleDataR = "1.0,1.0"
		end
		local xPortScaleL, yPortScaleL = scaleDataL:match('^([^,]-)%s*,%s*(.-)$')
		local xPortScaleR, yPortScaleR = scaleDataR:match('^([^,]-)%s*,%s*(.-)$')
		cmdInput()
		while true do
		--Actions
			if screenTime == timeLimit then--or (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then --Disable temporarily to prevent desync in online mode
				commandBufReset(p1Cmd)
				commandBufReset(p2Cmd)
				break
			end
		--Draw Versus Screen Last Match Backgrounds
			if matchNo == lastMatch then
				animDraw(f_animVelocity(selectHardBG0, -1, -1)) --Draw Red BG for Final Battle
		--Draw Versus Screen Normal Matchs Backgrounds
			else
				--Draw Black BG only for Tower Mode
				if data.gameMode == "tower" then
					animDraw(f_animVelocity(selectTowerBG0, -1, -1))
				--Draw Red BG for Special Modes
				elseif data.gameMode == "bossrush" or data.gameMode == "singleboss" or data.rosterMode == "suddendeath" or data.gameMode == "intermission" then
					animDraw(f_animVelocity(selectHardBG0, -1, -1))
				--Draw Blue BG for Normal Modes
				else
					animDraw(f_animVelocity(selectBG0, -1, -1))
				end
			end
		--Draw Window Portraits
			animDraw(f_animVelocity(vsWindowL, -2, 0))
			animDraw(f_animVelocity(vsWindowR, 2, 0))
		--Draw Character Portraits
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				drawPortrait(data.t_p1selected[1].cel, 20, 30, xPortScaleL, yPortScaleL)
				drawPortrait(data.t_p2selected[1].cel, 300, 30, -xPortScaleR, yPortScaleR)
				--You can use drawVSPortrait instead of drawPortrait to draw exclusive Portraits in this screen.
			end
		--Draw Character Sprite Animations
			if data.charPresentation == "Sprite" then
				for j=#data.t_p1selected, 1, -1 do
					f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 139 - (2*j-1) * 18, 168, data.t_p1selected[j].up)
				end
				for j=#data.t_p2selected, 1, -1 do
					f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimWin', 180 + (2*j-1) * 18, 168, data.t_p2selected[j].up)
				end
			end
		--Draw Match Info
			if data.gameMode == "arcade" or data.gameMode == "tower" then
				textImgDraw(txt_matchNo)
			elseif data.gameMode == "versus" or data.gameMode == "survival" or data.gameMode == "allroster" or data.gameMode == "intermission" then
				textImgDraw(txt_gameNo)
			elseif data.gameMode == "bossrush" then
				textImgDraw(txt_bossNo)
			elseif data.gameMode == "bonusrush" then
				textImgDraw(txt_bonusNo)
			end
		--Draw Names
			f_drawNameList(txt_p1NameVS, 5, data.t_p1selected, 78, 180, 0, 14, colorToName, 0)
			f_drawNameList(txt_p2NameVS, 5, data.t_p2selected, 241, 180, 0, 14, colorToName, 0)
		--Draw Assets
			animUpdate(vsLogo)
			animDraw(vsLogo)
			animDraw(footerBG)
			if hintTime > 150 then --Time to load a new random hint
				f_getVSHint() --Update Hint
				hintTime = 0 --Restart timer for a new random hint
			end
			textImgDraw(txt_hints) --Draw Hints
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			hintTime = hintTime + 1 --Start Timer for Randoms Hints
			screenTime = screenTime + 1 --Start Timer for Versus Screen
			cmdInput()
			refresh()
		end
	end
end

--;===========================================================
--; LOADING SCREEN
--;===========================================================
function f_loading()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	if data.t_p1selected ~= nil and data.t_p2selected ~= nil then
		f_selectChar(1, data.t_p1selected)
		f_selectChar(2, data.t_p2selected)
	end
	local t = 0
	while true do
		if t == 30 then
			cmdInput()
			break
		end
		t = t + 1
		textImgSetText(txt_loading, "LOADING MATCH...")
		textImgDraw(txt_loading)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; WIN SCREEN SCREENPACK
--;===========================================================
txt_winnername = createTextImg(jgFnt, 0, 1, "", 20, 177)
txt_winquote = createTextImg(font2, 0, 1, "", 0, 0)
txt_winquoteFix = createTextImg(jgFnt, 0, 1, "", 20, 177)
	
--Win Char Modern Transparent BG
wincharBG = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(wincharBG, 160, 0)
animSetTile(wincharBG, 1, 1)
animSetWindow(wincharBG, -54, 14, 428, 142)

--Win Char Classic Transparent (left portrait background)
wincharBGC1 = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(wincharBGC1, 160, 0)
animSetTile(wincharBGC1, 1, 1)
--animSetWindow(wincharBGC1, 20, 30, 120, 140)

--Win Char Classic Transparent (right portrait background)
wincharBGC2 = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(wincharBGC2, 160, 0)
animSetTile(wincharBGC2, 1, 1)
--animSetWindow(wincharBGC2, 180, 30, 120, 140)

--Win Quote Transparent BG
quoteBG = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(quoteBG, 160, 0)
animSetTile(quoteBG, 1, 1)
animSetWindow(quoteBG, 14, 167, 290, 62)

--;===========================================================
--; VICTORY SCREEN
--;===========================================================
function f_selectWin()
	local bufRematchu = 0
	local bufRematchd = 0
	local bufRematchr = 0
	local bufRematchl = 0
	local bufRematch2u = 0
	local bufRematch2d = 0
	local bufRematch2r = 0
	local bufRematch2l = 0
	local menuReady = false
	local timeToSkip = 650
	local winnerTeam = nil
	local winnerSide = nil
	local charData = nil
	local scaleData = nil
	local xPortScale, yPortScale = nil
	p1Cursor = 1
	p2Cursor = 1
	p1Ready = false
	p2Ready = false
	setService("") --Erase Service
	f_modeplayTime() --Store Favorite Game Mode (Addressed to Simple Character Select)
	if data.winscreen == "Fixed" or not data.victoryscreen then
		playBGM(bgmNothing)
	else --Classic/Modern Victory Screen
		playBGM(bgmVictory)
	end
	local txt = ""
	local i = 0
--Winner Logic
	if winner == 1 then
		p1Wins = p1Wins + 1
		winnerTeam = p1numChars
		winnerSide = data.t_p1selected
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			--Player 1 is not in this side so..:
			f_defeats() --Store Player Losses
			--f_loseCoins()
		else
			f_winCoins() --Add Coins Rewards by win
			f_victories() --Store Player Victories
		end
		if data.winscreen == "Fixed" or not data.victoryscreen then --Permanent Victory Quotes when Left Side Wins
			txt = "READY FOR THE NEXT BATTLE?"
		else --Victory Quotes from Left Side char
			txt = f_winParse(t_selChars[data.t_p1selected[1].cel+1], t_selChars[data.t_p2selected[1].cel+1], data.t_p2selected[1].pal, #data.t_p2selected)
		end
	else--if winner == 2 then
		p2Wins = p2Wins + 1
		winnerTeam = p2numChars
		winnerSide = data.t_p2selected
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			--Player 2 is not in this side so..:
			f_winCoins()
			f_victories()
		else
			f_defeats()
			--f_loseCoins()
		end
		if data.winscreen == "Fixed" or not data.victoryscreen then --Permanent Victory Quotes when Right Side Wins
			txt = "READY FOR THE NEXT BATTLE?"
		else --Victory Quotes from Right Side char
			txt = f_winParse(t_selChars[data.t_p2selected[1].cel+1], t_selChars[data.t_p1selected[1].cel+1], data.t_p1selected[1].pal, #data.t_p1selected)
		end
	end
	if txt == "" or txt == nil then txt = "I am the winner!" end --In case that f_winParse returns "nothing"
--Online Ranked Match Control
	if onlinegame == true and data.gameMode == "versus" then
		f_ftcontrol()
	end
	--Portraits Scale Logic
	for j=#winnerSide, 1, -1 do
		charData = t_selChars[winnerSide[j].cel+1]
		if charData.winSprScale ~= nil then
			scaleData = charData.winSprScale
		else
			scaleData = "1.0,1.0"
		end
		xPortScale, yPortScale = scaleData:match('^([^,]-)%s*,%s*(.-)$')
	end
	cmdInput()
	while true do
		if data.victoryscreen then --Only shows if data.victoryscreen == true
		--Draw Winner Screen Last Match Backgrounds
			if matchNo == lastMatch then
				animDraw(f_animVelocity(selectHardBG0, -1, -1)) --Draw Red BG for Final Battle
		--Draw Winner Screen Normal Matchs Backgrounds
			else
				--Draw Black BG only for Tower Mode
				if data.gameMode == "tower" then
					animDraw(f_animVelocity(selectTowerBG0, -1, -1))
				--Draw Red BG for Special Modes
				elseif data.gameMode == "bossrush" or data.gameMode == "singleboss" or data.rosterMode == "suddendeath" or data.gameMode == "intermission" then
					animDraw(f_animVelocity(selectHardBG0, -1, -1))
				--Draw Blue BG for Normal Modes
				else
					animDraw(f_animVelocity(selectBG0, -1, -1))
				end
			end
		--Draw Permanent Victory Quote Message
			if data.winscreen == "Fixed" then
				f_textRender(txt_winquoteFix, txt, i, 20, 190, 15, 2, 59)
			else --Classic/Modern Victory Screen
				if data.winscreen == "Modern" then
					animDraw(f_animVelocity(wincharBG, 0, 1.5))
					--Draw Portraits
					if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
						if winnerTeam == 1 then
							drawWinPortrait(winnerSide[1].cel, 99, 15, xPortScale, yPortScale) --Your char portrait appears in modern win screen
						elseif winnerTeam == 2 then	--Your 2nd char portrait appears in modern win screen
							drawWinPortrait(winnerSide[2].cel, 150, 15, xPortScale, yPortScale)
							drawWinPortrait(winnerSide[1].cel, 45, 15, xPortScale, yPortScale)
						elseif winnerTeam == 3 then	--Your 3rd char portrait appears in modern win screen	
							drawWinPortrait(winnerSide[3].cel, 0, 15, xPortScale, yPortScale)
							drawWinPortrait(winnerSide[2].cel, 205, 15, xPortScale, yPortScale)
							drawWinPortrait(winnerSide[1].cel, 99, 15, xPortScale, yPortScale)
						elseif winnerTeam == 4 then	--Your 4th char portrait appears in modern win screen
							drawWinPortrait(winnerSide[4].cel, 205, 15, xPortScale, yPortScale)
							drawWinPortrait(winnerSide[3].cel, 0, 15, xPortScale, yPortScale)
							drawWinPortrait(winnerSide[2].cel, 150, 15, xPortScale, yPortScale)
							drawWinPortrait(winnerSide[1].cel, 45, 15, xPortScale, yPortScale)
						end
					--Draw Char Animations
					elseif data.charPresentation == "Sprite" then
						for j=#data.t_p1selected, 1, -1 do
							f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 178 - (2*j-1) * 18, 152.5, data.t_p1selected[j].up)
						end
					end
				elseif data.winscreen == "Classic" then
					if winner == 2 then
						--Draw Portraits
						if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
							drawLoserPortrait(data.t_p1selected[1].cel, 32, 20, 1, 1)
						--Draw Char Animations
						elseif data.charPresentation == "Sprite" then
							for j=#data.t_p1selected, 1, -1 do
								f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimDizzy', 139 - (2*j-1) * 18, 158, data.t_p1selected[j].up)
							end
						end
					end
					animDraw(f_animVelocity(wincharBGC1, -2, 0))
					animSetWindow(wincharBGC1, 32, 20, 120, 140)
					if winner == 1 then
						if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
							drawWinPortrait(data.t_p1selected[1].cel, 32, 20, 1, 1)
							drawLoserPortrait(data.t_p2selected[1].cel, 289, 20, -1, 1)
						elseif data.charPresentation == "Sprite" then
							for j=#data.t_p1selected, 1, -1 do
								f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 149 - (2*j-1) * 18, 158, data.t_p1selected[j].up)
							end
							for j=#data.t_p2selected, 1, -1 do
								f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimDizzy', 180 + (2*j-1) * 18, 158, data.t_p2selected[j].up)
							end
						end
					end
					animDraw(f_animVelocity(wincharBGC2, 2, 0))
					animSetWindow(wincharBGC2, 169, 20, 120, 140)
					if winner == 2 then
						if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
							drawWinPortrait(data.t_p2selected[1].cel, 289, 20, -1, 1)
						elseif data.charPresentation == "Sprite" then
							for j=#data.t_p2selected, 1, -1 do
								f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimWin', 170 + (2*j-1) * 18, 158, data.t_p2selected[j].up)
							end
						end
					end
				end
			--Draw Winner Message
				animDraw(f_animVelocity(quoteBG, 2, 0))
				f_textRender(txt_winquote, txt, i, 20, 190, 15, 2, 59)
			--Draw Character Name
				textImgSetText(txt_winnername, f_getName(winnerSide[1].cel))
				textImgDraw(txt_winnername)
			end
		end
	--REMATCH OPTION
		if data.victoryscreen then --If victory screen is enable
			if data.gameMode == "versus" then --Show Rematch Menu for these modes
				if not menuReady then
					if i == timeToSkip or (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
						cmdInput()
						menuReady = true
					end
				elseif menuReady then
					f_rematch()
				end
				if rematchEnd then
					data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
					commandBufReset(p1Cmd, 1)
					commandBufReset(p2Cmd, 2)
					break
				end
			else --Don't Show Rematch Menu
				if i == timeToSkip or (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
					cmdInput()
					data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
					if data.orderSelect == true and data.gameMode == "arcade" then f_selectMusic()
					elseif data.gameMode == "tower" then playBGM(bgmTower)
					elseif data.gameMode == "singleboss" then playBGM(bgmSelectBoss)
					end
					commandBufReset(p1Cmd, 1)
					commandBufReset(p2Cmd, 2)
					break
				end
			end
		else--If victory screen is disable
			if data.gameMode == "versus" then
				f_rematch()
			else --Don't Show Rematch Menu
				rematchEnd = true
			end
			if rematchEnd then
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				if data.orderSelect == true and data.gameMode == "arcade" then f_selectMusic()
				elseif data.gameMode == "tower" then playBGM(bgmTower)
				elseif data.gameMode == "singleboss" then playBGM(bgmSelectBoss)
				end
				commandBufReset(p1Cmd, 1)
				commandBufReset(p2Cmd, 2)
				break
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		i = i + 1
		cmdInput()
		refresh()
	end
end

function f_winParse(winner, looser, pal)
	local quote = -1
	local logVar = winner.name .. '\n'
	if winner.quotes ~= nil then
		if #winner.trigger == 0 then
			logVar = logVar .. '0 triggers found\n'
			local i = 0
			for k,v in pairs(winner.quotes) do
				i = i + 1
			end
			if i ~= 0 then
				logVar = logVar .. 'quote = random value from all ' .. i .. ' available quotes\n'
				quote = math.random(1,i)
				i = 0
				for k,v in pairs(winner.quotes) do
					i = i + 1
					if i == quote then
						quote = k
					end
				end
			else
				logVar = logVar .. '0 quotes found\n'
			end
		else
			for i=1, #winner.trigger do
				local value = 0
				local trigger = false
				local condition = false
				local triggerall = true
				local triggerCnt = 0
				logVar = logVar .. 'condition: ' .. i .. '\n'
				for k,v in pairs(winner.trigger[i]) do
					if k == 'value' then
						logVar = logVar .. ' value\n  before: ' .. v .. '\n'
						v = v:gsub('%s*', '')
						if tonumber(v) then
							value = tonumber(v)
						else
							v = v:gsub('ifelse%s*%([^,]+,[^,]+,(.+)', '(%1') --always return else value
							v = v:gsub('var%s*%(%s*[0-9]+%s*%)%s*[><=!]+', '0*')
							v = v:gsub('var%s*%(%s*[0-9]+%s*%)', '0')
							v = v:gsub('ceil%s*%(', 'math.ceil(')
							v = v:gsub('random', 'math.random(0,999)')
							v = v:gsub('%%', '*1/1000*')
							f = assert(loadstring('return ' .. v))
							value = f()
							if tonumber(value) then
								value = tonumber(value)
								value = math.floor(value)
							else
								value = -1
							end
						end
						logVar = logVar .. '  after: ' .. v .. '\n  result: ' .. value .. '\n'
					else --trigger
						local skip = false
						if k == 'all' then
							logVar = logVar .. ' triggerall' .. '\n  before: ' .. v .. '\n'
							if v:match('numenemy') then
								skip = false --Added condition for numenemy to always be true (WHY THE FUCK WOULD THERE BE NO ENEMY TO READ WINQUOTES OFF OF!!!!)
								--logVar = logVar .. '  after: skipped\n'
							elseif v:match('numpartner') then
								skip = true
								logVar = logVar .. '  after: skipped\n'
							elseif v:match('numhelper') then
								skip = true
								logVar = logVar .. '  after: skipped\n'
							elseif v:match('ishelper') then
								skip = true
								logVar = logVar .. '  after: skipped\n'
							elseif v:match('numtarget') then
								skip = true
								logVar = logVar .. '  after: skipped\n'
							elseif v:match('playeridexist') then
								skip = true
								logVar = logVar .. '  after: skipped\n'
							end
						else
							logVar = logVar .. ' trigger' .. '\n  before: ' .. v .. '\n'
							triggerCnt = triggerCnt + 1
						end
						if not skip then
							if v:match('numexplod') then
								trigger = false
								logVar = logVar .. '  after: false\n  result: false\n'
							elseif v:match('helper%s*%([^,]+,') then
								trigger = false
								logVar = logVar .. '  after: false\n  result: false\n'
							elseif v:match('s?e?l?f?animexist%s*%([^%)]+%)') then
								trigger = false
								logVar = logVar .. '  after: false\n  result: false\n'
							else
								v = v:gsub('^%s*1%s*$', 'true')
								v = v:gsub('!%s*time', 'true')
								v = v:gsub('enemyn?e?a?r?%s*,', '')
								v = v:gsub('ifelse%s*%([^,]+,[^,]+,(.+)', '(%1')
								v = v:gsub('var%s*%(%s*[0-9]+%s*%)%s*(=?)', '0%1%1')
								v = v:gsub('life%s*=', '1000 ==')
								v = v:gsub('life%s*%s*([<>!])', '1000 %1')
								v = v:gsub('winperfect', 'false')
								v = v:gsub('wintime', 'false')
								v = v:gsub('winko', 'false')
								v = v:gsub('ceil%s*%(', 'math.ceil(')
								v = v:gsub('!=', '~=')
								v = v:gsub('!', ' not ')
								v = v:gsub('||', ' or ')
								v = v:gsub('&&', ' and ')
								v = v:gsub('authorname%s*=', '"' .. looser.author .. '"==')
								v = v:gsub('name%s*=', '"' .. looser.name .. '"==')
								v = v:gsub('palno%s*=%s*%[%s*([0-9]+)%s*,%s*([0-9]+)%s*%]', '(' .. pal .. '>=%1 and ' .. pal .. '<=%2)')
								v = v:gsub('palno%s*~=%s*%[%s*([0-9]+)%s*,%s*([0-9]+)%s*%]', '(' .. pal .. '<%1 or ' .. pal .. '>%2)') --Added this case
								v = v:gsub('numenemy', 'true') --ALWAYS assume there was an enemy...
								v = v:gsub('palno%s*=', pal .. '==')
								v = v:gsub('random', 'math.random(0,999)')
								v = v:gsub('%%', '*1/1000*')
								f = assert(loadstring('if ' .. v .. ' then return true else return false end'))
								trigger = f()
								logVar = logVar .. '  after: ' .. v .. '\n  result: ' .. tostring(trigger) .. '\n'
							end
							--triggerall == false
							if k == 'all' and not trigger then
								triggerall = false
							--triggerX == true
							elseif k ~= 'all' and trigger then
								condition = true
							end
						end
					end
				end
				if triggerall and (condition or triggerCnt == 0) then
					quote = value
				end
			end
		end
		quote = tostring(quote) --quotes table keys are strings
		if winner.quotes[quote] ~= nil then
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: yes', 'save/debug/quotes.log')
			return winner.quotes[quote]
		else
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: no', 'save/debug/quotes.log')
			return ''
		end
	else
		f_printVar(logVar .. '0 triggers found\n0 quotes found\n\nquote: -1\nexists: no', 'save/debug/quotes.log')
		return ''
	end
end

--;===========================================================
--; RANKED MATCH SCREEN
--;===========================================================
txt_rankInfo = createTextImg(font5, 0, 0, "INFORMATION", 157, 111)
txt_rankESC = createTextImg(jgFnt, 5, 0, "PRESS ESC TO EXIT", 159, 151)
txt_rankText = createTextImg(jgFnt, 0, 0, "", 0, 0,0.56,0.56)
txt_rankMsg = "ONLINE MATCH RANKED HAS FINISHED"
	
--Scrolling background
rankedBG = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(rankedBG, 160, 0)
animSetTile(rankedBG, 1, 1)
animSetColorKey(rankedBG, -1)

--Ranked Info Window BG
rankWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(rankWindowBG, 83.5, 97)
animUpdate(rankWindowBG)
animSetScale(rankWindowBG, 1, 1)

function f_ftcontrol()
	if p1Wins == data.ftcontrol then
		--os.exit()--Fightcade System
		cmdInput()
		while true do
			--Draw BG
			animDraw(f_animVelocity(rankedBG, -1, -1))
			--Draw Menu BG
			animDraw(rankWindowBG)
			animUpdate(rankWindowBG)
			--Draw Info Text
			f_textRender(txt_rankText, txt_rankMsg, 0, 160, 125, 10, 0, 25)
			--Draw Esc Text
			textImgDraw(txt_rankESC)
			--Draw Cursor
			animSetWindow(cursorBox, 87,141, 144,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			--Draw Info Title Text
			textImgDraw(txt_rankInfo)
			--Actions
			if esc() then
				sndPlay(sysSnd, 100, 2)
				break
			end
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			cmdInput()
			refresh()
		end
	elseif p2Wins == data.ftcontrol then
		--os.exit()--Fightcade System
		cmdInput()
		while true do
			--Draw BG
			animDraw(f_animVelocity(rankedBG, -1, -1))
			--Draw Menu BG
			animDraw(rankWindowBG)
			animUpdate(rankWindowBG)
			--Draw Info Text
			f_textRender(txt_rankText, txt_rankMsg, 0, 160, 125, 10, 0, 25)
			--Draw Ok Text
			textImgDraw(txt_rankESC)
			--Draw Cursor
			animSetWindow(cursorBox, 87,141, 144,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			--Draw Info Title Text
			textImgDraw(txt_rankInfo)
			--Actions
			if esc() then
				sndPlay(sysSnd, 100, 2)
				break
			end
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			cmdInput()
			refresh()
		end
	end
end

--;===========================================================
--; REMATCH SCREENPACK
--;===========================================================
txt_rematchCPU = createTextImg(font6, 0, 0, "BATTLE OPTION", 160, 102)
txt_rematch = createTextImg(font6, 0, 0, "P1 BATTLE OPTION", 86, 102)
txt_rematch2 = createTextImg(font6, 0, 0, "P2 BATTLE OPTION", 237, 102)

--Scrolling background
rematchBG = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(rematchBG, 160, 0)
animSetTile(rematchBG, 1, 1)
animSetColorKey(rematchBG, -1)

--Rematch Window BG
rematchWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(rematchWindowBG, 0.4, 97)
animUpdate(rematchWindowBG)
animSetScale(rematchWindowBG, 1.005, 1.1)

--Rematch Window BG CPU
rematchCPUWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(rematchCPUWindowBG, 83.5, 97)
animUpdate(rematchCPUWindowBG)
animSetScale(rematchCPUWindowBG, 1.005, 1.1)

--Rematch Window BG Player 2
rematch2WindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(rematch2WindowBG, 168.4, 97)
animUpdate(rematch2WindowBG)
animSetScale(rematch2WindowBG, 1.005, 1.1)

--;===========================================================
--; REMATCH MENU
--;===========================================================
t_battleOption = {
	{id = textImgNew(), text = "REMATCH"},
	{id = textImgNew(), text = "CHARACTER SELECT"},
	{id = textImgNew(), text = "STAGE SELECT"},
	{id = textImgNew(), text = "MAIN MENU"},
}

t_battleOption2 = {
	{id = textImgNew(), text = t_battleOption[1].text}, --Get rematch text from above table
	{id = textImgNew(), text = t_battleOption[2].text},
	{id = textImgNew(), text = t_battleOption[3].text},
	{id = textImgNew(), text = t_battleOption[4].text},
}

function f_rematch()
	if not p1Ready then
		--Player 1 Cursor
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufRematchu >= 30) then
			sndPlay(sysSnd, 100, 0)
			p1Cursor = p1Cursor - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufRematchd >= 30) then
			sndPlay(sysSnd, 100, 0)
			p1Cursor = p1Cursor + 1
		end
		if p1Cursor < 1 then
			p1Cursor = #t_battleOption
		elseif p1Cursor > #t_battleOption then
			p1Cursor = 1
		end
	end
	--Draw BG only when Winscreen is off
	if data.victoryscreen == false then animDraw(f_animVelocity(rematchBG, -1, -1)) end
	if data.p2In == 1 or (data.p1In == 2 and data.p2In == 2) then --VS CPU
		--Draw Menu BG
		animDraw(rematchCPUWindowBG)
		animUpdate(rematchCPUWindowBG)
		--Draw Title
		textImgDraw(txt_rematchCPU)
	else
		animDraw(rematchWindowBG)
		animUpdate(rematchWindowBG)
		textImgDraw(txt_rematch)
	end
	--Set Color and Text Position
	for i=1, #t_battleOption do
		if data.p2In == 1 or (data.p1In == 2 and data.p2In == 2) then --VS CPU
			t_battleOption[i].id = createTextImg(jgFnt, 0, 0, t_battleOption[i].text, 159.1, 104.5+i*13,0.95,0.95)
		else
			t_battleOption[i].id = createTextImg(jgFnt, 0, 0, t_battleOption[i].text, 76, 104.5+i*13,0.95,0.95)
		end
		if i == p1Cursor + 0 then
			textImgSetBank(t_battleOption[i].id, 5)
		else
			textImgSetBank(t_battleOption[i].id, 0)
		end
		textImgDraw(t_battleOption[i].id)
	end
	if not p1Ready then
	--Draw Cursor
		if data.p2In == 1 or (data.p1In == 2 and data.p2In == 2) then --VS CPU
			animSetWindow(cursorBox, 87.1, 94.5+p1Cursor*13, 145, 13)
		else
			animSetWindow(cursorBox, 4, 94.5+p1Cursor*13, 145, 13)
		end
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end
	--Player 2 Mirror Assets
	if data.p2In == 2 and data.p1In ~= 2 then
		if not p2Ready then
			if commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufRematch2u >= 30) then
				sndPlay(sysSnd, 100, 0)
				p2Cursor = p2Cursor - 1
			elseif commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufRematch2d >= 30) then
				sndPlay(sysSnd, 100, 0)
				p2Cursor = p2Cursor + 1
			end
			if p2Cursor < 1 then
				p2Cursor = #t_battleOption2
			elseif p2Cursor > #t_battleOption2 then
				p2Cursor = 1
			end
		end
		animDraw(rematch2WindowBG)
		animUpdate(rematch2WindowBG)
		textImgDraw(txt_rematch2)
		for i=1, #t_battleOption2 do
			t_battleOption2[i].id = createTextImg(jgFnt, 0, 0, t_battleOption2[i].text, 244, 104.5+i*13,0.9,0.9)
			if i == p2Cursor + 0 then
				textImgSetBank(t_battleOption2[i].id, 5)
			else
				textImgSetBank(t_battleOption2[i].id, 0)
			end
			textImgDraw(t_battleOption2[i].id)
		end
		if not p2Ready then
			animSetWindow(cursorBox, 172, 94.5+p2Cursor*13, 145, 13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	end
	--Rematch Option Timer
	if data.gameMode == "arcade" or data.gameMode == "tower" or data.ftcontrol > 0 or data.attractMode == true then
		--txt_rematchTime = createTextImg(jgFnt, 0, 0, (rematchTimer/gameTick), 160, 70)
		rematchTimeNumber = rematchTimer/gameTick
		nodecimalRematchTime = string.format("%.0f",rematchTimeNumber)
		txt_rematchTime = createTextImg(jgFnt, 0, 0, nodecimalRematchTime, 160, 70)
		if rematchTimer > 0 then
			rematchTimer = rematchTimer - 0.5 --Activate Rematch Timer
			textImgDraw(txt_rematchTime)
		else --when rematchTimer <= 0
			
		end
	end
	if commandGetState(p1Cmd, 'holdu') then
		bufRematchd = 0
		bufRematchu = bufRematchu + 1
	elseif commandGetState(p2Cmd, 'holdu') then
		bufRematch2d = 0
		bufRematch2u = bufRematch2u + 1
	elseif commandGetState(p1Cmd, 'holdd') then
		bufRematchu = 0
		bufRematchd = bufRematchd + 1
	elseif commandGetState(p2Cmd, 'holdd') then
		bufRematch2u = 0
		bufRematch2d = bufRematch2d + 1
	else
		bufRematchu = 0
		bufRematchd = 0
		bufRematch2u = 0
		bufRematch2d = 0
	end
	if not p1Ready then
		if btnPalNo(p1Cmd) > 0 or rematchTimer == 0 then
			if p1Cursor == 1 then
				sndPlay(sysSnd, 100, 1)
				battleOption = 1 --Rematch
				p1Ready = true
			elseif p1Cursor == 2 then
				sndPlay(sysSnd, 100, 1)
				battleOption = 2 --Back to Character Select
				p1Ready = true
				p2Ready = true
			elseif p1Cursor == 3 then
				sndPlay(sysSnd, 100, 1)
				battleOption = 3 --Back to Stage Select
				p1Ready = true
				p2Ready = true
			elseif p1Cursor == 4 then
				sndPlay(sysSnd, 100, 2)
				battleOption = 4 --Back to Main Menu
				p1Ready = true
				p2Ready = true
			end
			if data.p2In == 1 or (data.p1In == 2 and data.p2In == 2) then --Logic for CPU
				battleOption2 = battleOption
				p2Ready = true
			end
			cmdInput()
		end
	end
	if not p2Ready then
		if data.p2In == 2 and data.p1In ~= 2 then
			if btnPalNo(p2Cmd) > 0 or rematchTimer == 0 then
				if p2Cursor == 1 then
					sndPlay(sysSnd, 100, 1)
					battleOption2 = 1
					p2Ready = true
				elseif p2Cursor == 2 then
					sndPlay(sysSnd, 100, 1)
					battleOption2 = 2
					p1Ready = true
					p2Ready = true
				elseif p2Cursor == 3 then
					sndPlay(sysSnd, 100, 1)
					battleOption2 = 3
					p1Ready = true
					p2Ready = true
				elseif p2Cursor == 4 then
					sndPlay(sysSnd, 100, 2)
					battleOption2 = 4
					p1Ready = true
					p2Ready = true
				end
				cmdInput()
			end
		end
	end
	if p1Ready and p2Ready then rematchEnd = true end
	if onlinegame == true then
		if esc() then
			battleOption = 4
			rematchEnd = true
			f_exitOnline()
		end
	end
end

function f_randomRematch()
--Get new random chars for player 1 side
	if randomP1Rematch == true and data.randomCharRematch == "Variable" then
	--Your 1st char will be randomized for your rematch
		if p1numChars == 1 or p1numChars == 2 or p1numChars == 3 or p1numChars == 4 then
			data.t_p1selected[1].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p1selected[1].pal = math.random(1,12)
		end
	--Your 2nd char will be randomized for your rematch
		if p1numChars == 2 or p1numChars == 3 or p1numChars == 4 then
			data.t_p1selected[2].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p1selected[2].pal = math.random(1,12)
		end
	--Your 3rd char will be randomized for your rematch
		if p1numChars == 3 or p1numChars == 4 then
			data.t_p1selected[3].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p1selected[3].pal = math.random(1,12)
		end
	--Your 4th char will be randomized for your rematch
		if p1numChars == 4 then
			data.t_p1selected[4].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p1selected[4].pal = math.random(1,12)
		end
	end
--Get new random chars for player 2 side
	if randomP2Rematch == true and data.randomCharRematch == "Variable" then
		if p2numChars == 1 or p2numChars == 2 or p2numChars == 3 or p2numChars == 4 then
			data.t_p2selected[1].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p2selected[1].pal = math.random(1,12)
		end
		if p2numChars == 2 or p2numChars == 3 or p2numChars == 4 then
			data.t_p2selected[2].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p2selected[2].pal = math.random(1,12)
		end
		if p2numChars == 3 or p2numChars == 4 then
			data.t_p2selected[3].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p2selected[3].pal = math.random(1,12)
		end
		if p2numChars == 4 then
			data.t_p2selected[4].cel = t_randomChars[math.random(#t_randomChars)]
			data.t_p2selected[4].pal = math.random(1,12)
		end
	end
end

--;===========================================================
--; HERE COMES A NEW CHALLENGER SCREEN
--;===========================================================
function f_selectChallenger()
	if data.quickCont == true and data.rosterAdvanced == true then return end
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	playBGM(bgmNothing)
	sndPlay(sysSnd, 200, 1) --Here comes a new Challenger!
	local i = 0
	data.rosterMode = "challenger"
	cmdInput()
	while true do
		if i == 150 or (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			cmdInput()
			break
		end
	--Draw Last Match Backgrounds
		if matchNo == lastMatch then
			animDraw(f_animVelocity(selectHardBG0, -1, -1)) --Draw Red BG for Final Battle
	--Draw Normal Matchs Backgrounds
		else
			--Draw Black BG only for Tower Mode
			if data.gameMode == "tower" then
				animDraw(f_animVelocity(selectTowerBG0, -1, -1))
			--Draw Red BG for Special Modes
			elseif data.gameMode == "bossrush" or data.gameMode == "singleboss" or data.rosterMode == "suddendeath" or data.gameMode == "intermission" then
				animDraw(f_animVelocity(selectHardBG0, -1, -1))
			--Draw Blue BG for Normal Modes
			else
				animDraw(f_animVelocity(selectBG0, -1, -1))
			end
		end
		animDraw(f_animVelocity(challengerWindow, 0, 1.5))
		animDraw(challengerText)
		animUpdate(challengerText)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		i = i + 1
		cmdInput()
		refresh()
	end
end

--VS CHALLENGER (use your character selected for arcade mode to defeat a human challenger the winner keep playing the arcade)
function f_challengerVS()
	f_default()
	setGameMode('vs')
	data.gameMode = "challenger"
	data.rosterMode = "versus"
	data.stageMenu = true
	--data.p2Faces = true
	textImgSetText(txt_mainSelect, "CHALLENGER MODE")
--ARCADE PLAYER IS IN LEFT SIDE - NEW CHALLENGER COMES FROM RIGHT SIDE
	if keepLSide then
		data.p1TeamMenu = {mode = p1RestoreTeamMode, chars = p1RestoreCharsNo}
		data.p2TeamMenu = {mode = p1RestoreTeamMode, chars = p1RestoreCharsNo} --Set Challenger Team Mode at same arcade player conditions
		data.p1SelectMenu = false --Character Data will be loaded in f_p1SelectMenu() following this p1SelectMenu condition
		if P2overP1 then
			setHomeTeam(2)
			remapInput(1, 2)
			remapInput(2, 1)
			setPlayerSide('p1right')
		else
			setHomeTeam(1)
		end
--ARCADE PLAYER IS IN RIGHT SIDE - NEW CHALLENGER COMES FROM LEFT SIDE
	elseif keepRSide then
		data.p1TeamMenu = {mode = p2RestoreTeamMode, chars = p2RestoreCharsNo}
		data.p2TeamMenu = {mode = p2RestoreTeamMode, chars = p2RestoreCharsNo}
		data.p2SelectMenu = false
		if not P2overP1 then
			setHomeTeam(2)
			remapInput(1, 2)
			remapInput(2, 1)
			setPlayerSide('p1right')
		else
			setHomeTeam(1)
		end
	end
	data.p2In = 2
end

--;===========================================================
--; SERVICE SCREENPACK
--;===========================================================
txt_service = createTextImg(jgFnt, 0, 0, "SELECT A SERVICE", 159, 13)

--Transparent background
serviceBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(serviceBG1, 20, 20)
animSetAlpha(serviceBG1, 20, 100)
animUpdate(serviceBG1)

--Up Arrow
serviceUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(serviceUpArrow, 228, 11)
animUpdate(serviceUpArrow)
animSetScale(serviceUpArrow, 0.5, 0.5)

--Down Arrow
serviceDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(serviceDownArrow, 228, 231)
animUpdate(serviceDownArrow)
animSetScale(serviceDownArrow, 0.5, 0.5)

--;===========================================================
--; SERVICE MENU
--;===========================================================
t_service = {
	{id = '', text = "DIFFICULTY LEVEL DOWN"},
	{id = '', text = "POWER WILL START AT MAX"},
	{id = '', text = "ENEMY LIFE AT 1/3"},
	{id = '', text = "CHANGE TEAM MODE"},
	{id = '', text = "DOUBLE DEFENCE"},
	{id = '', text = "NO SERVICE"},
}

t_lockedService = {
	{id = '', text = "This service is Unavailable in Co-Op Mode."},
}
for i=1, #t_lockedService do
	t_lockedService[i].id = createTextImg(font2, 0, 0, t_lockedService[i].text, 161, 210+i*15)
end

t_noService = {
	{id = '', text = "You have Disabled Change Characters by Quick Continue."},
}
for i=1, #t_noService do
	t_noService[i].id = createTextImg(font2, 0, 0, t_noService[i].text, 159.5, 210+i*15)
end

t_devService = {
	{id = '', text = "This service will be available coming soon."},
}
for i=1, #t_devService do
	t_devService[i].id = createTextImg(font2, 0, 0, t_devService[i].text, 161, 210+i*15)
end

function f_service()
	local cursorPosY = 1
	local moveTxt = 0
	local serviceMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	playBGM(bgmService)
	cmdInput()
	while true do
		if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			devService = false
			noService = false
			sndPlay(sysSnd, 100, 0)
			serviceMenu = serviceMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			devService = false
			noService = false
			sndPlay(sysSnd, 100, 0)
			serviceMenu = serviceMenu + 1
		elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) or serviceTimer == 0 then
			--DIFFICULTY -1 BUT ALWAYS NEEDS TO BE > 1
			if serviceMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				if data.difficulty == 1 then
					data.difficulty = 1
				else
					data.difficulty = data.difficulty - 1
					--tmpDifficulty = data.difficulty - 1
					--setCom(2, tmpDifficulty)
				end
				if onlinegame == true then
					script.options.f_netsaveCfg()
				elseif onlinegame == false then
					script.options.f_saveCfg()
				end
				serviceBack = true
				break
			--FULL POWER
			elseif serviceMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				setService("max power")
				serviceBack = true
				break
			--LOW CPU LIFE
			elseif serviceMenu == 3 then
				sndPlay(sysSnd, 100, 1)
				setService("low cpu life")
				serviceBack = true
				break
			--CHANGE PLAYER TEAM MODE
			elseif serviceMenu == 4 then
				if data.coop == true then
					noService = true
				elseif data.quickCont == true then
					noService = true
				else
					sndPlay(sysSnd, 100, 1)
					serviceTeam = true
					break
				end
			--PLAYER DEFENCE X2
			elseif serviceMenu == 5 then
				sndPlay(sysSnd, 100, 1)
				setService("defence x2")
				serviceBack = true
				break
			--[[???
			elseif serviceMenu == 6 then
				devService = true
				sndPlay(sysSnd, 100, 1)
				setService("?")
				break
			]]
			--NOT SERVICE
			else
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				serviceBack = true
				break
			end
			commandBufReset(p1Cmd, 1)
			commandBufReset(p2Cmd, 2)
		end
		--Cursor position calculation
		if serviceMenu < 1 then
			serviceMenu = #t_service
			if #t_service > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_service
			end
		elseif serviceMenu > #t_service then
			serviceMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (serviceMenu - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (serviceMenu - 1) * 15
		end	
		if #t_service <= 14 then
			maxService = #t_service
		elseif serviceMenu - cursorPosY > 0 then
			maxService = serviceMenu + 14 - cursorPosY
		else
			maxService = 14
		end		
		--Draw Character Select Last Match Backgrounds
		if matchNo == lastMatch then
			animDraw(f_animVelocity(selectHardBG0, -1, -1)) --Draw Red BG for Final Battle
		--Draw Character Select Normal Matchs Backgrounds
		else
			--Draw Black BG only for Tower Mode
			if data.gameMode == "tower" then
				animDraw(f_animVelocity(selectTowerBG0, -1, -1))
			--Draw Red BG for Special Modes
			elseif data.gameMode == "bossrush" or data.gameMode == "singleboss" or data.rosterMode == "suddendeath" or data.gameMode == "intermission" then
				animDraw(f_animVelocity(selectHardBG0, -1, -1))
			--Draw Blue BG for Normal Modes
			else
				animDraw(f_animVelocity(selectBG0, -1, -1))
			end
		end
		--Draw Transparent Table BG		
		animSetScale(serviceBG1, 220, maxService*15)
		animSetWindow(serviceBG1, 80,20, 160,210)
		animDraw(serviceBG1)
		--Draw Title Menu
		textImgDraw(txt_service)
		--Draw Cursor
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Service Info
		if noService == true then
			if data.coop == true then
				for i=1, #t_lockedService do
					textImgDraw(t_lockedService[i].id)
				end
			else
				for i=1, #t_noService do
					textImgDraw(t_noService[i].id)
				end
			end
		end
		if devService == true then
			for i=1, #t_devService do
				textImgDraw(t_devService[i].id)
			end
		end
		--Draw Text for Table
		for i=1, maxService do	
			if i > serviceMenu - cursorPosY then
				t_service[i].id = createTextImg(font2, 0, 0, t_service[i].text, 158.5, 15+i*15-moveTxt)
				textImgDraw(t_service[i].id)
			end
		end
		--Service Option Timer
		--txt_serviceTime = createTextImg(jgFnt, 0, 0, (serviceTimer/gameTick), 160, 122)
		serviceTimeNumber = serviceTimer/gameTick
		nodecimalServiceTime = string.format("%.0f",serviceTimeNumber)
		txt_serviceTime = createTextImg(jgFnt, 0, 0, nodecimalServiceTime, 160, 122)
		if serviceTimer == 1 and noService == true then serviceTimer = data.serviceTime end --Reset the timer to avoid being trapped because the service is unavailable.
		if serviceTimer > 0 then
			serviceTimer = serviceTimer - 0.5 --Activate Service Timer
			textImgDraw(txt_serviceTime)
		else --when serviceTimer <= 0
			
		end
		--Draw Up Animated Cursor
		if maxService > 14 then
			animDraw(serviceUpArrow)
			animUpdate(serviceUpArrow)
		end
		--Draw Down Animated Cursor
		if #t_service > 14 and maxService < #t_service then
			animDraw(serviceDownArrow)
			animUpdate(serviceDownArrow)
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		refresh()
	end
end

--;===========================================================
--; RESULTS SCREENPACK
--;===========================================================
--Rank F
rankF = animNew(sysSff, [[
210,0, 0,0,
]])
animAddPos(rankF, 236, 205)
animUpdate(rankF)
animSetScale(rankF, 0.5, 0.5)

--Rank D-
rankDM = animNew(sysSff, [[
210,1, 0,0,
]])
animAddPos(rankDM, 236, 205)
animUpdate(rankDM)
animSetScale(rankDM, 0.5, 0.5)

--Rank D
rankD = animNew(sysSff, [[
210,2, 0,0,
]])
animAddPos(rankD, 236, 205)
animUpdate(rankD)
animSetScale(rankD, 0.5, 0.5)

--Rank D+
rankDP = animNew(sysSff, [[
210,3, 0,0,
]])
animAddPos(rankDP, 236, 205)
animUpdate(rankDP)
animSetScale(rankDP, 0.5, 0.5)

--Rank C
rankC = animNew(sysSff, [[
210,4, 0,0,
]])
animAddPos(rankC, 236, 205)
animUpdate(rankC)
animSetScale(rankC, 0.5, 0.5)

--Rank C+
rankCP = animNew(sysSff, [[
210,5, 0,0,
]])
animAddPos(rankCP, 236, 205)
animUpdate(rankCP)
animSetScale(rankCP, 0.5, 0.5)

--Rank B
rankB = animNew(sysSff, [[
210,6, 0,0,
]])
animAddPos(rankB, 236, 205)
animUpdate(rankB)
animSetScale(rankB, 0.5, 0.5)

--Rank B+
rankBP = animNew(sysSff, [[
210,7, 0,0,
]])
animAddPos(rankBP, 236, 205)
animUpdate(rankBP)
animSetScale(rankBP, 0.5, 0.5)

--Rank A
rankA = animNew(sysSff, [[
210,8, 0,0,
]])
animAddPos(rankA, 236, 205)
animUpdate(rankA)
animSetScale(rankA, 0.5, 0.5)

--Rank A+
rankAP = animNew(sysSff, [[
210,9, 0,0,
]])
animAddPos(rankAP, 236, 205)
animUpdate(rankAP)
animSetScale(rankAP, 0.5, 0.5)

--Rank S
rankS = animNew(sysSff, [[
210,10, 0,0,
]])
animAddPos(rankS, 236, 205)
animUpdate(rankS)
animSetScale(rankS, 0.5, 0.5)

--Rank S+
rankSP = animNew(sysSff, [[
210,11, 0,0,
]])
animAddPos(rankSP, 236, 205)
animUpdate(rankSP)
animSetScale(rankSP, 0.5, 0.5)

--Rank XS
rankXS = animNew(sysSff, [[
210,12, 0,0,
]])
animAddPos(rankXS, 232, 205)
animUpdate(rankXS)
animSetScale(rankXS, 0.5, 0.5)

--Rank GDLK
rankGDLK = animNew(sysSff, [[
210,13, 0,0,
]])
animAddPos(rankGDLK, 240, 205)
animUpdate(rankGDLK)
animSetScale(rankGDLK, 0.5, 0.5)

--;===========================================================
--; RESULTS SCREEN
--;===========================================================
txt_resultTitle = createTextImg(font14, 0, 0, "", 159, 20)
txt_resultNo = createTextImg(survNumFnt, 0, 1, "", 2, 150)
txt_resultWins = createTextImg(survNumFnt, 0, -1, "", 320, 110)
txt_resultLoses = createTextImg(survNumFnt, 0, -1, "", 320, 200)
txt_resultTime = createTextImg(jgFnt, 0, 1, "TIME: 9'99''999", 32, 220) --WIP
txt_resultScore = createTextImg(jgFnt, 0, 1, "SCORE: 999.999.999", 32, 234) --WIP
txt_resultRank = createTextImg(jgFnt, 0, 1, "RANK", 262, 205)
txt_resultName = createTextImg(font6, 0, 0, "", 0, 0)
txt_resultTeam = createTextImg(font6, 0, 0, "", 0, 0)

--Result BG
resultBG = animNew(sysSff, [[280,0, 0,0, -1]])
animAddPos(resultBG, 0, 0)
animUpdate(resultBG)

function f_result(state)
	--if state == "win" then
	--elseif state == "lost" then
	--end
	if data.gameMode == "tower" then rosterSize = #t_selTower[destinySelect].kombats else rosterSize = #t_roster end
	local victoriesPercent = (winCnt/rosterSize)*100
	local charPortr = nil
	local charTable = nil
	local scaleData = nil
	if data.gameMode == "survival" or data.gameMode == "endless" or data.gameMode == "allroster" then
		--Common Data
		playBGM(bgmResults)
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			textImgSetText(txt_resultName, f_getName(data.t_p2selected[1].cel))
			charPortr = data.t_p2selected[1].cel
			charTable = data.t_p2selected
			if p2teamMode > 0 then
				textImgSetText(txt_resultTeam, "TEAM")
			elseif p1teamMode == 0 then
				textImgSetText(txt_resultTeam, "")
			end
		else
			textImgSetText(txt_resultName, f_getName(data.t_p1selected[1].cel))
			charPortr = data.t_p1selected[1].cel
			charTable = data.t_p1selected
			if p1teamMode > 0 then
				textImgSetText(txt_resultTeam, "TEAM")
			elseif p1teamMode == 0 then
				textImgSetText(txt_resultTeam, "")
			end
		end
		if data.gameMode == "survival" then
			textImgSetAlign(txt_resultTeam, -1)
			textImgSetPos(txt_resultTeam, 318, 48)
			textImgSetAlign(txt_resultName, -1)
			textImgSetPos(txt_resultName, 318, 60)
			textImgSetText(txt_resultNo, winCnt.." WINS")
			textImgSetText(txt_resultTitle, "SURVIVAL RESULTS")
		else--if data.gameMode == "endless" or data.gameMode == "allroster" then
			textImgSetAlign(txt_resultTeam, 1)
			textImgSetPos(txt_resultTeam, 2, 50)
			textImgSetAlign(txt_resultName, 1)
			textImgSetPos(txt_resultName, 2, 65)
			textImgSetText(txt_resultWins, winCnt.." WINS")
			textImgSetText(txt_resultLoses, looseCnt.." LOSES")
			if data.gameMode == "endless" then textImgSetText(txt_resultTitle, "ENDLESS RESULTS")
			elseif data.rosterMode == "suddendeath" then textImgSetText(txt_resultTitle, "SUDDEN DEATH RESULTS")
			--elseif data.rosterMode == "timeattack" then textImgSetText(txt_resultTitle, "TIME ATTACK RESULTS")
			--elseif data.rosterMode == "scoreattack" then textImgSetText(txt_resultTitle, "SCORE ATTACK RESULTS")
			end
		end
	else --Boss/Bonus Rush Exit
		return
	end
	--Portraits Scale Logic
	local charData = t_selChars[charPortr+1]
	if charData.resultSprScale ~= nil then
		scaleData = charData.resultSprScale
	else
		scaleData = "1.0,1.0"
	end
	local xPortScale, yPortScale = scaleData:match('^([^,]-)%s*,%s*(.-)$')
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			cmdInput()
			break
		end
		if data.gameMode == "survival" then
			--Draw Character Portrait
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				drawResultPortrait(charPortr, 320, 80, -xPortScale, yPortScale)
			--Draw Character Sprite Animations
			elseif data.charPresentation == "Sprite" then
				for j=#charTable, 1, -1 do
					f_drawCharAnim(t_selChars[charTable[j].cel+1], 'p2AnimWin', 180 + (2*j-1) * 18, 206.5, charTable[j].up)
				end
			end
			animDraw(resultBG) --Draw BG
			textImgDraw(txt_resultNo)
			textImgDraw(txt_resultRank)
			--Show Ranks According Some Percentage Rates
			if victoriesPercent < 35 then --0% -- 34%
				animDraw(rankF)
			elseif victoriesPercent >= 35 and victoriesPercent < 40 then --35% -- 39%
				animDraw(rankDM)
			elseif victoriesPercent >= 40 and victoriesPercent < 45 then --40% -- 44%
				animDraw(rankD)
			elseif victoriesPercent >= 45 and victoriesPercent < 50 then --45% -- 49%
				animDraw(rankDP)
			elseif victoriesPercent >= 50 and victoriesPercent < 55 then --50% -- 54%
				animDraw(rankC)
			elseif victoriesPercent >= 55 and victoriesPercent < 60 then --55% -- 59%
				animDraw(rankCP)
			elseif victoriesPercent >= 60 and victoriesPercent < 65 then --60% -- 64%
				animDraw(rankB)
			elseif victoriesPercent >= 65 and victoriesPercent < 70 then --65% -- 69%
				animDraw(rankBP)
			elseif victoriesPercent >= 70 and victoriesPercent < 75 then --70% -- 74%
				animDraw(rankA)
			elseif victoriesPercent >= 75 and victoriesPercent < 80 then --75% -- 79
				animDraw(rankAP)
			elseif victoriesPercent >= 80 and victoriesPercent < 85 then --80% -- 84%
				animDraw(rankS)
			elseif victoriesPercent >= 85 and victoriesPercent < 90 then --85% -- 89%
				animDraw(rankSP)
			elseif victoriesPercent >= 90 and victoriesPercent < 95 then --90% -- 94%
				animDraw(rankXS)
			elseif victoriesPercent >= 95 then --95% -- 100%
				animDraw(rankGDLK)
			end
		else
			--Draw Character Portrait
			if data.charPresentation == "Portrait" or data.charPresentation == "Mixed" then
				drawResultPortrait(charPortr, 0, 80, xPortScale, yPortScale)
			--Draw Character Sprite Animations
			elseif data.charPresentation == "Sprite" then
				for j=#charTable, 1, -1 do
					f_drawCharAnim(t_selChars[charTable[j].cel+1], 'p1AnimWin', 139 - (2*j-1) * 18, 206.5, charTable[j].up)
				end
			end
			animDraw(resultBG) --Draw BG
			textImgDraw(txt_resultWins)
			textImgDraw(txt_resultLoses)
		end
		--textImgDraw(txt_resultTime)
		--textImgDraw(txt_resultScore)
		textImgDraw(txt_resultTitle)
		textImgDraw(txt_resultName)
		textImgDraw(txt_resultTeam)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CONTINUE SCREENPACK
--;===========================================================
--Background
contBG0 = animNew(contSff, [[
1000,0, -32,8, -1
]])
animUpdate(contBG0)

--Black Background Cover Top
contBG1 = animNew(contSff, [[
1000,0, 0,0, -1
]])
animSetColorKey(contBG1, -1)
animSetTile(contBG1, 1, 0)
animSetWindow(contBG1, 0, 0, 320, 40)
animSetAlpha(contBG1, 0, 0)
animUpdate(contBG1)

--Black Background Cover Bottom
contBG2 = animNew(contSff, [[
1000,0, 0,0, -1
]])
animSetColorKey(contBG2, -1)
animSetTile(contBG2, 1, 0)
animSetWindow(contBG2, 0, 200, 320, 40)
animSetAlpha(contBG2, 0, 0)
animUpdate(contBG2)

--;===========================================================
--; CONTINUE SCREEN
--;===========================================================
--Coins left text
txt_coins = createTextImg(jgFnt, 0, 1, "", 15, 30)
txt_cont = createTextImg(jgFnt, 0, 1, "", 158, 30)

function f_continue()
	setService("")
	sndPlay(contSnd, 1, 1)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
	playBGM(bgmContinue)
	f_contTimerReset()
	f_gameOverReset()
	data.continue = 0
	serviceTeam = false
	local tablePos = ''
	local tablePos2 = ''
	local tablePos3 = ''
	local tablePos4 = ''
	local anim = false
	local anim2 = false
	local anim3 = false
	local anim4 = false
	local animLength = 0
	local animLength2 = 0
	local animLength3 = 0
	local animLength4 = 0
	local i = 0
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
		if p2numChars == 1 or p2numChars == 2 or p2numChars == 3 or p2numChars == 4 then
			tablePos = t_selChars[data.t_p2selected[1].cel+1] --Your 1st char appear in continue screen
		end
		if p2numChars == 2 or p2numChars == 3 or p2numChars == 4 then
			tablePos2 = t_selChars[data.t_p2selected[2].cel+1] --Your 2nd char appears in continue screen
		end
		if p2numChars == 3 or p2numChars == 4 then
			tablePos3 = t_selChars[data.t_p2selected[3].cel+1] --Your 3rd char appears in continue screen
		end
		if p2numChars == 4 then
			tablePos4 = t_selChars[data.t_p2selected[4].cel+1] --Your 4th char appears in continue screen
		end
	else
		if p1numChars == 1 or p1numChars == 2 or p1numChars == 3 or p1numChars == 4 then
			tablePos = t_selChars[data.t_p1selected[1].cel+1]
		end
		if p1numChars == 2 or p1numChars == 3 or p1numChars == 4 then
			tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
		end
		if p1numChars == 3 or p1numChars == 4 then
			tablePos3 = t_selChars[data.t_p1selected[3].cel+1]
		end
		if p1numChars == 4 then
			tablePos4 = t_selChars[data.t_p1selected[4].cel+1]	
		end
	end
	if tablePos.sffData ~= nil and tablePos.dizzy ~= nil then
		anim = f_animFromTable(tablePos['dizzy'], tablePos.sffData, 80, 180, tablePos.xscale, tablePos.yscale, 0, 1)
	end
	if tablePos2.sffData ~= nil and tablePos2.dizzy ~= nil then
		anim2 = f_animFromTable(tablePos2['dizzy'], tablePos2.sffData, 60, 180, tablePos2.xscale, tablePos2.yscale, 0, 1)
	end
	if tablePos3.sffData ~= nil and tablePos3.dizzy ~= nil then
		anim3 = f_animFromTable(tablePos3['dizzy'], tablePos3.sffData, 40, 180, tablePos3.xscale, tablePos3.yscale, 0, 1)
	end
	if tablePos4.sffData ~= nil and tablePos4.dizzy ~= nil then
		anim4 = f_animFromTable(tablePos4['dizzy'], tablePos4.sffData, 100, 180, tablePos4.xscale, tablePos4.yscale, 0, 1)
	end
	if data.attractMode == true then
		textImgSetText(txt_coins, "CREDITS: "..data.attractCoins)
	--else
		--textImgSetText(txt_coins, "COINS: "..data.coins)
	end
	textImgSetText(txt_cont, "TIMES CONTINUED: "..data.continueCount)
	cmdInput()
	while true do
		animDraw(contBG0)
		i = i + 1
		--if commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			--cmdInput()
			--data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
			--playBGM(bgmTitle)
			--break
		if data.continue == 0 then --waiting for player's decision
			if anim4 then
				animDraw(anim4)
				animUpdate(anim4)
			end
			if anim3 then
				animDraw(anim3)
				animUpdate(anim3)
			end	
			if anim2 then
				animDraw(anim2)
				animUpdate(anim2)
			end
			if anim then
				animDraw(anim)
				animUpdate(anim)
				animDraw(contBG1)
				animDraw(contBG2)
			end
			if commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
				if tablePos.sffData ~= nil and tablePos.win ~= nil then
					anim, animLength = f_animFromTable(tablePos['win'], tablePos.sffData, 80, 180, tablePos.xscale, tablePos.yscale, 0, 1)
				else
					animLength = 0
				end
				if tablePos2.sffData ~= nil and tablePos2.win ~= nil then
					anim2, animLength2 = f_animFromTable(tablePos2['win'], tablePos2.sffData, 60, 180, tablePos2.xscale, tablePos2.yscale, 0, 1)
				else
					animLength2 = 0
				end
				if tablePos3.sffData ~= nil and tablePos3.win ~= nil then
					anim3, animLength3 = f_animFromTable(tablePos3['win'], tablePos3.sffData, 40, 180, tablePos3.xscale, tablePos3.yscale, 0, 1)
				else
					animLength3 = 0
				end
				if tablePos4.sffData ~= nil and tablePos4.win ~= nil then
					anim4, animLength4 = f_animFromTable(tablePos4['win'], tablePos4.sffData, 100, 180, tablePos4.xscale, tablePos4.yscale, 0, 1)
				else
					animLength4 = 0
				end
				if onlinegame == false then
					if data.attractMode == true then
						if data.attractCoins < 1 then
							data.attractCoins = 0
						elseif data.attractCoins >= 1 then
							data.attractCoins = data.attractCoins - 1
						end
						f_saveProgress()
					--else
						--if data.coins < 1 then
							--data.coins = 0
						--elseif data.coins >= 1 then
							--data.coins = data.coins - 1 --Lose 1 Coin by be defeated :c
						--end
						--f_saveProgress()
					end
				elseif onlinegame == true then
					--Free Online Arcade to Avoid Desync
				end
				data.continueCount = data.continueCount + 1 --Times Continue
				--f_saveProgress()
				if data.attractMode == true then
					textImgSetText(txt_coins, "CREDITS: "..data.attractCoins)
				--else
					--textImgSetText(txt_coins, "COINS: "..data.coins)
				end
				textImgSetText(txt_cont, "TIMES CONTINUED: "..data.continueCount)				
				fadeContinue = f_fadeAnim(30, 'fadeout', 'black', fadeSff)
				data.continue = 1
			elseif i > 1366 then --Continue = NO
				data.continue = 2
				f_gameOver()
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				break
			end
			animDraw(contTimer)
			if (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) and i >= 71 then
				local cnt = 0
				if i < 135 then
					cnt = 135
				elseif i <= 262 then
					cnt = 262
				elseif i < 389 then
					cnt = 389
				elseif i < 516 then
					cnt = 516
				elseif i < 643 then
					cnt = 643
				elseif i < 770 then
					cnt = 770
				elseif i < 897 then
					cnt = 897
				elseif i < 1024 then
					cnt = 1024
				elseif i < 1151 then
					cnt = 1151
				elseif i < 1278 then
					cnt = 1278
				end
				while i < cnt do
					i = i + 1
					animUpdate(contTimer)
				end
			else
				animUpdate(contTimer)
			end
			if i == 135 then
				sndPlay(contSnd, 0, 9)
			elseif i == 262 then
				sndPlay(contSnd, 0, 8)
			elseif i == 389 then
				sndPlay(contSnd, 0, 7)
			elseif i == 516 then
				sndPlay(contSnd, 0, 6)
			elseif i == 643 then
				sndPlay(contSnd, 0, 5)
			elseif i == 770 then
				sndPlay(contSnd, 0, 4)
			elseif i == 897 then
				sndPlay(contSnd, 0, 3)
			elseif i == 1024 then
				sndPlay(contSnd, 0, 2)
			elseif i == 1151 then
				sndPlay(contSnd, 0, 1)
			elseif i == 1278 then
				sndPlay(contSnd, 0, 0)
			end
		elseif data.continue == 1 then --Continue = YES
			if animLength4+30 > 0 then
					animLength4 = animLength4 - 1
					if anim4 then
						animDraw(anim4)
						if animLength4 > 0 then
							animUpdate(anim4)
						end
					end	
				--if animLength4 < 0 then
					--animDraw(fadeContinue)
					--animUpdate(fadeContinue)
				--end
				if animLength3+30 > 0 then
					animLength3 = animLength3 - 1
					if anim3 then
						animDraw(anim3)
						if animLength3 > 0 then
							animUpdate(anim3)
						end
					end
				end	
				--if animLength3 < 0 then
					--animDraw(fadeContinue)
					--animUpdate(fadeContinue)
				--end
				if animLength2+30 > 0 then
					animLength2 = animLength2 - 1
					if anim2 then
						animDraw(anim2)
						if animLength2 > 0 then
							animUpdate(anim2)
						end
					end
				end	
				--if animLength2 < 0 then
					--animDraw(fadeContinue)
					--animUpdate(fadeContinue)
				--end
				if animLength+30 > 0 then
					animLength = animLength - 1
					if anim then
						animDraw(anim)
						if animLength > 0 then
							animUpdate(anim)
						end
					end
					animDraw(contBG1)
					animDraw(contBG2)
				end
				if animLength < 0 then
					animDraw(fadeContinue)
					animUpdate(fadeContinue)
				end
			else
				data.fadeSelect = f_fadeAnim(MainFadeInTime, 'fadein', 'black', fadeSff)
				cmdInput()
				--service screen
				if data.serviceScreen == false then
					--Do nothing and don't show the screen
				elseif data.serviceScreen == true then
					f_service()
				end
				if serviceTeam == false then --Draw Portrait BG when select a service different of Change Team
					if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
						p2BG = true
						p2memberPreview = 1
					else
						p1BG = true
						p1memberPreview = 1
					end
					if data.coop then
						--p2BG = true
						--p2memberPreview = 1
						p2coopReady = false
						p2coopRandom = false
					end
				end
				--challenger screen
				if data.challengerScreen == false then
					f_selectMusic() --and don't show the screen
				elseif data.challengerScreen == true then
					f_selectChallenger()
					f_challengerMusic()
				else
					f_selectMusic() --play original char select song instead of challenger song
				end
				break
			end
		end
		if i >= 71 then --show when count starts counting down
			if onlinegame == false then
				textImgDraw(txt_coins) --Show Coins Count
			elseif onlinegame == true then
				--Don't Show Coins Count
			end
			textImgDraw(txt_cont) --Always Show Times Continue Count
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; GAME OVER SCREENPACK
--;===========================================================
function f_contTimerReset()
	contTimer = animNew(contSff, [[
	2,0, 0,0, 1 --1
	2,1, 0,0, 1 --2
	2,2, 0,0, 1 --3
	2,3, 0,0, 3 --6
	2,4, 0,0, 3 --9
	2,5, 0,0, 1 --10
	2,6, 0,0, 3 --13
	2,7, 0,0, 2 --15
	2,8, 0,0, 2 --17
	2,9, 0,0, 2 --19
	2,10, 0,0, 1 --20
	2,11, 0,0, 5 --25
	2,12, 0,0, 5 --30
	2,13, 0,0, 1 --31
	2,14, 0,0, 1 --32
	2,15, 0,0, 3 --35
	2,16, 0,0, 3 --38
	2,17, 0,0, 1 --39
	2,18, 0,0, 5 --44
	2,19, 0,0, 1 --45
	2,20, 0,0, 4 --49
	2,21, 0,0, 1 --50
	2,22, 0,0, 1 --51
	2,23, 0,0, 1 --52
	2,24, 0,0, 2 --54
	2,25, 0,0, 1 --55
	2,26, 0,0, 5 --60
	2,27, 0,0, 5 --65
	2,28, 0,0, 1 --66
	2,29, 0,0, 3 --69
	2,30, 0,0, 2 --71
	3,0, 0,0, 6 --77
	3,1, 0,0, 54 --131
	3,2, 0,0, 4 --135
	3,3, 0,0, 4 --139
	3,4, 0,0, 4 --143
	3,5, 0,0, 4 --147
	3,6, 0,0, 44 --191
	3,7, 0,0, 9 --200
	3,8, 0,0, 4 --204
	3,9, 0,0, 3 --207
	3,10, 0,0, 2 --209
	3,11, 0,0, 2 --211
	3,12, 0,0, 1 --212
	3,13, 0,0, 2 --214
	3,14, 0,0, 1 --215
	3,15, 0,0, 1 --216
	3,16, 0,0, 2 --218
	3,17, 0,0, 1 --219
	3,18, 0,0, 1 --220
	3,19, 0,0, 1 --221
	4,0, 0,0, 1 --222
	4,1, 0,0, 2 --224
	4,2, 0,0, 2 --226
	4,3, 0,0, 2 --228
	4,4, 0,0, 2 --230
	4,5, 0,0, 2 --232
	4,6, 0,0, 2 --234
	4,7, 0,0, 1 --235
	4,8, 0,0, 2 --237
	4,9, 0,0, 3 --240
	4,10, 0,0, 4 --244
	4,11, 0,0, 9 --253
	4,12, 0,0, 5 --258
	4,13, 0,0, 4 --262
	4,14, 0,0, 4 --266
	4,15, 0,0, 4 --270
	4,16, 0,0, 4 --274
	4,17, 0,0, 44 --318
	4,18, 0,0, 9 --327
	4,19, 0,0, 4 --331
	4,20, 0,0, 3 --334
	4,21, 0,0, 2 --336
	4,22, 0,0, 2 --338
	4,23, 0,0, 1 --339
	4,24, 0,0, 2 --341
	4,25, 0,0, 1 --342
	4,26, 0,0, 1 --343
	4,27, 0,0, 2 --345
	4,28, 0,0, 1 --346
	4,29, 0,0, 1 --347
	4,30, 0,0, 1 --348
	5,0, 0,0, 1 --349
	5,1, 0,0, 2 --351
	5,2, 0,0, 2 --353
	5,3, 0,0, 2 --355
	5,4, 0,0, 2 --357
	5,5, 0,0, 2 --359
	5,6, 0,0, 2 --361
	5,7, 0,0, 1 --362
	5,8, 0,0, 2 --364
	5,9, 0,0, 3 --367
	5,10, 0,0, 4 --371
	5,11, 0,0, 9 --380
	5,12, 0,0, 5 --385
	5,13, 0,0, 4 --389
	5,14, 0,0, 4 --393
	5,15, 0,0, 4 --397
	5,16, 0,0, 4 --401
	5,17, 0,0, 44 --445
	5,18, 0,0, 9 --454
	5,19, 0,0, 4 --458
	5,20, 0,0, 3 --461
	5,21, 0,0, 2 --463
	5,22, 0,0, 2 --465
	5,23, 0,0, 1 --466
	5,24, 0,0, 2 --468
	5,25, 0,0, 1 --469
	5,26, 0,0, 1 --470
	5,27, 0,0, 2 --472
	5,28, 0,0, 1 --473
	5,29, 0,0, 1 --474
	5,30, 0,0, 1 --475
	6,0, 0,0, 1 --476
	6,1, 0,0, 2 --478
	6,2, 0,0, 2 --480
	6,3, 0,0, 2 --482
	6,4, 0,0, 2 --484
	6,5, 0,0, 2 --486
	6,6, 0,0, 2 --488
	6,7, 0,0, 1 --489
	6,8, 0,0, 2 --491
	6,9, 0,0, 3 --494
	6,10, 0,0, 4 --498
	6,11, 0,0, 9 --507
	6,12, 0,0, 5 --512
	6,13, 0,0, 4 --516
	6,14, 0,0, 4 --520
	6,15, 0,0, 4 --524
	6,16, 0,0, 4 --528
	6,17, 0,0, 44 --572
	6,18, 0,0, 9 --581
	6,19, 0,0, 4 --585
	6,20, 0,0, 3 --588
	6,21, 0,0, 2 --590
	6,22, 0,0, 2 --592
	6,23, 0,0, 1 --593
	6,24, 0,0, 2 --595
	6,25, 0,0, 1 --596
	6,26, 0,0, 1 --597
	6,27, 0,0, 2 --599
	6,28, 0,0, 1 --600
	6,29, 0,0, 1 --601
	6,30, 0,0, 1 --602
	7,0, 0,0, 1 --603
	7,1, 0,0, 2 --605
	7,2, 0,0, 2 --607
	7,3, 0,0, 2 --609
	7,4, 0,0, 2 --611
	7,5, 0,0, 2 --613
	7,6, 0,0, 2 --615
	7,7, 0,0, 1 --616
	7,8, 0,0, 2 --618
	7,9, 0,0, 3 --621
	7,10, 0,0, 4 --625
	7,11, 0,0, 9 --634
	7,12, 0,0, 5 --639
	7,13, 0,0, 4 --643
	7,14, 0,0, 4 --647
	7,15, 0,0, 4 --651
	7,16, 0,0, 4 --655
	7,17, 0,0, 44 --699
	7,18, 0,0, 9 --708
	7,19, 0,0, 4 --712
	7,20, 0,0, 3 --715
	7,21, 0,0, 2 --717
	7,22, 0,0, 2 --719
	7,23, 0,0, 1 --720
	7,24, 0,0, 2 --722
	7,25, 0,0, 1 --723
	7,26, 0,0, 1 --724
	7,27, 0,0, 2 --726
	7,28, 0,0, 1 --727
	7,29, 0,0, 1 --728
	7,30, 0,0, 1 --729
	8,0, 0,0, 1 --730
	8,1, 0,0, 2 --732
	8,2, 0,0, 2 --734
	8,3, 0,0, 2 --736
	8,4, 0,0, 2 --738
	8,5, 0,0, 2 --740
	8,6, 0,0, 2 --742
	8,7, 0,0, 1 --743
	8,8, 0,0, 2 --745
	8,9, 0,0, 3 --748
	8,10, 0,0, 4 --752
	8,11, 0,0, 9 --761
	8,12, 0,0, 5 --766
	8,13, 0,0, 4 --770
	8,14, 0,0, 4 --774
	8,15, 0,0, 4 --778
	8,16, 0,0, 4 --782
	8,17, 0,0, 44 --826
	8,18, 0,0, 9 --835
	8,19, 0,0, 4 --839
	8,20, 0,0, 3 --842
	8,21, 0,0, 2 --844
	8,22, 0,0, 2 --846
	8,23, 0,0, 1 --847
	8,24, 0,0, 2 --849
	8,25, 0,0, 1 --850
	8,26, 0,0, 1 --851
	8,27, 0,0, 2 --853
	8,28, 0,0, 1 --854
	8,29, 0,0, 1 --855
	8,30, 0,0, 1 --856
	9,0, 0,0, 1 --857
	9,1, 0,0, 2 --859
	9,2, 0,0, 2 --861
	9,3, 0,0, 2 --863
	9,4, 0,0, 2 --865
	9,5, 0,0, 2 --867
	9,6, 0,0, 2 --869
	9,7, 0,0, 1 --870
	9,8, 0,0, 2 --872
	9,9, 0,0, 3 --875
	9,10, 0,0, 4 --879
	9,11, 0,0, 9 --888
	9,12, 0,0, 5 --893
	9,13, 0,0, 4 --897
	9,14, 0,0, 4 --901
	9,15, 0,0, 4 --905
	9,16, 0,0, 4 --909
	9,17, 0,0, 44 --953
	9,18, 0,0, 9 --962
	9,19, 0,0, 4 --966
	9,20, 0,0, 3 --969
	9,21, 0,0, 2 --971
	9,22, 0,0, 2 --973
	9,23, 0,0, 1 --974
	9,24, 0,0, 2 --976
	9,25, 0,0, 1 --977
	9,26, 0,0, 1 --978
	9,27, 0,0, 2 --980
	9,28, 0,0, 1 --981
	9,29, 0,0, 1 --982
	9,30, 0,0, 1 --983
	10,0, 0,0, 1 --984
	10,1, 0,0, 2 --986
	10,2, 0,0, 2 --988
	10,3, 0,0, 2 --990
	10,4, 0,0, 2 --992
	10,5, 0,0, 2 --994
	10,6, 0,0, 2 --996
	10,7, 0,0, 1 --997
	10,8, 0,0, 2 --999
	10,9, 0,0, 3 --1002
	10,10, 0,0, 4 --1006
	10,11, 0,0, 9 --1015
	10,12, 0,0, 5 --1020
	10,13, 0,0, 4 --1024
	10,14, 0,0, 4 --1028
	10,15, 0,0, 4 --1032
	10,16, 0,0, 4 --1036
	10,17, 0,0, 44 --1080
	10,18, 0,0, 9 --1089
	10,19, 0,0, 4 --1093
	10,20, 0,0, 3 --1096
	10,21, 0,0, 2 --1098
	10,22, 0,0, 2 --1100
	10,23, 0,0, 1 --1101
	10,24, 0,0, 2 --1103
	10,25, 0,0, 1 --1104
	10,26, 0,0, 1 --1105
	10,27, 0,0, 2 --1107
	10,28, 0,0, 1 --1108
	10,29, 0,0, 1 --1109
	10,30, 0,0, 1 --1110
	11,0, 0,0, 1 --1111
	11,1, 0,0, 2 --1113
	11,2, 0,0, 2 --1115
	11,3, 0,0, 2 --1117
	11,4, 0,0, 2 --1119
	11,5, 0,0, 2 --1121
	11,6, 0,0, 2 --1123
	11,7, 0,0, 1 --1124
	11,8, 0,0, 2 --1126
	11,9, 0,0, 3 --1129
	11,10, 0,0, 4 --1133
	11,11, 0,0, 9 --1142
	11,12, 0,0, 5 --1147
	11,13, 0,0, 4 --1151
	11,14, 0,0, 4 --1155
	11,15, 0,0, 4 --1159
	11,16, 0,0, 4 --1163
	11,17, 0,0, 44 --1207
	11,18, 0,0, 9 --1216
	11,19, 0,0, 4 --1220
	11,20, 0,0, 3 --1223
	11,21, 0,0, 2 --1225
	11,22, 0,0, 2 --1227
	11,23, 0,0, 1 --1228
	11,24, 0,0, 2 --1230
	11,25, 0,0, 1 --1231
	11,26, 0,0, 1 --1232
	11,27, 0,0, 2 --1234
	11,28, 0,0, 1 --1235
	11,29, 0,0, 1 --1236
	11,30, 0,0, 1 --1237
	12,0, 0,0, 1 --1238
	12,1, 0,0, 2 --1240
	12,2, 0,0, 2 --1242
	12,3, 0,0, 2 --1244
	12,4, 0,0, 2 --1246
	12,5, 0,0, 2 --1248
	12,6, 0,0, 2 --1250
	12,7, 0,0, 1 --1251
	12,8, 0,0, 2 --1253
	12,9, 0,0, 3 --1256
	12,10, 0,0, 4 --1260
	12,11, 0,0, 9 --1269
	12,12, 0,0, 5 --1274
	12,13, 0,0, 4 --1278
	12,14, 0,0, 4 --1282
	12,15, 0,0, 4 --1286
	12,16, 0,0, 4 --1290
	12,17, 0,0, 75 --1365
	12,18, 0,0, 1 --1366
	]])
	--black background for 1 frame
	animAddPos(contTimer, -53, 0)
end

function f_gameOverReset()
	gameOver = animNew(contSff, [[
	100,0, 0,0, 1 --1
	100,1, 0,0, 1 --2
	100,2, 0,0, 1 --3
	100,3, 0,0, 1 --4
	100,4, 0,0, 1 --5
	100,5, 0,0, 1 --6
	100,6, 0,0, 1 --7
	100,7, 0,0, 1 --8
	100,8, 0,0, 1 --9
	100,9, 0,0, 1 --10
	100,10, 0,0, 1 --11
	100,11, 0,0, 1 --12
	100,12, 0,0, 1 --13
	100,13, 0,0, 1 --14
	100,14, 0,0, 1 --15
	100,15, 0,0, 1 --16
	100,16, 0,0, 1 --17
	100,17, 0,0, 1 --18
	100,18, 0,0, 1 --19
	100,19, 0,0, 1 --20
	100,20, 0,0, 1 --21
	100,21, 0,0, 1 --22
	100,22, 0,0, 1 --23
	100,23, 0,0, 1 --24
	100,24, 0,0, 1 --25
	100,25, 0,0, 1 --26
	100,26, 0,0, 1 --27
	100,27, 0,0, 1 --28
	100,28, 0,0, 1 --29
	100,29, 0,0, 1 --30
	100,30, 0,0, 1 --31
	100,31, 0,0, 1 --32
	101,0, 0,0, 1 --33
	101,1, 0,0, 1 --34
	101,2, 0,0, 1 --35
	101,3, 0,0, 1 --36
	101,4, 0,0, 1 --37
	101,5, 0,0, 1 --38
	101,6, 0,0, 1 --39
	101,7, 0,0, 1 --40
	101,8, 0,0, 1 --41
	101,9, 0,0, 1 --42
	101,10, 0,0, 1 --43
	101,11, 0,0, 1 --44
	101,12, 0,0, 1 --45
	101,13, 0,0, 1 --46
	101,14, 0,0, 1 --47
	101,15, 0,0, 1 --48
	101,16, 0,0, 1 --49
	101,17, 0,0, 1 --50
	101,18, 0,0, 1 --51
	101,19, 0,0, 1 --52
	101,20, 0,0, 1 --53
	101,21, 0,0, 1 --54
	101,22, 0,0, 1 --55
	101,23, 0,0, 1 --56
	101,24, 0,0, 1 --57
	101,25, 0,0, 1 --58
	101,26, 0,0, 1 --59
	101,27, 0,0, 1 --60
	101,28, 0,0, 1 --61
	101,29, 0,0, 1 --62
	101,30, 0,0, 1 --63
	101,31, 0,0, 1 --64
	101,32, 0,0, 1 --65
	101,33, 0,0, 1 --66
	101,34, 0,0, 1 --67
	101,35, 0,0, 1 --68
	101,36, 0,0, 1 --69
	101,37, 0,0, 1 --70
	101,38, 0,0, 1 --71
	101,39, 0,0, 1 --72
	101,40, 0,0, 1 --73
	101,41, 0,0, 1 --74
	101,42, 0,0, 1 --75
	101,43, 0,0, 1 --76
	101,44, 0,0, 1 --77
	101,45, 0,0, 1 --78
	101,46, 0,0, 1 --79
	101,47, 0,0, 1 --80
	101,48, 0,0, 1 --81
	101,49, 0,0, 1 --82
	101,50, 0,0, 1 --83
	101,51, 0,0, 1 --84
	101,52, 0,0, 1 --85
	101,53, 0,0, 1 --86
	101,54, 0,0, 1 --87
	101,55, 0,0, 1 --88
	101,56, 0,0, 1 --89
	101,57, 0,0, 1 --90
	101,58, 0,0, 1 --91
	101,59, 0,0, 1 --92
	101,60, 0,0, 1 --93
	101,61, 0,0, 1 --94
	101,62, 0,0, 1 --95
	101,63, 0,0, 1 --96
	101,64, 0,0, 1 --97
	101,65, 0,0, 1 --98
	101,66, 0,0, 1 --99
	101,67, 0,0, 1 --100
	101,68, 0,0, 1 --101
	101,69, 0,0, 1 --102
	101,70, 0,0, 1 --103
	101,71, 0,0, 1 --104
	101,72, 0,0, 1 --105
	101,73, 0,0, 1 --106
	101,74, 0,0, 1 --107
	101,75, 0,0, 119 --226
	101,75, 0,0, -1
	]])
	--black background for 24 frames
	animAddPos(gameOver, -53, 0)
end

--;===========================================================
--; GAME OVER SCREEN
--;===========================================================
function f_gameOver()
	playBGM(bgmGameOver)
	sndPlay(contSnd, 1, 0)
	f_gameOverReset()
	local tablePos = ''
	local tablePos2 = ''
	local tablePos3 = ''
	local tablePos4 = ''
	local anim = false
	local anim2 = false
	local anim3 = false
	local anim4 = false
	local animLength = 0
	local animLength2 = 0
	local animLength3 = 0
	local animLength4 = 0
	local i = 0
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
		if p2numChars == 1 or p2numChars == 2 or p2numChars == 3 or p2numChars == 4 then
			tablePos = t_selChars[data.t_p2selected[1].cel+1]
		end
		if p2numChars == 2 or p2numChars == 3 or p2numChars == 4 then
			tablePos2 = t_selChars[data.t_p2selected[2].cel+1]
		end
		if p2numChars == 3 or p2numChars == 4 then
			tablePos3 = t_selChars[data.t_p2selected[3].cel+1]
		end
		if p2numChars == 4 then
			tablePos4 = t_selChars[data.t_p2selected[4].cel+1]	
		end
	else
		if p1numChars == 1 or p1numChars == 2 or p1numChars == 3 or p1numChars == 4 then
			tablePos = t_selChars[data.t_p1selected[1].cel+1]
		end
		if p1numChars == 2 or p1numChars == 3 or p1numChars == 4 then
			tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
		end
		if p1numChars == 3 or p1numChars == 4 then
			tablePos3 = t_selChars[data.t_p1selected[3].cel+1]
		end
		if p1numChars == 4 then
			tablePos4 = t_selChars[data.t_p1selected[4].cel+1]	
		end
	end
	if tablePos.sffData ~= nil then
		if tablePos.cheese ~= nil then
			anim, animLength = f_animFromTable(tablePos['cheese'], tablePos.sffData, 80, 180, tablePos.xscale, tablePos.yscale, 0, 1)
		elseif tablePos.lieDown ~= nil then
			anim, animLength = f_animFromTable(tablePos['lieDown'], tablePos.sffData, 80, 180, tablePos.xscale, tablePos.yscale, 0, 1)
		end
	end
	if tablePos2.sffData ~= nil then
		if tablePos2.cheese ~= nil then
			anim2, animLength2 = f_animFromTable(tablePos2['cheese'], tablePos2.sffData, 60, 180, tablePos2.xscale, tablePos2.yscale, 0, 1)
		elseif tablePos2.lieDown ~= nil then
			anim2, animLength2 = f_animFromTable(tablePos2['lieDown'], tablePos2.sffData, 60, 180, tablePos2.xscale, tablePos2.yscale, 0, 1)
		end
	end
	if tablePos3.sffData ~= nil then
		if tablePos3.cheese ~= nil then
			anim3, animLength3 = f_animFromTable(tablePos3['cheese'], tablePos3.sffData, 40, 180, tablePos3.xscale, tablePos3.yscale, 0, 1)
		elseif tablePos3.lieDown ~= nil then
			anim3, animLength3 = f_animFromTable(tablePos3['lieDown'], tablePos3.sffData, 40, 180, tablePos3.xscale, tablePos3.yscale, 0, 1)
		end
	end
	if tablePos4.sffData ~= nil then
		if tablePos4.cheese ~= nil then
			anim4, animLength4 = f_animFromTable(tablePos4['cheese'], tablePos4.sffData, 100, 180, tablePos4.xscale, tablePos4.yscale, 0, 1)
		elseif tablePos4.lieDown ~= nil then
			anim4, animLength4 = f_animFromTable(tablePos4['lieDown'], tablePos4.sffData, 100, 180, tablePos4.xscale, tablePos4.yscale, 0, 1)
		end
	end
	cmdInput()
	while true do
		animDraw(contBG0)
		i = i + 1
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			cmdInput()
			playBGM(bgmTitle)
			break
		else
			if anim4 then
				animDraw(anim4)
				animLength4 = animLength4 - 1
				if animLength4 > 0 then
					animUpdate(anim4)
				end
			end
			if anim3 then
				animDraw(anim3)
				animLength3 = animLength3 - 1
				if animLength3 > 0 then
					animUpdate(anim3)
				end
			end
			if anim2 then
				animDraw(anim2)
				animLength2 = animLength2 - 1
				if animLength2 > 0 then
					animUpdate(anim2)
				end
			end
			if anim then
				animDraw(anim)
				animLength = animLength - 1
				if animLength > 0 then
					animUpdate(anim)
				end
				animDraw(contBG1)
				animDraw(contBG2)
			end
			if i <= 226+60 then
				animDraw(gameOver)
				animUpdate(gameOver)
				if i == 190 then --music is shorter than animation and we don't want looping here
					playBGM("")
				elseif i == 226 then --create fading animation
					fadeGameOver = f_fadeAnim(60, 'fadeout', 'black', fadeSff)
				elseif i > 226 then --start fading the screen
					animDraw(fadeGameOver)
					animUpdate(fadeGameOver)
				end
			else
				cmdInput()
				break
			end
		end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; RANDOMTEST DEFINITION
--;===========================================================
--[[
Used to generate AI rank data
AutoLevel is a function that ranks characters based on his number of loses vs wins
AutoLevel is palette dependent so if a char has a 12th palette OP mode that mode can have more rank than his normal one
]]

--Ints variables
local tuyoiBorder = 0
local juuni = 12
local moudeta = {}
local rank = 0
local saikyou = false
local roster = {}
local debugText = ''
local numChars = 0
local nextChar = 1

function addMoudeta(rank)
	moudeta[#moudeta + 1] = rank
	local max = math.floor(numChars / (math.min(numChars / (juuni*10) + 3, juuni)*juuni))
	while #moudeta > max do
		table.remove(moudeta, 1)
	end
end

function randRank()
	local r = 0
	while true do
		r = math.random(1, tuyoiBorder + juuni - 2);
		local notbroken = true
		for i = 1, #moudeta do
			if math.abs(moudeta[i] - r) <= math.floor(juuni/3) then
				notbroken = false
				break
			end
		end
		if notbroken then
			break
		end
	end
	return r
end

function eachAllChars(f)
	for cel = 1, #t_randomChars do
		f(cel-1)
	end
end

function rakuBenry()
	local alf = "save/debug/autolevel.txt"
	local veljnz = {}
	local winct = {}
	local buf = '\239\187\191'
	local fp = io.open(alf, 'r')
	if fp then
		for line in fp:lines() do
			local tmp = strsplit(',', line)
			if #tmp >= 2 then
				for i = 1, 4 do
					if i == 4 then
						tmp[1] = string.sub(tmp[1], 4)
					else
						if string.byte(tmp[1], i) ~= string.byte(buf, i) then break end
					end
				end
				winct[tmp[1]] = map(tonumber, strsplit(' ', strtrim(tmp[2])))
			end
		end
		io.close(fp)
	end
	numChars = 0
	eachAllChars(function(cel)
		numChars = numChars + 1
	end)
	local tuyoninzu = math.floor(numChars / (juuni*10))
	if tuyoninzu < juuni - 1 then
		tuyoiBorder =  math.floor(numChars / (tuyoninzu + 1))
		tuyoninzu = juuni - 1
	else
		tuyoiBorder = math.floor(numChars / juuni)
	end
	local total = 0
	local zero ={}
	local tsuyoshi = {}
	local rand = {}
	local kai = {}
	local bimyou = {}
	local tuyocnt = 0
	local ran = randRank()
	eachAllChars(function(cel)
		if #veljnz < cel*12 then
			for i = #veljnz + 1, cel*12 do
				veljnz[i] = 0
			end
		end
		local wins = winct[getCharFileName(cel)]
		local tmp = 0
		for j = 1, 12 do
			if wins and j <= #wins then
				total = total + wins[j]
				veljnz[cel*12 + j] = wins[j]
				tmp = tmp + wins[j]
			else
				veljnz[cel*12 + j] = 0
			end
		end
		if tmp >= tuyoiBorder then tuyocnt = tuyocnt + 1 end
		if tmp >= tuyoiBorder - juuni then table.insert(tsuyoshi, cel) end
		if tmp >= 1 and tmp <= juuni then table.insert(bimyou, cel) end
		if tmp > ran-juuni and tmp <= ran then table.insert(rand, cel) end
		if tmp == 0 then table.insert(zero, cel) end
		if tmp < 0 then table.insert(kai, cel) end
	end)
	function charAdd(cList, numAdd)
	if numAdd <= 0 then return end
		for i = 1, numAdd do
			if #cList == 0 then break end
			local cidx = math.random(1, #cList)
			table.insert(roster, cList[cidx])
			table.remove(cList, cidx)
		end
	end
	roster = {}
	nextChar = 1
	debugText = ''
	local numZero = #zero
	if numZero > 0 then
		charAdd(zero, numZero)
		charAdd(kai, tuyoninzu - numZero)
		rank = 0
	elseif #bimyou >= math.max(tuyoninzu*20, math.floor((numChars*3)/20)) then
		charAdd(bimyou, #bimyou)
		rank = juuni
	else
		for n = 1, 3 do
			if #rand >= tuyoninzu then break end
			rand = {}
			ran = randRank()
			eachAllChars(function(cel)
				local tmp = 0
				for j = 1, 12 do
					tmp = tmp + veljnz[cel*12 + j]
				end
				if tmp > ran-juuni and tmp <= ran then table.insert(rand, cel) end
			end)
		end
		debugText = ran .. ' ' .. #rand
		if #rand >= tuyoninzu then
			charAdd(rand, #rand)
			rank = ran
			addMoudeta(rank)
		elseif tuyocnt >= tuyoninzu then
			charAdd(tsuyoshi, #tsuyoshi)
			rank = tuyoiBorder+juuni-1
		else
			addMoudeta(tuyoiBorder + (juuni-2) - math.floor(juuni/3))
			charAdd(kai, #kai)
			rank = -1
		end
	end
	if numZero == 0 then
		while total ~= 0 do
			local i = math.random(1, #veljnz)
			if total > 0 then
				veljnz[i] = veljnz[i] - 1
				total = total - 1
			else
				veljnz[i] = veljnz[i] + 1
				total = total + 1
			end
		end
	end
	eachAllChars(function(cel)
		buf = buf .. getCharFileName(cel) .. ','
		for j = 1, 12 do
			buf = buf .. ' ' .. veljnz[cel*12 + j]
		end
		buf = buf .. '\r\n'
	end)
	local alv = io.open(alf, 'wb')
	alv:write(buf)
	io.close(alv)
end

function randSel(pno, winner)
	if winner > 0 and (pno == winner) == not saikyou then return end
	local team
	if rank == 0 or rank == 12 or saikyou then
		team = 0
	elseif rank < 0 then
		team = math.random(0, 2)
	else
		team = math.random(0, 1)*2
	end
	setTeamMode(pno, team, math.random(1, 4))
	local tmp = 0
	while tmp < 2 do
		tmp = selectChar(pno, roster[nextChar], math.random(1, 12))
		nextChar = nextChar + 1
		if nextChar > #roster then nextChar = 1 end
	end
end

--Writes the ranked AI levels to a save file
--This file is not used by AutoLevel
function rosterTxt()
	local str = "Rank: " .. rank .. ' ' .. debugText
	for i = 1, #roster do
		str = str .. '\n' .. getCharFileName(roster[i])
	end
	dscr = io.open("save/debug/AI_Rank.txt", 'w')
	dscr:write(str)
	io.close(dscr)
end

--Sets AIs to level 8 (MAX level) and ints AutoLevel
function initRandom()
	for i = 1, 8 do
		setCom(i, 8)
	end
	setAutoLevel(true)
	rakuBenry()
	winner = 0
	wins = 0
	rosterTxt()
	nextChar = 1
	saikyou = rank == tuyoiBorder+juuni-1
end

function randomTest()
	initRandom()
	refresh()
	while not esc() do
		randSel(1, winner)
		randSel(2, winner)
		setMatchNo(1)
		selectStage(0)
		loadStart()
		local oldwinner = winner
		winner = game()
		if winner < 0 or esc() then break end
		oldwins = wins
		wins = wins + 1
		if winner ~= oldwinner then
			wins = 1
			setHomeTeam(winner == 1 and 2 or 1)
		end
		setMatchNo(wins)
		if winner <= 0 or wins >= 20 or wins == oldwins then
			initRandom()
		end
		refresh()
	end
end

--;===========================================================
--; PLAYER SAVE DATA
--;===========================================================
function f_victories()
	data.victories = data.victories + 1
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end

function f_defeats()
	data.defeats = data.defeats + 1
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end

function f_records()
	if data.rosterMode == "suddendeath" then
		if winCnt > data.suddenrecord then
			data.suddenrecord = winCnt
		end
	elseif data.rosterMode == "endless" then
		if winCnt > data.endlessrecord then
			data.endlessrecord = winCnt
		end
	end
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end

function f_modeplayTime()
	if data.rosterMode == "story" then data.storyTime = data.storyTime + clearTime --(math.floor(clearTime)) (Save time from Float to Integer)
	elseif data.rosterMode == "arcade" then data.arcadeTime = data.arcadeTime + clearTime
	elseif data.rosterMode == "versus" then data.vsTime = data.vsTime + clearTime
	elseif data.rosterMode == "training" then data.trainingTime = data.trainingTime + clearTime
	elseif data.rosterMode == "cpu" then data.cpumatchTime = data.cpumatchTime + clearTime
	elseif data.rosterMode == "survival" then data.survivalTime = data.survivalTime + clearTime
	elseif data.rosterMode == "boss" then data.bossTime = data.bossTime + clearTime
	elseif data.rosterMode == "bonus" then data.bonusTime = data.bonusTime + clearTime
	elseif data.rosterMode == "timeattack" then data.timeattackTime = data.timeattackTime + clearTime
	elseif data.rosterMode == "scoreattack" then data.scoreattackTime = data.scoreattackTime + clearTime
	elseif data.rosterMode == "endless" then data.endlessTime = data.endlessTime + clearTime
	elseif data.rosterMode == "suddendeath" then data.suddendeathTime = data.suddendeathTime + clearTime
	elseif data.rosterMode == "mission" then data.missionsTime = data.missionsTime + clearTime
	elseif data.rosterMode == "event" then data.eventsTime = data.eventsTime + clearTime
	elseif data.rosterMode == "tower" then data.towerTime = data.towerTime + clearTime
	elseif data.rosterMode == "tourney" then data.tourneyTime = data.tourneyTime + clearTime
	elseif data.rosterMode == "adventure" then data.adventureTime = data.adventureTime + clearTime
	end
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end

function f_favoriteChar()
	data.favoriteChar = f_getName(data.t_p1selected[1].cel) --Improve store logic with json
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end

function f_favoriteStage()
	data.favoriteStage = getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1') --Improve store logic with json
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end
