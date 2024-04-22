module(..., package.seeall)

--;===========================================================
--; VISUAL NOVEL PAUSE/OPTIONS MENU
--;===========================================================
txt_vnPTitle = createTextImg(jgFnt, 0, 0, "STORY OPTIONS", 160, 13)



t_vnPauseMenu = {
	{varID = textImgNew(), text = "Text Speed", 			 varText = ""},
	{varID = textImgNew(), text = "Text BG Transparency", 	 varText = data.VNtxtBGTrans},
	{varID = textImgNew(), text = "Display Character Name",  varText = ""},
	{varID = textImgNew(), text = "Sound Settings", 		 varText = ""},
	{varID = textImgNew(), text = "Control Guide", 		 	 varText = ""},
	{varID = textImgNew(), text = "Restore Settings", 		 varText = ""},
	--{varID = textImgNew(), text = "Save Progress",			 varText = ""},
	{varID = textImgNew(), text = "Skip Chapter", 			 varText = ""},
	{varID = textImgNew(), text = "Resume", 				 varText = ""},
}

--Logic to Display Text instead Int/Boolean Values
function f_vnCfgdisplayTxt()
if data.VNdelay == 3 then t_vnPauseMenu[1].varText = "Slow"
elseif data.VNdelay == 2 then t_vnPauseMenu[1].varText = "Normal"
elseif data.VNdelay == 1 then t_vnPauseMenu[1].varText = "Fast"
elseif data.VNdelay == 0 then t_vnPauseMenu[1].varText = "Instant"
end

if data.VNdisplayName then t_vnPauseMenu[3].varText = "Yes" else t_vnPauseMenu[3].varText = "No" end
end

f_vnCfgdisplayTxt() --Load Display Text

function f_restoreVNcfg()
	data.VNdelay = 2
	data.VNtxtBGTrans = 255
	data.VNdisplayName = true
end

function f_vnPauseMenu()
	local hasChanged = false
	cmdInput()
	--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufuVNP >= 30) then
		sndPlay(sysSnd, 100, 0)
		vnPauseMenu = vnPauseMenu - 1
		if buflVNP then buflVNP = 0 end
		if bufrVNP then bufrVNP = 0 end
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufdVNP >= 30) then
		sndPlay(sysSnd, 100, 0)
		vnPauseMenu = vnPauseMenu + 1
		if buflVNP then buflVNP = 0 end
		if bufrVNP then bufrVNP = 0 end
	end
	if vnPauseMenu < 1 then
		vnPauseMenu = #t_vnPauseMenu
		if #t_vnPauseMenu > 10 then
			cursorPosYVNP = 10
		else
			cursorPosYVNP = #t_vnPauseMenu
		end
	elseif vnPauseMenu > #t_vnPauseMenu then
		vnPauseMenu = 1
		cursorPosYVNP = 1
	elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufuVNP >= 30)) and cursorPosYVNP > 1 then
		cursorPosYVNP = cursorPosYVNP - 1
	elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufdVNP >= 30)) and cursorPosYVNP < 10 then
		cursorPosYVNP = cursorPosYVNP + 1
	end
	if cursorPosYVNP == 10 then
		moveTxtVNP = (vnPauseMenu - 10) * 15
	elseif cursorPosYVNP == 1 then
		moveTxtVNP = (vnPauseMenu - 1) * 15
	end
	if #t_vnPauseMenu <= 10 then
		maxVNP = #t_vnPauseMenu
	elseif vnPauseMenu - cursorPosYVNP > 0 then
		maxVNP = vnPauseMenu + 10 - cursorPosYVNP
	else
		maxVNP = 10
	end
	--Actions
	if esc() or vnPauseMenuBack or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
		sndPlay(sysSnd, 100, 2)
		f_vnPauseMenuReset()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		if vnPauseMenu > 3 and vnPauseMenu < #t_vnPauseMenu then sndPlay(sysSnd, 100, 1) end
		--Sound Settings
		if vnPauseMenu == 4 then
			
		--Control Guide
		elseif vnPauseMenu == 5 then
			
		--Restore Settings
		elseif vnPauseMenu == 6 then
			f_restoreVNcfg()
			hasChanged = true
		--Save Progress
		--elseif vnPauseMenu == 7 then
			
		--Skip Chapter
		elseif vnPauseMenu == 7 then
			VNtxtEnd = true
		--Resume
		elseif vnPauseMenu == #t_vnPauseMenu then
			vnPauseMenuBack = true
		end
	end
	--Text Speed
	if vnPauseMenu == 1 then
	    if commandGetState(p1Cmd, 'r') then
			if data.VNdelay > 0 then
				sndPlay(sysSnd, 100, 0)
				data.VNdelay = data.VNdelay - 1
			end
			hasChanged = true
		elseif commandGetState(p1Cmd, 'l') then
			if data.VNdelay < 3 then
				sndPlay(sysSnd, 100, 0)
				data.VNdelay = data.VNdelay + 1
			end
			hasChanged = true
		end
	--Text BG Transparency
	elseif vnPauseMenu == 2 then
		if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufrVNP >= 30) then
			if data.VNtxtBGTrans < 255 then
				data.VNtxtBGTrans = data.VNtxtBGTrans + 1
			else
				data.VNtxtBGTrans = 0
			end
			if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
		elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and buflVNP >= 30) then
			if data.VNtxtBGTrans > 0 then
				data.VNtxtBGTrans = data.VNtxtBGTrans - 1
			else
				data.VNtxtBGTrans = 255
			end
			if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
			hasChanged = true
		end
	--Display Character Name
	elseif vnPauseMenu == 3 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
		sndPlay(sysSnd, 100, 1)
		if data.VNdisplayName then data.VNdisplayName = false else data.VNdisplayName = true end
		hasChanged = true
	end
	--Draw Pause Menu BG
	
	--Draw Title
	textImgDraw(txt_vnPTitle)
	--Set Table Text
	if hasChanged then
		f_saveVN()
		f_vnCfgdisplayTxt()
		t_vnPauseMenu[2].varText = data.VNtxtBGTrans
		hasChanged = false
	end
	--Draw Table Text
	for i=1, maxVNP do
		if i > vnPauseMenu - cursorPosYVNP then
			if t_vnPauseMenu[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_vnPauseMenu[i].varID, font2, 0, 1, t_vnPauseMenu[i].text, 70, 15+i*15-moveTxtVNP))
				textImgDraw(f_updateTextImg(t_vnPauseMenu[i].varID, font2, 0, -1, t_vnPauseMenu[i].varText, 250, 15+i*15-moveTxtVNP))
			end
		end
	end
	--Draw Cursor
	animSetWindow(cursorBox, 65,5+cursorPosYVNP*15, 190,15)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	if commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu') then
		bufdVNP = 0
		bufuVNP = bufuVNP + 1
	elseif commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd') then
		bufuVNP = 0
		bufdVNP = bufdVNP + 1
	else
		bufuVNP = 0
		bufdVNP = 0
	end
	--cmdInput()
end

function f_vnPauseMenuReset()
	vnPauseMenuBack = false
	vnPauseScreen = false
	cursorPosYVNP = 1
	moveTxtVNP = 0
	vnPauseMenu = 1
	bufuVNP = 0
	bufdVNP = 0
	bufrVNP = 0
	buflVNP = 0
end

--;===========================================================
--; VISUAL NOVEL SCENE DEFINITION
--;===========================================================
--Common Textbox Settings
function f_resetFullVN()
VNtxtActive = 1
VNtxt = 1
VNscroll = 0
VNnodelay = 0
VNdelay = data.VNdelay
VNskip = false
VNtxtReady = false
VNtxtEnd = false
--Narrative Text
VNtxtSpacing = 8.8 --spacing between lines (rendering Y position increasement for each line)
VNtxtPosX = 2
VNtxtPosY = 194
VNtxtBank = 0
VNtxtAlphaS = 255
VNtxtAlphaD = 0
f_vnPauseMenuReset()
end

function f_resetSimpleVN()
--Reset Text Box
VNtxtReady = false
VNtxtActive = 1
VNscroll = 0
VNdelay = data.VNdelay
end

function f_kfm1_1()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		--Actions
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		--Loading New Txt Logic
		if VNtxt < #t_vnBoxText[1] then --Only show new text if is store in the table
			if VNtxtReady then --When text is fully drawed
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		--Last Txt
		elseif VNtxt == #t_vnBoxText[1] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		--Draw BG
		animDraw(vnKfm1) --Draw KFM Sprite
		animDraw(vnTxtBG) --Draw Text BG
		if VNtxtActive == 0 then
			animDraw(vnNext) --Draw Next Text Arrow
			animUpdate(vnNext)
		end
		--Text to Show
		--textImgSetBank(txt_nameCfg, 1)
		textImgSetText(txt_nameCfg, t_vnBoxText[1][VNtxt].character) --Set Name Text
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end --Draw Name Text
		--for i=1, txt do
			VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[1][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1) --Draw Narrative Text
		--end
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

function f_kfm1_2()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		if VNtxt < #t_vnBoxText[2] then
			if VNtxtReady then
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		elseif VNtxt == #t_vnBoxText[2] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		animDraw(vnKfm1)
		animDraw(vnTxtBG)
		if VNtxtActive == 0 then
			animDraw(vnNext)
			animUpdate(vnNext)
		end
		textImgSetText(txt_nameCfg, t_vnBoxText[2][VNtxt].character)
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[2][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

function f_kfm1_3A()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		if VNtxt < #t_vnBoxText[3] then
			if VNtxtReady then
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		elseif VNtxt == #t_vnBoxText[3] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		animDraw(vnKfm1)
		animDraw(vnTxtBG)
		if VNtxtActive == 0 then
			animDraw(vnNext)
			animUpdate(vnNext)
		end
		textImgSetText(txt_nameCfg, t_vnBoxText[3][VNtxt].character)
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[3][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

function f_kfm1_3B()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		if VNtxt < #t_vnBoxText[4] then
			if VNtxtReady then
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		elseif VNtxt == #t_vnBoxText[4] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		animDraw(vnKfm1)
		animDraw(vnTxtBG)
		if VNtxtActive == 0 then
			animDraw(vnNext)
			animUpdate(vnNext)
		end
		textImgSetText(txt_nameCfg, t_vnBoxText[4][VNtxt].character)
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[4][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

function f_kfm1_4A()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		if VNtxt < #t_vnBoxText[5] then
			if VNtxtReady then
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		elseif VNtxt == #t_vnBoxText[5] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		animDraw(vnKfm1)
		animDraw(vnTxtBG)
		if VNtxtActive == 0 then
			animDraw(vnNext)
			animUpdate(vnNext)
		end
		textImgSetText(txt_nameCfg, t_vnBoxText[5][VNtxt].character)
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[5][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

function f_kfm1_4B()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		if VNtxt < #t_vnBoxText[6] then
			if VNtxtReady then
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		elseif VNtxt == #t_vnBoxText[6] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		animDraw(vnKfm1)
		animDraw(vnTxtBG)
		if VNtxtActive == 0 then
			animDraw(vnNext)
			animUpdate(vnNext)
		end
		textImgSetText(txt_nameCfg, t_vnBoxText[6][VNtxt].character)
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[6][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

function f_kfm1_4C()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		if VNtxt < #t_vnBoxText[7] then
			if VNtxtReady then
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		elseif VNtxt == #t_vnBoxText[7] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		animDraw(vnKfm1)
		animDraw(vnTxtBG)
		if VNtxtActive == 0 then
			animDraw(vnNext)
			animUpdate(vnNext)
		end
		textImgSetText(txt_nameCfg, t_vnBoxText[7][VNtxt].character)
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[7][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

function f_kfm1_4D()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		if VNtxtEnd then break end
		if not vnPauseScreen then
			if esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		if VNtxt < #t_vnBoxText[8] then
			if VNtxtReady then
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		elseif VNtxt == #t_vnBoxText[8] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		animDraw(vnKfm1)
		animDraw(vnTxtBG)
		if VNtxtActive == 0 then
			animDraw(vnNext)
			animUpdate(vnNext)
		end
		textImgSetText(txt_nameCfg, t_vnBoxText[8][VNtxt].character)
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[8][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end