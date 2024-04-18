
module(..., package.seeall)

txt_vnName = "Kung Fu Man"
txt_vn = [[
Welcome to IKEMEN PLUS ULTRA Visual Novel Mode!

This mode has been designed as a plan b to tell the story.
of kung fu man, in case we do not have the animated cinematics complete.
End of the test...
]]

function f_kfm1_1()
	playBGM("")
	local scroll = 0
	local delay1 = 3
	local delay2 = 1
	local nodelay = 0
	local delay = delay1
	local skip = false
	local txtReady = false
	--Narrative Text
	local txtSpacing = 8.8 --spacing between lines (rendering Y position increasement for each line)
	local txtPosX = 2
	local txtPosY = 194
	local txtBank = 0
	local txtAlphaS = 255
	local txtAlphaD = 0
	cmdInput()
	while true do
		if esc() or txtReady then break end
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			if delay == 0 then
				txtReady = true
			else
				if delay == delay1 then
					delay = delay2
				elseif delay == delay2 then
					delay = nodelay
				end
			end
		end
		animDraw(f_animVelocity(vnBG0, -1, -1)) --Draw BG
		animDraw(vnKfm1) --Draw KFM Sprite
		animDraw(vnTxtBG) --Draw Text BG
		--textImgSetBank(txt_nameCfg, 1)
		textImgSetText(txt_nameCfg, txt_vnName) --Set Name Text
		textImgDraw(txt_nameCfg) --Draw Name Text
		f_textRender(txt_boxCfg, txt_vn, scroll, txtPosX, txtPosY, txtSpacing, delay, -1) --Draw Narrative Text
		scroll = scroll + 1
		cmdInput()
		refresh()
	end
end