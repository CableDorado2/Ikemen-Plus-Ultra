
module(..., package.seeall)

--;===========================================================
--; SOUND TEST MENU LOOP
--;===========================================================
t_soundMenu = {
	{id = textImgNew(), text = 'CONTINUE?'},
	{id = textImgNew(), text = 'GAME OVER'},	
	{id = textImgNew(), text = 'BACK'},	
}	
	
function f_soundMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local soundMenu = 1
	while true do
		if esc() then
			playBGM(bgmTitle)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			soundMenu = soundMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			soundMenu = soundMenu + 1
		end
		if soundMenu < 1 then
			soundMenu = #t_soundMenu
			if #t_soundMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_soundMenu-1
			end
		elseif soundMenu > #t_soundMenu then
			soundMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (soundMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (soundMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--TRACK LIST			
			if soundMenu == 1 then
				playBGM('sound/CONTINUE.mp3')
			elseif soundMenu == 2 then
				playBGM('sound/GAME OVER.mp3')
			--BACK
			else
				playBGM(bgmTitle)
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_soundMenu do
			if i == soundMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_soundMenu[i].id, jgFnt, bank, 0, t_soundMenu[i].text, 159, 144+i*13-moveTxt))
		end
		animSetWindow(cursorBox, 101,147+cursorPosY*13, 116,13)
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
		textImgDraw(txt_titleFt)
		textImgDraw(txt_titleFt2)
		animDraw(arrowsD)
		animUpdate(arrowsD)
		animDraw(arrowsU)
		animUpdate(arrowsU)		
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end