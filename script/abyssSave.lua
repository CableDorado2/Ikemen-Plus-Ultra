--;===========================================================
--; MESSAGE SCREEN
--;===========================================================
function f_abyssDatMessage(mode)
	cmdInput()
	local lastTxt = ""
	local option = nil
	if not abyssDatComplete then
	--Cursor Position
		if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
			sndPlay(sndSys, 100, 0)
			abyssDatConfirm = abyssDatConfirm - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
			sndPlay(sndSys, 100, 0)
			abyssDatConfirm = abyssDatConfirm + 1
		end
		if abyssDatConfirm < 1 then
			abyssDatConfirm = 2
		elseif abyssDatConfirm > 2 then
			abyssDatConfirm = 1
		end
	else
		abyssDatConfirm = 2
		lastTxt = "OK"
		option = 2
	end
--Draw Fade BG
	animDraw(fadeWindowBG)
--Draw Menu BG
	animDraw(confirmWindowBG)
	animUpdate(confirmWindowBG)
--Draw Title
	if mode == "save" then
		textImgSetText(txt_abyssDatConfirmTitle, "SAVE TO THIS DATA SLOT?")
		if abyssDatOverwrite then textImgSetText(txt_abyssDatConfirmTitle, "OVERWRITE DATA?") end
		if abyssDatComplete then textImgSetText(txt_abyssDatConfirmTitle, "SAVE COMPLETE!") end
	else
		textImgSetText(txt_abyssDatConfirmTitle, "LOAD THIS DATA SLOT?")
	end
	textImgDraw(txt_abyssDatConfirmTitle)
--Draw Table Text
	for i=1, #t_confirmMenu do
		if i == abyssDatConfirm then
			bank = 5
		else
			bank = 0
		end
		if not abyssDatComplete then
			option = i
			lastTxt = t_confirmMenu[i].text
		end
		textImgDraw(f_updateTextImg(t_confirmMenu[i].id, jgFnt, bank, 0, lastTxt, 159, 120+option*13))
	end
--Draw Cursor
	animSetWindow(cursorBox, 87,123+(abyssDatConfirm-1)*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
--Draw Input Hints Panel
	drawConfirmInputHints()
--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sndSys, 100, 2)
		f_abyssDatConfirmReset()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
	--YES
		if abyssDatConfirm == 1 then
			sndPlay(sndSys, 100, 1)
		--Save Data
			if mode == "save" then
				abyssDatComplete = true
		--Load Data
			else
				abyssDatEnd = true
			end
	--NO/OK
		else
			sndPlay(sndSys, 100, 2)
			abyssDatEnd = true
		end
	end
	if abyssDatEnd then f_abyssDatConfirmReset() end
end

function f_abyssDatConfirmReset()
	abyssDatConfirmScreen = false
	--Cursor pos in NO
	abyssDatConfirm = 2
	abyssDatEnd = false
	abyssDatComplete = false
	abyssDatOverwrite = false
end

function f_mainTitle()
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local dataSel = 1
	local cursorPosY = 1
	local moveSlot = 0
	local maxItems = 2
	local t_data = abyssDat.save
	local menuMode = "save"
	local txt_menuTitle = ""
	if menuMode then
		txt_menuTitle = "SAVE DATA"
	else
		txt_menuTitle = "LOAD DATA"
	end
	f_resetAbyssDatArrowsPos()
	f_abyssDatConfirmReset()
	cmdInput()
	while true do
		if not abyssDatConfirmScreen then
		--Scroll Logic
			if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				dataSel = dataSel - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				dataSel = dataSel + 1
		--Data Select
			elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
			--DATA AVAILABLE
				--if data then
					abyssDatConfirmScreen = true
				--Save Logic
					if menuMode == "save" then
						
				--Load Logic
					else
						
					end
			--NO DATA
				--else
					
				--end
		--Delete Data
			--elseif commandGetState(p1Cmd, 'q') or commandGetState(p2Cmd, 'q') then	
				
			end
			if dataSel < 1 then
				dataSel = #t_data
				if #t_data > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_data
				end
			elseif dataSel > #t_data then
				dataSel = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveSlot = (dataSel - maxItems) * 105
			elseif cursorPosY == 1 then
				moveSlot = (dataSel - 1) * 105
			end	
			if #t_data <= maxItems then
				maxdataSel = #t_data
			elseif dataSel - cursorPosY > 0 then
				maxdataSel = dataSel + maxItems - cursorPosY
			else
				maxdataSel = maxItems
			end
		end
	--Draw BG
		animDraw(abyssBG)
		animDraw(f_animVelocity(abyssFog, -1, -1))
	--Draw Title
		textImgSetText(txt_abyssDatTitle, txt_menuTitle)
		textImgDraw(txt_abyssDatTitle)
		for slot=1, maxdataSel do
			if slot > dataSel - cursorPosY then
				f_abyssDatProfile(0, -120+slot*105-moveSlot, slot)
			end
			if slot == dataSel then animPosDraw(abyssDatSlotCursor, 0, 40+(-120+slot*105-moveSlot)) end --Draw Cursor
		end
		if maxdataSel > maxItems then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_data > maxItems and maxdataSel < #t_data then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		if abyssDatConfirmScreen then f_abyssDatMessage(menuMode) else drawAbyssDatInputHints() end
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
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end