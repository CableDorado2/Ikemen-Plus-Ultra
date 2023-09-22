module(..., package.seeall)

--;===========================================================
--; LOAD DATA
--;===========================================================
--Data loading from config.ssz
local file = io.open("ssz/config.ssz","r")
s_configSSZ = file:read("*all")
file:close()
gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))

gl_vol = f_minMax(gl_vol,0,100)
se_vol = f_minMax(se_vol,0,100)
bgm_vol = f_minMax(bgm_vol,0,100)

if pan_str < 20 then
	pan_str = 0
elseif pan_str >= 20 and pan_str < 60 then
	pan_str = 40
elseif pan_str >= 60 and pan_str < 100 then
	pan_str = 80
elseif pan_str >= 100 and pan_str < 140 then
	pan_str = 120
elseif pan_str >= 140 then
	pan_str = 160
end
t_panStr = {'None', 'Narrow', 'Medium', 'Wide', 'Full'}

--Data saving to config.ssz
function f_saveCfg()
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	local file = io.open("ssz/config.ssz","w+")
	file:write(s_configSSZ)
	file:close()
	modified = false
	configModified('true')
end

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

--Solid Window BG
pWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(pWindowBG, 83.5, 130)
animSetScale(pWindowBG, 1, 0.3)

--Transparent background
pauseBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(pauseBG1, 20, 70)
animSetAlpha(pauseBG1, 20, 100)

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
t_pauseMain = {
	{id = '', text = 'CONTINUE'},
	{id = '', text = 'MOVELIST'},
	{id = '', text = 'SETTINGS'},
	{id = '', text = 'PLAY SONG'}, --Coming Soon will appear only for Training Mode
	{id = '', text = 'HIDE MENU'},
	{id = '', text = 'CHARACTER SELECT'},
	{id = '', text = 'MAIN MENU'}
}

pauseMenuActive = false
rectScale = -1
pauseMode = ''
PcursorPosY = 1
PmoveTxt = 0
pauseMenu = 1
Pbufu = 0
P2bufu = 0
Pbufd = 0
P2bufd = 0
Pbufr = 0
P2bufr = 0
Pbufl = 0
P2bufl = 0
data.p2In = 2 --Player 2 Can Control

function f_pauseMain(p, st, esc)
	pn = p
	escape = esc
	start = st
	if data.pauseMode == 'Classic' then exitMatch() end --Mugen Exit Type
	if pauseMenuActive == false and rectScale == -1 then
		animReset(darkenIn)
		animUpdate(darkenIn)
		pauseMenuActive = true
		sndPlay(sysSnd, 100, 1)
		rectScale = 0
	end
	cmdInput()
	if pauseMode == '' or mainGoTo ~= '' then
		if pn == 1 then txt_pause = createTextImg(jgFnt, 0, 0, 'PAUSE [P1]', 159, 63)
		elseif pn == 2 then txt_pause = createTextImg(jgFnt, 0, 0, 'PAUSE [P2]', 159, 63)
		end
		--HIDE MENU
		if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == #t_pauseMain-2 then hide = true end
		--RESUME GAME
		if (escape or start or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and (pauseMenu == 1 or hide))) and rectScale == 10 then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
		end
		if pauseMenuActive == true and rectScale < 10 then
			rectScale = rectScale + 1
			animUpdate(darkenIn)
		elseif pauseMenuActive == false and rectScale > 0 then
			rectScale = rectScale - 1
			animUpdate(darkenOut)
		end
		if pauseMenuActive == false and rectScale == 0 then
			togglePauseMenu(0)
			if hide then
				togglePause()
				hide = false
			end
			setSysCtrl(0)
			rectScale = -1
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
		end
		if rectScale == -1 and mainGoTo ~= '' then
			rectScale = 0
			pauseMode = mainGoTo
			mainGoTo = ''
		end
		if rectScale == 10 then
			setSysCtrl(10)
			if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
				sndPlay(sysSnd, 100, 0)
				pauseMenu = pauseMenu - 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
				sndPlay(sysSnd, 100, 0)
				pauseMenu = pauseMenu + 1
			end
			if data.pauseMode == 'Modern' then
				if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
					--EXIT TO MAIN MENU
					if pauseMenu == #t_pauseMain then
						sndPlay(sysSnd, 100, 5)
					--MOVELIST
					elseif pauseMenu == 2 then
						sndPlay(sysSnd, 100, 5)
					--SETTINGS
					elseif pauseMenu == 3 then
						audioCfg = 1
						sndPlay(sysSnd, 100, 1)
						mainGoTo = 'Audio'
						rectScale = -10
					--CHANGE SONG
					elseif pauseMenu == 4 then
						playBGM(bgmTitle)
					--BACK TO CHARACTER SELECT
					elseif pauseMenu == 6 then
						exitMatch()
					end
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
			elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and PcursorPosY > 1 then
				PcursorPosY = PcursorPosY - 1
			elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and PcursorPosY < 7 then
				PcursorPosY = PcursorPosY + 1
			elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and PcursorPosY > 1 then
				PcursorPosY = PcursorPosY - 1
			elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and PcursorPosY < 7 then
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
			--animDraw(f_animVelocity(pauseBG0, -1, -1))
			--Draw Transparent Table BG
			animSetScale(pauseBG1, 220, maxPause*15)
			animSetWindow(pauseBG1, 80,70, 160,105)
			animDraw(pauseBG1)
			animUpdate(pauseBG1)
			--Draw Title Menu
			textImgDraw(txt_pause)
			--Draw Cursor
			animSetWindow(cursorBox, 80,55+PcursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			--Draw Text for Table
			for i=1, maxPause do	
				if i > pauseMenu - PcursorPosY then
					t_pauseMain[i].id = createTextImg(font2, 0, 0, t_pauseMain[i].text, 158.5, 65+i*15-PmoveTxt,0.85,0.85)
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
			elseif commandGetState(p2Cmd, 'holdu') then
				P2bufd = 0
				P2bufu = P2bufu + 1
			elseif commandGetState(p1Cmd, 'holdd') then
				Pbufu = 0
				Pbufd = Pbufd + 1
			elseif commandGetState(p2Cmd, 'holdd') then
				P2bufu = 0
				P2bufd = P2bufd + 1
			else
				Pbufu = 0
				Pbufd = 0
				P2bufu = 0
				P2bufd = 0
			end
		elseif pauseMode == 'Audio' then
			f_pauseAudio()
		end
	end
end

--;===========================================================
--; AUDIO SETTINGS
--;===========================================================
t_audioCfg = {
	{id = '', text = 'Master Volume',   	varID = textImgNew(), varText = gl_vol},
	{id = '', text = 'SFX Volume',       	varID = textImgNew(), varText = se_vol},
	{id = '', text = 'BGM Volume',      	varID = textImgNew(), varText = bgm_vol},
	{id = '', text = 'Audio Panning',   	varID = textImgNew(), varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{id = '', text = '          BACK'}
}

function f_pauseAudio()
	local hasChanged = false
	if pn == 1 then txt_audioCfg = createTextImg(jgFnt, 0, 0, 'AUDIO SETTINGS [P1]', 159, 63)
	elseif pn == 2 then txt_audioCfg = createTextImg(jgFnt, 0, 0, 'AUDIO SETTINGS [P2]', 159, 63)
	end
	if rectScale == 10 then
		if start then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
			if modified then f_saveCfg() end
		elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and audioCfg == #t_audioCfg) then
			sndPlay(sysSnd, 100, 2)
			rectScale = -10
			bufl = 0
			bufr = 0
		if modified then f_saveCfg() end
		end
	end
	if pauseMenuActive == true and rectScale < 10 then
		rectScale = rectScale + 1
	elseif pauseMenuActive == false and rectScale > 0 then
		rectScale = rectScale - 1
		animUpdate(darkenOut)
	end
	if pauseMenuActive == false and rectScale == 0 then
		togglePauseMenu(0)
		setSysCtrl(0)
		rectScale = -1
		pauseMode = ''
		bufl = 0
		bufr = 0
		return
	end
	if pauseMenuActive then
		animDraw(darkenIn)
	else
		animDraw(darkenOut)
	end
	if rectScale == -1 then
		pauseMode = ''
		rectScale = 0
	end
	if rectScale == 10 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 2 and commandGetState(p2Cmd, 'u')) then
			sndPlay(sysSnd, 100, 0)
			audioCfg = audioCfg - 1
			if audioCfg < 1 then audioCfg = #t_audioCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 2 and commandGetState(p2Cmd, 'd')) then
			sndPlay(sysSnd, 100, 0)
			audioCfg = audioCfg + 1
			if audioCfg > #t_audioCfg then audioCfg = 1 end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		end
		--Master volume
		if audioCfg == 1 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 30 and gl_vol < 100) then
				if gl_vol < 100 then gl_vol = gl_vol + 1 else gl_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 30 and gl_vol > 0) then
				if gl_vol > 0 then gl_vol = gl_vol - 1 else gl_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			end
		--SE volume
		elseif audioCfg == 2 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 30 and se_vol < 100) then
				if se_vol < 100 then se_vol = se_vol + 1 else se_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 30 and se_vol > 0) then
				if se_vol > 0 then se_vol = se_vol - 1 else se_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			end
		--BGM volume
		elseif audioCfg == 3 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 30 and bgm_vol < 100) then
				if bgm_vol < 100 then bgm_vol = bgm_vol + 1 else bgm_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 30 and bgm_vol > 0) then
				if bgm_vol > 0 then bgm_vol = bgm_vol - 1 else bgm_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			end
		--Audio Panning
		elseif audioCfg == 4 then
			if commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				if pan_str < 160 then pan_str = pan_str + 40 else pan_str = 0 end
				hasChanged = true
			elseif commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				if pan_str > 0 then pan_str = pan_str - 40 else pan_str = 160 end
				hasChanged = true
			end 
		end
		if audioCfg < 4 then
			if (pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr')) then
				bufl = 0
				bufr = bufr + 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl')) then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		end
		if hasChanged then
			if not modified then modified = true end
			t_audioCfg[1].varText = gl_vol
			t_audioCfg[2].varText = se_vol    
			t_audioCfg[3].varText = bgm_vol
			t_audioCfg[4].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
			setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
			setPanStr(pan_str / 100)
			hasChanged = false
		end
		animSetScale(pauseBG1, 220, maxPause*15)
		animSetWindow(pauseBG1, 80,70, 160,105)
		animDraw(pauseBG1)
		animUpdate(pauseBG1)
		textImgDraw(txt_audioCfg)
		animSetWindow(cursorBox, 80,55+PcursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxPause do	
			if i > audioCfg - PcursorPosY then
				t_audioCfg[i].id = createTextImg(font2, 0, 0, t_audioCfg[i].text, 158.5, 65+i*15-PmoveTxt,0.85,0.85)
				textImgDraw(t_audioCfg[i].id)
			end
		end
	end
end
