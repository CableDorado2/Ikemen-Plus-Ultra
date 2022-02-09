
module(..., package.seeall)

--;===========================================================
--; LOAD DATA
--;===========================================================
-- Data loading from data_sav.lua
local file = io.open("script/data_sav.lua","r")
s_dataLUA = file:read("*all")
file:close()

-- Data loading from config.ssz
local file = io.open("ssz/config.ssz","r")
s_configSSZ = file:read("*all")
file:close()
resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
b_screenMode = (s_configSSZ:match('const bool FullScreen%s*=%s*([^;%s]+)'))
gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
gameSpeed = tonumber(s_configSSZ:match('const int GameSpeed%s*=%s*(%d+)'))
b_saveMemory = s_configSSZ:match('const bool SaveMemory%s*=%s*([^;%s]+)')
b_openGL = s_configSSZ:match('const bool OpenGL%s*=%s*([^;%s]+)')

-- Data loading from sound.ssz
local file = io.open("lib/sound.ssz","r")
s_soundSSZ = file:read("*all")
file:close()
freq = tonumber(s_soundSSZ:match('const int Freq%s*=%s*(%d+)'))
channels = tonumber(s_soundSSZ:match('const int Channels%s*=%s*(%d+)'))
buffer = tonumber(s_soundSSZ:match('const int BufferSamples%s*=%s*(%d+)'))

-- Data loading from lifebar
local file = io.open(data.lifebar,"r")
s_lifebarDEF = file:read("*all")
file:close()
roundsNum = tonumber(s_lifebarDEF:match('match.wins%s*=%s*(%d+)'))
drawNum = tonumber(s_lifebarDEF:match('match.maxdrawgames%s*=%s*(%d+)'))

--Variable setting based on loaded data
if gameSpeed == 48 then
	s_gameSpeed = 'Slow'
--elseif gameSpeed == 56 then
	--s_gameSpeed = '93.33%'
elseif gameSpeed == 60 then
	s_gameSpeed = 'Normal'
--elseif gameSpeed == 64 then
	--s_gameSpeed = '106.66%'
elseif gameSpeed == 72 then
	s_gameSpeed = 'Turbo'
end
if b_screenMode == 'true' then
	b_screenMode = true
	s_screenMode = 'Yes'
elseif b_screenMode == 'false' then
	b_screenMode = false
	s_screenMode = 'No'
end
if channels == 6 then
	s_channels = '5.1'
elseif channels == 4 then
	s_channels = 'Quad'
elseif channels == 2 then
	s_channels = 'Stereo'
elseif channels == 1 then
	s_channels = 'Mono'
end
if b_saveMemory == 'true' then
	b_saveMemory = true
	s_saveMemory = 'Yes'
elseif b_saveMemory == 'false' then
	b_saveMemory = false
	s_saveMemory = 'No'
end
if b_openGL == 'true' then
	b_openGL = true
	s_openGL = 'Yes'
elseif b_openGL == 'false' then
	b_openGL = false
	s_openGL = 'No'
end
if data.teamLifeShare then
	s_teamLifeShare = 'Yes'
else
	s_teamLifeShare = 'No'
end
if data.zoomActive then
	s_zoomActive = 'Yes'
else
	s_zoomActive = 'No'
end
if data.p1Controller == -1 then
	s_p1Controller = 'Keyboard'
else
	s_p1Controller = 'Gamepad'
end
if data.p2Controller == -1 then
	s_p2Controller = 'Keyboard'
else
	s_p2Controller = 'Gamepad'
end
if data.contSelection then
	s_contSelection = 'Yes'
else
	s_contSelection = 'No'
end
if data.aiRamping then
	s_aiRamping = 'Yes'
else
	s_aiRamping = 'No'
end
if data.autoguard then
	s_autoguard = 'Yes'
else
	s_autoguard = 'No'
end
if data.vsDisplayWin then
	s_vsDisplayWin = 'Yes'
else
	s_vsDisplayWin = 'No'
end

--;===========================================================
--; BACKGROUND DEFINITION
--;===========================================================
--Scrolling background
optionsBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(optionsBG0, 160, 0)
animSetTile(optionsBG0, 1, 1)
animSetColorKey(optionsBG0, -1)

--Transparent background
optionsBG1 = animNew(sysSff, [[
100,1, 0,0, -1
]])
animSetTile(optionsBG1, 1, 1)
animSetAlpha(optionsBG1, 20, 100)
animUpdate(optionsBG1)

--;===========================================================
--; ON EXIT
--;===========================================================
modified = 0
needReload = 0

function f_strSub(str, t)
	local txt = ''
	for row, val in pairs(t) do
		if type(val) == 'string' then
			val = "'" .. tostring(val) .. "'"
		elseif type(var) == 'number' then
			val = var
		else
			val = tostring(val)
		end
		str = str:gsub(row .. '%s*=%s*[^\n]+', row .. ' = ' .. val)
		txt = txt .. row .. ' = ' .. val .. '\n'
	end
	return str, txt
end

function f_saveCfg()
	-- Data saving to data_sav.lua
	local t_saves = {
		['data.lifeMul'] = data.lifeMul,
		['data.team1VS2Life'] = data.team1VS2Life,
		['data.turnsRecoveryRate'] = data.turnsRecoveryRate,
		['data.teamLifeShare'] = data.teamLifeShare,
		['data.zoomActive'] = data.zoomActive,
		['data.zoomMin'] = data.zoomMin,
		['data.zoomMax'] = data.zoomMax,
		['data.zoomSpeed'] = data.zoomSpeed,
		['data.roundTime'] = data.roundTime,
		['data.numTurns'] = data.numTurns,
		['data.numSimul'] = data.numSimul,
		['data.simulType'] = data.simulType,
		['data.p1Controller'] = data.p1Controller,
		['data.p2Controller'] = data.p2Controller,
		['data.difficulty'] = data.difficulty,	
		['data.coins'] = data.coins,
		['data.contSelection'] = data.contSelection,
		['data.vsDisplayWin'] = data.vsDisplayWin,		
		['data.aiRamping'] = data.aiRamping,
		['data.autoguard'] = data.autoguard,
		['data.lifebar'] = data.lifebar,
		['data.sffConversion'] = data.sffConversion
	}
	s_dataLUA = f_strSub(s_dataLUA, t_saves)
	local file = io.open("script/data_sav.lua","w+")
	file:write(s_dataLUA)
	file:close()
	-- Data saving to config.ssz
	if b_saveMemory then
		s_saveMemory = s_saveMemory:gsub('const bool SaveMemory%s*=%s*[^;%s]+', 'const bool SaveMemory = true')
	else
		s_saveMemory = s_saveMemory:gsub('const bool SaveMemory%s*=%s*[^;%s]+', 'const bool SaveMemory = false')
	end
	if b_openGL then
		s_configSSZ = s_configSSZ:gsub('const bool OpenGL%s*=%s*[^;%s]+', 'const bool OpenGL = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool OpenGL%s*=%s*[^;%s]+', 'const bool OpenGL = false')
	end
	if b_screenMode then
		s_configSSZ = s_configSSZ:gsub('const bool FullScreen%s*=%s*[^;%s]+', 'const bool FullScreen = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool FullScreen%s*=%s*[^;%s]+', 'const bool FullScreen = false')
	end	
	s_configSSZ = s_configSSZ:gsub('const int Width%s*=%s*%d+', 'const int Width = ' .. resolutionWidth)
	s_configSSZ = s_configSSZ:gsub('const int Height%s*=%s*%d+', 'const int Height = ' .. resolutionHeight)
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const int GameSpeed%s*=%s*%d+', 'const int GameSpeed = ' .. gameSpeed)
	local file = io.open("ssz/config.ssz","w+")
	file:write(s_configSSZ)
	file:close()
	-- Data saving to sound.ssz
	s_soundSSZ = s_soundSSZ:gsub('const int Freq%s*=%s*%d+', 'const int Freq = ' .. freq)
	s_soundSSZ = s_soundSSZ:gsub('const int Channels%s*=%s*%d+', 'const int Channels = ' .. channels)
	s_soundSSZ = s_soundSSZ:gsub('const int BufferSamples%s*=%s*%d+', 'const int BufferSamples = ' .. buffer)
	local file = io.open("lib/sound.ssz","w+")
	file:write(s_soundSSZ)
	file:close()
	-- Data saving to lifebar
	s_lifebarDEF = s_lifebarDEF:gsub('match.wins%s*=%s*%d+', 'match.wins = ' .. roundsNum)
	s_lifebarDEF = s_lifebarDEF:gsub('match.maxdrawgames%s*=%s*%d+', 'match.maxdrawgames = ' .. drawNum)
	local file = io.open(data.lifebar,"w+")
	file:write(s_lifebarDEF)
	file:close()
	-- Reload lifebar
	loadLifebar(data.lifebar)
	-- Reload game if needed
	if needReload == 1 then
		os.execute("reload.bat")
		os.exit()
	end
end

--;===========================================================
--; INFO BOX
--;===========================================================
txt_exitInfo = createTextImg(jgFnt, 0, 0, 'INFORMATION', 159, 13)
t_exitInfo = {
	{id = '', text = "Some selected options require restart Ikemen. Press"},
	{id = '', text = "start key to reboot Ikemen and load your new settings."},
}
for i=1, #t_exitInfo do
	t_exitInfo[i].id = createTextImg(font2, 0, 1, t_exitInfo[i].text, 25, 15+i*15)
end
function f_exitInfo()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or esc() then
			sndPlay(sysSnd, 100, 2)
			f_saveCfg()
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 20,20, 280,#t_exitInfo*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_exitInfo)
		for i=1, #t_exitInfo do
			textImgDraw(t_exitInfo[i].id)
		end
		cmdInput()
		refresh()
	end
end

t_restart = {
	{id = '', text = "The changes that you have made"},
	{id = '', text = "require Save and Back.    "},
}
for i=1, #t_restart do
	t_restart[i].id = createTextImg(font2, 0, -1, t_restart[i].text, 236, 155+i*15)
end

t_newinput = {
	{id = '', text = "Press any key to assign"},--{id = '', text = "Enter new input..."},
}
for i=1, #t_newinput do
	t_newinput[i].id = createTextImg(font2, 0, -1, t_newinput[i].text, 236, 180+i*15)
end

--;===========================================================
--; MAIN LOOP
--;===========================================================
txt_mainCfg = createTextImg(jgFnt, 0, 0, 'OPTIONS', 159, 13)
t_mainCfg = {
	{id = '', text = 'Gameplay Settings'},
	{id = '', text = 'Video Settings'},
	{id = '', text = 'Audio Settings'},
	{id = '', text = 'Input Settings'},
	{id = '', text = 'Engine Settings'},	
	{id = '', text = 'Port Change',        varID = textImgNew(), varText = getListenPort()},
	{id = '', text = 'Default Values'},
	{id = '', text = 'Save and Back'},
	{id = '', text = 'Back Without Saving'},
}

for i=1, #t_mainCfg do
	t_mainCfg[i].id = createTextImg(font2, 0, 1, t_mainCfg[i].text, 85, 15+i*15)
end

function f_mainCfg()
	cmdInput()
	local mainCfg = 1	
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		if esc() then
			--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			--sndPlay(sysSnd, 100, 2)
			--if needReload == 1 then
				--f_exitInfo()
			--end
			--break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainCfg = mainCfg - 1
			if mainCfg < 1 then mainCfg = #t_mainCfg end		
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainCfg = mainCfg + 1
			if mainCfg > #t_mainCfg then mainCfg = 1 end
		--Port Change
		elseif mainCfg == 6 and (btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 1)
			inputDialogPopup(inputdia, 'Introduce a new Port (Default: 7500)')
			while not inputDialogIsDone(inputdia) do
				animDraw(f_animVelocity(optionsBG0, -1, -1))
				refresh()
			end
			setListenPort(inputDialogGetStr(inputdia))
			modified = 1
		elseif btnPalNo(p1Cmd) > 0 then
			--Gameplay Settings
			if mainCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				f_gameCfg()
			--Video Settings
			elseif mainCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				f_videoCfg()
			--Audio Settings
			elseif mainCfg == 3 then
				sndPlay(sysSnd, 100, 1)
				f_audioCfg()
			--Input Settings
			elseif mainCfg == 4 then
				sndPlay(sysSnd, 100, 1)
				f_inputCfg()
			--Engine Settings
			elseif mainCfg == 5 then
				sndPlay(sysSnd, 100, 1)
				f_engineCfg()	
			--Default Values
			elseif mainCfg == 7 then
				sndPlay(sysSnd, 100, 1)
				--saves.ini
				data.lifeMul = 100
				data.team1VS2Life = 120
				data.turnsRecoveryRate = 300
				data.teamLifeShare = false
				s_teamLifeShare = 'No'
				data.zoomActive = true
				s_zoomActive = 'Yes'
				data.zoomMin = 0.75
				data.zoomMax = 1.1
				data.zoomSpeed = 1.0
				data.roundTime = 99
				data.numTurns = 4
				data.numSimul = 4
				data.simulType = 'Assist'
				data.p1Controller = -1
				data.p2Controller = -1
				data.difficulty = 8
				data.coins = 10
				data.contSelection = true
				s_contSelection = 'Yes'
				data.aiRamping = true
				s_aiRamping = 'Yes'
				data.autoguard = false
				s_autoguard = 'No'
				data.vsDisplayWin = true
				s_vsDisplayWin = 'Yes'				
				data.lifebar = 'data/fight.def'
				data.sffConversion = true
				--config.ssz
				f_inputDefault()
				--b_saveMemory = false
				--s_saveMemory = 'No'
				b_openGL = false
				s_openGL = 'No'
				resolutionWidth = 640
				resolutionHeight = 480
				b_screenMode = false
				s_screenMode = 'No'
				setScreenMode(b_screenMode)
				gl_vol = 100
				se_vol = 50
				bgm_vol = 80
				setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
				gameSpeed = 60
				s_gameSpeed = 'Normal'
				--sound.ssz
				freq = 48000
				channels = 2
				s_channels = 'Stereo'
				buffer = 2048
				--lifebar
				roundsNum = 2
				drawNum = 2
				--other
				setListenPort(7500)
				modified = 1
				needReload = 1
			--Save and Back
			elseif mainCfg == 8 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				if needReload == 1 then
					f_exitInfo()
				end
				f_saveCfg()
				break	
			--Back Without Save
			else
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end			
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_mainCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_mainCfg)
		if needReload == 1 then
			for i=1, #t_restart do
				textImgDraw(t_restart[i].id)
			end
		end			
		t_mainCfg[6].varText = getListenPort()
		for i=1, #t_mainCfg do
			textImgDraw(t_mainCfg[i].id)
			if t_mainCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_mainCfg[i].varID, font2, 0, -1, t_mainCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+mainCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

function f_inputDefault()
	if data.p1Controller ~= -1 then
		data.p1Controller = -1
		s_p1Controller = 'Keyboard'
		f_swapController(0, 2, 0, -1)
	end
	if data.p2Controller ~= -1 then
		data.p2Controller = -1
		s_p2Controller = 'Keyboard'
		f_swapController(1, 3, 1, -1)
	end
	t_keyCfg[1].varText = 'UP'
	t_keyCfg[2].varText = 'DOWN'
	t_keyCfg[3].varText = 'LEFT'
	t_keyCfg[4].varText = 'RIGHT'
	t_keyCfg[5].varText = 'z'
	t_keyCfg[6].varText = 'x'
	t_keyCfg[7].varText = 'c'
	t_keyCfg[8].varText = 'a'
	t_keyCfg[9].varText = 's'
	t_keyCfg[10].varText = 'd'
	t_keyCfg[11].varText = 'RETURN'
	f_keySave(0,-1)
	t_keyCfg[1].varText = 't'
	t_keyCfg[2].varText = 'g'
	t_keyCfg[3].varText = 'f'
	t_keyCfg[4].varText = 'h'
	t_keyCfg[5].varText = 'j'
	t_keyCfg[6].varText = 'k'
	t_keyCfg[7].varText = 'l'
	t_keyCfg[8].varText = 'i'
	t_keyCfg[9].varText = 'o'
	t_keyCfg[10].varText = 'p'
	t_keyCfg[11].varText = 'q'
	f_keySave(1,-1)
	t_keyCfg[1].varText = '-7'
	t_keyCfg[2].varText = '-8'
	t_keyCfg[3].varText = '-5'
	t_keyCfg[4].varText = '-6'
	t_keyCfg[5].varText = '0'
	t_keyCfg[6].varText = '1'
	t_keyCfg[7].varText = '4'
	t_keyCfg[8].varText = '2'
	t_keyCfg[9].varText = '3'
	t_keyCfg[10].varText = '5'
	t_keyCfg[11].varText = '7'
	f_keySave(2,0)
	t_keyCfg[1].varText = '-7'
	t_keyCfg[2].varText = '-8'
	t_keyCfg[3].varText = '-5'
	t_keyCfg[4].varText = '-6'
	t_keyCfg[5].varText = '0'
	t_keyCfg[6].varText = '1'
	t_keyCfg[7].varText = '4'
	t_keyCfg[8].varText = '2'
	t_keyCfg[9].varText = '3'
	t_keyCfg[10].varText = '5'
	t_keyCfg[11].varText = '7'
	f_keySave(3,1)
end

--;===========================================================
--; GAMEPLAY SETTINGS
--;===========================================================
txt_gameCfg = createTextImg(jgFnt, 0, 0, 'GAMEPLAY SETTINGS', 159, 13)
t_gameCfg = {
	{id = '', text = 'Difficulty Level',         varID = textImgNew(), varText = data.difficulty},
	{id = '', text = 'Round Time',         		 varID = textImgNew(), varText = data.roundTime},	
	{id = '', text = 'Rounds to Win',      		 varID = textImgNew(), varText = roundsNum},
	{id = '', text = 'Max Draw Games',      	 varID = textImgNew(), varText = drawNum},	
	{id = '', text = 'Life',               		 varID = textImgNew(), varText = data.lifeMul .. '%'},	
	{id = '', text = 'Arcade Coins',             varID = textImgNew(), varText = data.coins},
	{id = '', text = 'Char change at Continue',  varID = textImgNew(), varText = s_contSelection},
	{id = '', text = 'Versus Win Counter',  	 varID = textImgNew(), varText = s_vsDisplayWin},	
	{id = '', text = 'AI ramping',               varID = textImgNew(), varText = s_aiRamping},
	{id = '', text = 'Auto-Guard',               varID = textImgNew(), varText = s_autoguard},
	{id = '', text = 'Team Settings'},
	{id = '', text = 'Back'},
}
for i=1, #t_gameCfg do
	t_gameCfg[i].id = createTextImg(font2, 0, 1, t_gameCfg[i].text, 85, 15+i*15)
end

function f_gameCfg()
	cmdInput()
	local gameCfg = 1
	local bufl = 0
	local bufr = 0	
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			gameCfg = gameCfg - 1
			if gameCfg < 1 then gameCfg = #t_gameCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			gameCfg = gameCfg + 1
			if gameCfg > #t_gameCfg then gameCfg = 1 end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		--Difficulty Level
		elseif gameCfg == 1 then
			if commandGetState(p1Cmd, 'r') and data.difficulty < 8 then
				sndPlay(sysSnd, 100, 0)
				data.difficulty = data.difficulty + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.difficulty > 1 then
				sndPlay(sysSnd, 100, 0)
				data.difficulty = data.difficulty - 1
				modified = 1
			end
		--Round Time			
		elseif gameCfg == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if data.roundTime < 1000 then
					data.roundTime = data.roundTime + 1
				else
					data.roundTime = -1
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if data.roundTime > -1 then
					data.roundTime = data.roundTime - 1
				else
					data.roundTime = 1000
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modified = 1
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
		--Rounds to Win			
		elseif gameCfg == 3 then
			if commandGetState(p1Cmd, 'r') and roundsNum < 10 then
				sndPlay(sysSnd, 100, 0)
				roundsNum = roundsNum + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and roundsNum > 1 then
				sndPlay(sysSnd, 100, 0)
				roundsNum = roundsNum - 1
				modified = 1
			end
		--Max Draw Games			
		elseif gameCfg == 4 then
			if commandGetState(p1Cmd, 'r') and drawNum < 10 then
				sndPlay(sysSnd, 100, 0)
				drawNum = drawNum + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and drawNum > 0 then
				sndPlay(sysSnd, 100, 0)
				drawNum = drawNum - 1
				modified = 1
			end				
		--Life
		elseif gameCfg == 5 then
			if commandGetState(p1Cmd, 'r') and data.lifeMul < 300 then
				sndPlay(sysSnd, 100, 0)
				data.lifeMul = data.lifeMul + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.lifeMul > 10 then
				sndPlay(sysSnd, 100, 0)
				data.lifeMul = data.lifeMul - 10
				modified = 1
			end			
		--Arcade Coins
		elseif gameCfg == 6 then
			if commandGetState(p1Cmd, 'r') and data.coins < 99 then
				sndPlay(sysSnd, 100, 0)
				data.coins = data.coins + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.coins > 0 then
				sndPlay(sysSnd, 100, 0)
				data.coins = data.coins - 1
				modified = 1
			end
		--Char change at Continue
		elseif gameCfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.contSelection then
				data.contSelection = false
				s_contSelection = 'No'
				modified = 1
			else
				data.contSelection = true
				s_contSelection = 'Yes'
				modified = 1
			end
		--Display Versus Win Counter
		elseif gameCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.vsDisplayWin then
				data.vsDisplayWin = false
				s_vsDisplayWin = 'No'
				modified = 1
			else
				data.vsDisplayWin = true
				s_vsDisplayWin = 'Yes'
				modified = 1
			end			
		--AI ramping
		elseif gameCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.aiRamping then
				data.aiRamping = false
				s_aiRamping = 'No'
				modified = 1
			else
				data.aiRamping = true
				s_aiRamping = 'Yes'
				modified = 1
			end
		--Auto-Guard
		elseif gameCfg == 10 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.autoguard then
				data.autoguard = false
				s_autoguard = 'No'
				modified = 1
			else
				data.autoguard = true
				s_autoguard = 'Yes'
				modified = 1
			end
		--Team Settings
		elseif gameCfg == 11 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			f_teamCfg()			
		--Back
		elseif gameCfg == 12 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end	
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_gameCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_gameCfg)
		t_gameCfg[1].varText = data.difficulty
		if data.roundTime ~= -1 then
			t_gameCfg[2].varText = data.roundTime
		else
			t_gameCfg[2].varText = 'Infinite'
		end
		t_gameCfg[3].varText = roundsNum
		t_gameCfg[4].varText = drawNum		
		t_gameCfg[5].varText = data.lifeMul .. '%'		
		t_gameCfg[6].varText = data.coins
		t_gameCfg[7].varText = s_contSelection
		t_gameCfg[8].varText = s_vsDisplayWin		
		t_gameCfg[9].varText = s_aiRamping
		t_gameCfg[10].varText = s_autoguard
		for i=1, #t_gameCfg do
			textImgDraw(t_gameCfg[i].id)
			if t_gameCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_gameCfg[i].varID, font2, 0, -1, t_gameCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+gameCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; TEAM SETTINGS
--;===========================================================
txt_teamCfg = createTextImg(jgFnt, 0, 0, 'TEAM SETTINGS', 159, 13)
t_teamCfg = {
	{id = '', text = 'Single Vs Team Life',     varID = textImgNew(), varText = data.team1VS2Life .. '%'},
	{id = '', text = 'Turns HP Recovery',       varID = textImgNew(), varText = data.turnsRecoveryRate .. '%'},
	{id = '', text = 'Disadvantage Life Share', varID = textImgNew(), varText = s_teamLifeShare},
	{id = '', text = 'Turns Players Limit',             varID = textImgNew(), varText = data.numTurns},
	{id = '', text = 'Simul Players Limit',             varID = textImgNew(), varText = data.numSimul},
	{id = '', text = 'Simul Type',              varID = textImgNew(), varText = data.simulType},
	{id = '', text = 'Back'},
}
for i=1, #t_teamCfg do
	t_teamCfg[i].id = createTextImg(font2, 0, 1, t_teamCfg[i].text, 85, 15+i*15)
end

function f_teamCfg()
	cmdInput()
	local teamCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			teamCfg = teamCfg - 1
			if teamCfg < 1 then teamCfg = #t_teamCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			teamCfg = teamCfg + 1
			if teamCfg > #t_teamCfg then teamCfg = 1 end
		--1P Vs Team Life
		elseif teamCfg == 1 then
			if commandGetState(p1Cmd, 'r') and data.team1VS2Life < 3000 then
				sndPlay(sysSnd, 100, 0)
				data.team1VS2Life = data.team1VS2Life + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.team1VS2Life > 10 then
				sndPlay(sysSnd, 100, 0)
				data.team1VS2Life = data.team1VS2Life - 10
				modified = 1
			end
		--Turns HP Recovery
		elseif teamCfg == 2 then
			if commandGetState(p1Cmd, 'r') and data.turnsRecoveryRate < 3000 then
				sndPlay(sysSnd, 100, 0)
				data.turnsRecoveryRate = data.turnsRecoveryRate + 10
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.turnsRecoveryRate > 10 then
				sndPlay(sysSnd, 100, 0)
				data.turnsRecoveryRate = data.turnsRecoveryRate - 10
				modified = 1
			end
		--Disadvantage Life Share
		elseif teamCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.teamLifeShare then
				data.teamLifeShare = false
				s_teamLifeShare = 'No'
				modified = 1
			else
				data.teamLifeShare = true
				s_teamLifeShare = 'Yes'
				modified = 1
			end
		--Turns Limit (by default also requires editing 'if(!.m.inRange!int?(1, 4, nt)){' in ssz/system-script.ssz)
		elseif teamCfg == 4 then
			if commandGetState(p1Cmd, 'r') and data.numTurns < 4 then
				sndPlay(sysSnd, 100, 0)
				data.numTurns = data.numTurns + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.numTurns > 2 then
				sndPlay(sysSnd, 100, 0)
				data.numTurns = data.numTurns - 1
				modified = 1
			end
		--Simul Limit (by default also requires editing 'const int maxSimul = 4;' in ssz/common.ssz)
		elseif teamCfg == 5 then
			if commandGetState(p1Cmd, 'r') and data.numSimul < 4 then
				sndPlay(sysSnd, 100, 0)
				data.numSimul = data.numSimul + 1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.numSimul > 2 then
				sndPlay(sysSnd, 100, 0)
				data.numSimul = data.numSimul - 1
				modified = 1
			end
		--Simul Type
		elseif teamCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.simulType == 'Tag' then
				data.simulType = 'Assist'
				modified = 1
			else
				data.simulType = 'Tag'
				modified = 1
			end
		--Back
		elseif teamCfg == 7 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_teamCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_teamCfg)
		t_teamCfg[1].varText = data.team1VS2Life .. '%'
		t_teamCfg[2].varText = data.turnsRecoveryRate .. '%'
		t_teamCfg[3].varText = s_teamLifeShare
		t_teamCfg[4].varText = data.numTurns
		t_teamCfg[5].varText = data.numSimul
		t_teamCfg[6].varText = data.simulType
		for i=1, #t_teamCfg do
			textImgDraw(t_teamCfg[i].id)
			if t_teamCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_teamCfg[i].varID, font2, 0, -1, t_teamCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+teamCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VIDEO SETTINGS
--;===========================================================
txt_videoCfg = createTextImg(jgFnt, 0, 0, 'VIDEO SETTINGS', 159, 13)
t_videoCfg = {
	{id = '', text = 'Resolution',  varID = textImgNew(), varText = resolutionWidth .. 'x' .. resolutionHeight},
	{id = '', text = 'Fullscreen',  varID = textImgNew(), varText = s_screenMode},	
	{id = '', text = 'OpenGL 2.0', varID = textImgNew(), varText = s_openGL},
	--{id = '', text = 'Save Memory', varID = textImgNew(), varText = s_saveMemory},
	{id = '', text = 'Back'},
}
for i=1, #t_videoCfg do
	t_videoCfg[i].id = createTextImg(font2, 0, 1, t_videoCfg[i].text, 85, 15+i*15)
end

function f_videoCfg()
	cmdInput()
	local videoCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			videoCfg = videoCfg - 1
			if videoCfg < 1 then videoCfg = #t_videoCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			videoCfg = videoCfg + 1
			if videoCfg > #t_videoCfg then videoCfg = 1 end
		--Resolution
		elseif videoCfg == 1 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 0)
			f_resCfg()
		--Fullscreen			
		elseif videoCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			sndPlay(sysSnd, 100, 0)
			if b_screenMode == false then
				b_screenMode = true
				s_screenMode = 'Yes'
				modified = 1	
			else
				b_screenMode = false
				s_screenMode = 'No'
				modified = 1
			end			
		--OpenGL 2.0
		elseif videoCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if b_openGL == false then
				b_openGL = true
				s_openGL = 'Yes'
				f_glWarning()
				modified = 1
				needReload = 1				
			else
				b_openGL = false
				s_openGL = 'No'
				modified = 1
				needReload = 0
			end
		--Save memory
		--elseif videoCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			--sndPlay(sysSnd, 100, 0)
			--if b_saveMemory == false then
				--b_saveMemory = true
				--s_saveMemory = 'Yes'
				--f_memWarning()
				--modified = 1
				--needReload = 1
			--else
				--b_saveMemory = false
				--s_saveMemory = 'No'
				--f_memWarning()
				--modified = 1
				--needReload = 1
			--end
		--Back
		elseif videoCfg == 4 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_videoCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_videoCfg)
		t_videoCfg[1].varText = resolutionWidth .. 'x' .. resolutionHeight
		t_videoCfg[2].varText = s_screenMode		
		t_videoCfg[3].varText = s_openGL
		--t_videoCfg[4].varText = s_saveMemory
		setScreenMode(b_screenMode) --added via system-script.ssz
		for i=1, #t_videoCfg do
			textImgDraw(t_videoCfg[i].id)
			if t_videoCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_videoCfg[i].varID, font2, 0, -1, t_videoCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+videoCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

txt_Warning = createTextImg(jgFnt, 0, 0, 'WARNING', 159, 13)
t_glWarning = {
	{id = '', text = "You won't be able to start the game if your system"},
	{id = '', text = "doesn't support OpenGL 2.0 or later."},
	{id = '', text = " "},	
	{id = '', text = "In such case, you will need to edit ssz/config.ssz:"},
	{id = '', text = "const bool OpenGL = false"},
}
for i=1, #t_glWarning do
	t_glWarning[i].id = createTextImg(font2, 0, 1, t_glWarning[i].text, 25, 15+i*15)
end
function f_glWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or esc() then
			sndPlay(sysSnd, 100, 0)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 20,20, 280,#t_glWarning*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_Warning)
		for i=1, #t_glWarning do
			textImgDraw(t_glWarning[i].id)
		end
		cmdInput()
		refresh()
	end
end

t_memWarning = {
	{id = '', text = "Enabling 'Save memory' option negatively affects FPS."},
	{id = '', text = "It's not yet known if disabling it has any drawbacks."},
}
for i=1, #t_memWarning do
	t_memWarning[i].id = createTextImg(font2, 0, 1, t_memWarning[i].text, 25, 15+i*15)
end
function f_memWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or esc() then
			sndPlay(sysSnd, 100, 0)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 20,20, 280,#t_memWarning*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_Warning)
		for i=1, #t_memWarning do
			textImgDraw(t_memWarning[i].id)
		end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; RESOLUTION SETTINGS
--;===========================================================
txt_resCfg = createTextImg(jgFnt, 0, 0, 'RESOLUTION SETTINGS', 159, 13)
t_resCfg = {
	{id = '', x = 320,  y = 240,  text = '320x240     (4:3 QVGA)'},
	{id = '', x = 512,  y = 384,  text = '512x384     (4:3 MACINTOSH)'},
	{id = '', x = 640,  y = 480,  text = '640x480     (4:3 VGA)'},
	{id = '', x = 800,  y = 600,  text = '800x600     (4:3 SVGA)'},
	{id = '', x = 960,  y = 720,  text = '960x720     (4:3 HD)'},
	{id = '', x = 1024, y = 768,  text = '1024x768    (4:3 XGA)'},
	{id = '', x = 1152, y = 864,  text = '1152x864    (4:3 XGA+)'},
	{id = '', x = 1200, y = 900,  text = '1200x900    (4:3 HD+)'},
	{id = '', x = 1280, y = 960,  text = '1280x960    (4:3 Quad-VGA)'},
	{id = '', x = 1440, y = 1080, text = '1440x1080   (4:3 FHD)'},
	{id = '', x = 1600, y = 1200, text = '1600x1200   (4:3 XGA)'},
	{id = '', x = 1920, y = 1440, text = '1920x1440   (4:3 UXGA+)'},
	{id = '', x = 2048, y = 1536, text = '2048x1536   (4:3 QXGA)'},
	{id = '', x = 3200, y = 2400, text = '3200x2400   (4:3 QUXGA)'},
	{id = '', x = 6400, y = 4800, text = '6400x4800   (4:3 HUXGA)'},
	{id = '', x = 1280, y = 720,  text = '1280x720    (16:9 HD)'},
	{id = '', x = 1600, y = 900,  text = '1600x900    (16:9 HD+)'},
	{id = '', x = 1920, y = 1080, text = '1920x1080   (16:9 FHD)'},
	{id = '', x = 2560, y = 1440, text = '2560x1440   (16:9 2K)'},
	{id = '', x = 3840, y = 2160, text = '3840x2160   (16:9 4K)'},
	{id = '', x = 1280, y = 800,  text = '1280x800    (16:10 WXGA)'},
	{id = '', x = 1440, y = 900,  text = '1440x900    (16:10 WXGA+)'},
	{id = '', x = 1680, y = 1050, text = '1680x1050   (16:10 WSXGA+)'},
	{id = '', x = 1920, y = 1200, text = '1920x1200   (16:10 WUXGA)'},
	{id = '', x = 2560, y = 1600, text = '2560x1600   (16:10 WQXGA)'},
	{id = '', x = 400,  y = 254,  text = '400x254     (Arcade)'},
	{id = '', x = 800,  y = 508,  text = '400x508     (Arcade x2)'},
	{id = '', x = 1200, y = 762,  text = '1200x762    (Arcade x3)'},
	{id = '', x = 1600, y = 1016, text = '1600x1016   (Arcade x4)'},
	{id = '', text = 'Back'},
}
for i=1, #t_resCfg do
	t_resCfg[i].id = createTextImg(font2, 0, 1, t_resCfg[i].text, 85, 15+i*15)
end

function f_resCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			resCfg = resCfg - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			resCfg = resCfg + 1
		end
		--Cursor position calculation
		if resCfg < 1 then
			resCfg = #t_resCfg
			if #t_resCfg > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_resCfg
			end
		elseif resCfg > #t_resCfg then
			resCfg = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (resCfg - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg - 1) * 15
		end
		--Options
		if btnPalNo(p1Cmd) > 0 then
			--Back
			if resCfg == #t_resCfg then
				sndPlay(sysSnd, 100, 2)
				break
			--Resolution
			else
				sndPlay(sysSnd, 100, 0)
				resolutionWidth = t_resCfg[resCfg].x
				resolutionHeight = t_resCfg[resCfg].y
				if (resolutionHeight / 3 * 4) ~= resolutionWidth then
					f_resWarning()
				end
				modified = 1
				needReload = 1
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		if moveTxt == 180 then
			animSetWindow(optionsBG1, 80,20, 160,210)
		else
			animSetWindow(optionsBG1, 80,20, 160,#t_resCfg*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_resCfg)
		for i=1, #t_resCfg do
			if i > resCfg - cursorPosY then
				textImgDraw(f_updateTextImg(t_resCfg[i].id, font2, 0, 1, t_resCfg[i].text, 85, 15+i*15-moveTxt))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

t_resWarning = {
	{id = '', text = "Non 4:3 resolutions requires stages coded for different"},
	{id = '', text = "aspect ratio. Change it back to 4:3 if stages look off."},
}
for i=1, #t_resWarning do
	t_resWarning[i].id = createTextImg(font2, 0, 1, t_resWarning[i].text, 25, 15+i*15)
end
function f_resWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or esc() then
			sndPlay(sysSnd, 100, 0)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 20,20, 280,#t_resWarning*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_Warning)
		for i=1, #t_resWarning do
			textImgDraw(t_resWarning[i].id)
		end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; AUDIO SETTINGS
--;===========================================================
txt_audioCfg = createTextImg(jgFnt, 0, 0, 'AUDIO SETTINGS', 159, 13)
t_audioCfg = {
	{id = '', text = 'Master Volume',	varID = textImgNew(), varText = gl_vol .. '%'},
	{id = '', text = 'SFX Volume',		varID = textImgNew(), varText = se_vol .. '%'},
	{id = '', text = 'BGM Volume',		varID = textImgNew(), varText = bgm_vol .. '%'},
	{id = '', text = 'Sample Rate',    varID = textImgNew(), varText = freq},
	{id = '', text = 'Channels',       varID = textImgNew(), varText = s_channels},
	{id = '', text = 'Buffer Samples', varID = textImgNew(), varText = buffer},
	{id = '', text = 'Back'},
}
for i=1, #t_audioCfg do
	t_audioCfg[i].id = createTextImg(font2, 0, 1, t_audioCfg[i].text, 85, 15+i*15)
end

function f_audioCfg()
	cmdInput()
	local audioCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			audioCfg = audioCfg - 1
			if audioCfg < 1 then audioCfg = #t_audioCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			audioCfg = audioCfg + 1
			if audioCfg > #t_audioCfg then audioCfg = 1 end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		--Master Volume
		elseif audioCfg == 1 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if gl_vol < 100 then
					gl_vol = gl_vol + 1
				else
					gl_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if gl_vol > 0 then
					gl_vol = gl_vol - 1
				else
					gl_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modified = 1
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
		elseif audioCfg == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if se_vol < 100 then
					se_vol = se_vol + 1
				else
					se_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if se_vol > 0 then
					se_vol = se_vol - 1
				else
					se_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modified = 1
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
		elseif audioCfg == 3 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if bgm_vol < 100 then
					bgm_vol = bgm_vol + 1
				else
					bgm_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if bgm_vol > 0 then
					bgm_vol = bgm_vol - 1
				else
					bgm_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sysSnd, 100, 0) end
				modified = 1
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
		--Sample Rate
		elseif audioCfg == 4 then
			if commandGetState(p1Cmd, 'r') and  freq < 96000 then
				sndPlay(sysSnd, 100, 0)
				if freq < 22050 then
					freq = 22050
				elseif freq < 44100 then
					freq = 44100
				elseif freq < 48000 then
					freq = 48000
				elseif freq < 64000 then
					freq = 64000
				elseif freq < 88200 then
					freq = 88200
				elseif freq < 96000 then
					freq = 96000
				end
				modified = 1
				needReload = 1
			elseif commandGetState(p1Cmd, 'l') and freq >= 22050 then
				sndPlay(sysSnd, 100, 0)
				if freq >= 96000 then
					freq = 88200
				elseif freq >= 88200 then
					freq = 64000
				elseif freq >= 64000 then
					freq = 48000
				elseif freq >= 48000 then
					freq = 44100
				elseif freq >= 44100 then
					freq = 22050
				elseif freq >= 22050 then
					freq = 11025
				end
				modified = 1
				needReload = 1
			end
		--Channels
		elseif audioCfg == 5 then
			if commandGetState(p1Cmd, 'r') and  channels < 6 then
				sndPlay(sysSnd, 100, 0)
				if channels < 2 then
					channels = 2
					s_channels = 'Stereo'
				elseif channels < 4 then
					channels = 4
					s_channels = 'Quad'
				elseif channels < 6 then
					channels = 6
					s_channels = '5.1'
				end
				modified = 1
				needReload = 1
			elseif commandGetState(p1Cmd, 'l') and channels >= 2 then
				sndPlay(sysSnd, 100, 0)
				if channels >= 6 then
					channels = 4
					s_channels = 'Quad'
				elseif channels >= 4 then
					channels = 2
					s_channels = 'Stereo'
				elseif channels >= 2 then
					channels = 1
					s_channels = 'Mono'
				end
				modified = 1
				needReload = 1
			end
		--Buffer Samples
		elseif audioCfg == 6 then
			if commandGetState(p1Cmd, 'r') and buffer < 8192 then
				sndPlay(sysSnd, 100, 0)
				buffer = buffer * 2
				modified = 1
				needReload = 1
			elseif commandGetState(p1Cmd, 'l') and buffer >= 1024 then
				sndPlay(sysSnd, 100, 0)
				buffer = buffer / 2
				modified = 1
				needReload = 1
			end
		--Back
		elseif audioCfg == 7 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_audioCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_audioCfg)
		t_audioCfg[1].varText = gl_vol .. '%'
		t_audioCfg[2].varText = se_vol .. '%'
		t_audioCfg[3].varText = bgm_vol .. '%'
		t_audioCfg[4].varText = freq
		t_audioCfg[5].varText = s_channels
		t_audioCfg[6].varText = buffer
		setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)		
		for i=1, #t_audioCfg do
			textImgDraw(t_audioCfg[i].id)
			if t_audioCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font2, 0, -1, t_audioCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+audioCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; INPUT SETTINGS
--;===========================================================
txt_inputCfg = createTextImg(jgFnt, 0, 0, 'INPUT SETTINGS', 159, 13)
t_inputCfg = {
	{id = '', text = 'Player 1 (Keyboard)'},
	{id = '', text = 'Player 2 (Keyboard)'},
	{id = '', text = 'Default Controls'},
	{id = '', text = 'Back'},
}
for i=1, #t_inputCfg do
	t_inputCfg[i].id = createTextImg(font2, 0, 1, t_inputCfg[i].text, 85, 15+i*15)
end

function f_inputCfg()
	cmdInput()
	local inputCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		end
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			inputCfg = inputCfg - 1
			if inputCfg < 1 then inputCfg = #t_inputCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			inputCfg = inputCfg + 1
			if inputCfg > #t_inputCfg then inputCfg = 1 end
		elseif btnPalNo(p1Cmd) > 0 then
			if inputCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				if data.p1Controller == -1 then
					f_keyRead(0, -1)
					f_keyCfg(0, -1)
				else
					f_keyRead(2, -1)
					f_keyCfg(2, -1)
				end
			elseif inputCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				if data.p2Controller == -1 then
					f_keyRead(1, -1)
					f_keyCfg(1, -1)
				else
					f_keyRead(3, -1)
					f_keyCfg(3, -1)
				end
			elseif inputCfg == 3 then
				sndPlay(sysSnd, 100, 1)
				f_inputDefault()
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_inputCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_inputCfg)
		for i=1, #t_inputCfg do
			textImgDraw(t_inputCfg[i].id)
			if t_inputCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_inputCfg[i].varID, font2, 0, -1, t_inputCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+inputCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

function f_swapController(playerOld, playerNew, controllerOld, controllerNew)
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerOld .. '%]%.set%(\n*%s*' .. controllerOld, 'in.new[' .. playerNew .. 'deleteMe].set(\n  ' .. controllerOld)
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNew .. '%]%.set%(\n*%s*' .. controllerNew, 'in.new[' .. playerOld .. '].set(\n  ' .. controllerNew)
	s_configSSZ = s_configSSZ:gsub('deleteMe', '')
end

txt_keyCfg = createTextImg(jgFnt, 0, 0, 'KEY SETTINGS', 159, 13)
t_keyCfg = {
	{id = '', text = 'Up',    varID = textImgNew(), varText = ''},
	{id = '', text = 'Down',  varID = textImgNew(), varText = ''},
	{id = '', text = 'Left',  varID = textImgNew(), varText = ''},
	{id = '', text = 'Right', varID = textImgNew(), varText = ''},
	{id = '', text = 'A',     varID = textImgNew(), varText = ''},
	{id = '', text = 'B',     varID = textImgNew(), varText = ''},
	{id = '', text = 'C',     varID = textImgNew(), varText = ''},
	{id = '', text = 'X',     varID = textImgNew(), varText = ''},
	{id = '', text = 'Y',     varID = textImgNew(), varText = ''},
	{id = '', text = 'Z',     varID = textImgNew(),	varText = ''},
	{id = '', text = 'Start', varID = textImgNew(),	varText = ''},
	{id = '', text = 'Back'},
}
for i=1, #t_keyCfg do
	t_keyCfg[i].id = createTextImg(font2, 0, 1, t_keyCfg[i].text, 85, 15+i*15)
end

function f_keyCfg(playerNo, controller)
	cmdInput()
	local keyCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			f_keySave(playerNo, controller)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			keyCfg = keyCfg - 1
			if keyCfg < 1 then keyCfg = #t_keyCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			keyCfg = keyCfg + 1
			if keyCfg > #t_keyCfg then keyCfg = 1 end
		end
		if btnPalNo(p1Cmd) > 0 then
			if keyCfg < #t_keyCfg then
				sndPlay(sysSnd, 100, 1)
				t_keyCfg[keyCfg].varText = f_readInput(t_keyCfg[keyCfg].varText)
			else
				sndPlay(sysSnd, 100, 2)
				f_keySave(playerNo, controller)
				break
			end
			modified = 1
			--needReload = 1
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_keyCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_keyCfg)
		for i=1, #t_keyCfg do
			textImgDraw(t_keyCfg[i].id)
			if t_keyCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_keyCfg[i].varID, font2, 0, -1, t_keyCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+keyCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

t_kpCfg = {
	{id = '', text = 'Keyboard'},
	{id = '', text = 'Keypad (Numpad)'},
}
for i=1, #t_kpCfg do
	t_kpCfg[i].id = createTextImg(font2, 0, 1, t_kpCfg[i].text, 85, 15+i*15)
end

function f_kpCfg(swap1, swap2)
	cmdInput()
	local kpCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return swap1
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			kpCfg = kpCfg - 1
			if kpCfg < 1 then kpCfg = #t_kpCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			kpCfg = kpCfg + 1
			if kpCfg > #t_kpCfg then kpCfg = 1 end
		end
		if btnPalNo(p1Cmd) > 0 then
			if kpCfg == 1 then
				return swap1
			else
				return swap2
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_kpCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_keyCfg)
		for i=1, #t_kpCfg do
			textImgDraw(t_kpCfg[i].id)
		end
		animSetWindow(cursorBox, 80,5+kpCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

function f_keyRead(playerNo, controller)
	local tmp = s_configSSZ:match('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);')
	local tmp = tmp:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
	local tmp = tmp:gsub('%(int%)k_t::([^,%s]*)%s*(,)\n*%s*', '%1%2')
	local tmp = tmp:gsub('%(int%)k_t::([^%)%s]*)%s*%);', '%1')
	for i, c
		in ipairs(script.randomtest.strsplit(',', tmp))
	do
		t_keyCfg[i].varText = c
	end
end

function f_padRead(playerNo, controller)
	local tmp = s_configSSZ:match('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);')
	local tmp = tmp:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
	local tmp = tmp:gsub('([^,%s]*)%s*(,)\n*%s*', '%1%2')
	local tmp = tmp:gsub('([^%)%s]*)%s*%);', '%1')
	for i, c
		in ipairs(script.randomtest.strsplit(',', tmp))
	do
		t_keyCfg[i].varText = c
	end
end

t_keySwap = {
	{key = '`',  swap1 = 'GRAVE'},
	{key = '=',  swap1 = 'EQUALS'},
	{key = '[',  swap1 = 'LEFTBRACKET'},
	{key = ']',  swap1 = 'RIGHTBRACKET'},
	{key = '\\', swap1 = 'BACKSLASH'},
	{key = ';',  swap1 = 'SEMICOLON'},
	{key = "'",  swap1 = 'APOSTROPHE'},
	{key = '*',  swap1 = 'KP_MULTIPLY'},
	{key = '+',  swap1 = 'KP_PLUS'},
	{key = '-',  swap1 = 'MINUS',  swap2 = 'KP_MINUS'},
	{key = ',',  swap1 = 'COMMA',  swap2 = 'KP_PERIOD'},
	{key = '.',  swap1 = 'PERIOD', swap2 = 'KP_PERIOD'},
	{key = '/',  swap1 = 'SLASH',  swap2 = 'KP_DIVIDE'},
	{key = '0',  swap1 = '0',      swap2 = 'KP_0'},
	{key = '1',  swap1 = '1',      swap2 = 'KP_1'},
	{key = '2',  swap1 = '2',      swap2 = 'KP_2'},
	{key = '3',  swap1 = '3',      swap2 = 'KP_3'},
	{key = '4',  swap1 = '4',      swap2 = 'KP_4'},
	{key = '5',  swap1 = '5',      swap2 = 'KP_5'},
	{key = '6',  swap1 = '6',      swap2 = 'KP_6'},
	{key = '7',  swap1 = '7',      swap2 = 'KP_7'},
	{key = '8',  swap1 = '8',      swap2 = 'KP_8'},
	{key = '9',  swap1 = '9',      swap2 = 'KP_9'},
}

function f_readInput(oldkey)
	getKeyboard = ''
	local readInput = 1
	while true do
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_keyCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_keyCfg)
		if getKeyboard == '' then
			for i=1, #t_newinput do
				textImgDraw(t_newinput[i].id)
			end
		end	
		for i=1, #t_keyCfg do
			textImgDraw(t_keyCfg[i].id)
			if t_keyCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_keyCfg[i].varID, font2, 0, -1, t_keyCfg[i].varText, 235, 15+i*15))
			end
		end	
		cmdInput()
		if upKey() then
			getKeyboard = 'UP'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if downKey() then
			getKeyboard = 'DOWN'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if leftKey() then
			getKeyboard = 'LEFT'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if rightKey() then
			getKeyboard = 'RIGHT'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if aKey() then
			getKeyboard = 'a'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if bKey() then
			getKeyboard = 'b'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if cKey() then
			getKeyboard = 'c'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if dKey() then
			getKeyboard = 'd'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if eKey() then
			getKeyboard = 'e'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if fKey() then
			getKeyboard = 'f'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if gKey() then
			getKeyboard = 'g'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if hKey() then
			getKeyboard = 'h'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if iKey() then
			getKeyboard = 'i'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if jKey() then
			getKeyboard = 'j'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if kKey() then
			getKeyboard = 'k'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if lKey() then
			getKeyboard = 'l'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if mKey() then
			getKeyboard = 'm'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if nKey() then
			getKeyboard = 'n'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if oKey() then
			getKeyboard = 'o'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if pKey() then
			getKeyboard = 'p'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if qKey() then
			getKeyboard = 'q'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if rKey() then
			getKeyboard = 'r'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if sKey() then
			getKeyboard = 's'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if tKey() then
			getKeyboard = 't'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if uKey() then
			getKeyboard = 'u'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if vKey() then
			getKeyboard = 'v'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if wKey() then
			getKeyboard = 'w'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if xKey() then
			getKeyboard = 'x'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if yKey() then
			getKeyboard = 'y'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if zKey() then
			getKeyboard = 'z'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if kzeroKey() then
			getKeyboard = 'KP_0'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if koneKey() then
			getKeyboard = 'KP_1'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if ktwoKey() then
			getKeyboard = 'KP_2'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if kthreeKey() then
			getKeyboard = 'KP_3'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if kfourKey() then
			getKeyboard = 'KP_4'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if kfiveKey() then
			getKeyboard = 'KP_5'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if ksixKey() then
			getKeyboard = 'KP_6'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if ksevenKey() then
			getKeyboard = 'KP_7'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if keightKey() then
			getKeyboard = 'KP_8'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if knineKey() then
			getKeyboard = 'KP_9'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if zeroKey() then
			getKeyboard = '_0'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if oneKey() then
			getKeyboard = '_1'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if twoKey() then
			getKeyboard = '_2'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if threeKey() then
			getKeyboard = '_3'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if fourKey() then
			getKeyboard = '_4'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if fiveKey() then
			getKeyboard = '_5'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if sixKey() then
			getKeyboard = '_6'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if sevenKey() then
			getKeyboard = '_7'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if eightKey() then
			getKeyboard = '_8'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if nineKey() then
			getKeyboard = '_9'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if returnKey() then
			getKeyboard = 'RETURN'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if lshiftKey() then
			getKeyboard = 'LSHIFT'
			sndPlay(sysSnd, 100, 1)
			break
			end
		if rshiftKey() then
			getKeyboard = 'RSHIFT'
			sndPlay(sysSnd, 100, 1)
			break
			end
        animDraw(data.fadeTitle)
	    animUpdate(data.fadeTitle)			
		refresh()
		end
	local key = getKeyboard
	return key
end

function f_keySave(playerNo, controller)
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+2 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo+2 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+4 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo+4 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+6 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo+6 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')		
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
	'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ', ' .. t_keyCfg[1].varText .. ', ' .. t_keyCfg[2].varText .. ', ' .. t_keyCfg[3].varText .. ', ' .. t_keyCfg[4].varText .. ', ' .. t_keyCfg[5].varText .. ', ' .. t_keyCfg[6].varText .. ', ' .. t_keyCfg[7].varText .. ', ' .. t_keyCfg[8].varText .. ', ' .. t_keyCfg[9].varText .. ', ' .. t_keyCfg[10].varText .. ', ' .. t_keyCfg[11].varText .. ');')
end

--;===========================================================
--; ENGINE SETTINGS
--;===========================================================
txt_engineCfg = createTextImg(jgFnt, 0, 0, 'ENGINE SETTINGS', 159, 13)
t_engineCfg = {
	{id = '', text = 'Game Speed',  	varID = textImgNew(), varText = s_gameSpeed},
	{id = '', text = 'Zoom Settings'},
	{id = '', text = 'Back'},
}
for i=1, #t_engineCfg do
	t_engineCfg[i].id = createTextImg(font2, 0, 1, t_engineCfg[i].text, 85, 15+i*15)
end

function f_engineCfg()
	cmdInput()
	local engineCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			engineCfg = engineCfg - 1
			if engineCfg < 1 then engineCfg = #t_engineCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			engineCfg = engineCfg + 1
			if engineCfg > #t_engineCfg then engineCfg = 1 end
		--Game Speed
		elseif engineCfg == 1 then
			if commandGetState(p1Cmd, 'r') and gameSpeed < 72 then
				sndPlay(sysSnd, 100, 0)
				if gameSpeed < 48 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				--elseif gameSpeed < 56 then
					--gameSpeed = 56
					--s_gameSpeed = '93.33%'
				elseif gameSpeed < 60 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				--elseif gameSpeed < 64 then
					--gameSpeed = 64
					--s_gameSpeed = '106.66%'
				elseif gameSpeed < 72 then
					gameSpeed = 72
					s_gameSpeed = 'Turbo'
				end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and gameSpeed > 48 then
				sndPlay(sysSnd, 100, 0)
				--if gameSpeed >= 72 then
					--gameSpeed = 64
					--s_gameSpeed = '106.66%'
				if gameSpeed >= 64 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				--elseif gameSpeed >= 60 then
					--gameSpeed = 56
					--s_gameSpeed = '93.33%'
				elseif gameSpeed >= 56 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				end
				modified = 1
			end
		--Zoom Settings
		elseif engineCfg == 2 and btnPalNo(p1Cmd) > 0 then	
			sndPlay(sysSnd, 100, 1)
			f_zoomCfg()		
		--Back
		elseif engineCfg == 3 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_engineCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_engineCfg)
		t_engineCfg[1].varText = s_gameSpeed
		for i=1, #t_engineCfg do
			textImgDraw(t_engineCfg[i].id)
			if t_engineCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_engineCfg[i].varID, font2, 0, -1, t_engineCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+engineCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ZOOM SETTINGS
--;===========================================================
txt_zoomCfg = createTextImg(jgFnt, 0, 0, 'ZOOM SETTINGS', 159, 13)
t_zoomCfg = {
	{id = '', text = 'Zoom Active',  varID = textImgNew(), varText = s_zoomActive},
	{id = '', text = 'Max Zoom Out', varID = textImgNew(), varText = data.zoomMin},
	{id = '', text = 'Max Zoom In',  varID = textImgNew(), varText = data.zoomMax},
	{id = '', text = 'Zoom Speed',   varID = textImgNew(), varText = data.zoomSpeed},
	{id = '', text = 'Back'},
}
for i=1, #t_zoomCfg do
	t_zoomCfg[i].id = createTextImg(font2, 0, 1, t_zoomCfg[i].text, 85, 15+i*15)
end

function f_zoomCfg()
	cmdInput()
	local zoomCfg = 1
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			zoomCfg = zoomCfg - 1
			if zoomCfg < 1 then zoomCfg = #t_zoomCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			zoomCfg = zoomCfg + 1
			if zoomCfg > #t_zoomCfg then zoomCfg = 1 end
		--Zoom Active
		elseif zoomCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.zoomActive then
				data.zoomActive = false
				s_zoomActive = 'No'
				modified = 1
			else
				data.zoomActive = true
				s_zoomActive = 'Yes'
				modified = 1
			end
		--Max Zoom Out
		elseif zoomCfg == 2 and data.zoomMin < 10 then
			if commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				data.zoomMin = data.zoomMin + 0.05
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomMin > 0.05 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMin = data.zoomMin - 0.05
				modified = 1
			end
		--Max Zoom In
		elseif zoomCfg == 3 then
			if commandGetState(p1Cmd, 'r') and data.zoomMax < 10 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMax = data.zoomMax + 0.05
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomMax > 0.05 then
				sndPlay(sysSnd, 100, 0)
				data.zoomMax = data.zoomMax - 0.05
				modified = 1
			end
		--Zoom Speed
		elseif zoomCfg == 4 then
			if commandGetState(p1Cmd, 'r') and data.zoomSpeed < 10 then
				sndPlay(sysSnd, 100, 0)
				data.zoomSpeed = data.zoomSpeed + 0.1
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.zoomSpeed > 0.1 then
				sndPlay(sysSnd, 100, 0)
				data.zoomSpeed = data.zoomSpeed - 0.1
				modified = 1
			end
		--Back
		elseif zoomCfg == 5 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_zoomCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_zoomCfg)
		t_zoomCfg[1].varText = s_zoomActive
		t_zoomCfg[2].varText = data.zoomMin
		t_zoomCfg[3].varText = data.zoomMax
		t_zoomCfg[4].varText = data.zoomSpeed
		for i=1, #t_zoomCfg do
			textImgDraw(t_zoomCfg[i].id)
			if t_zoomCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_zoomCfg[i].varID, font2, 0, -1, t_zoomCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+zoomCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end