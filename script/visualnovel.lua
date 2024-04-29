module(..., package.seeall)

--;===========================================================
--; VISUAL NOVEL PAUSE/OPTIONS MENU
--;===========================================================
txt_vnPTitle = createTextImg(jgFnt, 0, 0, "STORY OPTIONS", 160, 13)

--Pause background
vnPauseBG = animNew(vnSff, [[100,1, 0,0, -1]])

t_vnPauseMenu = {
	{varID = textImgNew(), text = "Text Speed", 			 varText = ""},
	{varID = textImgNew(), text = "Text BG Transparency", 	 varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"},
	{varID = textImgNew(), text = "Display Character Name",  varText = ""},
	{varID = textImgNew(), text = "Sound Settings", 		 varText = ""},
	--{varID = textImgNew(), text = "Control Guide", 		 	 varText = ""},
	{varID = textImgNew(), text = "Restore Settings", 		 varText = ""},
	--{varID = textImgNew(), text = "Save Progress",			 varText = ""},
	{varID = textImgNew(), text = "Skip Scene", 			 varText = ""},
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
	data.VNtxtBGTransD = 0
	data.VNtxtBGTransS = 255
	data.VNdisplayName = true
end

function f_vnPauseMenu()
	if not audioCfgVNActive then
		if not defaultScreenVN then
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
					cursorPosYAVN = 1
					moveTxtAVN = 0
					audioCfgVN = 1
					bufu = 0
					bufd = 0
					bufr = 0
					bufl = 0
					audioCfgVNActive = true
				--Control Guide
				--elseif vnPauseMenu == 5 then
					--WIP
				--Restore Settings
				elseif vnPauseMenu == 5 then
					defaultScreenVN = true
					defaultVN = true
				--Save Progress
				--elseif vnPauseMenu == 7 then
					--WIP
				--Skip Scene
				elseif vnPauseMenu == 6 then
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
					hasChangedVN = true
				elseif commandGetState(p1Cmd, 'l') then
					if data.VNdelay < 3 then
						sndPlay(sysSnd, 100, 0)
						data.VNdelay = data.VNdelay + 1
					end
					hasChangedVN = true
				end
			--Text BG Transparency
			elseif vnPauseMenu == 2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufrVNP >= 30) then
					if data.VNtxtBGTransD < 255 then
						data.VNtxtBGTransD = data.VNtxtBGTransD + 1
						data.VNtxtBGTransS = data.VNtxtBGTransS - 1
					else
						data.VNtxtBGTransD = 0
						data.VNtxtBGTransS = 255
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
						hasChangedVN = true
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and buflVNP >= 30) then
					if data.VNtxtBGTransD > 0 then
						data.VNtxtBGTransD = data.VNtxtBGTransD - 1
						data.VNtxtBGTransS = data.VNtxtBGTransS + 1
					else
						data.VNtxtBGTransD = 255
						data.VNtxtBGTransS = 0
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
					hasChangedVN = true
				end
			--Display Character Name
			elseif vnPauseMenu == 3 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sysSnd, 100, 1)
				if data.VNdisplayName then data.VNdisplayName = false else data.VNdisplayName = true end
				hasChangedVN = true
			end
		end
		--Draw Pause Menu BG
		animSetScale(vnPauseBG, 1.28, maxVNP*0.25)
		animSetWindow(vnPauseBG, 63,20, 200, 150)
		animSetAlpha(vnPauseBG, 255, 22)
		animPosDraw(vnPauseBG, 63, 20)
		--Draw Title
		textImgDraw(txt_vnPTitle)
		--Set Table Text
		if hasChangedVN then
			f_saveVN()
			f_vnCfgdisplayTxt()
			t_vnPauseMenu[2].varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"
			hasChangedVN = false
		end
		--Draw Table Text
		for i=1, maxVNP do
			if i > vnPauseMenu - cursorPosYVNP then
				if t_vnPauseMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_vnPauseMenu[i].varID, font2, 0, 1, t_vnPauseMenu[i].text, 68, 15+i*15-moveTxtVNP))
					textImgDraw(f_updateTextImg(t_vnPauseMenu[i].varID, font2, 0, -1, t_vnPauseMenu[i].varText, 252, 15+i*15-moveTxtVNP))
				end
			end
		end
		--Draw Cursor
		if not defaultScreenVN then
			animSetWindow(cursorBox, 64,5+cursorPosYVNP*15, 192,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if defaultScreenVN == true then f_defaultMenuVN() end
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
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			buflVNP = 0
			bufrVNP = bufrVNP + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufrVNP = 0
			buflVNP = buflVNP + 1
		else
			bufrVNP = 0
			buflVNP = 0
		end
	else
		f_audioCfgVN()
	end
end

function f_vnPauseMenuReset()
	hasChangedVN = false
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
--; VISUAL NOVEL AUDIO SETTINGS
--;===========================================================
txt_audioCfg = createTextImg(jgFnt, 0, 0, "AUDIO SETTINGS", 159, 13)

--Data loading from config.ssz
local file = io.open("save/config.ssz","r")
s_configSSZ = file:read("*all")
file:close()

gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))

--Data saving to config.ssz
function f_saveSettingsVN()
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	local file = io.open("save/config.ssz","w+")
	file:write(s_configSSZ)
	file:close()
	modifiedVN = false
end

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
t_panStr = {"None", "Narrow", "Medium", "Wide", "Full"}

t_audioCfg = {
	{varID = textImgNew(), text = "Master Volume",		varText = gl_vol.."%"},
	{varID = textImgNew(), text = "SFX Volume",			varText = se_vol.."%"},
	{varID = textImgNew(), text = "BGM Volume",			varText = bgm_vol.."%"},
	{varID = textImgNew(), text = "Audio Panning",   	varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{varID = textImgNew(), text = "Default Values",		varText = ""},
	{varID = textImgNew(), text = "          BACK",  	varText = ""},
}

function f_audioCfgVN()
	if not defaultScreenVN then
		cmdInput()
		if modifiedVN then f_saveSettingsVN() end
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sysSnd, 100, 2)
			audioCfgVNActive = false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			audioCfgVN = audioCfgVN - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			audioCfgVN = audioCfgVN + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		--Master Volume
		elseif audioCfgVN == 1 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if gl_vol < 100 then
					gl_vol = gl_vol + 1
				else
					gl_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if gl_vol > 0 then
					gl_vol = gl_vol - 1
				else
					gl_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modifiedVN = true
			end
			if commandGetState(p1Cmd, 'holdr') then
				bufl = 0
				bufr = bufr + 1
			elseif commandGetState(p1Cmd, 'holdl') then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		--SFX Volume
		elseif audioCfgVN == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if se_vol < 100 then
					se_vol = se_vol + 1
				else
					se_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if se_vol > 0 then
					se_vol = se_vol - 1
				else
					se_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modifiedVN = true
			end
			if commandGetState(p1Cmd, 'holdr') then
				bufl = 0
				bufr = bufr + 1
			elseif commandGetState(p1Cmd, 'holdl') then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		--BGM Volume
		elseif audioCfgVN == 3 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if bgm_vol < 100 then
					bgm_vol = bgm_vol + 1
				else
					bgm_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if bgm_vol > 0 then
					bgm_vol = bgm_vol - 1
				else
					bgm_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modifiedVN = true
			end
			if commandGetState(p1Cmd, 'holdr') then
				bufl = 0
				bufr = bufr + 1
			elseif commandGetState(p1Cmd, 'holdl') then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		--Audio Panning
		elseif audioCfgVN == 4 then
			if commandGetState(p1Cmd, 'r') and pan_str < 160 then
				sndPlay(sysSnd, 100, 0)
				pan_str = pan_str + 40
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') and pan_str > 0 then
				sndPlay(sysSnd, 100, 0)
				pan_str = pan_str - 40
				modifiedVN = true
			end
			setPanStr(pan_str / 100)
		--Default Values
		elseif audioCfgVN == 5 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
			sndPlay(sysSnd, 100, 1)
			defaultScreenVN = true
			defaultAudioVN = true
		--BACK
		elseif audioCfgVN == #t_audioCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
			audioCfgVNActive = false
			sndPlay(sysSnd, 100, 2)
		end
		if audioCfgVN < 1 then
			audioCfgVN = #t_audioCfg
			if #t_audioCfg > 14 then
				cursorPosYAVN = 14
			else
				cursorPosYAVN = #t_audioCfg
			end
		elseif audioCfgVN > #t_audioCfg then
			audioCfgVN = 1
			cursorPosYAVN = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosYAVN > 1 then
			cursorPosYAVN = cursorPosYAVN - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosYAVN < 14 then
			cursorPosYAVN = cursorPosYAVN + 1
		end
		if cursorPosYAVN == 14 then
			moveTxtAVN = (audioCfgVN - 14) * 15
		elseif cursorPosYAVN == 1 then
			moveTxtAVN = (audioCfgVN - 1) * 15
		end
		if #t_audioCfg <= 14 then
			maxAudioCfgVN = #t_audioCfg
		elseif audioCfgVN - cursorPosYAVN > 0 then
			maxAudioCfgVN = audioCfgVN + 14 - cursorPosYAVN
		else
			maxAudioCfgVN = 14
		end
	end
	animSetScale(vnPauseBG, 1.28, maxAudioCfgVN*0.25)
	animSetWindow(vnPauseBG, 63,20, 200, 150)
	animSetAlpha(vnPauseBG, 255, 22)
	animPosDraw(vnPauseBG, 63, 20)
	textImgDraw(txt_audioCfg)
	if defaultScreenVN == false then
		animSetWindow(cursorBox, 64,5+cursorPosYAVN*15, 192,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end	
	t_audioCfg[1].varText = gl_vol.."%"
	t_audioCfg[2].varText = se_vol.."%"
	t_audioCfg[3].varText = bgm_vol.."%"
	t_audioCfg[4].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
	setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)		
	setPanStr(pan_str / 100)
	for i=1, maxAudioCfgVN do
		if i > audioCfgVN - cursorPosYAVN then
			if t_audioCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font2, 0, 1, t_audioCfg[i].text, 85, 15+i*15-moveTxtAVN))
				textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font2, 0, -1, t_audioCfg[i].varText, 235, 15+i*15-moveTxtAVN))
			end
		end
	end
	if defaultScreenVN == true then f_defaultMenuVN() end
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
end

--;===========================================================
--; VISUAL NOVEL DEFAULT VALUES MESSAGE
--;===========================================================
txt_defaultquestionVN = createTextImg(jgFnt, 1, 0, "LOAD DEFAULT SETTINGS?", 160, 110,0.8,0.8)

--Default Window BG
defaultWindowBGVN = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(defaultWindowBGVN, 83.5, 97)
animUpdate(defaultWindowBGVN)
animSetScale(defaultWindowBGVN, 1, 1)

t_defaultMenuVN = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

function f_defaultMenuVN()
	cmdInput()
	--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sysSnd, 100, 0)
		defaultMenuVN = defaultMenuVN - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sysSnd, 100, 0)
		defaultMenuVN = defaultMenuVN + 1
	end
	if defaultMenuVN < 1 then
		defaultMenuVN = #t_defaultMenuVN
		if #t_defaultMenuVN > 4 then
			cursorPosYDefaultVN = 4
		else
			cursorPosYDefaultVN = #t_defaultMenuVN-1
		end
	elseif defaultMenuVN > #t_defaultMenuVN then
		defaultMenuVN = 1
		cursorPosYDefaultVN = 0
	elseif (commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) and cursorPosYDefaultVN > 0 then
		cursorPosYDefaultVN = cursorPosYDefaultVN - 1
	elseif (commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) and cursorPosYDefaultVN < 4 then
		cursorPosYDefaultVN = cursorPosYDefaultVN + 1
	end
	if cursorPosYDefaultVN == 4 then
		moveTxtDefaultVN = (defaultMenuVN - 5) * 13
	elseif cursorPosYDefaultVN == 0 then
		moveTxtDefaultVN = (defaultMenuVN - 1) * 13
	end
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(defaultWindowBGVN)
	animUpdate(defaultWindowBGVN)
	--Draw Title
	textImgDraw(txt_defaultquestionVN)
	--Draw Table Text
	for i=1, #t_defaultMenuVN do
		if i == defaultMenuVN then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_defaultMenuVN[i].id, jgFnt, bank, 0, t_defaultMenuVN[i].text, 159, 120+i*13-moveTxtDefaultVN))
	end
	--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYDefaultVN*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))	
	--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sysSnd, 100, 2)
		f_defaultResetVN()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--YES
		if defaultMenuVN == 1 then
			sndPlay(sysSnd, 100, 1)
			if defaultVN == true then
				f_restoreVNcfg()
				hasChangedVN = true
				--modifiedVN = true
			elseif defaultAudioVN == true then
				gl_vol = 80
				se_vol = 80
				bgm_vol = 50
				setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
				pan_str = 80
				setPanStr(pan_str / 100)
				modifiedVN = true
			end
		--NO
		else
			sndPlay(sysSnd, 100, 2)
		end
		f_defaultResetVN()
	end
end

function f_defaultResetVN()
	moveTxtDefaultVN = 0
	--Cursor pos in NO
	cursorPosYDefaultVN = 1
	defaultMenuVN = 2
	--Reset
	defaultScreenVN = false
	defaultVN = false
	defaultAudioVN = false
end

--;===========================================================
--; LOAD VISUAL NOVEL DATA
--;===========================================================
function f_vnLoad(path)
t_vnBoxText = {}
local t = {}
local group = ''
local section = 0
local file = io.open(path,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')

--[[
function f_newVNBox()
chapt = #t_vnBoxText+1 --Add chapter to the table
t_vnBoxText[chapt] = {} --Create sub-table to store content from this chapter
end
]]

for line in content:gmatch('[^\r\n]+') do
	line = tostring(line:lower()) --line:lower()
	if line:match('^%s*%[%s*chapter%s+[0-9]+$*%]') then
		section = 1
		chapt = #t_vnBoxText+1 --Add chapter to the table
		t_vnBoxText[chapt] = {} --Create sub-table to store content from this chapter
	elseif section > 0 then --[Chapter No]
		if line:match('^%s*character%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {} --Add content filtered to the end of the "chapter" sub-table
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['ID'] = ""
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['character'] = data:gsub('^%s*character%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		elseif line:match('^%s*cut%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {}
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['cut'] = data:gsub('^%s*cut%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				
			--end
		end
		if line:match('^%s*bgm%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['bgm'] = data:gsub('^%s*bgm%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		if line:match('text:$') then
			t_vnBoxText[chapt][#t_vnBoxText[chapt]]['text'] = ""
		end
		if type(t_vnBoxText[chapt][#t_vnBoxText[chapt]].text) == 'string' then
			if t_vnBoxText[chapt][#t_vnBoxText[chapt]].text == '' then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]].text = " " --line  --line get "text:" and we don't need that
			else
				t_vnBoxText[chapt][#t_vnBoxText[chapt]].text = t_vnBoxText[chapt][#t_vnBoxText[chapt]].text .. '\n' .. line
			end
		end
	end
	--textImgDraw(txt_loading)
	--refresh()
end
if data.debugLog then f_printTable(t_vnBoxText, "save/debug/t_vnBoxText.txt") end
end

--;===========================================================
--; VISUAL NOVEL DEFINITION
--;===========================================================
--Common Textbox Settings
function f_resetFullVN()
VNtxtActive = 1
VNscroll = 0
VNnodelay = 0
VNdelay = data.VNdelay
VNskip = false
VNtxtReady = false
VNtxtEnd = false
VNbgmActive = false
VNbgmNew = false
VNbgm = ""
--Narrative Text
VNtxtSpacing = 9 --spacing between lines (rendering Y position increasement for each line)
VNtxtPosX = 2
VNtxtPosY = 184 --194
VNtxtBank = 0
VNtxtAlphaS = 255
VNtxtAlphaD = 0
f_vnPauseMenuReset()
f_defaultResetVN()
end

function f_resetSimpleVN()
--Reset Text Box
VNtxtReady = false
VNtxtActive = 1
VNscroll = 0
VNdelay = data.VNdelay
end

function f_playVNbgm()
playBGM(t_vnBoxText[vnChapter][VNtxt].bgm) --Play BGM
t_currentVNbgm = t_vnBoxText[vnChapter][VNtxt].bgm --Backup the current BGM to decide after if it will change
end

function f_vnScene(arcPath, chaptNo, dialogueNo)
	f_vnLoad(arcPath) --What Dialogue File will load?
	f_resetFullVN()
	vnChapter = chaptNo --What chapter number does it start in?
	VNtxt = dialogueNo --What dialogue number does it start in?
	if data.songSelect then playBGM(VNbgm) end
	cmdInput()
	while true do
		--Actions
		if t_vnBoxText[vnChapter][VNtxt].cut ~= nil or VNtxtEnd then break end
		if not vnPauseScreen then
			if commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				vnPauseScreen = true
				sndPlay(sysSnd, 100, 3)
			elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) or commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
		end
		--Loading New Txt Logic
		if VNtxt < #t_vnBoxText[vnChapter] then --Only show new text if is store in the table
			if VNtxtReady then --When text is fully drawed
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		--Last Txt
		elseif VNtxt == #t_vnBoxText[vnChapter] then
			if VNtxtReady then
				VNtxtEnd = true
			end
		end
		--BGM Player
		if not VNbgmActive then
			if t_vnBoxText[vnChapter][VNtxt].bgm ~= nil then
				f_playVNbgm()
				VNbgmActive = true
			end
		else--if VNbgmActive is true
			if t_vnBoxText[vnChapter][VNtxt].bgm ~= t_currentVNbgm and t_vnBoxText[vnChapter][VNtxt].bgm ~= nil then --If a new song is detected
				VNbgmNew = true
			end
		end
		if VNbgmNew then
			f_playVNbgm()
			VNbgmNew = false
		end
		f_drawVN() --Draw Sprites
		animSetAlpha(vnTxtBG, data.VNtxtBGTransS, data.VNtxtBGTransD) --Set BG Transparency
		animDraw(vnTxtBG) --Draw Text BG
		if VNtxtActive == 0 then
			animDraw(vnNext) --Draw Next Text Arrow
			animUpdate(vnNext)
		end
		--Text to Show
		--textImgSetBank(txt_nameCfg, 1)
		if t_vnBoxText[vnChapter][VNtxt].character ~= nil then
			textImgSetText(txt_nameCfg, t_vnBoxText[vnChapter][VNtxt].character) --Set Name Text
		else
			textImgSetText(txt_nameCfg, "") --Set Empty Name Text
		end
		if data.VNdisplayName then textImgDraw(txt_nameCfg) end --Draw Name Text
		if t_vnBoxText[vnChapter][VNtxt].text ~= nil then
			VNtextData = t_vnBoxText[vnChapter][VNtxt].text --Set Narrative Text
		else
			VNtextData = "" --Set Empty Narrative Text
		end
		VNtxtActive = f_textRender(txt_boxCfg, VNtextData, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1) --Draw Narrative Text
		f_drawQuickText(txt_testVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
		if vnPauseScreen then f_vnPauseMenu() end
		VNscroll = VNscroll + 1
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VISUAL NOVEL ASSETS DRAW LOGIC
--;===========================================================
function f_drawVN()
	--Draw Chapter 1 Visuals
	if vnChapter == 1 then
		if VNtxt > 0 and VNtxt < 24 then
			animDraw(vnBG0)
			if VNtxt >= 4 and VNtxt <= 10 then
				animDraw(vnKfm1)
			end
			if VNtxt >= 3 and VNtxt <= 9 then
				--animDraw(vnMM1)
			end
		end
	--Draw Chapter 2 Visuals
	elseif vnChapter == 2 then
		animDraw(vnBG2)
		if VNtxt < 6 then animDraw(vnKfm1) end
		if VNtxt >= 4 then animDraw(vnEKfm1) end
	end
end