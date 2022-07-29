
module(..., package.seeall)

--;===========================================================
--; STORYBOARDS MENU LOOP
--;===========================================================
t_storyboardMenu = {
	{id = textImgNew(), text = 'Back'},
}
txt_storyboard = createTextImg(jgFnt, 0, 0, 'STORYBOARD SELECT', 159, 13)

storyboardDir = ".\\storyboards\\"

function f_storyboardMenu()
    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	local cursorPosY = 1
	local moveTxt = 0
	local storyboardMenu = 1
	local storyboardList = {}
	local i = 1
	local g = 1
	p = io.popen('dir "'..storyboardDir..'" /b')  
	for file in p:lines() do                    
		storyboardList[i] = tostring(file)
		i = i + 1
	end
	p:close()
	cmdInput()
	while true do
		if esc() then
		    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			playBGM(bgmMenu)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu - 1
			if cursorPosY > 1 then 
				cursorPosY = cursorPosY - 1
			elseif cursorPosY == 1 then
				moveTxt = moveTxt - 1
			end
			if storyboardMenu < 1 then 
				storyboardMenu = #t_storyboardMenu + #storyboardList
				if #t_storyboardMenu + #storyboardList >= 14 then
					cursorPosY = 14
					moveTxt = #storyboardList-13
				else
					cursorPosY = #t_storyboardMenu + #storyboardList
					moveTxt = 0
				end
			end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			storyboardMenu = storyboardMenu + 1
			if cursorPosY < 14 then 
				cursorPosY = cursorPosY + 1
			elseif cursorPosY == 14 then
				moveTxt = moveTxt + 1
			end
			if storyboardMenu > #t_storyboardMenu + #storyboardList then 
				moveTxt = 0
				storyboardMenu = 1
				cursorPosY = 1
			end
		end
		if btnPalNo(p1Cmd) > 0 then
			if storyboardMenu ~= (#t_storyboardMenu + #storyboardList) then
				storyboardFile = ('storyboards/' .. storyboardList[storyboardMenu])
				script.storyboard.f_storyboard(storyboardFile)
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				playBGM(bgmTitle)
				--while true do
					--if esc() then
						--sndPlay(sysSnd, 100, 2)
						--break
					--elseif btnPalNo(p1Cmd) or (commandGetState(p1Cmd, 'holds') > 0) then
						--f_default()
						--sndPlay(sysSnd, 100, 2)
						--break
					--end
				--end
			else
			    data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				playBGM(bgmMenu)
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_storyboard)
		if #storyboardList >= 13 then
			animSetWindow(optionsBG1, 80,20, 160,14*15)
		else
			animSetWindow(optionsBG1, 80,20, 160,(#t_storyboardMenu+#storyboardList)*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		for i=1, math.min(#storyboardList+1, 14) do
			if i+moveTxt < #t_storyboardMenu + #storyboardList then
				textImgDraw(createTextImg(font2, 0, 1, storyboardList[i+moveTxt], 85, 15+i*15))
			else
				textImgDraw(createTextImg(font2, 0, 1, t_storyboardMenu[1].text, 85, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end




--;===========================================================
--; STORYBOARDS MENU LOOP
--;===========================================================
t_videoMenu = {
	{id = textImgNew(), text = 'KUNG FU MAN'},
	{id = textImgNew(), text = 'KUNG FU GIRL'},	
	{id = textImgNew(), text = 'BACK'},	
}	
	
function f_videoMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local videoMenu = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			videoMenu = videoMenu + 1
		end
		if videoMenu < 1 then
			videoMenu = #t_videoMenu
			if #t_videoMenu > 4 then
				cursorPosY = 4
			else
				cursorPosY = #t_videoMenu-1
			end
		elseif videoMenu > #t_videoMenu then
			videoMenu = 1
			cursorPosY = 0
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 4 then
			moveTxt = (videoMenu - 5) * 13
		elseif cursorPosY == 0 then
			moveTxt = (videoMenu - 1) * 13
		end
		if btnPalNo(p1Cmd) > 0 then
			f_default()
			--CUTSCENES LIST			
			if videoMenu == 1 then
				sndPlay(sysSnd, 100, 1)
				cmdInput()
				local cursorPosY = 0
				local moveTxt = 0
				local playCredits = 1
				script.storyboard.f_storyboard('chars/Kung Fu Man/Intro.def')
				script.storyboard.f_storyboard('chars/Kung Fu Man/Ending.def')
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				playBGM(bgmTitle)
				while true do
					if esc() then
						sndPlay(sysSnd, 100, 2)
						break
					elseif btnPalNo(p1Cmd) or (commandGetState(p1Cmd, 'holds') > 0) then
						f_default()
						sndPlay(sysSnd, 100, 2)
						break
					end
				end
			elseif videoMenu == 2 then
				sndPlay(sysSnd, 100, 1)
				cmdInput()
				local cursorPosY = 0
				local moveTxt = 0
				local playCredits = 1
				script.storyboard.f_storyboard('chars/Kung Fu Girl/Storyboard/Intro.def')
				script.storyboard.f_storyboard('chars/Kung Fu Girl/Storyboard/Ending.def')
				data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
				playBGM(bgmTitle)
				while true do
					if esc() then
						sndPlay(sysSnd, 100, 2)
						break
					elseif btnPalNo(p1Cmd) or (commandGetState(p1Cmd, 'holds') > 0) then
						f_default()
						sndPlay(sysSnd, 100, 2)
						break
					end
				end	
			--BACK
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end	
		animDraw(f_animVelocity(titleBG0, -2.15, 0))
		for i=1, #t_videoMenu do
			if i == videoMenu then
				bank = 5
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_videoMenu[i].id, jgFnt, bank, 0, t_videoMenu[i].text, 159, 144+i*13-moveTxt))
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