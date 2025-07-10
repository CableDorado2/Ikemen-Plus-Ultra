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
	f_resetAbyssDatArrowsPos()
	cmdInput()
	while true do
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
		--Save Logic
			
		--Load Logic
			
	--Delete Data
			
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
	--Draw BG
		animDraw(abyssBG)
		animDraw(f_animVelocity(abyssFog, -1, -1))
	--Draw Title
		textImgDraw(txt_abyssDatTitle)
		for slot=1, maxdataSel do
			if slot > dataSel - cursorPosY then
				f_abyssDatProfile(0, -120+slot*105-moveSlot, slot)
			end
		end
		if maxdataSel > maxItems then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_data > maxItems and maxdataSel < #t_data then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		drawAbyssInputHints()
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
		--DEBUG STUFF
	--[[
		f_drawQuickText(txt_debugGalleryCursor, jgFnt, 0, 1, "ITEM: "..dataSel, 10, 100+15)
		f_drawQuickText(txt_debugGalleryCursorX, jgFnt, 0, 1, "CURSOR Y: "..cursorPosY, 10, 100+30)
		f_drawQuickText(txt_debugGalleryCursorY, jgFnt, 0, 1, "MOVE SLOT: "..moveSlot, 10, 100+45)
		f_drawQuickText(txt_debugGalleryMoveX, jgFnt, 0, 1, "TOTAL ITEMS: "..#t_data, 10, 100+60)
		f_drawQuickText(txt_debugGalleryMoveY, jgFnt, 0, 1, "MAX ITEM MOVE: "..maxdataSel, 10, 100+75)
	--]]
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end