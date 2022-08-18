--;===========================================================
--; OLD/UNUSED SCRIPTS
--;===========================================================

function f_orderSelectOLD()
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
				animSetWindow(cursorBox, 20, 14, 120, 16)
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