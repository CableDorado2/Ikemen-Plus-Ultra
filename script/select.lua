
module(..., package.seeall)

--;===========================================================
--; GENERAL CONFIG
--;===========================================================
selectColumns = 5
selectRows = 2
offsetRows = 1
setSelColRow(selectColumns, selectRows)
setRandomSpr(sysSff, 151, 0, 1, 1)
setSelCellSize(27+2, 27+2)
setSelCellScale(1, 1)

--default turns/simul count after starting the game
p1numTurns = 2
p1numSimul = 2
p2numTurns = 2
p2numSimul = 2
--default team mode after starting the game (0 - Single, 1 - Simul, 2 - Turns)
p1teamMode = 0
p2teamMode = 0
--let cursor wrap around
wrappingX = true
wrappingY = true

--;===========================================================
--; SELECT LOOP FUNCTIONS
--;===========================================================
txt_selectHint = createTextImg(font1, 0, -1, 'PRESS A,B,C,X,Y OR Z BUTTON TO SELECT A PALETTE COLOR FOR THE CHARACTERS ', 308, 239)

function f_selectReset()
	if data.p2Faces then
		p1FaceX = 10
		p1FaceY = 170
		p2FaceX = 169
		p2FaceY = 170
	else
		p1FaceX = 90
		p1FaceY = 170
		p2FaceX = 90
		p2FaceY = 170
	end
	p1Cell = nil
	p2Cell = nil
	p1Portrait = nil
	p2Portrait = nil
	data.t_p1selected = {}
	data.t_p2selected = {}
	selectStart()
	p1TeamEnd = false
	p1SelEnd = false
	p2TeamEnd = false
	p2SelEnd = false
	if data.p2In == 1 then
		p2TeamEnd = true
		p2SelEnd = true
	end
	if not data.p2SelectMenu then
		p2SelEnd = true
	end
	selScreenEnd = false
	stageEnd = false
	p1numChars = 1
	p2numChars = 1
	p1teamMode = 0
	p2teamMode = 0
	p1numTurns = 2
	p1numSimul = 2
	p2numTurns = 2
	p2numSimul = 2		
	matchNo = 0
	setMatchNo(matchNo)
end

function f_setZoom()
	local zoom = data.zoomActive
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
	if data.gameMode == 'arcade' then
		if p2teamMode == 0 then --Single
			t = t_selOptions.arcademaxmatches
		else --Team
			t = t_selOptions.teammaxmatches
		end
		for i=1, #t do --for each order number
			cnt = t[i] * p2numChars --set amount of matches to get from the table
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
	--Survival / Boss Rush / VS 100 Kumite / Bonus Rush
	else
		if data.gameMode == 'survival' then
			t = t_randomChars
			cnt = #t
			local i = 0
			while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do --not integer
				i = i + 1
				cnt = #t + i
			end
		elseif data.gameMode == 'bossrush' then
			t = t_bossChars
			cnt = #t
			local i = 0
			while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do
				i = i + 1
				cnt = #t + i
			end
		elseif data.gameMode == 'bonusrush' then
			t = t_bonusChars
			cnt = #t
			local i = 0
			while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do
				i = i + 1
				cnt = #t + i
			end			
		elseif data.gameMode == 'endless' then
			t = t_randomChars
			cnt = 9999 * p2numChars
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
	f_printTable(t_roster, 'debug/t_roster.txt')
end

function f_aiRamp()
	local start_match = 0
	local start_diff = 0
	local end_match = 0
	local end_diff = 0
	t_aiRamp = {}
	--Arcade
	if data.gameMode == 'arcade' then
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
	elseif data.gameMode == 'survival' then
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
	f_printTable(t_aiRamp, 'debug/t_aiRamp.txt')
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

function f_aiLevel()
	--Offset
	local offset = 0
	if data.aiRamping and data.gameMode == 'arcade' or data.gameMode == 'survival' then
		offset = t_aiRamp[matchNo] - data.difficulty
	end
	--Coop
	if data.coop then
		setCom(1, 0)
		setCom(2, f_difficulty(2, offset))
		setCom(3, 0)
		if not restoreTeam then
			setCom(4, f_difficulty(4, offset))
		end
	else
		--Player 1
		if p1teamMode == 0 then --Single
			if data.p1In == 1 and not data.aiFight then
				setCom(1, 0)
			else
				setCom(1, f_difficulty(1, offset))
			end
		elseif p1teamMode == 1 then --Simul
			if data.simulType == 'Tag' then
				for i=1, p1numChars*2 do
					if i % 2 ~= 0 then --odd value
						if data.p1In == 1 and not data.aiFight then
							setCom(i, 0)
						else
							setCom(i, f_difficulty(i, offset))
						end
					end
				end
			else --data.simulType == 'Assist'
				if data.p1In == 1 and not data.aiFight then
					setCom(1, 0)
				else
					setCom(1, f_difficulty(1, offset))
				end
				for i=3, p1numChars*2 do
					if i % 2 ~= 0 then
						setCom(i, f_difficulty(i, offset))
					end
				end
			end
		elseif p1teamMode == 2 then --Turns
			for i=1, p1numChars*2 do
				if i % 2 ~= 0 then
					if data.p1In == 1 and not data.aiFight then
						setCom(i, 0)
					else
						setCom(i, f_difficulty(i, offset))
					end
				end
			end
		end
		--Player 2
		if p2teamMode == 0 then --Single
			if data.p2In == 2 and not data.aiFight then
				setCom(2, 0)
			else
				setCom(2, f_difficulty(2, offset))
			end
		elseif p2teamMode == 1 then --Simul
			if data.simulType == 'Tag' then
				for i=2, p2numChars*2 do
					if i % 2 == 0 then --even value
						if data.p2In == 2 and not data.aiFight then
							setCom(i, 0)
						else
							setCom(i, f_difficulty(i, offset))
						end
					end
				end
			else --data.simulType == 'Assist'
				if data.p2In == 2 and not data.aiFight then
					setCom(2, 0)
				else
					setCom(2, f_difficulty(2, offset))
				end
				for i=4, p2numChars*2 do
					if i % 2 == 0 then
						setCom(i, f_difficulty(i, offset))
					end
				end
			end
		elseif p2teamMode == 2 then --Turns
			for i=2, p2numChars*2 do
				if i % 2 == 0 then
					if data.p2In == 2 and not data.aiFight then
						setCom(i, 0)
					else
						setCom(i, f_difficulty(i, offset))
					end
				end
			end
		end
	end
end

--;===========================================================
--; SIMPLE LOOP (VS MODE, TRAINING, WATCH, BONUS GAMES)
--;===========================================================
function f_selectSimple()
	p1SelX = 0
	p1SelY = 0
	p2SelX = 4
	p2SelY = 0
	p1FaceOffset = 0
	p2FaceOffset = 0
	p1OffsetRow = 0
	p2OffsetRow = 0
	stageList = 0
	gameNo = 0
	p1Wins = 0
	p2Wins = 0	
	cmdInput()
	while true do
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		playBGM(bgmSelect)
		f_selectReset()
		while not selScreenEnd do
			if esc() then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				f_menuMusic()
				return
			end
			f_selectScreen()
		end
		f_aiLevel()
		f_selectVersus()
		f_setZoom()
		f_assignMusic()
		winner = game()
		--win screen
		if data.gameMode == 'versus' then
			if t_selChars[data.t_p2selected[1].cel+1].winscreen == nil or t_selChars[data.t_p2selected[1].cel+1].winscreen == 1 then
			f_selectWin()
			f_selectChallenger()
			end
		end		
		playBGM('')		
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ADVANCE LOOP (ARCADE, TEAM CO-OP, SURVIVAL, SURVIVAL CO-OP, VS 100 KUMITE, BOSS RUSH)
--;===========================================================
function f_selectAdvance()
	p1SelX = 0
	p1SelY = 0
	p2SelX = 4
	p2SelY = 0
	p1FaceOffset = 0
	p2FaceOffset = 0
	p1OffsetRow = 0
	p2OffsetRow = 0
	winner = 0
	winCnt = 0
	looseCnt = 0
	clearTime = 0
	matchTime = 0
	gameNo = 0
	bossNo = 0
	p1Wins = 0
	p2Wins = 0	
	cmdInput()
	f_selectReset()
	stageEnd = true
	if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' then
		playBGM(bgmSelectBoss)
	else	
		playBGM(bgmSelect)
	end	
	while true do
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		selectStart()
		while not selScreenEnd do
			if esc() then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				f_menuMusic()
				return
			end
			f_selectScreen()
		end
		--first match
		if matchNo == 0 then
			--generate roster
			f_makeRoster()
			lastMatch = #t_roster / p2numChars
			matchNo = 1
			--generate AI ramping table
			f_aiRamp()
			--intro
			if data.gameMode == 'arcade' then
				local tPos = t_selChars[data.t_p1selected[1].cel+1]
				if tPos.intro ~= nil and io.open(tPos.intro or '','r') ~= nil then
					script.storyboard.f_storyboard(tPos.intro)
				end
			end
		--player exit the match via ESC in VS 100 Kumite mode
		elseif winner == -1 and data.gameMode == 'endless' then
			--counter
			looseCnt = looseCnt + 1
			--result
			f_result('lost')
			--reset title screen fading
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			f_menuMusic()
			return	
		--player won (also if lost in VS 100 Kumite)
		elseif winner == 1 or data.gameMode == 'endless' then
			--counter
			if winner == 1 then
				winCnt = winCnt + 1
			else --only true in VS 100 Kumite mode
				looseCnt = looseCnt + 1
			end	
			--win screen
			if data.gameMode == 'arcade' then
				if t_selChars[data.t_p2selected[1].cel+1].winscreen == nil or t_selChars[data.t_p2selected[1].cel+1].winscreen == 1 then
					f_selectWin()
				end
			end
			--no more matches left
			if matchNo == lastMatch then
				--ending
				if data.gameMode == 'arcade' then
					local tPos = t_selChars[data.t_p1selected[1].cel+1]
					if tPos.ending ~= nil and io.open(tPos.ending or '','r') ~= nil then
						script.storyboard.f_storyboard(tPos.ending)
					end
				end
				--result
				f_result('win')
				if data.gameMode == 'arcade' then
					--credits
					script.storyboard.f_storyboard('data/credits.def')
					--unlocks screen
					data.unlocks = true
					f_saveUnlockData()
					--assert(loadfile('script/unlocks_sav.lua'))()
					--game over
					script.storyboard.f_storyboard('data/gameover.def')
					--intro
					script.storyboard.f_storyboard('data/intro.def')
					--reset title screen fading
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					f_menuMusic()
					return
				else
					--game over
					script.storyboard.f_storyboard('data/gameover.def')
					--reset title screen fading
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					f_menuMusic()
					return
				end	
			--next match available
			else
				matchNo = matchNo + 1
			end
		--player lost and don't have any coins left
		elseif data.coinsLeft == 0 then
			--counter
			looseCnt = looseCnt + 1
			--win screen
			if data.gameMode == 'arcade' then
				if winner >= 1 and (t_selChars[data.t_p2selected[1].cel+1].winscreen == nil or t_selChars[data.t_p2selected[1].cel+1].winscreen == 1) then
					f_selectWin()
				end
			end
			--result
			f_result('lost')
			--game over
			script.continue.f_gameOver()
			--intro
			--script.storyboard.f_storyboard('data/intro.def')
			--reset title screen fading
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			f_menuMusic()
			return
		--player lost but can continue
		else
			--counter
			looseCnt = looseCnt + 1
			--win screen
			if winner >= 1 and (t_selChars[data.t_p2selected[1].cel+1].winscreen == nil or t_selChars[data.t_p2selected[1].cel+1].winscreen == 1) then
				f_selectWin()
			end
			--continue screen
			script.continue.f_continue()
			if data.continue == 2 then --Continue = NO
				--intro
				--script.storyboard.f_storyboard('data/intro.def')
				--reset title screen fading
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				f_menuMusic()
				return
			end
			if data.contSelection then --true if 'Char change at Continue' option is enabled
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				data.t_p1selected = {}
				p1Portrait = nil
				p1SelEnd = false
				if data.coop then
					p2SelEnd = false
				end
				selScreenEnd = false
				while not selScreenEnd do
					if esc() then
						data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 2)
						f_menuMusic()
						return
					end
					f_selectScreen()
				end
			elseif esc() then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				f_menuMusic()
				return
			end
		end
		--assign enemy team
		data.t_p2selected = {}
		local shuffle = true
		for i=1, p2numChars do
			if i == 1 and data.gameMode == 'arcade' and t_selChars[data.t_p1selected[1].cel+1][matchNo] ~= nil then
				p2Cell = t_charAdd[t_selChars[data.t_p1selected[1].cel+1][matchNo]]
				shuffle = false
			else
				p2Cell = t_roster[matchNo*p2numChars-i+1]
			end
			p2Pal = math.random(1,6)
			local updateAnim = true
			for j=1, #data.t_p2selected do
				if data.t_p2selected[j].cel == p2Cell then 
					updateAnim = false
				end
			end
			data.t_p2selected[#data.t_p2selected+1] = {['cel'] = p2Cell, ['pal'] = p2Pal, ['up'] = updateAnim, ['rand'] = false}
			if shuffle then
				f_shuffleTable(data.t_p2selected)
			end
		end
		--Team conversion to Single match if bonus paramvalue on any opponents is detected
		restoreTeam = false
		local teamMode = p2teamMode
		local numChars = p2numChars
		if p2numChars > 1 then
			for i=1, #data.t_p2selected do
				if t_selChars[data.t_p2selected[i].cel+1].bonus ~= nil and t_selChars[data.t_p2selected[i].cel+1].bonus == 1 then
					p2teamMode = 0
					p2numChars = 1
					setTeamMode(2, 0, 1)
					p2Cell = t_charAdd[t_selChars[data.t_p2selected[i].cel+1].char]
					data.t_p2selected = {}
					data.t_p2selected[1] = {['cel'] = p2Cell, ['pal'] = p2Pal, ['up'] = true, ['rand'] = false}
					restoreTeam = true
					break
				end
			end
		end
		setMatchNo(matchNo)
		f_aiLevel()
		f_selectStage()
		f_selectVersus()
		f_setZoom()
		--inputs
		if data.coop then
			remapInput(3,2) --P2 controls assigned to P3 character
			--remapInput(2,3) --P3 controls assigned to P2 character
		end
		matchTime = os.clock()
		f_assignMusic()
		winner = game()
		playBGM('')
		matchTime = os.clock() - matchTime
		clearTime = clearTime + matchTime
		--restore P2 Team settings if needed
		if restoreTeam then
			p2teamMode = teamMode
			p2numChars = numChars
			setTeamMode(2, p2teamMode, p2numChars)
		end
		resetRemapInput()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SELECT SCREEN
--;===========================================================
txt_p1Wins = createTextImg(jgFnt, 0, 1, '', 2, 13)
txt_p2Wins = createTextImg(jgFnt, 0, -1, '', 318, 13)

--Scrolling background
selectBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(selectBG0, 160, 0)
animSetTile(selectBG0, 1, 1)
animSetColorKey(selectBG0, -1)

--Hardcore Scrolling background
selectHardBG0 = animNew(sysSff, [[
101,0, 0,0, -1
]])
animAddPos(selectHardBG0, 160, 0)
animSetTile(selectHardBG0, 1, 1)
animSetColorKey(selectHardBG0, -1)

--Dark Box (Player1 side)
selectBG1a = animNew(sysSff, [[
100,1, 0,166, -1, 0, s
]])
animAddPos(selectBG1a, 160, 0)
animSetTile(selectBG1a, 1, 0)
animSetWindow(selectBG1a, 5, 0, 151, 239)

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
animSetWindow(selectBG1c, 85, 0, 151, 239)

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

--P1 Team cursor
p1TmCursor = animNew(sysSff, [[
180,0, 0,0, -1
]])

--P2 Team cursor
p2TmCursor = animNew(sysSff, [[
190,0, 0,0, -1
]])

--P1 Team icon
p1TmIcon = animNew(sysSff, [[
181,0, 0,0, -1
]])

--P1 Empty Team icon 1
p1EmptyIcon = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon, 81, 66)
animUpdate(p1EmptyIcon)

--P1 Empty Team icon 2
p1EmptyIcon2 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon2, 87, 66)
animUpdate(p1EmptyIcon2)

--P1 Empty Team icon 3
p1EmptyIcon3 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon3, 93, 66)
animUpdate(p1EmptyIcon3)

--P1 Empty Team icon 4
p1EmptyIcon4 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon4, 99, 66)
animUpdate(p1EmptyIcon4)

--P1 Empty Turns icon 1
p1EmptyIcon5 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon5, 81, 81)
animUpdate(p1EmptyIcon5)

--P1 Empty Turns icon 2
p1EmptyIcon6 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon6, 87, 81)
animUpdate(p1EmptyIcon6)

--P1 Empty Turns icon 3
p1EmptyIcon7 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon7, 93, 81)
animUpdate(p1EmptyIcon7)

--P1 Empty Turns icon 4
p1EmptyIcon8 = animNew(sysSff, [[
182,0, 0,0, -1
]])
animAddPos(p1EmptyIcon8, 99, 81)
animUpdate(p1EmptyIcon8)

--P2 Team icon
p2TmIcon = animNew(sysSff, [[
191,0, 0,0, -1
]])

--P2 Empty Team icon
p2EmptyIcon = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon, 239, 66)
animUpdate(p2EmptyIcon)

--P2 Empty Team icon 2
p2EmptyIcon2 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon2, 233, 66)
animUpdate(p2EmptyIcon2)

--P2 Empty Team icon 3
p2EmptyIcon3 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon3, 227, 66)
animUpdate(p2EmptyIcon3)

--P2 Empty Team icon 4
p2EmptyIcon4 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon4, 221, 66)
animUpdate(p2EmptyIcon4)

--P2 Empty Turns icon 5
p2EmptyIcon5 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon5, 239, 81)
animUpdate(p2EmptyIcon5)

--P2 Empty Turns icon 6
p2EmptyIcon6 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon6, 233, 81)
animUpdate(p2EmptyIcon6)

--P2 Empty Turns icon 7
p2EmptyIcon7 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon7, 227, 81)
animUpdate(p2EmptyIcon7)

--P2 Empty Turns icon 8
p2EmptyIcon8 = animNew(sysSff, [[
192,0, 0,0, -1
]])
animAddPos(p2EmptyIcon8, 221, 81)
animUpdate(p2EmptyIcon8)

--nothing but changed to fade if needed
data.fadeSelect = animNew(sysSff, [[
-1,-1, 0,0, -1
]])

function f_selectScreen()
	--draw
	if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' then 
		animDraw(f_animVelocity(selectHardBG0, -1, -1))
	else
		animDraw(f_animVelocity(selectBG0, -1, -1))
	end
	if data.p2Faces then
		animDraw(f_animVelocity(selectBG1a, -1, 0))
		animSetWindow(selectBG1a, 5, 0, 151, 239)
		animDraw(f_animVelocity(selectBG1b, -1, 0))
		animSetWindow(selectBG1b, 164, 0, 151, 239)
	else
		animDraw(f_animVelocity(selectBG1c, -1, 0))
		animSetWindow(selectBG1c, 85, 0, 151, 239)
	end
	animDraw(f_animVelocity(selectBG2a, -1, 0))
	animDraw(f_animVelocity(selectBG2b, -3, 0))
	animDraw(f_animVelocity(selectBG2c, -6, 0))
	textImgDraw(txt_mainSelect)
	drawFace(p1FaceX, p1FaceY, p1FaceOffset)
	for i=0, selectColumns-1 do
		for j=0, selectRows-1 do
			animPosDraw(selectCell, p1FaceX+i*(27+2), p1FaceY+j*(27+2))
		end
	end
	if data.p2Faces then
		drawFace(p2FaceX, p2FaceY, p2FaceOffset)
		for i=0, selectColumns-1 do
			for j=0, selectRows-1 do
				animPosDraw(selectCell, p2FaceX+i*(27+2), p2FaceY+j*(27+2))
			end
		end
	end
	--Player1		
	if not p1TeamEnd then
		f_p1TeamMenu()
	elseif data.p1In > 0 or data.p1Char ~= nil then
		f_p1SelectMenu()
	end
	--Player2
	if not p2TeamEnd then
		f_p2TeamMenu()
	elseif data.p2In > 0 or data.p2Char ~= nil then
		f_p2SelectMenu()
	end
	--Win Counter
	if data.gameMode == 'versus' and data.vsDisplayWin == true then
		textImgSetText(txt_p1Wins, 'WINS: ' .. p1Wins)
		textImgSetText(txt_p2Wins, 'WINS: ' .. p2Wins)
		textImgDraw(txt_p1Wins)
		textImgDraw(txt_p2Wins)
	end	
	if p1SelEnd and p2SelEnd then
		--Stage select
		if not stageEnd then
			f_selectStage()
		else
			selScreenEnd = true
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
--; PLAYER 1 TEAM MENU
--;===========================================================
p1SelTmTxt = createTextImg(jgFnt, 0, 1, 'GAME MODE', 20, 30)
t_p1selTeam = {
	{id = '', text = 'SINGLE'},
	{id = '', text = 'SIMUL'},
	{id = '', text = 'TURNS'},
	--{id = '', text = 'BACK TO MENU'},	
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
	elseif data.p1TeamMenu ~= nil then
		p1numChars = data.p1TeamMenu.chars
		p1teamMode = data.p1TeamMenu.mode
		setTeamMode(1, p1teamMode, p1numChars)
		p1TeamEnd = true
	else
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			p1teamMode = p1teamMode - 1
			if p1teamMode < 0 then p1teamMode = #t_p1selTeam-1 end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			p1teamMode = p1teamMode + 1
			if p1teamMode > #t_p1selTeam-1 then p1teamMode = 0 end
		elseif p1teamMode == 1 then --Simul
			if commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				p1numSimul = p1numSimul - 1
				if p1numSimul < 2 then p1numSimul = 2 end
			elseif commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				p1numSimul = p1numSimul + 1
				if p1numSimul > data.numSimul then p1numSimul = data.numSimul end
			end
		elseif p1teamMode == 2 then --Turns
			if commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				p1numTurns = p1numTurns - 1
				if p1numTurns < 2 then p1numTurns = 2 end
			elseif commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				p1numTurns = p1numTurns + 1
				if p1numTurns > data.numTurns then p1numTurns = data.numTurns end
			end			
		end
		textImgDraw(p1SelTmTxt)
		for i=1, #t_p1selTeam do
			if i == p1teamMode + 1 then
				textImgSetBank(t_p1selTeam[i].id, 3)
			else
				textImgSetBank(t_p1selTeam[i].id, 0)
			end
			textImgDraw(t_p1selTeam[i].id)
		end
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
		if btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			if p1teamMode == 0 then --Single
				p1numChars = 1
			elseif p1teamMode == 1 then --Simul
				p1numChars = p1numSimul
			elseif p1teamMode == 2 then --Turns
				p1numChars = p1numTurns
			--elseif p1teamMode == 3 then --Back to Menu
			
			end
			setTeamMode(1, p1teamMode, p1numChars)
			p1TeamEnd = true
			cmdInput()
		end
	end
end

--;===========================================================
--; PLAYER 2 TEAM MENU
--;===========================================================
p2SelTmTxt = createTextImg(jgFnt, 0, -1, 'GAME MODE', 300, 30)
t_p2selTeam = {
	{id = '', text = 'SINGLE'},
	{id = '', text = 'SIMUL'},
	{id = '', text = 'TURNS'},
}
for i=1, #t_p2selTeam do
	t_p2selTeam[i].id = createTextImg(jgFnt, 0, -1, t_p2selTeam[i].text, 300, 35+i*15)
end

function f_p2TeamMenu()
	if data.coop then --Simul coop
		p2teamMode = 1
		p2numChars = 2
		setTeamMode(2, p2teamMode, p2numChars)
		p2TeamEnd = true
	elseif data.p2TeamMenu ~= nil then
		p2numChars = data.p2TeamMenu.chars
		p2teamMode = data.p2TeamMenu.mode
		setTeamMode(2, p2teamMode, p2numChars)
		p2TeamEnd = true
	else
		if commandGetState(p2Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			p2teamMode = p2teamMode - 1
			if p2teamMode < 0 then p2teamMode = #t_p2selTeam-1 end
		elseif commandGetState(p2Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			p2teamMode = p2teamMode + 1
			if p2teamMode > #t_p2selTeam-1 then p2teamMode = 0 end
		elseif p2teamMode == 1 then --Simul
			if commandGetState(p2Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				p2numSimul = p2numSimul - 1
				if p2numSimul < 2 then p2numSimul = 2 end
			elseif commandGetState(p2Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				p2numSimul = p2numSimul + 1
				if p2numSimul > data.numSimul then p2numSimul = data.numSimul end
			end
		elseif p2teamMode == 2 then --Turns
			if commandGetState(p2Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				p2numTurns = p2numTurns - 1
				if p2numTurns < 2 then p2numTurns = 2 end
			elseif commandGetState(p2Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				p2numTurns = p2numTurns + 1
				if p2numTurns > data.numTurns then p2numTurns = data.numTurns end
			end
		end
		textImgDraw(p2SelTmTxt)
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
		if btnPalNo(p2Cmd) > 0 then
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
			cmdInput()
		end
	end
end

--;===========================================================
--; SELECT MENU
--;===========================================================
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

function f_drawSelectName(id, bank, t, x, y, spacingX, spacingY, rowUnique, bankUnique)
	for i=1, #t do
		textImgSetText(id, f_getName(t[i].cel))
		textImgSetPos(id, x, y)
		if rowUnique ~= nil then
			if i == rowUnique then
				textImgSetBank(id, 3)
			else
				textImgSetBank(id, bankUnique)
			end
		else
			textImgSetBank(id, 3)
		end
		textImgDraw(id)
		x = x + spacingX
		y = y + spacingY
	end
	return x, y
end

function f_drawSelectNameP2(id, bank, t, x, y, spacingX, spacingY, rowUnique, bankUnique)
	for i=1, #t do
		textImgSetText(id, f_getName(t[i].cel))
		textImgSetPos(id, x, y)
		if rowUnique ~= nil then
			if i == rowUnique then
				textImgSetBank(id, 1)
			else
				textImgSetBank(id, bank)
			end
		else
			textImgSetBank(id, 1)
		end
		textImgDraw(id)
		x = x + spacingX
		y = y + spacingY
	end
	return x, y
end

function f_drawCharAnim(t, data, x, y, update)
	if t ~= nil and t[data] ~= nil then
		animSetPos(t[data], x, y)
		animDraw(t[data])
		if update then
			animUpdate(t[data])
		end
		return true
	end
	return false
end

--;===========================================================
--; PLAYER 1 SELECT MENU
--;===========================================================
txt_p1Name = createTextImg(jgFnt, 4, 1, '', 0, 0)

function f_p1SelectMenu()
	if data.p1Char ~= nil then
		local t = {}
		for i=1, #data.p1Char do
			local updateAnim = false
			if t[data.p1Char[i]] == nil then
				updateAnim = true
				t[data.p1Char[i]] = ''
			end
			data.t_p1selected[i] = {['cel'] = data.p1Char[i], ['pal'] = math.random(1,6), ['up'] = updateAnim}
		end
		p1Portrait = data.p1Char[1]
		p1SelEnd = true
	else
		--if p1Portrait then drawPortrait(p1Portrait, 18, 13, 1, 1) end
		local numChars = p1numChars
		if data.coop then numChars = 1 end
		if p1Cell then
			if numChars ~= #data.t_p1selected then
				local updateAnim = true
				for i=1, #data.t_p1selected do
					if data.t_p1selected[i].cel == p1Cell then 
						updateAnim = false
					end
				end
				if getCharName(p1Cell) == 'Random' then
					--sndPlay(sysSnd, 100, 0)
					f_drawCharAnim(t_selChars[math.random(1, #t_randomChars)], 'p1AnimStand', 30 + 28*#data.t_p1selected, 133, updateAnim)
				else
					f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 30 + 28*#data.t_p1selected, 133, updateAnim)
				end
			end
			for j=#data.t_p1selected, 1, -1 do
				f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimStand', 30 + 28*(j-1), 133, data.t_p1selected[j].up)
			end
		end
		local nameX, nameY = f_drawSelectName(txt_p1Name, 4, data.t_p1selected, 10, 144, 4, 7)
		if not p1SelEnd then
			local tmpCelX = p1SelX
			local tmpCelY = p1SelY
			if commandGetState(p1Cmd, 'u') then
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
			elseif commandGetState(p1Cmd, 'd') then
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
			elseif commandGetState(p1Cmd, 'l') then
				while true do
					p1SelX = f_findCelXSub(p1SelX, wrappingX)
					if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then break end
				end
				if tmpCelX ~= p1SelX then
					sndPlay(sysSnd, 100, 0)
				end
			elseif commandGetState(p1Cmd, 'r') then
				while true do
					p1SelX = f_findCelXAdd(p1SelX, wrappingX)
					if getCharName(p1SelX+selectColumns*p1SelY) ~= '' then break end
				end
				if tmpCelX ~= p1SelX then
					sndPlay(sysSnd, 100, 0)
				end
			end
			p1Cell = p1SelX + selectColumns*p1SelY
			p1Portrait = p1Cell
			textImgDraw(txt_selectHint)
			textImgSetText(txt_p1Name, f_getName(p1Cell))
			textImgPosDraw(txt_p1Name, 10, nameY)
			animPosDraw(p1ActiveCursor, p1FaceX+p1SelX*(27+2), p1FaceY+(p1SelY-p1OffsetRow)*(27+2))
			if btnPalNo(p1Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				local cel = p1Cell
				if getCharName(cel) == 'Random' then
					cel = math.random(1, #t_randomChars)-1
				end
				local updateAnim = true
				for i=1, #data.t_p1selected do
					if data.t_p1selected[i].cel == p1Cell then 
						updateAnim = false
					end
				end
				if data.coop then
					data.t_p1selected[1] = {['cel'] = cel, ['pal'] = btnPalNo(p1Cmd), ['up'] = updateAnim}
					p1SelEnd = true
				else
					data.t_p1selected[#data.t_p1selected+1] = {['cel'] = cel, ['pal'] = btnPalNo(p1Cmd), ['up'] = updateAnim}
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
		end
	end
end

--;===========================================================
--; PLAYER 2 SELECT MENU
--;===========================================================
txt_p2Name = createTextImg(jgFnt, 1, -1, '', 0, 0)

function f_p2SelectMenu()
	if data.p2Char ~= nil then
		local t = {}
		for i=1, #data.p2Char do
			local updateAnim = false
			if t[data.p2Char[i]] == nil then
				updateAnim = true
				t[data.p2Char[i]] = ''
			end
			data.t_p2selected[i] = {['cel'] = data.p2Char[i], ['pal'] = math.random(1,6), ['up'] = updateAnim}
			--f_printTable(data.t_p2selected)
		end
		p2Portrait = data.p2Char[1]
		p2SelEnd = true
	elseif not data.p2SelectMenu then
		p2SelEnd = true
	else
		--if p2Portrait then drawPortrait(p2Portrait, 301, 13, -1, 1) end
		local numChars = p2numChars
		local t_selected = data.t_p2selected
		if data.coop then
			numChars = 1
			t_selected = {}
		end
		if p2Cell then
			if numChars ~= #t_selected then
				local updateAnim = true
				for i=1, #t_selected do
					if t_selected[i].cel == p2Cell then 
						updateAnim = false
					end
				end
				if getCharName(p2Cell) == 'Random' then
					--sndPlay(sysSnd, 100, 0)
					f_drawCharAnim(t_selChars[math.random(1, #t_randomChars)], 'p2AnimStand', 290 - 28*#t_selected, 133, updateAnim)
				else
					f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 290 - 28*#t_selected, 133, updateAnim)
				end
			end
			for j=#t_selected, 1, -1 do
				f_drawCharAnim(t_selChars[t_selected[j].cel+1], 'p2AnimStand', 290 - 28*(j-1), 133, t_selected[j].up)
			end
		end
		local nameX, nameY = f_drawSelectNameP2(txt_p2Name, 1, t_selected, 309, 144, -4, 7)
		if not p2SelEnd then
			local tmpCelX = p2SelX
			local tmpCelY = p2SelY
			if commandGetState(p2Cmd, 'u') then
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
			elseif commandGetState(p2Cmd, 'd') then
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
			elseif commandGetState(p2Cmd, 'l') then
				while true do
					p2SelX = f_findCelXSub(p2SelX, wrappingX)
					if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then break end
				end
				if tmpCelX ~= p2SelX then
					sndPlay(sysSnd, 100, 0)
				end
			elseif commandGetState(p2Cmd, 'r') then
				while true do
					p2SelX = f_findCelXAdd(p2SelX, wrappingX)
					if getCharName(p2SelX+selectColumns*p2SelY) ~= '' then break end
				end
				if tmpCelX ~= p2SelX then
					sndPlay(sysSnd, 100, 0)
				end
			end
			p2Cell = p2SelX + selectColumns*p2SelY
			p2Portrait = p2Cell
			textImgDraw(txt_selectHint)
			textImgSetText(txt_p2Name, f_getName(p2Cell))
			textImgPosDraw(txt_p2Name, 309, nameY)
			animPosDraw(p2ActiveCursor, p2FaceX+p2SelX*(27+2), p2FaceY+(p2SelY-p2OffsetRow)*(27+2))
			if btnPalNo(p2Cmd) > 0 then
				sndPlay(sysSnd, 100, 1)
				local cel = p2Cell
				if getCharName(cel) == 'Random' then
					cel = math.random(1, #t_randomChars)-1
				end
				local updateAnim = true
				if data.coop then
					for i=1, #data.t_p1selected do
						if data.t_p1selected[i].cel == p2Cell then 
							updateAnim = false
						end
					end
					data.t_p1selected[2] = {['cel'] = cel, ['pal'] = btnPalNo(p2Cmd), ['up'] = updateAnim}
					p2SelEnd = true
				else
					for i=1, #data.t_p2selected do
						if data.t_p2selected[i].cel == p2Cell then 
							updateAnim = false
						end
					end
					data.t_p2selected[#data.t_p2selected+1] = {['cel'] = cel, ['pal'] = btnPalNo(p2Cmd), ['up'] = updateAnim}
					if #data.t_p2selected == p2numChars then
						p2SelEnd = true
					end
				end
				cmdInput()
			end
		end
	end
end

--;===========================================================
--; STAGE SELECT
--;===========================================================
txt_selStage = createTextImg(jgFnt, 5, 0, '', 160, 239)

--Stage Select
selStage = animNew(sysSff, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStage, 85, 166)
animUpdate(selStage)

--Stage 0
stage0 = animNew(sysSff, [[
111,0, 0,0,
]])
animAddPos(stage0, 115, 172)
animUpdate(stage0)

--Stage 1
stage1 = animNew(stageSff, [[
0,0, 0,0,
]])
animAddPos(stage1, 115, 172)
animUpdate(stage1)

--Stage 2
stage2 = animNew(stageSff, [[
0,1, 0,0,
]])
animAddPos(stage2, 115, 172)
animUpdate(stage2)

--Stage 3
stage3 = animNew(stageSff, [[
0,2, 0,0,
]])
animAddPos(stage3, 115, 172)
animUpdate(stage3)

function f_selectStage()
	if data.stageMenu then
		if commandGetState(p1Cmd, 'l') then
			sndPlay(sysSnd, 100, 0)
			stageList = stageList - 1
			if stageList < 0 then stageList = data.includestage end
		elseif commandGetState(p1Cmd, 'r') then
			sndPlay(sysSnd, 100, 0)
			stageList = stageList + 1
			if stageList > data.includestage then stageList = 0 end
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			for i=1, 5 do
				stageList = stageList - 1
				if stageList < 0 then stageList = data.includestage end
			end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			for i=1, 5 do
				stageList = stageList + 1
				if stageList > data.includestage then stageList = 0 end
			end
		end		
		animSetWindow(selectBG1a, 0, 0, 0, 0)
		animSetWindow(selectBG1b, 0, 0, 0, 0)
		animSetWindow(selectBG1c, 0, 0, 0, 0)
		p1FaceX = 99
		p1FaceY = 999
		p2FaceX = 999
		p2FaceY = 999
		animAddPos(selStage, 0, 0)
		animUpdate(selStage)
		animDraw(selStage)
		--Stage Preview
		if stageList == 0 then
			animAddPos(stage0, 0, 0)
			animUpdate(stage0)
			animDraw(stage0)
		elseif stageList == 1 then
			animAddPos(stage1, 0, 0)
			animUpdate(stage1)
			animDraw(stage1)
		elseif stageList == 2 then
			animAddPos(stage2, 0, 0)
			animUpdate(stage2)
			animDraw(stage2)
		elseif stageList == 3 then
			animAddPos(stage3, 0, 0)
			animUpdate(stage3)
			animDraw(stage3)			
		end		
		textImgSetText(txt_selStage, 'STAGE ' .. stageList .. ': ' .. getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1'))
		textImgDraw(txt_selStage)
		if btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			if stageList == 0 then
				stageNo = math.random(1, data.includestage)
				setStage(stageNo)
				selectStage(stageNo)
			else
				stageNo = stageList
				setStage(stageNo)
				selectStage(stageNo)
			end
			stageEnd = true
			cmdInput()
		end
	else
		if t_selChars[data.t_p2selected[1].cel+1].stage ~= nil then
			stageNo = math.random(1,#t_selChars[data.t_p2selected[1].cel+1].stage)
			stageNo = t_selChars[data.t_p2selected[1].cel+1].stage[stageNo]
		else
			stageNo = math.random(1, data.includestage)
		end
		setStage(stageNo)
		selectStage(stageNo)
		stageEnd = true
	end
end

function f_assignMusic()
	track = ''
	if data.stageMenu then
		if t_selStages[stageNo].music ~= nil then
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
		stageEnd = true
	end
	playBGM(track)
end

--;===========================================================
--; VERSUS SCREEN
--;===========================================================
txt_p2NameVS = createTextImg(jgFnt, 0, 0, '', 0, 0)
txt_p1NameVS = createTextImg(jgFnt, 0, 0, '', 0, 0)
txt_matchNo = createTextImg(jgFnt, 0, 0, '', 160, 10)
txt_matchFinal = createTextImg(jgFnt, 0, 0, '', 160, 10)
txt_gameNo = createTextImg(jgFnt, 0, 0, '', 160, 10)
txt_bossNo = createTextImg(jgFnt, 0, 0, '', 160, 10)
txt_vsHint = createTextImg(font1, 0, -1, '', 308, 239)

--VS background
versusBG1 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(versusBG1, 160, 0)
animSetTile(versusBG1, 1, 1)
animSetColorKey(versusBG1, -1)

--Hardcore VS background
versusHardBG1 = animNew(sysSff, [[
101,0, 0,0, -1
]])
animAddPos(versusHardBG1, 160, 0)
animSetTile(versusHardBG1, 1, 1)
animSetColorKey(versusHardBG1, -1)

--VS Screen (left portrait background)
versusBG2 = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(versusBG2, 160, 0)
animSetTile(versusBG2, 1, 1)
animSetWindow(versusBG2, 20, 30, 120, 140)

--VS Screen (right portrait background)
versusBG3 = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(versusBG3, 160, 0)
animSetTile(versusBG3, 1, 1)
animSetWindow(versusBG3, 180, 30, 120, 140)

--VS Background Footer
vsBG6 = animNew(sysSff, [[
300,0, 0,128, -1
]])
animSetScale(vsBG6, 1.2, 1.8)
animAddPos(vsBG6, 160, 0)
animSetTile(vsBG6, 1, 0)
animUpdate(vsBG6)

--P1 Order cursor
p1OrderCursor = animNew(sysSff, [[
195,0, 0,0, -1
]])
animSetScale(p1OrderCursor, 0.10, 0.10)

--P2 Order cursor
p2OrderCursor = animNew(sysSff, [[
195,1, 0,0, -1
]])
animSetScale(p2OrderCursor, 0.10, 0.10)

function f_selectVersus()
	gameNo = gameNo+1
	bossNo = bossNo+1
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
	textImgSetText(txt_matchNo, 'STAGE: ' .. matchNo)
	textImgSetText(txt_matchFinal, 'FINAL STAGE')
	textImgSetText(txt_gameNo, 'MATCH: ' .. gameNo)
	textImgSetText(txt_bossNo, 'BOSS: ' .. bossNo)
	local randomHint = math.random(1,3) --Last number is the amount of Hints
	local i = 0
	if not data.versusScreen then
		while true do
			if i == 0 then
				f_selectChar(1, data.t_p1selected)
				f_selectChar(2, data.t_p2selected)
			elseif i == 30 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end
	else
		if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' or matchNo == lastMatch then
			playBGM(bgmVSFinal)
		else	
			playBGM(bgmVS)
		end	
		--VS Logo
		versusBG4 = animNew(sysSff, [[
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
		animAddPos(versusBG4, 160, 95)
		local sndNumber = -1
		local p1Confirmed = false
		local p2Confirmed = false
		local p1Row = 1
		local p2Row = 1
		local t_tmp = {}
		local sndTime = 0
		local orderTime = 0
		if data.p1In == 1 and data.p2In == 2 and (#data.t_p1selected > 1 or #data.t_p2selected > 1) and not data.coop then
			orderTime = math.max(#data.t_p1selected, #data.t_p2selected) * 60
		elseif #data.t_p1selected > 1 and not data.coop then
			orderTime = #data.t_p1selected * 60
		else
			f_selectChar(1, data.t_p1selected)
			p1Confirmed = true
			f_selectChar(2, data.t_p2selected)
			p2Confirmed = true
		end
		cmdInput()
		while true do
			--draw background on top
			if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' then 
				animDraw(f_animVelocity(versusHardBG1, 0, 1.5))
			else
				animDraw(f_animVelocity(versusBG1, 0, 1.5))
			end
			animDraw(f_animVelocity(versusBG2, -2, 0))
			animDraw(f_animVelocity(versusBG3, 2, 0))
			--drawPortrait(data.t_p1selected[1].cel, 20, 30, 1, 1)
			--drawPortrait(data.t_p2selected[1].cel, 300, 30, -1, 1)
			--end loop after at least 120 ticks (extended if sound has been triggered)
			--draw info text
			if p1Confirmed == false then
				txt_p1State = createTextImg(jgFnt, 3, 0, 'WAITING ORDER', 78, 25)
				textImgDraw(txt_p1State)
			elseif p1Confirmed == true and p2Confirmed == true then
				txt_p1State = createTextImg(jgFnt, 2, 0, 'START MATCH', 79, 25)
				textImgDraw(txt_p1State)	
				animSetWindow(cursorBox, 0, 157, 98, 15)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			else
				txt_p1State = createTextImg(jgFnt, 5, 0, 'READY!', 78, 25)
				textImgDraw(txt_p1State)
			end
			if p2Confirmed == false then
				txt_p2State = createTextImg(jgFnt, 1, 0, 'WAITING ORDER', 241, 25)
				textImgDraw(txt_p2State)
			--elseif p1Confirmed == false and p2Confirmed == true then
				--txt_p2State = createTextImg(jgFnt, 5, 0, 'READY!', 241, 25)
				--textImgDraw(txt_p2State)
			else
				txt_p2State = createTextImg(jgFnt, 5, 0, 'READY!', 241, 25)
				textImgDraw(txt_p2State)
			end	
			--set random hints
			if randomHint == 1 then
				textImgSetText(txt_vsHint, "PRESS LEFT OR RIGHT TO CHANGE THE CHARACTER ORDER IN SIMUL OR TURNS MODE ")
				textImgDraw(txt_vsHint)
			elseif randomHint == 2 then
				textImgSetText(txt_vsHint, "KEEP START BUTTON IN THE CHARACTER SELECT AND PRESS C or Z BUTTON      ")
				textImgDraw(txt_vsHint)
			elseif randomHint == 3 then
				textImgSetText(txt_vsHint, "IF ANY CHARACTER GETTING BUG, PRESS F4 TO RELOAD THE MATCH         ")
				textImgDraw(txt_vsHint)
			--elseif randomHint == 4 then
				--textImgSetText(txt_vsHint, "PRESS (RIGHT OR LEFT)+ Y + A TO CHANGE BETWEEN THE CHARACTERS IN TAG MODE")
				--textImgDraw(txt_vsHint)
			--elseif randomHint == 5 then
				--textImgSetText(txt_vsHint, "WHILE YOU FIGHT, PRESS Y + A TO ACTIVATE THE PARTNER ASSIST IN TAG MODE  ")
				--textImgDraw(txt_vsHint) 				
			end	
			i = i + 1
			--if esc() then
				--orderTime = 0
				--if i < 120 then i = 120 end
			--end
			if sndTime > 0 then
				sndTime = sndTime - 1
			elseif btnPalNo(p1Cmd) > 0 and p1Confirmed and p2Confirmed then --Original Time To Select: elseif i > 120 and p1Confirmed and p2Confirmed then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				break
			end
			--option to adjust Team Mode characters order if timer is > 0
			if orderTime > 0 then
				--orderTime = orderTime - 1                                    Activate Original OrderTime
				sndNumber = -1
				--if Player 1 has not confirmed the order yet
				if not p1Confirmed then
					if btnPalNo(p1Cmd) > 0 then
						if not p1Confirmed then
							sndNumber = 1
							f_selectChar(1, data.t_p1selected)
							p1Confirmed = true
						end
						if data.p2In ~= 2 then
							if not p2Confirmed then
								f_selectChar(2, data.t_p2selected)
								p2Confirmed = true
							end
						end
					elseif commandGetState(p1Cmd, 'u') then
						if #data.t_p1selected > 1 then
							sndNumber = 0
							p1Row = p1Row - 1
							if p1Row == 0 then p1Row = #data.t_p1selected end
						end
					elseif commandGetState(p1Cmd, 'd') then
						if #data.t_p1selected > 1 then
							sndNumber = 0
							p1Row = p1Row + 1
							if p1Row > #data.t_p1selected then p1Row = 1 end
						end
					elseif commandGetState(p1Cmd, 'l') then
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
					elseif commandGetState(p1Cmd, 'r') then
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
				--if Player2 has not confirmed the order yet and is not controlled by Player 1
				if not p2Confirmed and data.p2In ~= 1 then
					if btnPalNo(p2Cmd) > 0 then
						if not p2Confirmed then
							sndNumber = 1
							f_selectChar(2, data.t_p2selected)
							p2Confirmed = true
						end
					elseif commandGetState(p2Cmd, 'u') then
						if #data.t_p2selected > 1 then
							sndNumber = 0
							p2Row = p2Row - 1
							if p2Row == 0 then p2Row = #data.t_p2selected end
						end
					elseif commandGetState(p2Cmd, 'd') then
						if #data.t_p2selected > 1 then
							sndNumber = 0
							p2Row = p2Row + 1
							if p2Row > #data.t_p2selected then p2Row = 1 end
						end
					elseif commandGetState(p2Cmd, 'l') then
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
					elseif commandGetState(p2Cmd, 'r') then
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
			else --orderTime <= 0
				if not p1Confirmed then
					f_selectChar(1, data.t_p1selected)
					p1Confirmed = true
				end
				if not p2Confirmed then
					f_selectChar(2, data.t_p2selected)
					p2Confirmed = true
				end
				if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
					if i < 120 then i = 120 end
				end
			end
			--draw character animations
			for j=#data.t_p1selected, 1, -1 do
				f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimStand', 30 + (2*j-1) * 100/(2*#data.t_p1selected), 168, data.t_p1selected[j].up)
			end
			for j=#data.t_p2selected, 1, -1 do
				f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimStand', 290 - (2*j-1) * 100/(2*#data.t_p2selected), 168, data.t_p2selected[j].up)
			end
			--draw names
			f_drawSelectName(txt_p1NameVS, 0, data.t_p1selected, 78, 180, 0, 14, p1Row, 4)
			f_drawSelectNameP2(txt_p2NameVS, 0, data.t_p2selected, 241, 180, 0, 14, p2Row, 1)
			--p1 order cursor position
			animUpdate(p1OrderCursor)
			animPosDraw(p1OrderCursor, 1, 172)
			animPosDraw(p1OrderCursor, 1, 186)
			animPosDraw(p1OrderCursor, 1, 200)
			animPosDraw(p1OrderCursor, 1, 214)
			txt_p1orderNo1 = createTextImg(jgFnt, 0, 0, '1', 9.2, 180)
			textImgDraw(txt_p1orderNo1)
			txt_p1orderNo2 = createTextImg(jgFnt, 0, 0, '2', 9, 194)
			textImgDraw(txt_p1orderNo2)
			txt_p1orderNo3 = createTextImg(jgFnt, 0, 0, '3', 9, 208)
			textImgDraw(txt_p1orderNo3)
			txt_p1orderNo4 = createTextImg(jgFnt, 0, 0, '4', 9, 222)
			textImgDraw(txt_p1orderNo4)
			--p2 order cursor position
			animUpdate(p2OrderCursor)
			animPosDraw(p2OrderCursor, 305, 172)
			animPosDraw(p2OrderCursor, 305, 186)
			animPosDraw(p2OrderCursor, 305, 200)
			animPosDraw(p2OrderCursor, 305, 214)
			txt_p2orderNo1 = createTextImg(jgFnt, 0, 0, '1', 310.2, 180)
			textImgDraw(txt_p2orderNo1)
			txt_p2orderNo2 = createTextImg(jgFnt, 0, 0, '2', 311, 194)
			textImgDraw(txt_p2orderNo2)
			txt_p2orderNo3 = createTextImg(jgFnt, 0, 0, '3', 311, 208)
			textImgDraw(txt_p2orderNo3)
			txt_p2orderNo4 = createTextImg(jgFnt, 0, 0, '4', 311, 222)
			textImgDraw(txt_p2orderNo4)
			--draw match counter
			if data.gameMode == 'arcade' then
				if matchNo ~= lastMatch then
					textImgDraw(txt_matchNo)
				else
					textImgDraw(txt_matchFinal)
				end
			elseif data.gameMode == 'versus' then
				textImgDraw(txt_gameNo)
			elseif data.gameMode == 'survival' then
				textImgDraw(txt_gameNo)
			elseif data.gameMode == 'bossrush' then
				textImgDraw(txt_bossNo)	
			end
			--draw background on bottom
			animUpdate(versusBG4)
			animDraw(versusBG4)
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			animDraw(vsBG6)
			textImgDraw(txt_vsHint)
			cmdInput()
			refresh()
		end
	end
end

function f_selectChar(player, t)
	for i=1, #t do
		selectChar(player, t[i].cel, t[i].pal)
	end
end

--;===========================================================
--; HERE COMES A NEW CHALLENGER SCREEN
--;===========================================================
--Challenger Transparent BG
versusBG5 = animNew(sysSff, [[
100,1, 20,13, -1, 0, s
]])
animAddPos(versusBG5, 160, 0)
animSetTile(versusBG5, 1, 1)
animSetWindow(versusBG5, -54, 67, 428, 100)

--Challenger Text
challengerText1 = animNew(sysSff, [[
500,0, 0,0, 5
500,1, 0,0, 5
500,2, 0,0, 5
500,3, 0,0, 5
500,4, 0,0, 5
500,5, 0,0, 5
500,6, 0,0, 5
500,7, 0,0, 5
500,8, 0,0, 5
500,9, 0,0, 5
]])
animAddPos(challengerText1, 15, 100)
animUpdate(challengerText1)
--animSetScale(challengerText1, 1.2, 1)

function f_selectChallenger()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	playBGM(bgmNothing)
	sndPlay(sysSnd, 200, 1) --Here comes a new Challenger!
	local txt = ''
	local i = 0
	cmdInput()
	while true do
		if i == 150 then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			break
		elseif btnPalNo(p1Cmd) > 0 then
			cmdInput()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			break
		end
		if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' then 
			animDraw(f_animVelocity(versusHardBG1, 0, 1.5))
		else
			animDraw(f_animVelocity(versusBG1, 0, 1.5))
		end
		animDraw(f_animVelocity(versusBG5, 0, 1.5))
		i = i + 1
		animDraw(challengerText1)
		animUpdate(challengerText1)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; WIN SCREEN
--;===========================================================
txt_winquote = createTextImg(jgFnt, 0, 1, '', 0, 0)

function f_selectWin()
	playBGM(bgmVictory)
	local txt = ''
	if winner == 1 then
		p1Wins = p1Wins + 1
		txt = f_winParse(t_selChars[data.t_p1selected[1].cel+1], t_selChars[data.t_p2selected[1].cel+1], data.t_p2selected[1].pal, #data.t_p2selected)
	else--if winner == 2 then
		p2Wins = p2Wins + 1
		txt = f_winParse(t_selChars[data.t_p2selected[1].cel+1], t_selChars[data.t_p1selected[1].cel+1], data.t_p1selected[1].pal, #data.t_p1selected)
	end
	local i = 0
	cmdInput()
	while true do
		if i == 550 then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			break
		elseif btnPalNo(p1Cmd) > 0 then
			cmdInput()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			break
		end
		if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' then 
			animDraw(f_animVelocity(versusHardBG1, 0, 1.5))
		else
			animDraw(f_animVelocity(versusBG1, 0, 1.5))
		end
		if winner == 1 then
			animDraw(f_animVelocity(versusBG2, -2, 0))
			drawPortrait(data.t_p1selected[1].cel, 20, 30, 1, 1)
			drawPortrait(data.t_p2selected[1].cel, 300, 30, -1, 1)
			animDraw(f_animVelocity(versusBG3, 2, 0))
		else--if winner == 2 then
			drawPortrait(data.t_p1selected[1].cel, 20, 30, 1, 1)
			animDraw(f_animVelocity(versusBG2, -2, 0))
			animDraw(f_animVelocity(versusBG3, 2, 0))
			drawPortrait(data.t_p2selected[1].cel, 300, 30, -1, 1)
		end
		i = i + 1
		f_textRender(txt_winquote, txt, i, 20, 186, 15, 2, 35)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: yes', 'debug/quotes.log')
			return winner.quotes[quote]
		else
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: no', 'debug/quotes.log')
			return ''
		end
	else
		f_printVar(logVar .. '0 triggers found\n0 quotes found\n\nquote: -1\nexists: no', 'debug/quotes.log')
		return ''
	end
end

function f_winParseOLD(winner, looser, pal)
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
								skip = true
								logVar = logVar .. '  after: skipped\n'
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
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: yes', 'debug/quotes.log')
			return winner.quotes[quote]
		else
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: no', 'debug/quotes.log')
			return ''
		end
	else
		f_printVar(logVar .. '0 triggers found\n0 quotes found\n\nquote: -1\nexists: no', 'debug/quotes.log')
		return ''
	end
end

--;===========================================================
--; RESULT
--;===========================================================
txt_result = textImgNew()
txt_resultTime = textImgNew()

function f_result(state)
	--if state == 'win' then
	--elseif state == 'lost' then
	--end
	if data.gameMode == 'survival' then
		playBGM(bgmResults)
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		textImgSetFont(txt_result, survBarsFnt)
		textImgSetPos(txt_result, 159, 239)
		textImgSetText(txt_result, 'X' .. winCnt .. 'WINS')
	elseif data.gameMode == 'endless' then
		playBGM(bgmResults)
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		textImgSetFont(txt_result, survNumFnt)
		textImgSetPos(txt_result, 159, 150)
		textImgSetText(txt_result, winCnt .. ' WINS' .. looseCnt .. ' LOSES')	
	else
		return
	end
	cmdInput()
	while true do
		if esc() or btnPalNo(p1Cmd) > 0 then
			cmdInput()
			break
		end
		textImgDraw(txt_result)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end
