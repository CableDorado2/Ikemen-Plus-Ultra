
module(..., package.seeall)

--Common Textbox Settings
function f_resetFullVN()
VNtxtActive = 1
VNtxt = 1
VNscroll = 0
VNdelay1 = 3
VNdelay2 = 1
VNnodelay = 0
VNdelay = VNdelay1
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
end

function f_resetSimpleVN()
--Reset Text Box
VNtxtReady = false
VNtxtActive = 1
VNscroll = 0
VNdelay = VNdelay1
end

function f_kfm1_1()
	playBGM("")
	f_resetFullVN()
	cmdInput()
	while true do
		--Actions
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg) --Draw Name Text
		--for i=1, txt do
			VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[1][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1) --Draw Narrative Text
		--end
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
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
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg)
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[2][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
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
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg)
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[3][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
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
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg)
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[4][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
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
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg)
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[5][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
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
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg)
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[6][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
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
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg)
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[7][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
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
		if esc() or VNtxtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			VNdelay = VNnodelay
			if VNtxtActive == 0 then VNtxtReady = true end
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
		textImgDraw(txt_nameCfg)
		VNtxtActive = f_textRender(txt_boxCfg, t_vnBoxText[8][VNtxt].text, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1)
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end