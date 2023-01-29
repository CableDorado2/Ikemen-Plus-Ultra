
module(..., package.seeall)

--;===========================================================
--; GENERAL CONFIG
--;===========================================================
--Default turns/simul count after starting the game
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
txt_selectHint = createTextImg(font1, 0, -1, 'PRESS A,B,C,X,Y OR Z BUTTON TO SELECT A COLOR PALETTE FOR THE CHARACTERS ', 308, 239)

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

function f_selectReset()
	--When you play in multiplayer the roster is divided into 2 and the 2nd player can choose without the screen being cut:
	if data.p2Faces or data.selectType == 'Fixed' then
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
		elseif data.selectType == 'Fixed' then --When you play in a Single Mode
			p1FaceX = 90
			p1FaceY = 170
			--p2FaceX = 90
			--p2FaceY = 170
		end
	--When data.p2Faces is false and you play in 1P you will see an expanded roster, as there is no 2P to select it will not be cut:
	elseif data.selectType == 'Variable' then
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
		--p2FaceX = 2
		--p2FaceY = 170
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
	if data.p2In == 1 or data.p2In == 3 then
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
	--Survival / Boss Rush / Endless / Bonus Rush
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
			cnt = 999 * p2numChars
		elseif data.gameMode == 'allroster' then
			t = t_randomChars
			cnt = #t
			local i = 0
			while cnt / p2numChars ~= math.ceil(cnt / p2numChars) do --not integer
				i = i + 1
				cnt = #t + i
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
	f_printTable(t_roster, 'saved/debug/t_roster.txt')
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
	f_printTable(t_aiRamp, 'saved/debug/t_aiRamp.txt')
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
			elseif data.p2In == 3 and not data.aiFight then
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
--; BACK TO MAIN MENU LOOP
--;===========================================================
t_backMenu = {
	{id = textImgNew(), text = 'YES'},
	{id = textImgNew(), text = 'NO'},
}	
	
function f_backMenu()
	if onlinegame == false then
		cmdInput()
		local cursorPosY = 0
		local moveTxt = 0
		local backMenu = 1
		while true do
			if commandGetState(p1Cmd, 'u') then
				sndPlay(sysSnd, 100, 0)
				backMenu = backMenu - 1
			elseif commandGetState(p1Cmd, 'd') then
				sndPlay(sysSnd, 100, 0)
				backMenu = backMenu + 1
			end
			if backMenu < 1 then
				backMenu = #t_backMenu
				if #t_backMenu > 4 then
					cursorPosY = 4
				else
					cursorPosY = #t_backMenu-1
				end
			elseif backMenu > #t_backMenu then
				backMenu = 1
				cursorPosY = 0
			elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 4 then
				moveTxt = (backMenu - 5) * 13
			elseif cursorPosY == 0 then
				moveTxt = (backMenu - 1) * 13
			end
			if btnPalNo(p1Cmd) > 0 then
				--YES
				if backMenu == 1 then
					if data.rosterMode == 'event' or data.rosterMode == 'mission' then
						data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
					end
					sndPlay(sysSnd, 100, 2)
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
					setGameType(0)
					setServiceType(0)
					backmenu = true
					break
				--NO
				else
					backmenu = false
					data.fadeTitle = f_fadeAnim(20, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 1)
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
					f_selectReset()
					if data.rosterAdvance == true then
						stageEnd = true
						--f_aiLevel()
						--f_orderSelect()
						--f_selectVersus()
						--f_setZoom()
						--f_assignMusic()
					end
					break
				end
			end	
			animDraw(f_animVelocity(titleBG0, -2.15, 0))
			for i=1, #t_backMenu do
				if i == backMenu then
					bank = 5
				else
					bank = 0
				end
				textImgDraw(f_updateTextImg(t_backMenu[i].id, jgFnt, bank, 0, t_backMenu[i].text, 159, 165+i*13-moveTxt))
			end
			animSetWindow(cursorBox, 0,168+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			animDraw(titleBG1)
			animAddPos(titleBG2, -1, 0)
			animUpdate(titleBG2)
			animDraw(titleBG2)
			animDraw(titleBG3)
			animDraw(titleBG4)
			animDraw(titleBG5)
			animDraw(titleBG6)
			textImgDraw(txt_subTitle)
			textImgDraw(txt_titleFt)
			textImgSetText(txt_titleFt, '            YOU WILL BACK TO MAIN MENU')
			f_sysTime()	
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			cmdInput()
			refresh()
		end
	elseif onlinegame == true then
		f_backOnline()
	end
end

function f_backOnline()
	while true do
		--setGameType(0)
		--setServiceType(0)
		backmenu = true
		break
		cmdInput()
		refresh()
	end
end

--;================================================================
--; SIMPLE LOOP (VERSUS, TRAINING, WATCH, SINGLE BONUS/BOSSES LIST)
--;================================================================
function f_selectSimple()
	p1SelX = 0
	p1SelY = 0
	p2SelX = 4 --Cursor position after choosing the Team Mode (Single, Team or Turns), this is used to put p2 in the 4th slot
	p2SelY = 0
	p1FaceOffset = 0
	p2FaceOffset = 0
	p1OffsetRow = 0
	p2OffsetRow = 0
	stageList = 0
	gameNo = 0
	bossNo = 0
	bonusNo = 0
	p1Wins = 0
	p2Wins = 0
	cmdInput()
	while true do
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		if data.rosterMode == 'challenger' then
			f_challengerMusic()
		elseif data.rosterMode == 'event' then
			--playBGM('')
		else	
			playBGM(bgmSelect)
		end
		f_selectReset()
		while not selScreenEnd do
			if esc() then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				f_backMenu()
				if backmenu == true then
					if data.rosterMode == 'event' then
						--playBGM('')
					else
						f_menuMusic()
					end
					return
				end
			end
			f_selectScreen()
		end
		f_aiLevel()
		f_orderSelect()
		f_selectVersus()
		f_setZoom()
		f_assignMusic()
		winner = game()
		--versus win screen
		if data.gameMode == 'versus' then
			if t_selChars[data.t_p2selected[1].cel+1].winscreen == nil or t_selChars[data.t_p2selected[1].cel+1].winscreen == 1 then
				f_selectWin()
				if data.challengerScreen == true then
					f_selectChallenger()
				else
				--Do Nothing and don't show the screen
				end
			end
		elseif data.rosterMode == 'mission' or data.rosterMode == 'event' then
			if t_selChars[data.t_p2selected[1].cel+1].winscreen == nil or t_selChars[data.t_p2selected[1].cel+1].winscreen == 1 then
				f_selectWin()
			end
			if data.rosterMode == 'event' then
				playBGM(bgmEvents)
			else
				f_menuMusic()
			end
			return
		end	
		playBGM('')
		cmdInput()
		refresh()
	end
end

--;================================================================
--; TOURNAMENT LOOP
--;================================================================
function f_selectTournament()
--TODO
end

--;=====================================================================================
--; ADVANCE LOOP (ARCADE, SURVIVAL, BOSS/BONUS RUSH, SUDDEN DEATH, TIME ATTACK, ENDLESS)
--;=====================================================================================
function f_selectAdvance()
	data.rosterAdvance = true
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
	bonusNo = 0
	p1Wins = 0
	p2Wins = 0
	cmdInput()
	f_selectReset()
	stageEnd = true
	while true do
		if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' then
			playBGM(bgmSelectBoss)
		elseif data.rosterMode == 'challenger' then
			f_challengerMusic()
		else	
			playBGM(bgmSelect)
		end	
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		selectStart()
		while not selScreenEnd do
			if esc() then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				f_backMenu()
				if backmenu == true then
					f_menuMusic()
					return
				end
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
		--player exit the match via ESC in Endless mode
		elseif winner == -1 and data.gameMode == 'endless' then
			--counter
			looseCnt = looseCnt + 1
			--result
			f_result('lost')
			--reset title screen fading
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			f_menuMusic()
			return	
		--player won (also if lost in Endless mode)
		elseif winner == 1 or data.gameMode == 'endless' then
			--counter
			if winner == 1 then
				winCnt = winCnt + 1
			else --only true in Endless mode
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
				--complete missions verification
				f_missionStatus()
				--complete events verification
				f_eventStatus()
				if data.gameMode == 'arcade' then
					--complete missions verification
					f_missionStatus()
					--complete events verification
					f_eventStatus()
					--credits
					script.storyboard.f_storyboard('data/screenpack/credits.def')
					--unlocks
					data.arcadeUnlocks = true --Unlock Extras Menu when complete Arcade Mode
					f_saveUnlockData()
					--game over
					script.storyboard.f_storyboard('data/screenpack/gameover.def')
					--intro
					script.storyboard.f_storyboard('data/screenpack/intro.def')
					--reset title screen fading
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					f_menuMusic()
					return
				else
					--game over
					script.storyboard.f_storyboard('data/screenpack/gameover.def')
					--reset title screen fading
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					if data.rosterMode == 'event' then
						playBGM(bgmEvents)
					else
						f_menuMusic()
					end
					return
				end	
			--next match available
			else
				matchNo = matchNo + 1
			end
		--player lost in special game mode or don't have any coins left for Arcade
		elseif data.coins == 0 or data.gameMode == 'survival' or data.gameMode == 'bossrush' or data.gameMode == 'bonusrush' then
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
			f_gameOver()
			--intro
			--script.storyboard.f_storyboard('data/screenpack/intro.def')
			--reset title screen fading
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			if data.rosterMode == 'event' then
				playBGM(bgmEvents)
			else
				f_menuMusic()
			end
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
			f_continue()
			if data.continue == 2 then --Continue = NO
				--intro
				--script.storyboard.f_storyboard('data/screenpack/intro.def')
				--reset title screen fading
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				f_menuMusic()
				return
			end
			if data.contSelection then --true if 'Char change at Continue' option is enabled
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				if serviceTeam == true then p1TeamEnd = false end
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
						f_backMenu()
						if backmenu == true then
							f_menuMusic()
							return
						end
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
					--setGameType(3) --Disable HUD for All Bonus
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
		f_orderSelect()
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
txt_p1Wins = createTextImg(font6, 0, 1, '', 2, 13)
txt_p2Wins = createTextImg(font6, 0, -1, '', 318, 13)

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

function f_selectScreen()
	--draw
	if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' or matchNo == lastMatch then --Red BG for a Decisive Battle
		animDraw(f_animVelocity(selectHardBG0, -1, -1)) --Sprite Animation (Diagonal Movement around left direction)
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
		if data.selectType == 'Fixed' then
			animSetWindow(selectBG1c, 85, 0, 151, 239)
		elseif data.selectType == 'Variable' then
			animSetWindow(selectBG1c, -2, 0, 324, 239)
		end
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
--; TOURNAMENT SCREEN
--;===========================================================
function f_selectTournamentScreen()
	--draw layerno = 0 backgrounds
	
	--draw layerno = 1 backgrounds

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
p1SelTmTxt = createTextImg(jgFnt, 0, 1, 'TEAM MODE', 20, 30)

t_p1selTeam = {
	{id = '', text = 'SINGLE'},
	{id = '', text = 'SIMUL'},
	{id = '', text = 'TURNS'},	
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
		if btnPalNo(p1Cmd) > 0 then
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
			cmdInput()
		end
	end
end

--;===========================================================
--; PLAYER 2 TEAM MENU
--;===========================================================
p2SelTmTxt = createTextImg(jgFnt, 0, -1, 'TEAM MODE', 300, 30)
IASelTmTxt = createTextImg(jgFnt, 0, -1, 'CPU MODE', 300, 30)

t_p2selTeam = {
	{id = '', text = 'SINGLE'},
	{id = '', text = 'SIMUL'},
	{id = '', text = 'TURNS'},
}
for i=1, #t_p2selTeam do
	t_p2selTeam[i].id = createTextImg(jgFnt, 0, -1, t_p2selTeam[i].text, 300, 35+i*15)
end

function f_p2TeamMenu()
	if data.coop then --Simul co-op
		if data.coopenemy == 'Single' then --CPU Co-op Players uses Co-Op CPU Team Mode setting.
			p2teamMode = 0
			p2numChars = 2 --Fix AI Fight Error When p2numChars = 1 (Take reference of Arcade Bonus in co-op)
		elseif data.coopenemy == 'Simul' then
			p2teamMode = 1
			p2numChars = 2
		elseif data.coopenemy == 'Turns' then
			p2teamMode = 2
			p2numChars = 3
		end
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
		if data.p2In == 2 then
			textImgDraw(p2SelTmTxt)
		else
			textImgDraw(IASelTmTxt)
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
--; SELECT MENU ASSETS
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
				textImgSetBank(id, 3) --Color of P1 on VS screen
			else
				textImgSetBank(id, bankUnique) --Color of Team Member on VS screen
			end
		else
			textImgSetBank(id, 3) --Color of P1 when select him on Character Select
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
txt_p1Name = createTextImg(jgFnt, 4, 1, '', 0, 0) --Text color when scrolling through the roster

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
		if data.charPresentation == 'Portrait' or data.charPresentation == 'Mixed' then
			animDraw(f_animVelocity(charBG2, -2, 0)) --P1 Portrait BG location
			if p1Portrait then drawPortrait(p1Portrait, 0, 20, 1, 1) end --P1 Portrait location
		end
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
					--sndPlay(sysSnd, 100, 0) --Cursor SFX in Random...
					if data.charPresentation == 'Portrait' or data.charPresentation == 'Mixed' then
						drawPortrait(math.random(1, #t_randomChars), 0, 20, 1, 1) --P1 RANDOM Portrait location.
					end
					if data.charPresentation == 'Sprite' or data.charPresentation == 'Mixed' then
						f_drawCharAnim(t_selChars[math.random(1, #t_randomChars)], 'p1AnimStand', 30 + 28*#data.t_p1selected, 133, updateAnim) --P1 RANDOM animation location ONLY in Char Select
					end
				else
					if data.charPresentation == 'Sprite' or data.charPresentation == 'Mixed' then
						f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 30 + 28*#data.t_p1selected, 133, updateAnim) --P1 animation location ONLY in character select
					end
				end
			end
			for j=#data.t_p1selected, 1, -1 do
				if data.charPresentation == 'Portrait' or data.charPresentation == 'Mixed' then
					--drawPortrait(data.t_p1selected[p1numChars].cel, 0, 20, 1, 1) --Location of P1 Portrait chosen ONLY in the Char Select (This detects random select portrait)
					drawPortrait(p1Portrait, 0, 20, 1, 1) --Location of P1 Portrait chosen ONLY in the Char Select
				end
				if data.charPresentation == 'Sprite' or data.charPresentation == 'Mixed' then
					f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 30 + 28*(j-1), 133, data.t_p1selected[j].up) --Location of the animation of P1 chosen ONLY in the Char Select
				end
			end
		end
		local nameX, nameY = f_drawSelectName(txt_p1Name, 4, data.t_p1selected, 10, 144, 4, 7) --Location of the name of P1 in the character select
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
			--Draw Character Select Hint
			textImgDraw(txt_selectHint)
			textImgSetText(txt_p1Name, f_getName(p1Cell))
			textImgPosDraw(txt_p1Name, 10, nameY)
			animPosDraw(p1ActiveCursor, p1FaceX+p1SelX*(27+2), p1FaceY+(p1SelY-p1OffsetRow)*(27+2))
			if commandGetState(p1Cmd, 'a') or commandGetState(p1Cmd, 'b') or commandGetState(p1Cmd, 'c') or commandGetState(p1Cmd, 'x') or commandGetState(p1Cmd, 'y') or commandGetState(p1Cmd, 'z') then
				sndPlay(sysSnd, 100, 1)
				local cel = p1Cell
				if getCharName(cel) == 'Random' then
					cel = math.random(1, #t_randomChars)-1
				elseif f_getName(p1Cell) == 'Kung Fu Man' then --Character Voice when is selected Example for Player 1 Side
                    sndPlay(announcerSnd, 1, 0)
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
						elseif data.p2In == 3 and matchNo == 0 then
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
		if data.charPresentation == 'Portrait' or data.charPresentation == 'Mixed' then
			animDraw(f_animVelocity(charBG3, 2, 0))
			if p2Portrait then drawPortrait(p2Portrait, 320, 20, -1, 1) end
		end	
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
					if data.charPresentation == 'Portrait' or data.charPresentation == 'Mixed' then
						drawPortrait(math.random(1, #t_randomChars), 320, 20, -1, 1)
					end
					if data.charPresentation == 'Sprite' or data.charPresentation == 'Mixed' then
						f_drawCharAnim(t_selChars[math.random(1, #t_randomChars)], 'p2AnimStand', 290 - 28*#t_selected, 133, updateAnim)
					end
				else
					if data.charPresentation == 'Sprite' or data.charPresentation == 'Mixed' then
						f_drawCharAnim(t_selChars[p2Cell+1], 'p2AnimStand', 290 - 28*#t_selected, 133, updateAnim)
					end	
				end
			end
			for j=#t_selected, 1, -1 do
				if data.charPresentation == 'Portrait' or data.charPresentation == 'Mixed' then
					drawPortrait(p2Portrait, 320, 20, -1, 1)
				end
				if data.charPresentation == 'Sprite' or data.charPresentation == 'Mixed' then
					f_drawCharAnim(t_selChars[t_selected[j].cel+1], 'p2AnimWin', 290 - 28*(j-1), 133, t_selected[j].up)
				end	
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
			textImgDraw(txt_selectHint)
			textImgSetText(txt_p2Name, f_getName(p2Cell))
			textImgPosDraw(txt_p2Name, 309, nameY)
			animPosDraw(p2ActiveCursor, p2FaceX+p2SelX*(27+2), p2FaceY+(p2SelY-p2OffsetRow)*(27+2))
			if commandGetState(p2Cmd, 'a') or commandGetState(p2Cmd, 'b') or commandGetState(p2Cmd, 'c') or commandGetState(p2Cmd, 'x') or commandGetState(p2Cmd, 'y') or commandGetState(p2Cmd, 'z') then
				sndPlay(sysSnd, 100, 1)
				local cel = p2Cell
				if getCharName(cel) == 'Random' then
					cel = math.random(1, #t_randomChars)-1
				elseif f_getName(p2Cell) == 'Kung Fu Man' then --Another Character Voice when is selected Example for Player 2 Side
                    sndPlay(announcerSnd, 2, 0)
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
function f_stagePreview()
	stagePreview = ''
	stagePreview = '0,' .. stageList-1 .. ', 0,0, 0'
	stagePreview = animNew(stageSff, stagePreview)
	if data.stageType == 'Classic' then
		animSetScale(stagePreview, 0.0705, 0.0705)
		animSetPos(stagePreview, 114.9, 171.5)
	elseif data.stageType == 'Modern' then
		animSetScale(stagePreview, 0.151, 0.150)
		animSetPos(stagePreview, 62.1, 74)
	end
	animUpdate(stagePreview)
	animDraw(stagePreview)
	return stagePreview
end

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
animAddPos(selStage, 85, 166)
animUpdate(selStage)

--Modern Stage Select
selStageM = animNew(sysSff, [[
110,0, 0,0, 10
110,1, 0,0, 10
110,2, 0,0, 10
]])
animAddPos(selStageM, 0, 62)
animUpdate(selStageM)
animSetScale(selStageM, 2.12, 2.12)

--Classic Stage 0
stage0 = animNew(sysSff, [[
110,3, 0,0,
]])
animAddPos(stage0, 115, 172)
animUpdate(stage0)

--Modern Stage 0
stage0M = animNew(sysSff, [[
110,3, 0,0,
]])
animSetPos(stage0M, 62, 74)
animUpdate(stage0M)
animSetScale(stage0M, 2.15, 2.15)

function f_selectStage()
	local bufl = 0
	local bufr = 0
	if data.stageType == 'Classic' then
		txt_selStage = createTextImg(jgFnt, 5, 0, '', 160, 239)
	elseif data.stageType == 'Modern' then
		txt_selStage = createTextImg(jgFnt, 5, 0, '', 160, 205)
		--Draw Stage Select Title BG
		animDraw(f_animVelocity(selectSTBG2a, -1, 0))
		animDraw(f_animVelocity(selectSTBG2b, -3, 0))
		animDraw(f_animVelocity(selectSTBG2c, -6, 0))
		--Draw Stage Name BG
		animDraw(f_animVelocity(selectSBG2a, 1, 0))
		animDraw(f_animVelocity(selectSBG2b, 3, 0))
		animDraw(f_animVelocity(selectSBG2c, 6, 0))
		--Draw Title Text
		txt_stageSelect = createTextImg(jgFnt, 0, 0, 'STAGE SELECT', 159, 60)
		textImgDraw(txt_stageSelect)
	end
	if data.stageMenu then
		--if commandGetState(p1Cmd, 's') then
			--sndPlay(sysSnd, 100, 0)
			--TODO: Alternative Stage Code
		if commandGetState(p1Cmd, 'u') then
			--if stageList == 1 or stageList == 14 or stageList == 17 then --Alternative Stage Available By Down Button on StageList Numbered
				--sndPlay(sysSnd, 100, 1)
				--stageList = stageList + 1
			--elseif stageList == 2 or stageList == 15 or stageList == 18 then
				--sndPlay(sysSnd, 100, 1)
				--stageList = stageList - 1
			--end
			sndPlay(sysSnd, 100, 3)
			for i=1, 5 do --Go back 5 by 5
				stageList = stageList - 1
				if stageList < 0 then stageList = data.includestage end
			end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') then
			--if stageList == 1 or stageList == 14 or stageList == 17 then --Alternative Stage Available By Up Button on StageList Numbered
				--sndPlay(sysSnd, 100, 1)
				--stageList = stageList + 1
			--elseif stageList == 2 or stageList == 15 or stageList == 18 then
				--sndPlay(sysSnd, 100, 1)
				--stageList = stageList - 1
			--else
			
			--end
			sndPlay(sysSnd, 100, 3)
			for i=1, 5 do --Advance 5 by 5
				stageList = stageList + 1
				if stageList > data.includestage then stageList = 0 end
			end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
			--if stageList == 1 or stageList == 14 or stageList == 17 then --Alternative Stage Available For Stage 1
				--sndPlay(sysSnd, 100, 0)
				--stageList = stageList + 2
			--elseif stageList == 2 or stageList == 15 or stageList == 18 then --Not Move
			--else --No Alternative Stage Available
				sndPlay(sysSnd, 100, 0)
				stageList = stageList + 1
				if stageList > data.includestage then stageList = 0 end
			--end
		elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
			--if stageList == 3 or stageList == 16 or stageList == 19 then --Alternative Stage Available For Stage 1
				--sndPlay(sysSnd, 100, 0)
				--stageList = stageList - 2
			--elseif stageList == 2 or stageList == 15 or stageList == 18 then --Not Move
			--else --No Alternative Stage Available
				sndPlay(sysSnd, 100, 0)
				stageList = stageList - 1
				if stageList < 0 then stageList = data.includestage end
			--end
		if commandGetState(p1Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
			end
		end		
		animSetWindow(selectBG1a, 0, 0, 0, 0)
		animSetWindow(selectBG1b, 0, 0, 0, 0)
		animSetWindow(selectBG1c, 0, 0, 0, 0)
		p1FaceX = 99
		p1FaceY = 999
		p2FaceX = 999
		p2FaceY = 999	
		if data.stageType == 'Classic' then
			animUpdate(selStage)
			animDraw(selStage)
		elseif data.stageType == 'Modern' then
			animUpdate(selStageM)
			animDraw(selStageM)
			p1Cell = nil
			p2Cell = nil
			p1Portrait = nil
			p2Portrait = nil
		end
		f_stagePreview() --Stages Preview Managed via Stages.sff
		if stageList == 0 then --Random Stage Preview Using Old Logic
			if data.stageType == 'Classic' then
				animUpdate(stage0)
				animDraw(stage0)
			elseif data.stageType == 'Modern' then
				animUpdate(stage0M)
				animDraw(stage0M)
			end
		end
		textImgSetText(txt_selStage, 'STAGE ' .. stageList .. ': ' .. getStageName(stageList):gsub('^["%s]*(.-)["%s]*$', '%1'))
		textImgDraw(txt_selStage)		
		if commandGetState(p1Cmd, 's') or commandGetState(p1Cmd, 'a') or commandGetState(p1Cmd, 'b') or commandGetState(p1Cmd, 'c') or commandGetState(p1Cmd, 'x') or commandGetState(p1Cmd, 'y') or commandGetState(p1Cmd, 'z') then
			sndPlay(sysSnd, 100, 1)
			if stageList == 1 then sndPlay(announcerSnd, 0,0) --Stage Announcer Voice Example
			--elseif stageList == 2 then sndPlay(announcerSnd, 0,1)
			end
			if stageList == 0 then
				stageNo = math.random(1, data.includestage)
				setStage(stageNo)
				selectStage(stageNo)
			else
				stageNo = stageList
				setStage(stageNo)
				selectStage(stageNo)
			end
			--create a timer to hear full announcer voice
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
--; ORDER SELECT AND VERSUS SCREEN
--;===========================================================
txt_p1NameVS = createTextImg(jgFnt, 0, 0, '', 0, 0)
txt_p2NameVS = createTextImg(jgFnt, 0, 0, '', 0, 0)
txt_orderHint = createTextImg(font5, 0, -1, '', 308, 239)
txt_vsHint = createTextImg(font5, 0, -1, '', 308, 239)
txt_matchNo = createTextImg(font21, 0, 0, '', 160, 20)
txt_matchFinal = createTextImg(font21, 0, 0, '', 160, 20)
txt_gameNo = createTextImg(font21, 0, 0, '', 160, 20)
txt_bossNo = createTextImg(font12, 0, 0, '', 160, 20)
txt_bonusNo = createTextImg(font21, 0, 0, '', 160, 20)

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

--;===========================================================
--; ORDER SELECT
--;===========================================================
function f_orderSelect()
	gameNo = gameNo+1
	bossNo = bossNo+1
	bonusNo = bonusNo+1
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
	--Arcade Match Text
	if data.gameMode == 'arcade' and matchNo == lastMatch - 1 then --If rival is in another match, replace [lastMatch - 1] with the match number where is your rival)
		textImgSetText(txt_matchNo, 'RIVAL MATCH') --Text for versus screen when you fighting against rival before final boss.
	else
		textImgSetText(txt_matchNo, 'STAGE: ' .. matchNo)
	end	
	textImgSetText(txt_matchFinal, 'FINAL STAGE')
	--Survival Match Text
	if data.gameMode == 'survival' then
		textImgSetText(txt_gameNo, 'REMAINING MATCHES: ' .. lastMatch - gameNo)
	--elseif data.gameMode == 'survival' and (lastMatch - gameNo == 0) then
		--textImgSetText(txt_gameNo, 'FINAL MATCH')
	--Boss Rush Match Text
	elseif data.gameMode == 'bossrush' then
		textImgSetText(txt_bossNo, 'REMAINING BOSSES: ' .. lastMatch - bossNo)
	--elseif data.gameMode == 'bossrush' and (lastMatch - bossNo == 0) then
		--textImgSetText(txt_bossNo, 'FINAL BOSS')
	else
		textImgSetText(txt_gameNo, 'MATCH: ' .. gameNo)
	end
	textImgSetText(txt_bonusNo, 'BONUS: ' .. bonusNo)
	local i = 0
	if not data.orderSelect then --Order Select off
		while true do
			if i == 0 then
				f_selectChar(1, data.t_p1selected)
				f_selectChar(2, data.t_p2selected)
			elseif i == 10 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end
	elseif p1teamMode == 0 and data.p2In == 1 then --Order Select off when P1 is playing in Single Team Mode and P2 is Controlled by AI
		while true do
			if i == 0 then
				f_selectChar(1, data.t_p1selected)
				f_selectChar(2, data.t_p2selected)
			elseif i == 10 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end
	elseif data.coop == true then --Order Select off when playing in CO-OP Mode
		while true do
			if i == 0 then
				f_selectChar(1, data.t_p1selected)
				f_selectChar(2, data.t_p2selected)
			elseif i == 10 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end	
	elseif p1teamMode == 0 and p2teamMode == 0 then --Order Select off when P1 and P2 playing in Single Team Mode
		while true do
			if i == 0 then
				f_selectChar(1, data.t_p1selected)
				f_selectChar(2, data.t_p2selected)
			elseif i == 10 then
				cmdInput()
				break
			end
			i = i + 1
			cmdInput()
			refresh()
		end	
	else
		if matchNo == lastMatch then
			playBGM(bgmSelectOrderFinal)
		--else	
			--playBGM(bgmSelectOrder)
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
		local orderhintTime = 0
		local randomHintOrder = math.random(3) --Select 1 of all randoms hints availables. Last number is the amount of Hints
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
			if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' or matchNo == lastMatch then --Red BG for a Decisive Battle
				animDraw(f_animVelocity(versusHardBG1, 0, 1.5))
			else
				animDraw(f_animVelocity(versusBG1, 0, 1.5))
			end
			animDraw(f_animVelocity(versusBG2, -2, 0))
			animDraw(f_animVelocity(versusBG3, 2, 0))
			if data.charPresentation == 'Portrait' or data.charPresentation == 'Mixed' then
				drawPortrait(data.t_p1selected[1].cel, 20, 30, 1, 1)
				drawPortrait(data.t_p2selected[1].cel, 300, 30, -1, 1)
			end	
			--end loop after at least 120 ticks (extended if sound has been triggered)
			--draw info text
			if p1Confirmed == false then
				txt_p1State = createTextImg(jgFnt, 3, 0, 'WAITING ORDER', 78, 25)
				textImgDraw(txt_p1State)
			elseif p1Confirmed == true and p2Confirmed == true then
				txt_p1State = createTextImg(jgFnt, 2, 0, 'START MATCH', 79, 25)
				textImgDraw(txt_p1State)	
				animSetWindow(cursorBox, 20, 14, 120, 16)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
				--for j=#data.t_p1selected, 1, -1 do
					--f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimWin', 30 + (2*j-1) * 100/(2*#data.t_p1selected), 168, data.t_p1selected[j].up)
				--end
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
			--set random hints for order select
			if randomHintOrder == 1 then
				textImgSetText(txt_orderHint, "PRESS LEFT OR RIGHT TO EDIT THE CHARACTERS ORDER ")
				textImgDraw(txt_orderHint)
			elseif randomHintOrder == 2 then
				textImgSetText(txt_orderHint, "PRESS UP OR DOWN TO CHOOSE A CHARACTER       ")
				textImgDraw(txt_orderHint)
			elseif randomHintOrder == 3 then
				textImgSetText(txt_orderHint, "PRESS ENTER TO CONFIRM THE ORDER SELECTED      ")
				textImgDraw(txt_orderHint)
			--elseif randomHintOrder == 4 then
				--textImgSetText(txt_orderHint, "PRESS (RIGHT OR LEFT)+ Y + A TO CHANGE BETWEEN THE CHARACTERS IN TAG MODE")
				--textImgDraw(txt_orderHint)
			--elseif randomHintOrder == 5 then
				--textImgSetText(txt_orderHint, "WHILE YOU FIGHT, PRESS Y + A TO ACTIVATE THE PARTNER ASSIST IN TAG MODE")
				--textImgDraw(txt_orderHint) 				
			end
			if orderhintTime > 150 then --Time for show a new random hint
				randomHintOrder = math.random(3) --Select 1 of all randoms hints availables. Last number is the amount of Hints
				orderhintTime = 0 --Restart timer for a new random hint
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
			if data.charPresentation == 'Portrait' then
				--Don't Draw character animations
			elseif data.charPresentation == 'Sprite' or data.charPresentation == 'Mixed' then
				--draw character animations
				for j=#data.t_p1selected, 1, -1 do
					f_drawCharAnim(t_selChars[data.t_p1selected[j].cel+1], 'p1AnimStand', 30 + (2*j-1) * 100/(2*#data.t_p1selected), 168, data.t_p1selected[j].up)
				end
				for j=#data.t_p2selected, 1, -1 do
					f_drawCharAnim(t_selChars[data.t_p2selected[j].cel+1], 'p2AnimStand', 290 - (2*j-1) * 100/(2*#data.t_p2selected), 168, data.t_p2selected[j].up)
				end
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
			--draw order screen text
			txt_orderSelect = createTextImg(font14, 0, 0, 'ORDER SELECT', 160, 10)
			textImgDraw(txt_orderSelect)
			--draw background on bottom
			animUpdate(versusBG4)
			animDraw(versusBG4)
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			animDraw(vsBG6)
			textImgDraw(txt_orderHint)
			orderhintTime = orderhintTime + 1 --Start timer for randoms hints
			cmdInput()
			refresh()
		end
	end
end

--;===========================================================
--; VERSUS SCREEN
--;===========================================================
function f_selectVersus()
	data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
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
		local vsTime = 0
		local vshintTime = 0
		local randomHintVS = math.random(3) --Select 1 of all randoms hints availables. Last number is the amount of Hints
		cmdInput()
		while true do
		--draw background on top
		if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' or matchNo == lastMatch then --Red BG for a Decisive Battle
			animDraw(f_animVelocity(versusHardBG1, 0, 1.5))
		else
			animDraw(f_animVelocity(versusBG1, 0, 1.5))
		end
		animDraw(f_animVelocity(versusBG2, -2, 0))
		animDraw(f_animVelocity(versusBG3, 2, 0))
		drawPortrait(data.t_p1selected[1].cel, 20, 30, 1, 1)
		drawPortrait(data.t_p2selected[1].cel, 300, 30, -1, 1)
		--set random hints for versus screen
		if randomHintVS == 1 then
			textImgSetText(txt_vsHint, "KEEP START IN CHAR SELECT AND PRESS C or Z BUTTON")
			textImgDraw(txt_vsHint)
		elseif randomHintVS == 2 then
			textImgSetText(txt_vsHint, "WHEN CHARS GETTING BUG PRESS F4 TO RELOAD THE MATCH")
			textImgDraw(txt_vsHint)
		elseif randomHintVS == 3 then
			textImgSetText(txt_vsHint, "PRESS THE IMPR PANT KEY TO TAKE A SCREENSHOT   ")
			textImgDraw(txt_vsHint)	
		end
		if vshintTime > 150 then --Time for show a new random hint
			randomHintVS = math.random(2) --Select 1 of all randoms hints availables. Last number is the amount of Hints
			vshintTime = 0 --Restart timer for a new random hint
		end
		vsTime = vsTime + 1
		if vsTime == 2222 then
			data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
			break
		elseif btnPalNo(p1Cmd) > 0 then
			data.fadeTitle = f_fadeAnim(30, 'fadein', 'black', fadeSff)
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
			break
		end
		--draw names
		f_drawSelectName(txt_p1NameVS, 0, data.t_p1selected, 78, 180, 0, 14, p1Row, 4)
		f_drawSelectNameP2(txt_p2NameVS, 0, data.t_p2selected, 241, 180, 0, 14, p2Row, 1)
		--draw match counter
			if data.gameMode == 'arcade' then
				if matchNo ~= lastMatch then
					textImgDraw(txt_matchNo)
				elseif matchNo == lastMatch then
					textImgDraw(txt_matchFinal)
				end
			elseif data.gameMode == 'survival' then
				--if gameNo ~= lastMatch then
					textImgDraw(txt_gameNo)
				--else
					--textImgDraw(txt_matchFinal)
				--end
			elseif data.gameMode == 'bossrush' then
				textImgDraw(txt_bossNo)
			elseif data.gameMode == 'bonusrush' then
				textImgDraw(txt_bonusNo)			
			elseif data.gameMode == 'versus' then
				textImgDraw(txt_gameNo)
			end	
		--draw background on bottom
		animUpdate(versusBG4)
		animDraw(versusBG4)
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		animDraw(vsBG6)
		textImgDraw(txt_vsHint)
		vshintTime = vshintTime + 1 --Start timer for randoms hints
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
--; WIN SCREEN
--;===========================================================
txt_winnername = createTextImg(jgFnt, 0, 1, '', 20, 177)
txt_winquote = createTextImg(font2, 0, 1, '', 0, 0)

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

function f_drawWinnerName(id, bank, t, x, y, spacingX, spacingY, rowUnique, bankUnique) --Unused
	for i=1, #t do
		textImgSetText(id, f_getName(t[i].cel)) --f_getName(t[i].cel if you want to get all names
		textImgSetPos(id, x, y)
		if rowUnique ~= nil then
			if i == rowUnique then
				textImgSetBank(id, bankUnique)
			else
				textImgSetBank(id, bank)
			end
		else
			textImgSetBank(id, bank)
		end
		textImgDraw(id)
		x = x + spacingX
		y = y + spacingY
	end
	return x, y
end

function f_missionStatus()
	if data.missionNo == 'mission 1' then
		data.mission1Status = 100
		f_saveUnlockData()
	elseif data.missionNo == 'mission 2' then
		data.mission2Status = 100
		f_saveUnlockData()
	elseif data.missionNo == 'mission 3' then
		data.mission3Status = 100
		f_saveUnlockData()
	elseif data.missionNo == 'mission 4' then
		data.mission4Status = 100
		f_saveUnlockData()
	elseif data.missionNo == 'mission 5' then
		data.mission5Status = 100
		f_saveUnlockData()
	elseif data.missionNo == 'mission 6' then
		data.mission6Status = 100
		f_saveUnlockData()
	end
	assert(loadfile('saved/stats_sav.lua'))()
end

function f_eventStatus()
	if data.eventNo == 'event 1' then
		data.event1Status = 100
		f_saveUnlockData()
	elseif data.eventNo == 'event 2' then
		data.event2Status = 100
		f_saveUnlockData()
	elseif data.eventNo == 'event 3' then
		data.event3Status = 100
		f_saveUnlockData()
	end
	assert(loadfile('saved/stats_sav.lua'))()
end

function f_winCoins()
	if onlinegame == false then	
		if coinSystem == true then
			data.coins = data.coins + 1 --Earn 1 Coin by Win :)
			sndPlay(sysSnd, 200, 0) --Coin Earned Song
			f_saveUnlockData()
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
			f_saveUnlockData()
		end
	elseif coinSystem == false then
		--Do nothing and don't lose or win coins
	end
end

function f_selectWin()
	setServiceType(0) --Erase Service
	if data.winscreen == 'None' or data.eventNo == 'event 2' or data.eventNo == 'event 3' then
		f_selectWinOFF()
	elseif data.winscreen == 'Fixed' then
		f_selectWinFix()
	else	
		playBGM(bgmVictory)
		local txt = ''
		if winner == 1 then
			p1Wins = p1Wins + 1
			f_winCoins()
			txt = f_winParse(t_selChars[data.t_p1selected[1].cel+1], t_selChars[data.t_p2selected[1].cel+1], data.t_p2selected[1].pal, #data.t_p2selected) --Victory Quotes		from each P1 char
			if data.gameMode == 'arcade' and data.missionNo == 'mission 3' then
				--Do nothing and don't save mission/event progress
			else 
				f_missionStatus()
				f_eventStatus()
			end
		else--if winner == 2 then
			p2Wins = p2Wins + 1
			--f_loseCoins()
			txt = f_winParse(t_selChars[data.t_p2selected[1].cel+1], t_selChars[data.t_p1selected[1].cel+1], data.t_p1selected[1].pal, #data.t_p1selected) --Victory Quotes from each P2 char
		end
		local i = 0
		cmdInput()
		while true do
			if i == 510 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				if data.orderSelect == true and data.gameMode == 'arcade' then
					playBGM(bgmSelect)
				end
				break
			elseif btnPalNo(p1Cmd) > 0 then
				cmdInput()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				if data.orderSelect == true and data.gameMode == 'arcade' then
					playBGM(bgmSelect)
				end
				commandBufReset(p1Cmd, 1)
				break
			end
			if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' or matchNo == lastMatch then --Red BG for a Decisive Battle 
				animDraw(f_animVelocity(versusHardBG1, 0, 1.5))
			else
				animDraw(f_animVelocity(versusBG1, 0, 1.5))
			end
			if winner == 1 then
				if data.winscreen == 'Classic' then
					animDraw(f_animVelocity(wincharBGC1, -2, 0))
					animSetWindow(wincharBGC1, 32, 20, 120, 140)
					drawPortrait(data.t_p1selected[1].cel, 32, 20, 1, 1)
					drawPortrait(data.t_p2selected[1].cel, 285, 20, -1, 1)
					animDraw(f_animVelocity(wincharBGC2, 2, 0))
					animSetWindow(wincharBGC2, 165, 20, 120, 140)
					animDraw(f_animVelocity(quoteBG, 2, 0))
					textImgSetText(txt_winnername, f_getName(data.t_p1selected[1].cel))
					--f_drawWinnerName(txt_winnername, 0, data.t_p1selected, 20, 177, 0, 14)
				elseif data.winscreen == 'Modern' then
					animDraw(f_animVelocity(wincharBG, 0, 1.5))
					animDraw(f_animVelocity(quoteBG, 2, 0))
					if p1numChars == 1 then
						drawPortrait(data.t_p1selected[1].cel, 99, 15, 1, 1) --Your char portrait appears in modern win screen
					elseif p1numChars == 2 then	--Your 2nd char portrait appears in modern win screen
						drawPortrait(data.t_p1selected[2].cel, 150, 15, 1, 1)
						drawPortrait(data.t_p1selected[1].cel, 45, 15, 1, 1)
					elseif p1numChars == 3 then	--Your 3rd char portrait appears in modern win screen	
						drawPortrait(data.t_p1selected[3].cel, 0, 15, 1, 1)
						drawPortrait(data.t_p1selected[2].cel, 205, 15, 1, 1)
						drawPortrait(data.t_p1selected[1].cel, 99, 15, 1, 1)
					elseif p1numChars == 4 then	--Your 4th char portrait appears in modern win screen
						drawPortrait(data.t_p1selected[4].cel, 205, 15, 1, 1)
						drawPortrait(data.t_p1selected[3].cel, 0, 15, 1, 1)
						drawPortrait(data.t_p1selected[2].cel, 150, 15, 1, 1)
						drawPortrait(data.t_p1selected[1].cel, 45, 15, 1, 1)
					end
					textImgSetText(txt_winnername, f_getName(data.t_p1selected[1].cel))
					--f_drawWinnerName(txt_winnername, 0, data.t_p1selected, 20, 177, 0, 14)
				end	
			else--if winner == 2 then
				if data.winscreen == 'Classic' then 
					drawPortrait(data.t_p1selected[1].cel, 32, 20, 1, 1)
					animDraw(f_animVelocity(wincharBGC1, -2, 0))
					animSetWindow(wincharBGC1, 32, 20, 120, 140)
					animDraw(f_animVelocity(wincharBGC2, 2, 0))
					animSetWindow(wincharBGC2, 165, 20, 120, 140)
					drawPortrait(data.t_p2selected[1].cel, 285, 20, -1, 1)
					animDraw(f_animVelocity(quoteBG, 2, 0))
					textImgSetText(txt_winnername, f_getName(data.t_p2selected[1].cel))
					--f_drawWinnerName(txt_winnername, 0, data.t_p2selected, 20, 177, 0, 14)
				elseif data.winscreen == 'Modern' then
					animDraw(f_animVelocity(wincharBG, 2, 0))
					animDraw(f_animVelocity(quoteBG, 2, 0))
					if p2numChars == 1 then
						drawPortrait(data.t_p2selected[1].cel, 99, 15, 1, 1)
					elseif p2numChars == 2 then
						drawPortrait(data.t_p2selected[2].cel, 150, 15, 1, 1)
						drawPortrait(data.t_p2selected[1].cel, 45, 15, 1, 1)
					elseif p2numChars == 3 then
						drawPortrait(data.t_p2selected[3].cel, 0, 15, 1, 1)
						drawPortrait(data.t_p2selected[2].cel, 205, 15, 1, 1)
						drawPortrait(data.t_p2selected[1].cel, 99, 15, 1, 1)
					elseif p2numChars == 4 then
						drawPortrait(data.t_p2selected[4].cel, 205, 15, 1, 1)
						drawPortrait(data.t_p2selected[3].cel, 0, 15, 1, 1)
						drawPortrait(data.t_p2selected[2].cel, 150, 15, 1, 1)
						drawPortrait(data.t_p2selected[1].cel, 45, 15, 1, 1)
					end
					textImgSetText(txt_winnername, f_getName(data.t_p2selected[1].cel))
					--f_drawWinnerName(txt_winnername, 0, data.t_p2selected, 20, 177, 0, 14)
				end	
			end
			i = i + 1
			f_textRender(txt_winquote, txt, i, 20, 190, 15, 2, 59) --Winner Message
			textImgDraw(txt_winnername)
			animDraw(data.fadeTitle)
			animUpdate(data.fadeTitle)
			cmdInput()
			refresh()
		end
	end --End of disabled Win Screen Conditional
end

function f_selectWinFix() --Use this while fixing recognition of victory quotes for any other character that causes crash
	--playBGM(bgmVictory)
	local txt = ''
	if winner == 1 then
		p1Wins = p1Wins + 1
		f_winCoins()
		txt = 'READY FOR THE NEXT BATTLE?' --Permanent Victory Quotes when P1 wins
		f_missionStatus()
		f_eventStatus()
	else--if winner == 2 then
		p2Wins = p2Wins + 1
		--f_loseCoins()
		txt = 'READY FOR THE NEXT BATTLE?' --Permanent Victory Quotes when P2 wins
	end
	local i = 0
	cmdInput()
	while true do
		if i == 200 then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			if data.orderSelect == true and data.gameMode == 'arcade' then
				playBGM(bgmSelect)
			end
			break
		elseif btnPalNo(p1Cmd) > 0 then
			cmdInput()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			if data.orderSelect == true and data.gameMode == 'arcade' then
				playBGM(bgmSelect)
			end
			break
		end
		i = i + 1
		f_textRender(txt_winnername, txt, i, 20, 190, 15, 2, 59) --Message
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

function f_selectWinOFF()
	if winner == 1 then
		p1Wins = p1Wins + 1
		f_winCoins()
		f_missionStatus()
		f_eventStatus()
	else--if winner == 2 then
		p2Wins = p2Wins + 1
		--f_loseCoins()
	end		
	while true do
		break
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
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: yes', 'saved/debug/quotes.log')
			return winner.quotes[quote]
		else
			f_printVar(logVar .. '\nquote: ' .. quote .. '\nexists: no', 'saved/debug/quotes.log')
			return ''
		end
	else
		f_printVar(logVar .. '0 triggers found\n0 quotes found\n\nquote: -1\nexists: no', 'saved/debug/quotes.log')
		return ''
	end
end

--;===========================================================
--; SERVICE MENU
--;===========================================================
txt_service = createTextImg(jgFnt, 0, 0, 'SELECT A SERVICE', 159, 13)

t_service = {
	{id = '', text = '  DIFFICULTY LEVEL DOWN'},
	{id = '', text = ' POWER WILL START AT MAX'},
	{id = '', text = '    ENEMY LIFE AT 1/3'},
	{id = '', text = ' 	   CHANGE TEAM MODE'},
	{id = '', text = '      DOUBLE DEFENCE'},
	{id = '', text = '        NO SERVICE'},
}
for i=1, #t_service do
	t_service[i].id = createTextImg(font2, 0, 1, t_service[i].text, 85, 15+i*15)
end

t_lockedService = {
	{id = '', text = "This service is Unavailable in Co-Op Mode."},
}
for i=1, #t_lockedService do
	t_lockedService[i].id = createTextImg(font2, 0, -1, t_lockedService[i].text, 260, 210+i*15)
end

t_noService = {
	{id = '', text = "You have Disabled Change Characters when Continuing."},
}
for i=1, #t_noService do
	t_noService[i].id = createTextImg(font2, 0, -1, t_noService[i].text, 289, 210+i*15)
end

t_devService = {
	{id = '', text = "This service will be available coming soon."},
}
for i=1, #t_devService do
	t_devService[i].id = createTextImg(font2, 0, -1, t_devService[i].text, 259, 210+i*15)
end

function f_service()
	local service = 1
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	playBGM(bgmService)
	cmdInput()
	while true do
		if commandGetState(p1Cmd, 'u') then
			lockService = false --Boolean to remove the Lock service message
			devService = false
			noService = false
			sndPlay(sysSnd, 100, 0)
			service = service - 1
			if service < 1 then service = #t_service end		
		elseif commandGetState(p1Cmd, 'd') then
			lockService = false --Boolean to remove the Lock service message
			devService = false
			noService = false
			sndPlay(sysSnd, 100, 0)
			service = service + 1
			if service > #t_service then service = 1 end
		elseif btnPalNo(p1Cmd) > 0 then
			--DIFFICULTY -1 BUT ALWAYS NEEDS TO BE > 1
			if service == 1 then
				sndPlay(sysSnd, 100, 1)
				if data.difficulty == 1 then
					data.difficulty = 1
				else
					data.difficulty = data.difficulty - 1
				end
				if onlinegame == true then
					script.options.f_netsaveCfg()
				elseif onlinegame == false then
					script.options.f_saveCfg()
				end	
				break
			--FULL POWER
			elseif service == 2 then
				setServiceType(1)
				sndPlay(sysSnd, 100, 1)
				break
			--LOW CPU LIFE
			elseif service == 3 then
				setServiceType(2)
				sndPlay(sysSnd, 100, 1)
				break
			--CHANGE PLAYER TEAM MODE
			elseif service == 4 then
				if data.coop == true then
					lockService = true
				elseif data.contSelection == false then
					noService = true
				else
					sndPlay(sysSnd, 100, 1)
					serviceTeam = true
					break
				end
			--PLAYER DEFENCE X2
			elseif service == 5 then
				sndPlay(sysSnd, 100, 1)
				setServiceType(3)
				break
			--???
			--elseif service == 6 then
				--devService = true
				--sndPlay(sysSnd, 100, 1)
				--setServiceType(?)
				--break
			--NOT SERVICE
			else
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				break
			end
			commandBufReset(p1Cmd, 1)
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_service*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_service)
		if lockService == true then
			for i=1, #t_lockedService do
				textImgDraw(t_lockedService[i].id)
			end
		end
		if noService == true then
			for i=1, #t_noService do
				textImgDraw(t_noService[i].id)
			end
		end
		if devService == true then
			for i=1, #t_devService do
				textImgDraw(t_devService[i].id)
			end
		end	
		for i=1, #t_service do
			textImgDraw(t_service[i].id)
			if t_service[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_service[i].varID, font2, 0, -1, t_service[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+service*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
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
animAddPos(challengerText1, 19, 100)
animUpdate(challengerText1)
--animSetScale(challengerText1, 1.2, 1)

function f_selectChallenger()
	if data.contSelection == false and data.rosterAdvance == true then return end
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	playBGM(bgmNothing)
	sndPlay(sysSnd, 200, 1) --Here comes a new Challenger!
	local txt = ''
	local i = 0
	data.rosterMode = 'challenger'
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
		if data.gameMode == 'bossrush' or data.rosterMode == 'suddendeath' or matchNo == lastMatch then --Red BG for a Decisive Battle 
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
--; RESULTS SCREEN
--;===========================================================
txt_result = textImgNew()
txt_resultTime = textImgNew()
txt_resultRank = createTextImg(jgFnt, 0, 1, '', 88, 228)
txt_sresultName = createTextImg(jgFnt, 0, 1, '', 10, 50)
txt_eresultName = createTextImg(jgFnt, 0, 1, '', 84, 228)

function f_result(state)
	if winCnt >= 0 and winCnt < 3 then
		rankGrade = 'F'
	elseif winCnt >= 3 and winCnt < 6 then
		rankGrade = 'E'
	elseif winCnt >= 6 and winCnt < 8 then
		rankGrade = 'D'
	elseif winCnt >= 8 and winCnt < 12 then
		rankGrade = 'C'
	elseif winCnt >= 12 and winCnt < 16 then
		rankGrade = 'B'
	elseif winCnt >= 16 and winCnt < 20 then
		rankGrade = 'A'
	elseif winCnt >= 20 and winCnt < 25 then
		rankGrade = 'AA'
	elseif winCnt >= 25 and winCnt < 30 then
		rankGrade = 'AAA'
	elseif winCnt >= 30 and winCnt < 40 then
		rankGrade = 'AAA'
	elseif winCnt >= 40 and winCnt < 50 then
		rankGrade = 'S'
	elseif winCnt >= 50 and winCnt < 100 then
		rankGrade = 'SS'
	elseif winCnt >= 100 then
		rankGrade = 'SSS'
	end
	--if state == 'win' then
	--elseif state == 'lost' then
	--end
	if data.gameMode == 'survival' then
		playBGM(bgmResults)
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		textImgSetFont(txt_result, survBarsFnt)
		textImgSetPos(txt_result, 159, 239)
		textImgSetText(txt_result, 'X' .. winCnt .. 'WINS')
		textImgSetText(txt_resultRank, 'RANK: ' ..rankGrade.. '')
		textImgSetText(txt_sresultName, 'PLAYER: ' ..f_getName(data.t_p1selected[1].cel).. '')
	elseif data.gameMode == 'endless' then
		playBGM(bgmResults)
		data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
		textImgSetFont(txt_result, survNumFnt)
		textImgSetPos(txt_result, 159, 150)
		textImgSetText(txt_result, winCnt .. ' WINS' .. looseCnt .. ' LOSES')
		textImgSetText(txt_eresultName, 'PLAYER: ' ..f_getName(data.t_p1selected[1].cel).. '')
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
		if data.gameMode == 'survival' then
			textImgDraw(txt_sresultName)
			textImgDraw(txt_resultRank)
		else 
			textImgDraw(txt_eresultName)
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CONTINUE SCREEN
--;===========================================================
--Coins left text
txt_coins = createTextImg(jgFnt, 0, 1, '', 15, 30)
txt_cont = createTextImg(jgFnt, 0, 1, '', 158, 30)

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

function f_continue()
	setServiceType(0)
	sndPlay(contSnd, 1, 1)
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
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
	if p1numChars == 1 then
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
	elseif p1numChars == 2 then	--Your 2nd char appears in continue screen
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
		tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
	elseif p1numChars == 3 then --Your 3rd char appears in continue screen
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
		tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
		tablePos3 = t_selChars[data.t_p1selected[3].cel+1]
	elseif p1numChars == 4 then --Your 4th char appears in continue screen
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
		tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
		tablePos3 = t_selChars[data.t_p1selected[3].cel+1]
		tablePos4 = t_selChars[data.t_p1selected[4].cel+1]	
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
	textImgSetText(txt_coins, 'COINS: ' .. data.coins)
	textImgSetText(txt_cont, 'TIMES CONTINUED: ' .. data.continueCount)	
	cmdInput()
	while true do
		animDraw(contBG0)
		i = i + 1
		if esc() then
			--cmdInput()
			--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			--playBGM(bgmTitle)
			--break
		elseif data.continue == 0 then --waiting for player's decision
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
			if commandGetState(p1Cmd, 's') then
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
					if data.coins < 1 then
						data.coins = 0
					elseif data.coins >= 1 then
						data.coins = data.coins - 1 --Lose 1 Coin by be defeated :c
					end
					f_saveUnlockData()
				elseif onlinegame == true then
					--Do nothing (Free Online Arcade)
				end
				data.continueCount = data.continueCount + 1 --Times Continue
				textImgSetText(txt_coins, 'COINS: ' .. data.coins)
				textImgSetText(txt_cont, 'TIMES CONTINUED: ' .. data.continueCount)				
				fadeContinue = f_fadeAnim(30, 'fadeout', 'black', fadeSff)
				data.continue = 1
			elseif i > 1366 then --Continue = NO
				data.continue = 2
				f_gameOver()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				break
			end
			animDraw(contTimer)
			if btnPalNo(p1Cmd) > 0 and i >= 71 then
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
				data.fadeSelect = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				cmdInput()
				--service screen
				if data.gameMode == 'arcade' and data.missionNo == 'mission 3' then
					--Do nothing and don't show the screen
				elseif data.serviceScreen == true then
					f_service()
				end
				--challenger screen
				if data.gameMode == 'arcade' and data.missionNo == 'mission 3' then
					playBGM(bgmSelect) --and don't show the screen
				elseif data.challengerScreen == true then
					f_selectChallenger()
					f_challengerMusic()
				else
					playBGM(bgmSelect) --play original char select song instead of challenger song
				end
				break
			end
		end
		if i >= 71 then --show when counter starts counting down
			if onlinegame == false then
				textImgDraw(txt_coins) --Show Coins Counter
			elseif onlinegame == true then
				--Don't Show Coins Counter
			end
			textImgDraw(txt_cont) --Alwats Show Times Continue Counter
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; GAME OVER
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
	if p1numChars == 1 then
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
	elseif p1numChars == 2 then
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
		tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
	elseif p1numChars == 3 then
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
		tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
		tablePos3 = t_selChars[data.t_p1selected[3].cel+1]
	elseif p1numChars == 4 then
		tablePos = t_selChars[data.t_p1selected[1].cel+1]
		tablePos2 = t_selChars[data.t_p1selected[2].cel+1]
		tablePos3 = t_selChars[data.t_p1selected[3].cel+1]
		tablePos4 = t_selChars[data.t_p1selected[4].cel+1]	
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
		if esc() then
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
					playBGM('')
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
