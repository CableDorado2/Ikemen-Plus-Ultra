
module(..., package.seeall)

txt_vnKFM = "Kung Fu Man"

txt_vn2 = [[
Welcome to IKEMEN PLUS ULTRA Visual Novel Mode!

This mode has been designed as a plan b to tell the story.
of kung fu man, in case we do not have the animated cinematics complete.
End of the test...
]]

txt_vn1 = [[
Test dasdasdas dasdasdasdas
das
]]

txt_vn3 = [[
Ok otro texto
vamos!
]]

--Store all Dialogues and Names in a Table to get better control
t_vnBoxText = {
	{ID = "", character = txt_vnKFM, 	text = txt_vn1},
	{ID = "", character = "TEST", 		text = txt_vn2},
	{ID = "", character = txt_vnKFM, 	text = txt_vn3},
}

function f_kfm1_1()
	playBGM("")
	local txtActive = 1
	local txt = 1
	local scroll = 0
	local delay1 = 3
	local delay2 = 1
	local nodelay = 0
	local delay = delay1
	local skip = false
	local txtReady = false
	local txtEnd = false
	--Narrative Text
	local txtSpacing = 8.8 --spacing between lines (rendering Y position increasement for each line)
	local txtPosX = 2
	local txtPosY = 194
	local txtBank = 0
	local txtAlphaS = 255
	local txtAlphaD = 0
	cmdInput()
	while true do
		--Actions
		if esc() or txtEnd then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then 
			if txtActive == 0 then txtReady = true end
		end
		--if delay == delay1 then
			--delay = delay2
		--elseif delay == delay2 then
			--delay = nodelay
		--end
		--Loading New Txt Logic
		if txt < #t_vnBoxText then --Only show new text if is store in the table
			if txtReady then --When text is fully drawed
				txt = txt + 1
				--Reset Text Box
				txtReady = false
				txtActive = 1
				scroll = 0
			end
		end
		--Draw BG
		animDraw(vnKfm1) --Draw KFM Sprite
		animDraw(vnTxtBG) --Draw Text BG
		if txtActive == 0 then
			animDraw(vnNext) --Draw Next Text Arrow
			animUpdate(vnNext)
		end
		--Text to Show
		--textImgSetBank(txt_nameCfg, 1)
		textImgSetText(txt_nameCfg, t_vnBoxText[txt].character) --Set Name Text
		textImgDraw(txt_nameCfg) --Draw Name Text
		--for i=1, txt do
			txtActive = f_textRender(txt_boxCfg, t_vnBoxText[txt].text, scroll, txtPosX, txtPosY, txtSpacing, delay, -1) --Draw Narrative Text
		--end
		f_drawQuickText(txt_testVar, font3, 0, 0, txtActive, 163.5, 168) --For Debug Purposes
		scroll = scroll + 1
		cmdInput()
		refresh()
	end
end