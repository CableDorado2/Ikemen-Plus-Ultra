module(..., package.seeall)

--;===========================================================
--; LOAD DATA
--;===========================================================
--TODO

--;===========================================================
--; PAUSE MENU SCREENPACK
--;===========================================================
pmTitle = fontNew('font/JG.fnt')
pmText = fontNew('font/f-6x9.fnt')

--Scrolling background
pauseBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(pauseBG0, 160, 0)
animSetTile(pauseBG0, 1, 1)
animSetColorKey(pauseBG0, -1)

--Transparent background
pauseBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(pauseBG1, 20, 70)
animSetAlpha(pauseBG1, 20, 100)
animUpdate(pauseBG1)

--Up Arrow
pauseUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(pauseUpArrow, 228, 61)
animUpdate(pauseUpArrow)
animSetScale(pauseUpArrow, 0.5, 0.5)

--Down Arrow
pauseDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(pauseDownArrow, 228, 176)
animUpdate(pauseDownArrow)
animSetScale(pauseDownArrow, 0.5, 0.5)

--Cursor Box
cursorBox = animNew(sysSff, [[
100,1, 0,0, -1
]])
animSetTile(cursorBox, 1, 1)

--Optimized Cursor Box
--cursorBox = animNew(sysSff, [[
--3,1, 0,0, -1
--]])
--animSetPos(cursorBox, 80, 20)
--animSetAlpha(cursorBox, 20, 100)
--animUpdate(cursorBox)

--Message Fade BG
fadeWindowBG = animNew(sysSff, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(fadeWindowBG, -54, 0)
animSetScale(fadeWindowBG, 427, 240)
--animUpdate(fadeWindowBG)

--Transparent Background (fade in)
darkenIn = animNew(sysSff, [[
300,1, 0,0, 1, 0, AS256D240
300,1, 0,0, 1, 0, AS256D225
300,1, 0,0, 1, 0, AS256D209
300,1, 0,0, 1, 0, AS256D194
300,1, 0,0, 1, 0, AS256D179
300,1, 0,0, 1, 0, AS256D163
300,1, 0,0, 1, 0, AS256D148
300,1, 0,0, 1, 0, AS256D132
300,1, 0,0, 1, 0, AS256D117
300,1, 0,0, -1, 0, AS256D102
]])
animSetPos(darkenIn, 0, 0)
animSetScale(darkenIn, 427, 240)

--Transparent Background (fade out)
darkenOut = animNew(sysSff, [[
300,1, 0,0, 1, 0, AS256D117
300,1, 0,0, 1, 0, AS256D132
300,1, 0,0, 1, 0, AS256D148
300,1, 0,0, 1, 0, AS256D163
300,1, 0,0, 1, 0, AS256D179
300,1, 0,0, 1, 0, AS256D194
300,1, 0,0, 1, 0, AS256D209
300,1, 0,0, 1, 0, AS256D225
300,1, 0,0, 1, 0, AS256D240
300,1, 0,0, -1, 0, AS256D256
]])
animSetPos(darkenOut, 0, 0)
animSetScale(darkenOut, 427, 240)

--;===========================================================
--; PAUSE MENU
--;===========================================================
txt_pause = createTextImg(jgFnt, 0, 0, 'PAUSE', 159, 63)

t_pauseMain = {
  {id = '', text = 'Resume'},
  {id = '', text = 'Movelist'},
  --{id = '', text = 'Training Menu'},
  {id = '', text = 'Game Options'},
  {id = '', text = 'Character Change'},
  {id = '', text = 'Hide Menu'},
  {id = '', text = 'Exit'}
}

function f_pauseMain()
	PcursorPosY = 1
	PmoveTxt = 0
	pauseMenu = 1
	Pbufu = 0
	Pbufd = 0
	Pbufr = 0
	Pbufl = 0
	cmdInput()
	while true do
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and Pbufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			pauseMenu = pauseMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and Pbufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			pauseMenu = pauseMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			--RESUME GAME
			if pauseMenu == 1 then
				sndPlay(sysSnd, 100, 1)
			--MOVELIST
			elseif pauseMenu == 2 then
				sndPlay(sysSnd, 100, 5)
			--GAME OPTIONS
			elseif pauseMenu == 3 then
				sndPlay(sysSnd, 100, 5)
			--CHARACTER CHANGE
			elseif pauseMenu == 4 then
				sndPlay(sysSnd, 100, 5)
			--HIDE MENU
			elseif pauseMenu == 5 then
				sndPlay(sysSnd, 100, 1)
			--EXIT
			else
				sndPlay(sysSnd, 100, 1)
				break
			end
		end
		--Cursor position calculation
		if pauseMenu < 1 then
			pauseMenu = #t_pauseMain
			if #t_pauseMain > 7 then
				PcursorPosY = 7
			else
				PcursorPosY = #t_pauseMain
			end
		elseif pauseMenu > #t_pauseMain then
			pauseMenu = 1
			PcursorPosY = 1
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and Pbufu >= 30)) and PcursorPosY > 1 then
			PcursorPosY = PcursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and Pbufd >= 30)) and PcursorPosY < 7 then
			PcursorPosY = PcursorPosY + 1
		end
		if PcursorPosY == 7 then
			PmoveTxt = (pauseMenu - 7) * 15
		elseif PcursorPosY == 1 then
			PmoveTxt = (pauseMenu - 1) * 15
		end
		if #t_pauseMain <= 7 then
			maxPause = #t_pauseMain
		elseif pauseMenu - PcursorPosY > 0 then
			maxPause = pauseMenu + 7 - PcursorPosY
		else
			maxPause = 7
		end
		--Draw BG
		animDraw(f_animVelocity(pauseBG0, -1, -1))
		--Draw Transparent Table BG		
		animSetScale(pauseBG1, 220, maxPause*15)
		animSetWindow(pauseBG1, 80,70, 160,105)
		animDraw(pauseBG1)
		--Draw Title Menu
		textImgDraw(txt_pause)
		--Draw Cursor
		animSetWindow(cursorBox, 80,55+PcursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Text for Table
		for i=1, maxPause do	
			if i > pauseMenu - PcursorPosY then
				t_pauseMain[i].id = createTextImg(font2, 0, 0, t_pauseMain[i].text, 158.5, 65+i*15-PmoveTxt)
				textImgDraw(t_pauseMain[i].id)
			end
		end
		--Draw Up Animated Cursor
		if maxPause > 7 then
			animDraw(pauseUpArrow)
			animUpdate(pauseUpArrow)
		end
		--Draw Down Animated Cursor
		if #t_pauseMain > 7 and maxPause < #t_pauseMain then
			animDraw(pauseDownArrow)
			animUpdate(pauseDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			Pbufd = 0
			Pbufu = Pbufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			Pbufu = 0
			Pbufd = Pbufd + 1
		else
			Pbufu = 0
			Pbufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end
