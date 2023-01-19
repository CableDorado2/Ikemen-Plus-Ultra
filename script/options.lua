
module(..., package.seeall)

--;===========================================================
--; LOAD DATA
--;===========================================================
function f_loadCfg()
	--Data loading from data_sav.lua
	local file = io.open("saved/data_sav.lua","r")
	s_dataLUA = file:read("*all")
	file:close()

	--Data loading from config.ssz
	local file = io.open("ssz/config.ssz","r")
	s_configSSZ = file:read("*all")
	file:close()
	HelperMaxEngine = tonumber(s_configSSZ:match('const int HelperMax%s*=%s*(%d+)'))
	PlayerProjectileMaxEngine = tonumber(s_configSSZ:match('const int PlayerProjectileMax%s*=%s*(%d+)'))
	ExplodMaxEngine = tonumber(s_configSSZ:match('const int ExplodMax%s*=%s*(%d+)'))
	AfterImageMaxEngine = tonumber(s_configSSZ:match('const int AfterImageMax%s*=%s*(%d+)'))
	resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
	resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
	b_screenMode = s_configSSZ:match('const bool FullScreen%s*=%s*([^;%s]+)') == 'true' and true or false
	gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
	se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
	bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
	pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))
	gameSpeed = tonumber(s_configSSZ:match('const int GameSpeed%s*=%s*(%d+)'))
	b_saveMemory = s_configSSZ:match('const bool SaveMemory%s*=%s*([^;%s]+)')
	b_openGL = s_configSSZ:match('const bool OpenGL%s*=%s*([^;%s]+)')
end

function f_loadNETCfg()
	--Data loading from data_netsav.lua
	local file = io.open("saved/data_netsav.lua","r")
	s_dataLUA = file:read("*all")
	file:close()

	--Data loading from netconfig.ssz
	local file = io.open("ssz/netconfig.ssz","r")
	s_configSSZ = file:read("*all")
	file:close()
	HelperMaxEngine = tonumber(s_configSSZ:match('const int HelperMax%s*=%s*(%d+)'))
	PlayerProjectileMaxEngine = tonumber(s_configSSZ:match('const int PlayerProjectileMax%s*=%s*(%d+)'))
	ExplodMaxEngine = tonumber(s_configSSZ:match('const int ExplodMax%s*=%s*(%d+)'))
	AfterImageMaxEngine = tonumber(s_configSSZ:match('const int AfterImageMax%s*=%s*(%d+)'))
	resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
	resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
end

function f_loadEXCfg()
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

	--Data loading from sound.ssz
	local file = io.open("lib/sound.ssz","r")
	s_soundSSZ = file:read("*all")
	file:close()
	freq = tonumber(s_soundSSZ:match('const int Freq%s*=%s*(%d+)'))
	channels = tonumber(s_soundSSZ:match('const int Channels%s*=%s*(%d+)'))
	buffer = tonumber(s_soundSSZ:match('const int BufferSamples%s*=%s*(%d+)'))

	--Data loading from lifebar
	local file = io.open(data.lifebar,"r")
	s_lifebarDEF = file:read("*all")
	file:close()
	roundsNum = tonumber(s_lifebarDEF:match('match.wins%s*=%s*(%d+)'))
	drawNum = tonumber(s_lifebarDEF:match('match.maxdrawgames%s*=%s*(%d+)'))

	--Variable setting based on loaded data
	if gameSpeed == 48 then
		s_gameSpeed = 'Slow'
	elseif gameSpeed == 60 then
		s_gameSpeed = 'Normal'
	elseif gameSpeed == 72 then
		s_gameSpeed = 'Turbo'
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

	s_screenMode = b_screenMode and 'Yes' or 'No'

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

	if data.debugMode then
		s_debugMode = 'Enabled'
	else
		s_debugMode = 'Disabled'
	end

	if data.challengerScreen then
		s_challengerScreen = 'Yes'
	else
		s_challengerScreen = 'No'
	end

	if data.serviceScreen then
		s_serviceScreen = 'Yes'
	else
		s_serviceScreen = 'No'
	end
end

if onlinegame == false then
	f_loadCfg()
	f_loadEXCfg()
elseif onlinegame == true then
	f_loadNETCfg()
	f_loadEXCfg()
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
	--Data saving to data_sav.lua
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
		['data.contSelection'] = data.contSelection,
		['data.vsDisplayWin'] = data.vsDisplayWin,		
		['data.aiRamping'] = data.aiRamping,
		['data.autoguard'] = data.autoguard,
		['data.lifebar'] = data.lifebar,
		['data.sffConversion'] = data.sffConversion,
		['data.language'] = data.language,
		['data.menuSong'] = data.menuSong,
		['data.clock'] = data.clock,
		['data.date'] = data.date,
		['data.stageType'] = data.stageType,
		['data.winscreen'] = data.winscreen,
		['data.debugMode'] = data.debugMode,
		['data.challengerSong'] = data.challengerSong,
		['data.challengerScreen'] = data.challengerScreen,
		['data.charPresentation'] = data.charPresentation,
		['data.serviceScreen'] = data.serviceScreen,
		['data.training'] = data.training,
		['data.coopenemy'] = data.coopenemy
	}
	s_dataLUA = f_strSub(s_dataLUA, t_saves)
	local file = io.open("saved/data_sav.lua","w+")
	file:write(s_dataLUA)
	file:close()
	--Data saving to config.ssz
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
	s_configSSZ = s_configSSZ:gsub('const bool FullScreen%s*=%s*[^;%s]+', 'const bool FullScreen = ' .. tostring(b_screenMode))
	s_configSSZ = s_configSSZ:gsub('const int HelperMax%s*=%s*%d+', 'const int HelperMax = ' .. HelperMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int PlayerProjectileMax%s*=%s*%d+', 'const int PlayerProjectileMax = ' .. PlayerProjectileMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int ExplodMax%s*=%s*%d+', 'const int ExplodMax = ' .. ExplodMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int AfterImageMax%s*=%s*%d+', 'const int AfterImageMax = ' .. AfterImageMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int Width%s*=%s*%d+', 'const int Width = ' .. resolutionWidth)
	s_configSSZ = s_configSSZ:gsub('const int Height%s*=%s*%d+', 'const int Height = ' .. resolutionHeight)
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	s_configSSZ = s_configSSZ:gsub('const int GameSpeed%s*=%s*%d+', 'const int GameSpeed = ' .. gameSpeed)
	s_configSSZ = s_configSSZ:gsub('listenPort%s*=%s*"%w+"', 'listenPort = "' .. getListenPort() .. '"')
	s_configSSZ = s_configSSZ:gsub('UserName%s*=%s*"%w+"', 'UserName = "' .. getUserName() .. '"')
	local file = io.open("ssz/config.ssz","w+")
	file:write(s_configSSZ)
	file:close()
	--Data saving to sound.ssz
	s_soundSSZ = s_soundSSZ:gsub('const int Freq%s*=%s*%d+', 'const int Freq = ' .. freq)
	s_soundSSZ = s_soundSSZ:gsub('const int Channels%s*=%s*%d+', 'const int Channels = ' .. channels)
	s_soundSSZ = s_soundSSZ:gsub('const int BufferSamples%s*=%s*%d+', 'const int BufferSamples = ' .. buffer)
	local file = io.open("lib/sound.ssz","w+")
	file:write(s_soundSSZ)
	file:close()
	--Data saving to lifebar
	s_lifebarDEF = s_lifebarDEF:gsub('match.wins%s*=%s*%d+', 'match.wins = ' .. roundsNum)
	s_lifebarDEF = s_lifebarDEF:gsub('match.maxdrawgames%s*=%s*%d+', 'match.maxdrawgames = ' .. drawNum)
	local file = io.open(data.lifebar,"w+")
	file:write(s_lifebarDEF)
	file:close()
	--Reload lifebar
	loadLifebar(data.lifebar)
	--Reload game if needed
	if needReload == 1 then
		--os.execute ("TASKKILL /IM Ikemen DRP.exe /F")
		sszReload() --Native Reboot, added via ikemen.ssz
		os.exit()
	end
end

function f_netsaveCfg()
	--Data saving to data_netsav.lua
	local t_netsaves = {
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
		['data.difficulty'] = data.difficulty,
		['data.contSelection'] = data.contSelection,
		['data.vsDisplayWin'] = data.vsDisplayWin,		
		['data.aiRamping'] = data.aiRamping,
		['data.autoguard'] = data.autoguard,
		['data.lifebar'] = data.lifebar,
		['data.stageType'] = data.stageType,
		['data.winscreen'] = data.winscreen,
		['data.challengerScreen'] = data.challengerScreen,
		['data.charPresentation'] = data.charPresentation,
		['data.serviceScreen'] = data.serviceScreen,
		['data.coopenemy'] = data.coopenemy
	}
	s_dataLUA = f_strSub(s_dataLUA, t_netsaves)
	local file = io.open("saved/data_netsav.lua","w+")
	file:write(s_dataLUA)
	file:close()
	--Data saving to netconfig.ssz
	s_configSSZ = s_configSSZ:gsub('const int HelperMax%s*=%s*%d+', 'const int HelperMax = ' .. HelperMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int PlayerProjectileMax%s*=%s*%d+', 'const int PlayerProjectileMax = ' .. PlayerProjectileMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int ExplodMax%s*=%s*%d+', 'const int ExplodMax = ' .. ExplodMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int AfterImageMax%s*=%s*%d+', 'const int AfterImageMax = ' .. AfterImageMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int Width%s*=%s*%d+', 'const int Width = ' .. resolutionWidth)
	s_configSSZ = s_configSSZ:gsub('const int Height%s*=%s*%d+', 'const int Height = ' .. resolutionHeight)
	local file = io.open("ssz/netconfig.ssz","w+")
	file:write(s_configSSZ)
	file:close()
	--Data saving to lifebar
	s_lifebarDEF = s_lifebarDEF:gsub('match.wins%s*=%s*%d+', 'match.wins = ' .. roundsNum)
	s_lifebarDEF = s_lifebarDEF:gsub('match.maxdrawgames%s*=%s*%d+', 'match.maxdrawgames = ' .. drawNum)
	local file = io.open(data.lifebar,"w+")
	file:write(s_lifebarDEF)
	file:close()
	--Reload lifebar
	loadLifebar(data.lifebar)
end

--;===========================================================
--; INFO BOXES
--;===========================================================
txt_exitInfo = createTextImg(jgFnt, 0, 0, 'INFORMATION', 159, 13)
txt_Warning = createTextImg(jgFnt, 0, 0, 'WARNING', 159, 13)

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
		if btnPalNo(p1Cmd) > 0 then
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
	t_restart[i].id = createTextImg(font2, 0, -1, t_restart[i].text, 238, 180+i*15)
end

t_locked = {
	{id = '', text = "This option is Unavailable in Online Mode."},
}
for i=1, #t_locked do
	t_locked[i].id = createTextImg(font2, 0, -1, t_locked[i].text, 260, 210+i*15)
end

t_erase = {
	{id = '', text = "There's no have any data saved to delete."},
}
for i=1, #t_erase do
	t_erase[i].id = createTextImg(font2, 0, -1, t_erase[i].text, 261, 210+i*15)
end

--;===========================================================
--; LOAD DEFAULT DATA
--;===========================================================
--Set Offline game Default Options shared with Online game Below
function f_onlineDefault()
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
	data.difficulty = 8
	data.contSelection = true
	s_contSelection = 'Yes'
	data.aiRamping = true
	s_aiRamping = 'Yes'
	data.autoguard = false
	s_autoguard = 'No'
	data.vsDisplayWin = true
	s_vsDisplayWin = 'Yes'
	data.lifebar = 'data/screenpack/winmugen/fight.def'
	data.stageType = 'Classic'
	data.winscreen = 'Classic'
	data.debugMode = false
	s_debugMode = 'Disabled'
	data.challengerScreen = true
	s_challengerScreen = 'Yes'
	data.charPresentation = 'Sprite'
	data.sffConversion = true
	data.serviceScreen = true
	s_serviceScreen = 'Yes'
	data.training = 'Free'
	data.coopenemy = 'Simul'
	--lifebar
	roundsNum = 2
	drawNum = 2
	--config.ssz
	HelperMaxEngine = 56
	PlayerProjectileMaxEngine = 50
	ExplodMaxEngine = 256
	AfterImageMaxEngine = 8
	gameSpeed = 60
	s_gameSpeed = 'Normal'
end

--Set ONLY Offline Default Options Below
function f_offlineDefault()
	--saves.ini
	data.language = 'ENGLISH'
	data.menuSong = 'Random'
	data.clock = 'Standard'
	data.date = 'Type A'
	data.challengerSong = 'Fixed'
	data.p1Controller = -1
	data.p2Controller = -1
	--config.ssz
	f_inputDefault()
	--b_saveMemory = false
	--s_saveMemory = 'No'
	b_openGL = false
	s_openGL = 'No'
	b_screenMode = false
	s_screenMode = 'No'
	setScreenMode(b_screenMode)
	resolutionWidth = 853
	resolutionHeight = 480
	setGameRes(resolutionWidth,resolutionHeight)
	gl_vol = 100
	se_vol = 70
	bgm_vol = 30
	setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
	pan_str = 80
	setPanStr(pan_str / 100)
	--sound.ssz
	freq = 48000
	channels = 2
	s_channels = 'Stereo'
	buffer = 2048
	--other
	setUserName('MUGENUSER')
	setListenPort(7500)
end

--Default Inputs Values
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
	t_keyCfg[5].varText = 'a'
	t_keyCfg[6].varText = 's'
	t_keyCfg[7].varText = 'd'
	t_keyCfg[8].varText = 'z'
	t_keyCfg[9].varText = 'x'
	t_keyCfg[10].varText = 'c'
	t_keyCfg[11].varText = 'RETURN'
	f_keySave(0,-1)
	t_keyCfg[1].varText = 'KP_5'
	t_keyCfg[2].varText = 'KP_2'
	t_keyCfg[3].varText = 'KP_1'
	t_keyCfg[4].varText = 'KP_3'
	t_keyCfg[5].varText = 'u'
	t_keyCfg[6].varText = 'i'
	t_keyCfg[7].varText = 'o'
	t_keyCfg[8].varText = 'j'
	t_keyCfg[9].varText = 'k'
	t_keyCfg[10].varText = 'l'
	t_keyCfg[11].varText = 'KP_0'
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
--; MAIN OPTIONS LOOP
--;===========================================================
txt_mainCfg = createTextImg(jgFnt, 0, 0, 'OPTIONS', 159, 13)

t_mainCfg = {
	{id = '', text = 'Gameplay Settings'},
	{id = '', text = 'Screenpack Settings'},
	{id = '', text = 'Video Settings'},
	{id = '', text = 'Audio Settings'},
	{id = '', text = 'Input Settings'},
	{id = '', text = 'Engine Settings'},	
	{id = '', text = 'Player Name',        varID = textImgNew(), varText = getUserName()}, --set and get UserName added via system-script.ssz
	{id = '', text = 'Port Change',        varID = textImgNew(), varText = getListenPort()},
	{id = '', text = 'Default Values'},
	{id = '', text = '              Save and Back'},
	{id = '', text = '          Back Without Saving'},
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
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			if data.erase == true then
				f_saveUnlockData()
			end
			if needReload == 1 then
				f_exitInfo()
			end
			f_saveCfg()
			return
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			mainCfg = mainCfg - 1
			if mainCfg < 1 then mainCfg = #t_mainCfg end		
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			mainCfg = mainCfg + 1
			if mainCfg > #t_mainCfg then mainCfg = 1 end
		--Player Name
		elseif mainCfg == 7 and (btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 1)
			inputDialogPopup(inputdia, 'Introduce an Username')
			while not inputDialogIsDone(inputdia) do
				animDraw(f_animVelocity(optionsBG0, -1, -1))
				refresh()
			end
			local playerName = inputDialogGetStr(inputdia)
			if playerName == '' then --if the field is empty
				setUserName('MUGENUSER') --set a default username
				modified = 1
			else
				setUserName(inputDialogGetStr(inputdia)) --set username introduced
				modified = 1
			end
			setUserName(inputDialogGetStr(inputdia))
			modified = 1
		--Port Change
		elseif mainCfg == 8 and (btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 1)
			inputDialogPopup(inputdia, 'Introduce a new Port (Default: 7500)')
			while not inputDialogIsDone(inputdia) do
				animDraw(f_animVelocity(optionsBG0, -1, -1))
				refresh()
			end
			local onlinePort = inputDialogGetStr(inputdia)
			if onlinePort == '' then
				setListenPort('7500')
				modified = 1
			else
				setListenPort(inputDialogGetStr(inputdia))
				modified = 1
			end
			setListenPort(inputDialogGetStr(inputdia))
			modified = 1	
		elseif btnPalNo(p1Cmd) > 0 then
			--Gameplay Settings
			if mainCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				f_gameCfg()
			--Screenpack Settings
			elseif mainCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				f_UICfg()	
			--Video Settings
			elseif mainCfg == 3 then
				sndPlay(sysSnd, 100, 1)
				f_videoCfg()
			--Audio Settings
			elseif mainCfg == 4 then
				sndPlay(sysSnd, 100, 1)
				f_audioCfg()
			--Input Settings
			elseif mainCfg == 5 then
				sndPlay(sysSnd, 100, 1)
				f_inputCfg()
			--Engine Settings
			elseif mainCfg == 6 then
				sndPlay(sysSnd, 100, 1)
				f_engineCfg()	
			--Default Values
			elseif mainCfg == 9 then
				sndPlay(sysSnd, 100, 1)
				f_onlineDefault() --Set Default Options for Online/Offline Game
				f_offlineDefault() --Set ONLY Default Options for Offline Game
				modified = 1
				needReload = 1
			--Save and Back
			elseif mainCfg == 10 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				if data.erase == true then
					f_saveUnlockData()
				end
				if needReload == 1 then
					f_exitInfo()
				end
				f_saveCfg()
				break	
			--Back Without Save
			else
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				assert(loadfile('saved/data_sav.lua'))() --Load old data no saved
				assert(loadfile('saved/stats_sav.lua'))() --Load old data no saved
				f_loadCfg()
				f_loadEXCfg()
				setScreenMode(b_screenMode)
				setGameRes(resolutionWidth,resolutionHeight)
				setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
				setPanStr(pan_str / 100)
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
		t_mainCfg[7].varText = getUserName()
		t_mainCfg[8].varText = getListenPort()
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

--;===========================================================
--; ONLINE SETTINGS LOOP
--;===========================================================
txt_onlineCfg = createTextImg(jgFnt, 0, 0, 'ONLINE SETTINGS', 159, 13)

t_onlineCfg = {
	{id = '', text = 'Gameplay Settings'},
	{id = '', text = 'Screenpack Settings'},
	{id = '', text = 'Video Settings'},
	{id = '', text = 'Engine Settings'},
	{id = '', text = '      SAVE AND PLAY'},
}
for i=1, #t_onlineCfg do
	t_onlineCfg[i].id = createTextImg(font2, 0, 1, t_onlineCfg[i].text, 85, 15+i*15)
end

function f_onlineCfg()
	cmdInput()
	local onlineCfg = 1	
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			onlineCfg = onlineCfg - 1
			if onlineCfg < 1 then onlineCfg = #t_onlineCfg end		
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			onlineCfg = onlineCfg + 1
			if onlineCfg > #t_onlineCfg then onlineCfg = 1 end	
		elseif btnPalNo(p1Cmd) > 0 then
			--Gameplay Settings
			if onlineCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				f_gameCfg()
			--Screenpack Settings
			elseif onlineCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				f_UICfg()	
			--Video Settings
			elseif onlineCfg == 3 then
				--sndPlay(sysSnd, 100, 1)
				--f_videoCfg()
			--Engine Settings
			elseif onlineCfg == 4 then
				sndPlay(sysSnd, 100, 1)
				f_engineCfg()	
			--Save and Play
			elseif onlineCfg == 5 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				if modified == 1 then
					f_netsaveCfg()
				end
				if netPlayer == 'Host' then --Declared in main.lua
					f_mainHost()
				elseif netPlayer == 'Client' then --Declared in main.lua
					f_mainJoin()
				end	
				break
			end			
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_onlineCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_onlineCfg)
		for i=1, #t_onlineCfg do
			textImgDraw(t_onlineCfg[i].id)
			if t_onlineCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_onlineCfg[i].varID, font2, 0, -1, t_onlineCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+onlineCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
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
	{id = '', text = 'AI ramping',               varID = textImgNew(), varText = s_aiRamping},
	{id = '', text = 'Auto-Guard',               varID = textImgNew(), varText = s_autoguard},
	{id = '', text = 'Game Speed',  	         varID = textImgNew(), varText = s_gameSpeed},
	{id = '', text = 'Training Character',  	 varID = textImgNew(), varText = data.training},
	{id = '', text = 'Team Settings'},
	{id = '', text = 'Zoom Settings'},
	{id = '', text = '          BACK'},
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
			lockSetting = false --Boolean to remove the Lock setting message, if the above or below option is available for online settings
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			lockSetting = false --Boolean to remove the Lock setting message, if the above or below option is available for online settings
			sndPlay(sysSnd, 100, 0)
			gameCfg = gameCfg - 1
			if gameCfg < 1 then gameCfg = #t_gameCfg end
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		elseif commandGetState(p1Cmd, 'd') then
			lockSetting = false --Boolean to remove the Lock setting message, if the above or below option is available for online settings
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
			if commandGetState(p1Cmd, 'r') and roundsNum < 5 then
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
			if commandGetState(p1Cmd, 'r') and drawNum < 2 then
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
		--AI ramping
		elseif gameCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
		elseif gameCfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
		--Game Speed
		elseif gameCfg == 8 then
		if onlinegame == true then --Detects if this option needs to be locked in online settings
			lockSetting = true --Boolean to show a Lock setting message
		elseif onlinegame == false then --allow use the option offline
			if commandGetState(p1Cmd, 'r') and gameSpeed < 72 then
				sndPlay(sysSnd, 100, 0)
				if gameSpeed < 48 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				elseif gameSpeed < 60 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				elseif gameSpeed < 72 then
					gameSpeed = 72
					s_gameSpeed = 'Turbo'
				end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and gameSpeed > 48 then
				sndPlay(sysSnd, 100, 0)
				if gameSpeed >= 64 then
					gameSpeed = 60
					s_gameSpeed = 'Normal'
				elseif gameSpeed >= 56 then
					gameSpeed = 48
					s_gameSpeed = 'Slow'
				end
				modified = 1
			end
		end
		--Training Character
		elseif gameCfg == 9 then
		if onlinegame == true then
			lockSetting = true
		elseif onlinegame == false then
			if (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				sndPlay(sysSnd, 100, 0)
				if commandGetState(p1Cmd, 'r') and data.training == 'Free' then
					data.training = 'Fixed'
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.training == 'Fixed' then
					data.training = 'Free'
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.training == 'Free' then
					data.training = 'Fixed'
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.training == 'Fixed' then
					data.training = 'Free'
					modified = 1
				end
			end
		end
		--Team Settings
		elseif gameCfg == 10 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			f_teamCfg()
		--Zoom Settings
		elseif gameCfg == 11 and btnPalNo(p1Cmd) > 0 then	
			sndPlay(sysSnd, 100, 1)
			f_zoomCfg()
		--Back
		elseif gameCfg == 12 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end	
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_gameCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_gameCfg)
		if lockSetting == true then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end	
		t_gameCfg[1].varText = data.difficulty
		if data.roundTime ~= -1 then
			t_gameCfg[2].varText = data.roundTime
		else
			t_gameCfg[2].varText = 'Infinite'
		end
		t_gameCfg[3].varText = roundsNum
		t_gameCfg[4].varText = drawNum		
		t_gameCfg[5].varText = data.lifeMul .. '%'			
		t_gameCfg[6].varText = s_aiRamping
		t_gameCfg[7].varText = s_autoguard
		t_gameCfg[8].varText = s_gameSpeed
		t_gameCfg[9].varText = data.training
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
	{id = '', text = 'Turns Players Limit',     varID = textImgNew(), varText = data.numTurns},
	{id = '', text = 'Simul Players Limit',     varID = textImgNew(), varText = data.numSimul},
	{id = '', text = 'Simul Type',              varID = textImgNew(), varText = data.simulType},
	{id = '', text = 'Co-op CPU Team',          varID = textImgNew(), varText = data.coopenemy},
	{id = '', text = '          BACK'},
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
		--P1 Vs Team Life
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
		--Co-op CPU Team Mode
		elseif teamCfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.coopenemy == 'Single' then
				data.coopenemy = 'Simul'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.coopenemy == 'Simul' then
				data.coopenemy = 'Turns'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.coopenemy == 'Turns' then
				data.coopenemy = 'Single'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.coopenemy == 'Single' then
				data.coopenemy = 'Turns'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.coopenemy == 'Simul' then
				data.coopenemy = 'Single'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.coopenemy == 'Turns' then
				data.coopenemy = 'Simul'
				modified = 1
			end
		--Back
		elseif teamCfg == 8 and btnPalNo(p1Cmd) > 0 then
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
		t_teamCfg[7].varText = data.coopenemy
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
--; ZOOM SETTINGS
--;===========================================================
txt_zoomCfg = createTextImg(jgFnt, 0, 0, 'ZOOM SETTINGS', 159, 13)

t_zoomCfg = {
	{id = '', text = 'Zoom Active',  varID = textImgNew(), varText = s_zoomActive},
	{id = '', text = 'Max Zoom Out', varID = textImgNew(), varText = data.zoomMin},
	{id = '', text = 'Max Zoom In',  varID = textImgNew(), varText = data.zoomMax},
	{id = '', text = 'Zoom Speed',   varID = textImgNew(), varText = data.zoomSpeed},
	{id = '', text = '          BACK'},
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
		elseif zoomCfg == 3 and data.zoomMax < 10 then
			if commandGetState(p1Cmd, 'r') then
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

--;===========================================================
--; SCREENPACK SETTINGS
--;===========================================================
txt_UICfg = createTextImg(jgFnt, 0, 0, 'USER INTERFACE SETTINGS', 159, 13)

t_UICfg = {
	{id = '', text = 'Language', 		         varID = textImgNew(), varText = data.language},
	{id = '', text = 'Clock Format',             varID = textImgNew(), varText = data.clock},
	{id = '', text = 'Date Format',            	 varID = textImgNew(), varText = data.date},
	{id = '', text = 'Versus Win Counter',  	 varID = textImgNew(), varText = s_vsDisplayWin},
	{id = '', text = 'Char Presentation',        varID = textImgNew(), varText = data.charPresentation},
	{id = '', text = 'Stage Select Type',        varID = textImgNew(), varText = data.stageType},
	{id = '', text = 'Win Screen Type',    		 varID = textImgNew(), varText = data.winscreen},
	{id = '', text = 'New Challenger Screen',	 varID = textImgNew(), varText = s_challengerScreen},
	{id = '', text = 'Char change at Continue',  varID = textImgNew(), varText = s_contSelection},
	{id = '', text = 'Service Screen',	   	     varID = textImgNew(), varText = s_serviceScreen},
	{id = '', text = '          BACK'},
}
for i=1, #t_UICfg do
	t_UICfg[i].id = createTextImg(font2, 0, 1, t_UICfg[i].text, 85, 15+i*15)
end

function f_UICfg()
	cmdInput()
	local UICfg = 1
	while true do
		if esc() then
			lockSetting = false
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			lockSetting = false
			sndPlay(sysSnd, 100, 0)
			UICfg = UICfg - 1
			if UICfg < 1 then UICfg = #t_UICfg end
		elseif commandGetState(p1Cmd, 'd') then
			lockSetting = false
			sndPlay(sysSnd, 100, 0)
			UICfg = UICfg + 1
			if UICfg > #t_UICfg then UICfg = 1 end
		--Language Settings
		elseif UICfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
		if onlinegame == true then
				lockSetting = true
		elseif onlinegame == false then
			sndPlay(sysSnd, 100, 0)
			--if commandGetState(p1Cmd, 'r') and data.language == 'ENGLISH' then
				--data.language = 'SPANISH'
				--modified = 1
				--needReload = 1
			--elseif commandGetState(p1Cmd, 'r') and data.language == 'SPANISH' then
				--data.language = 'JAPANESE'
				--modified = 1
				--needReload = 1
			--elseif commandGetState(p1Cmd, 'r') and data.language == 'JAPANESE' then
				--data.language = 'ENGLISH'
				--modified = 1
				--needReload = 1	
			--elseif commandGetState(p1Cmd, 'l') and data.language == 'ENGLISH' then
				--data.language = 'JAPANESE'
				--modified = 1
				--needReload = 1
			--elseif commandGetState(p1Cmd, 'l') and data.language == 'SPANISH' then
				--data.language = 'ENGLISH'
				--modified = 1
				--needReload = 1
			--elseif commandGetState(p1Cmd, 'l') and data.language == 'JAPANESE' then
				--data.language = 'SPANISH'
				--modified = 1
				--needReload = 1
			--end
		end
		--Clock Display
		elseif UICfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
		if onlinegame == true then
			lockSetting = true
		elseif onlinegame == false then	
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.clock == 'Standard' then
				data.clock = 'Full Standard'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.clock == 'Full Standard' then
				data.clock = 'Military'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.clock == 'Military' then
				data.clock = 'Full Military'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.clock == 'Full Military' then
				data.clock = 'Standard'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.clock == 'Standard' then
				data.clock = 'Full Military'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.clock == 'Full Standard' then
				data.clock = 'Standard'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.clock == 'Military' then
				data.clock = 'Full Standard'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.clock == 'Full Military' then
				data.clock = 'Military'
				modified = 1
			end
		end
		--Date Display
		elseif UICfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
		if onlinegame == true then
			lockSetting = true
		elseif onlinegame == false then	
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.date == 'Type A' then
				data.date = 'Type B'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.date == 'Type B' then
				data.date = 'Type C'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.date == 'Type C' then
				data.date = 'Type D'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.date == 'Type D' then
				data.date = 'Type E'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.date == 'Type E' then
				data.date = 'Type A'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.date == 'Type A' then
				data.date = 'Type E'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.date == 'Type B' then
				data.date = 'Type A'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.date == 'Type C' then
				data.date = 'Type B'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.date == 'Type D' then
				data.date = 'Type C'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.date == 'Type E' then
				data.date = 'Type D'
				modified = 1
			end
		end
		--Display Versus Win Counter
		elseif UICfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
		--Character Presentation Display Type
		elseif UICfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.charPresentation == 'Portrait' then
				data.charPresentation = 'Sprite'
				data.sffConversion = true
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.charPresentation == 'Sprite' then
				data.charPresentation = 'Mixed'
				data.sffConversion = true
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.charPresentation == 'Mixed' then
				data.charPresentation = 'Portrait'
				data.sffConversion = false
				modified = 1	
			elseif commandGetState(p1Cmd, 'l') and data.charPresentation == 'Portrait' then
				data.charPresentation = 'Mixed'
				data.sffConversion = true
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.charPresentation == 'Sprite' then
				data.charPresentation = 'Portrait'
				data.sffConversion = false
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.charPresentation == 'Mixed' then
				data.charPresentation = 'Sprite'
				data.sffConversion = true
				modified = 1	
			end
		--Stage Select Display Type
		elseif UICfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.stageType == 'Classic' then
				data.stageType = 'Modern'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.stageType == 'Modern' then
				data.stageType = 'Classic'
				--data.stageType = 'Chart' (SF X TK)
				modified = 1
			--elseif commandGetState(p1Cmd, 'r') and data.stageType == 'Chart' then
				--data.stageType = 'Classic'
				--modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.stageType == 'Classic' then
				data.stageType = 'Modern'
				--data.stageType = 'Chart'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.stageType == 'Modern' then
				data.stageType = 'Classic'
				modified = 1
			--elseif commandGetState(p1Cmd, 'l') and data.stageType == 'Chart' then
				--data.stageType = 'Modern'
				--modified = 1
			end
		--Win Screen Display Type
		elseif UICfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.winscreen == 'Classic' then
				data.winscreen = 'Modern'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.winscreen == 'Modern' then
				data.winscreen = 'Fixed'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.winscreen == 'Fixed' then
				data.winscreen = 'None'
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.winscreen == 'None' then
				data.winscreen = 'Classic'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.winscreen == 'Classic' then
				data.winscreen = 'None'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.winscreen == 'Modern' then
				data.winscreen = 'Classic'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.winscreen == 'Fixed' then
				data.winscreen = 'Modern'
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.winscreen == 'None' then
				data.winscreen = 'Fixed'
				modified = 1
			end
		--New Challenger Screen Display
		elseif UICfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.challengerScreen then
				data.challengerScreen = false
				s_challengerScreen = 'No'
				modified = 1
			else
				data.challengerScreen = true
				s_challengerScreen = 'Yes'
				modified = 1
			end
		--Char change at Continue
		elseif UICfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
		--Service Screen Display
		elseif UICfg == 10 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			sndPlay(sysSnd, 100, 0)
			if data.serviceScreen then
				data.serviceScreen = false
				s_serviceScreen = 'No'
				modified = 1
			else
				data.serviceScreen = true
				s_serviceScreen = 'Yes'
				modified = 1
			end	
		--Back
		elseif UICfg == 11 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_UICfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_UICfg)
		if lockSetting == true then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end	
		t_UICfg[1].varText = data.language
		t_UICfg[2].varText = data.clock
		t_UICfg[3].varText = data.date
		t_UICfg[4].varText = s_vsDisplayWin
		t_UICfg[5].varText = data.charPresentation
		t_UICfg[6].varText = data.stageType
		t_UICfg[7].varText = data.winscreen
		t_UICfg[8].varText = s_challengerScreen
		t_UICfg[9].varText = s_contSelection	
		t_UICfg[10].varText = s_serviceScreen
		for i=1, #t_UICfg do
			textImgDraw(t_UICfg[i].id)
			if t_UICfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_UICfg[i].varID, font2, 0, -1, t_UICfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+UICfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ENGINE SETTINGS
--;===========================================================
txt_engineCfg = createTextImg(jgFnt, 0, 0, 'ENGINE SETTINGS', 159, 13)

t_engineCfg = {
	{id = '', text = 'Debug Mode',  	      varID = textImgNew(), varText = s_debugMode},
	{id = '', text = 'HelperMax',             varID = textImgNew(), varText = HelperMaxEngine},
	{id = '', text = 'PlayerProjectileMax',	  varID = textImgNew(), varText = PlayerProjectileMaxEngine},
	{id = '', text = 'ExplodMax',             varID = textImgNew(), varText = ExplodMaxEngine},
	{id = '', text = 'AfterImageMax',         varID = textImgNew(), varText = AfterImageMaxEngine},
	{id = '', text = 'Erase/Reset Statistics'},
	{id = '', text = '          BACK'},
}
for i=1, #t_engineCfg do
	t_engineCfg[i].id = createTextImg(font2, 0, 1, t_engineCfg[i].text, 85, 15+i*15)
end

function f_engineCfg()
	cmdInput()
	local engineCfg = 1
	while true do
		if esc() then
			lockSetting = false
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			lockSetting = false
			eraseStatus = true
			sndPlay(sysSnd, 100, 0)
			engineCfg = engineCfg - 1
			if engineCfg < 1 then engineCfg = #t_engineCfg end
			if bufl then bufl = 0 end --New
			if bufr then bufr = 0 end --New
		elseif commandGetState(p1Cmd, 'd') then
			lockSetting = false
			eraseStatus = true
			sndPlay(sysSnd, 100, 0)
			engineCfg = engineCfg + 1
			if engineCfg > #t_engineCfg then engineCfg = 1 end
			if bufl then bufl = 0 end --New
			if bufr then bufr = 0 end --New					
		--Debug Mode
		elseif engineCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
		if onlinegame == true then
			lockSetting = true
		elseif onlinegame == false then	
			sndPlay(sysSnd, 100, 0)
			if data.debugMode then
				data.debugMode = false
				s_debugMode = 'Disabled'
				modified = 1
			else
				data.debugMode = true
				s_debugMode = 'Enabled'
				modified = 1
			end
		end
		--HelperMax
		elseif engineCfg == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if HelperMaxEngine < 1000 then --You can increase this limit
					HelperMaxEngine = HelperMaxEngine + 1
				else
					HelperMaxEngine = 56 --Minimum Value
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if HelperMaxEngine > 56 then --Minimum Value
					HelperMaxEngine = HelperMaxEngine - 1
				else
					HelperMaxEngine = 1000 --You can increase this limit
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
		--PlayerProjectileMax
		elseif engineCfg == 3 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if PlayerProjectileMaxEngine < 1000 then --You can increase this limit
					PlayerProjectileMaxEngine = PlayerProjectileMaxEngine + 1
				else
					PlayerProjectileMaxEngine = 50 --Minimum Value
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if PlayerProjectileMaxEngine > 50 then --Minimum Value
					PlayerProjectileMaxEngine = PlayerProjectileMaxEngine - 1
				else
					PlayerProjectileMaxEngine = 1000 --You can increase this limit
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
		--ExplodMax
		elseif engineCfg == 4 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if ExplodMaxEngine < 1000 then --You can increase this limit
					ExplodMaxEngine = ExplodMaxEngine + 1
				else
					ExplodMaxEngine = 128 --Minimum Value
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if ExplodMaxEngine > 128 then --Minimum Value
					ExplodMaxEngine = ExplodMaxEngine - 1
				else
					ExplodMaxEngine = 1000 --You can increase this limit
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
		--AfterImageMax
		elseif engineCfg == 5 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if AfterImageMaxEngine < 1000 then --You can increase this limit
					AfterImageMaxEngine = AfterImageMaxEngine + 1
				else
					AfterImageMaxEngine = 8 --Minimum Value
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sysSnd, 100, 0) end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if AfterImageMaxEngine > 8 then --Minimum Value
					AfterImageMaxEngine = AfterImageMaxEngine - 1
				else
					AfterImageMaxEngine = 1000 --You can increase this limit
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
		--Erase/Reset Statistics
		elseif engineCfg == 6 and btnPalNo(p1Cmd) > 0 then	
		if onlinegame == true then
			lockSetting = true
		elseif onlinegame == false then	
			if data.arcadeUnlocks == false and data.survivalUnlocks == false then --This means that at least you have some progress saved
				eraseStatus = false
			elseif data.arcadeUnlocks == true or data.survivalUnlocks == true then
				sndPlay(sysSnd, 100, 1)
				f_unlocksWarning()
			end
		end
		--Back
		elseif engineCfg == 7 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_engineCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_engineCfg)
		if lockSetting == true then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end	
		if eraseStatus == false then
			for i=1, #t_erase do
				textImgDraw(t_erase[i].id)
			end
		end
		t_engineCfg[1].varText = s_debugMode
		t_engineCfg[2].varText = HelperMaxEngine
		t_engineCfg[3].varText = PlayerProjectileMaxEngine
		t_engineCfg[4].varText = ExplodMaxEngine
		t_engineCfg[5].varText = AfterImageMaxEngine
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
--; ERASE/RESET STATISTICS DATA WARNING
--;===========================================================
t_unlocksWarning = {
	{id = '', text = "   All unlocked data or progress will be delete."},
	{id = '', text = "   Press ESC to Cancel or Press Enter to Accept."},
}
for i=1, #t_unlocksWarning do
	t_unlocksWarning[i].id = createTextImg(font2, 0, 1, t_unlocksWarning[i].text, 25, 15+i*15)
end

function f_unlocksWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			data.arcadeUnlocks = false
			data.survivalUnlocks = false
			data.coins = 0
			data.mission1Status = 0
			data.mission2Status = 0
			data.mission3Status = 0
			data.mission4Status = 0
			data.mission5Status = 0
			data.mission6Status = 0
			data.erase = true
			modified = 1
			break
		elseif esc() then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 20,20, 280,#t_unlocksWarning*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_Warning)
		for i=1, #t_unlocksWarning do
			textImgDraw(t_unlocksWarning[i].id)
		end
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
	--{id = '', text = 'OpenGL 2.0', varID = textImgNew(), varText = s_openGL},
	--{id = '', text = 'Save Memory', varID = textImgNew(), varText = s_saveMemory},
	{id = '', text = '          BACK'},
}
for i=1, #t_videoCfg do
	t_videoCfg[i].id = createTextImg(font2, 0, 1, t_videoCfg[i].text, 85, 15+i*15)
end

function f_videoCfg()
	cmdInput()
	local videoCfg = 1
	local hasChanged = true
	while true do
		if b_screenMode ~= getScreenMode() then
			if getScreenMode() then
				b_screenMode = true
				s_screenMode = 'Yes'
			else
				b_screenMode = false
				s_screenMode = 'No'
			end
			t_videoCfg[2].varText = s_screenMode
			modified = 1
		end
		if esc() then
			sndPlay(sysSnd, 100, 2)
			lockSetting = false
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			lockSetting = false
			videoCfg = videoCfg - 1
			if videoCfg < 1 then videoCfg = #t_videoCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			lockSetting = false
			videoCfg = videoCfg + 1
			if videoCfg > #t_videoCfg then videoCfg = 1 end
		--Resolution
		elseif videoCfg == 1 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 1)
			if f_resCfg() then
				modified = 1
				hasChanged = true
			end
		--Fullscreen			
		elseif videoCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
		if onlinegame == true then
			lockSetting = true
		elseif onlinegame == false then
			sndPlay(sysSnd, 100, 0)
			if not b_screenMode then
				b_screenMode = true
				s_screenMode = 'Yes'
			else
				b_screenMode = false
				s_screenMode = 'No'
			end
			modified = 1
			setScreenMode(b_screenMode) --added via system-script.ssz
			hasChanged = true
		end
		--OpenGL 2.0
		--elseif videoCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
			--sndPlay(sysSnd, 100, 0)
			--if b_openGL == false then
				--b_openGL = true
				--s_openGL = 'Yes'
				--f_glWarning()
				--modified = 1
				--needReload = 1				
			--else
				--b_openGL = false
				--s_openGL = 'No'
				--modified = 1
				--needReload = 0
			--end
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
		elseif videoCfg == 3 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_videoCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_videoCfg)
		t_videoCfg[1].varText = resolutionWidth .. 'x' .. resolutionHeight
		if hasChanged then
			t_videoCfg[2].varText = s_screenMode		
			--t_videoCfg[3].varText = s_openGL
			--t_videoCfg[4].varText = s_saveMemory
			hasChanged = false
		end
		if lockSetting == true then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end	
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

--;===========================================================
--; OPENGL 2.0 WARNING
--;===========================================================
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
			sndPlay(sysSnd, 100, 1)
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

--;===========================================================
--; SAVE MEMORY WARNING
--;===========================================================
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
			sndPlay(sysSnd, 100, 1)
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
--; ASPECT RATIO WARNING
--;===========================================================
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
			sndPlay(sysSnd, 100, 1)
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
--; ASPECT RATIO SETTINGS
--;===========================================================
txt_resCfg = createTextImg(jgFnt, 0, 0, 'ASPECT RATIO SETTINGS', 159, 13)

t_resCfg = {
	{id = '', text = '4:3 Resolutions'},
	{id = '', text = '16:9 Resolutions'},
	{id = '', text = '16:10 Resolutions'},
	{id = '', text = 'Extra Resolutions'},
	{id = '', text = '          BACK'},
}
for i=1, #t_resCfg do
	t_resCfg[i].id = createTextImg(font2, 0, 1, t_resCfg[i].text, 85, 15+i*15)
end

function f_resCfg()
	cmdInput()
	local resCfg = 1
	local hasChanged = true
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			break
		end
		if commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			resCfg = resCfg - 1
			if resCfg < 1 then resCfg = #t_resCfg end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			resCfg = resCfg + 1
			if resCfg > #t_resCfg then resCfg = 1 end
		elseif btnPalNo(p1Cmd) > 0 then
			--4:3 Resolutions
			if resCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				f_resCfg4_3()
				hasChanged = true
			--16:9 Resolutions
			elseif resCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				f_resCfg16_9()
				hasChanged = true
			--16:10 Resolutions
			elseif resCfg == 3 then
				sndPlay(sysSnd, 100, 1)
				f_resCfg16_10()
				hasChanged = true
			--Extra Resolutions
			elseif resCfg == 4 then
				sndPlay(sysSnd, 100, 1)
				f_EXresCfg()
				hasChanged = true
			--Back
			else
				sndPlay(sysSnd, 100, 2)
				break
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_resCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_resCfg)
		if hasChanged then
			setGameRes(resolutionWidth,resolutionHeight)
			hasChanged = false
		end
		for i=1, #t_resCfg do
			textImgDraw(t_resCfg[i].id)
			if t_resCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_resCfg[i].varID, font2, 0, -1, t_resCfg[i].varText, 235, 15+i*15))
			end
		end
		animSetWindow(cursorBox, 80,5+resCfg*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; 4:3 RESOLUTIONS
--;===========================================================
txt_resCfg4_3 = createTextImg(jgFnt, 0, 0, 'RESOLUTION SELECT (4:3)', 159, 13)

t_resCfg4_3 = {
	{id = '', x = 320,  y = 240,  text = '320x240             (QVGA)'},
	{id = '', x = 512,  y = 384,  text = '512x384        (MACINTOSH)'},
	{id = '', x = 640,  y = 480,  text = '640x480              (VGA)'},
	{id = '', x = 800,  y = 600,  text = '800x600             (SVGA)'},
	{id = '', x = 960,  y = 720,  text = '960x720               (HD)'},
	{id = '', x = 1024, y = 768,  text = '1024x768             (XGA)'},
	{id = '', x = 1152, y = 864,  text = '1152x864            (XGA+)'},
	{id = '', x = 1200, y = 900,  text = '1200x900             (HD+)'},
	{id = '', x = 1280, y = 960,  text = '1280x960        (Quad-VGA)'},
	{id = '', x = 1440, y = 1080, text = '1440x1080            (FHD)'},
	{id = '', x = 1600, y = 1200, text = '1600x1200            (XGA)'},
	{id = '', x = 1920, y = 1440, text = '1920x1440          (UXGA+)'},
	{id = '', x = 2048, y = 1536, text = '2048x1536           (QXGA)'},
	{id = '', x = 3200, y = 2400, text = '3200x2400          (QUXGA)'},
	{id = '', x = 6400, y = 4800, text = '6400x4800          (HUXGA)'},
	{id = '', text = '          BACK'},
}
for i=1, #t_resCfg4_3 do
	--if t_resCfg4_3[i].x ~= nil and t_resCfg4_3[i].y ~= nil then t_resCfg4_3[i].text = t_resCfg4_3[i].x .. 'x' .. t_resCfg4_3[i].y end --position the cursor at the chosen resolution
	t_resCfg4_3[i].id = createTextImg(font2, 0, 1, t_resCfg4_3[i].text, 85, 15+i*15)
end
--for i=1, #t_resCfg4_3-1 do
	--if t_resCfg4_3[i].x > getWidth() or t_resCfg4_3[i].y > getHeight() then
		--for j=i, #t_resCfg4_3-1 do
			--table.remove(t_resCfg4_3,i) --Show only resolutions recommended for your PC
		--end
		--break
	--end
--end

function f_resCfg4_3()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg4_3 = 1
	for i=1, #t_resCfg4_3 do
		if t_resCfg4_3[i].text == resolutionWidth .. 'x' .. resolutionHeight then
			resCfg4_3 = i
			break
		end
	end
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			resCfg4_3 = resCfg4_3 - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			resCfg4_3 = resCfg4_3 + 1
		end
		--Cursor position calculation
		if resCfg4_3 < 1 then
			resCfg4_3 = #t_resCfg4_3
			if #t_resCfg4_3 > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_resCfg4_3
			end
		elseif resCfg4_3 > #t_resCfg4_3 then
			resCfg4_3 = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (resCfg4_3 - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg4_3 - 1) * 15
		end
		--Options
		if btnPalNo(p1Cmd) > 0 then
			--Back
			if resCfg4_3 == #t_resCfg4_3 then
				sndPlay(sysSnd, 100, 2)
				return false
			--Resolution
			else
				sndPlay(sysSnd, 100, 1)
				resolutionWidth = t_resCfg4_3[resCfg4_3].x
				resolutionHeight = t_resCfg4_3[resCfg4_3].y
				if (resolutionHeight / 3 * 4) ~= resolutionWidth then
					f_resWarning()
				end
				modified = 1
				needReload = 1
				return true
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		if moveTxt == 180 then
			animSetWindow(optionsBG1, 80,20, 160,210)
		else
			animSetWindow(optionsBG1, 80,20, 160,#t_resCfg4_3*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_resCfg4_3)
		for i=1, #t_resCfg4_3 do
			if i > resCfg4_3 - cursorPosY then
				textImgDraw(f_updateTextImg(t_resCfg4_3[i].id, font2, 0, 1, t_resCfg4_3[i].text, 85, 15+i*15-moveTxt))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; 16:9 RESOLUTIONS
--;===========================================================
txt_resCfg16_9 = createTextImg(jgFnt, 0, 0, 'RESOLUTION SELECT (16:9)', 159, 13)

t_resCfg16_9 = {
	{id = '', x = 427,  y = 240,  text = '427x240        (ULTRA LOW)'},
	{id = '', x = 640,  y = 360,  text = '640x360              (LOW)'},
	{id = '', x = 853,  y = 480,  text = '853x480               (SD)'},
	{id = '', x = 1280, y = 720,  text = '1280x720              (HD)'},
	{id = '', x = 1600, y = 900,  text = '1600x900             (HD+)'},
	{id = '', x = 1920, y = 1080, text = '1920x1080        (FULL HD)'},
	{id = '', x = 2048, y = 1152, text = '2048x1152          (QWXGA)'},
	{id = '', x = 2560, y = 1440, text = '2560x1440            (QHD)'},
	{id = '', x = 3840, y = 2160, text = '3840x2160        (4K UHDV)'},
	{id = '', text = '          BACK'},
}
for i=1, #t_resCfg16_9 do
	t_resCfg16_9[i].id = createTextImg(font2, 0, 1, t_resCfg16_9[i].text, 85, 15+i*15)
end

function f_resCfg16_9()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg16_9 = 1
	for i=1, #t_resCfg16_9 do
		if t_resCfg16_9[i].text == resolutionWidth .. 'x' .. resolutionHeight then
			resCfg16_9 = i
			break
		end
	end
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			resCfg16_9 = resCfg16_9 - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			resCfg16_9 = resCfg16_9 + 1
		end
		--Cursor position calculation
		if resCfg16_9 < 1 then
			resCfg16_9 = #t_resCfg16_9
			if #t_resCfg16_9 > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_resCfg16_9
			end
		elseif resCfg16_9 > #t_resCfg16_9 then
			resCfg16_9 = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (resCfg16_9 - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg16_9 - 1) * 15
		end
		--Options
		if btnPalNo(p1Cmd) > 0 then
			--Back
			if resCfg16_9 == #t_resCfg16_9 then
				sndPlay(sysSnd, 100, 2)
				return false
			--Resolution
			else
				sndPlay(sysSnd, 100, 1)
				resolutionWidth = t_resCfg16_9[resCfg16_9].x
				resolutionHeight = t_resCfg16_9[resCfg16_9].y
				if (resolutionHeight / 3 * 4) ~= resolutionWidth then
					f_resWarning()
				end
				modified = 1
				needReload = 1
				return true
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		if moveTxt == 180 then
			animSetWindow(optionsBG1, 80,20, 160,210)
		else
			animSetWindow(optionsBG1, 80,20, 160,#t_resCfg16_9*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_resCfg16_9)
		for i=1, #t_resCfg16_9 do
			if i > resCfg16_9 - cursorPosY then
				textImgDraw(f_updateTextImg(t_resCfg16_9[i].id, font2, 0, 1, t_resCfg16_9[i].text, 85, 15+i*15-moveTxt))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; 16:10 RESOLUTIONS
--;===========================================================
txt_resCfg16_10 = createTextImg(jgFnt, 0, 0, 'RESOLUTION SELECT (16:10)', 159, 13)

t_resCfg16_10 = {
	{id = '', x = 320,  y = 200,  text = '320x200              (CGA)'},
	{id = '', x = 1280, y = 800,  text = '1280x800            (WXGA)'},
	{id = '', x = 1440, y = 900,  text = '1440x900           (WXGA+)'},
	{id = '', x = 1680, y = 1050, text = '1680x1050         (WSXGA+)'},
	{id = '', x = 1920, y = 1200, text = '1920x1200          (WUXGA)'},
	{id = '', x = 2560, y = 1600, text = '2560x1600          (WQXGA)'},
	{id = '', x = 2880, y = 1800, text = '2880x1800  (RETINA DISPLAY)'},
	{id = '', x = 3840, y = 2400, text = '3840x2400         (WQUXGA)'},
	{id = '', x = 7680, y = 4800, text = '7680x4800         (WHUXGA)'},
	{id = '', text = '          BACK'},
}
for i=1, #t_resCfg16_10 do
	t_resCfg16_10[i].id = createTextImg(font2, 0, 1, t_resCfg16_10[i].text, 85, 15+i*15)
end

function f_resCfg16_10()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg16_10 = 1
	for i=1, #t_resCfg16_10 do
		if t_resCfg16_10[i].text == resolutionWidth .. 'x' .. resolutionHeight then
			resCfg16_10 = i
			break
		end
	end
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			resCfg16_10 = resCfg16_10 - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			resCfg16_10 = resCfg16_10 + 1
		end
		--Cursor position calculation
		if resCfg16_10 < 1 then
			resCfg16_10 = #t_resCfg16_10
			if #t_resCfg16_10 > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_resCfg16_10
			end
		elseif resCfg16_10 > #t_resCfg16_10 then
			resCfg16_10 = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (resCfg16_10 - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg16_10 - 1) * 15
		end
		--Options
		if btnPalNo(p1Cmd) > 0 then
			--Back
			if resCfg16_10 == #t_resCfg16_10 then
				sndPlay(sysSnd, 100, 2)
				return false
			--Resolution
			else
				sndPlay(sysSnd, 100, 1)
				resolutionWidth = t_resCfg16_10[resCfg16_10].x
				resolutionHeight = t_resCfg16_10[resCfg16_10].y
				if (resolutionHeight / 3 * 4) ~= resolutionWidth then
					f_resWarning()
				end
				modified = 1
				needReload = 1
				return true
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		if moveTxt == 180 then
			animSetWindow(optionsBG1, 80,20, 160,210)
		else
			animSetWindow(optionsBG1, 80,20, 160,#t_resCfg16_10*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_resCfg16_10)
		for i=1, #t_resCfg16_10 do
			if i > resCfg16_10 - cursorPosY then
				textImgDraw(f_updateTextImg(t_resCfg16_10[i].id, font2, 0, 1, t_resCfg16_10[i].text, 85, 15+i*15-moveTxt))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; EXTRA RESOLUTIONS
--;===========================================================
txt_EXresCfg = createTextImg(jgFnt, 0, 0, 'RESOLUTION SELECT', 159, 13)

t_EXresCfg = {
	{id = '', x = 400,  y = 254,  text = '400x254           (ARCADE)'},
	{id = '', x = 800,  y = 508,  text = '400x508        (ARCADE x2)'},
	{id = '', x = 640,  y = 350,  text = '640x350         (EGA 11:6)'},
	{id = '', x = 720,  y = 348,  text = '720x348         (HGC 60:9)'},
	{id = '', x = 720,  y = 350,  text = '720x350        (MDA 72:35)'},
	{id = '', x = 720,  y = 360,  text = '720x360    (APPLE LISA 2:1)'},
	{id = '', x = 1024, y = 600,  text = '1024x600 (CANAIMA MG101A4)'},
	{id = '', x = 1360, y = 768,  text = '1360x768      (WXGA 85:48)'},
	{id = '', x = 1366, y = 728,  text = '1366x728 (CANAIMA EF10M12)'},
	{id = '', x = 1200, y = 762,  text = '1200x762       (ARCADE x3)'},
	{id = '', x = 1280, y = 1024, text = '1280x1024       (SXGA 5:4)'},
	{id = '', x = 1600, y = 1016, text = '1600x1016      (ARCADE x4)'},
	{id = '', x = 2048, y = 1080, text = '2048x1080        (2K 17:9)'},
	{id = '', x = 2560, y = 2048, text = '2560x2048       (QSXA 5:4)'},
	{id = '', x = 3200, y = 2048, text = '3200x2048    (WQSXA 25:16)'},
	{id = '', x = 4096, y = 2160, text = '4096x2160  (4K CINEMA 17:9)'},
	{id = '', x = 5120, y = 4096, text = '5120x4096      (HSXGA 5:4)'},
	{id = '', x = 6400, y = 4096, text = '6400x4096   (WHSXGA 25:16)'},
	{id = '', x = 7680, y = 4320, text = '7680x4320         (8K UHD)'},
	--{id = '', x = 30720, y = 17208, text = '30720x17208 (24K SUPER DEATH BATMETAL)'},
	{id = '', text = '          BACK'},
}
for i=1, #t_EXresCfg do
	t_EXresCfg[i].id = createTextImg(font2, 0, 1, t_EXresCfg[i].text, 85, 15+i*15)
end

function f_EXresCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local EXresCfg = 1
	for i=1, #t_EXresCfg do
		if t_EXresCfg[i].text == resolutionWidth .. 'x' .. resolutionHeight then
			EXresCfg = i
			break
		end
	end
	while true do
		if esc() then
			sndPlay(sysSnd, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			EXresCfg = EXresCfg - 1
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			EXresCfg = EXresCfg + 1
		end
		--Cursor position calculation
		if EXresCfg < 1 then
			EXresCfg = #t_EXresCfg
			if #t_EXresCfg > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_EXresCfg
			end
		elseif EXresCfg > #t_EXresCfg then
			EXresCfg = 1
			cursorPosY = 1
		elseif commandGetState(p1Cmd, 'u') and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif commandGetState(p1Cmd, 'd') and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (EXresCfg - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (EXresCfg - 1) * 15
		end
		--Options
		if btnPalNo(p1Cmd) > 0 then
			--Back
			if EXresCfg == #t_EXresCfg then
				sndPlay(sysSnd, 100, 2)
				return false
			--Resolution
			else
				sndPlay(sysSnd, 100, 1)
				resolutionWidth = t_EXresCfg[EXresCfg].x
				resolutionHeight = t_EXresCfg[EXresCfg].y
				if (resolutionHeight / 3 * 4) ~= resolutionWidth then
					f_resWarning()
				end
				modified = 1
				needReload = 1
				return true
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		if moveTxt == 180 then
			animSetWindow(optionsBG1, 80,20, 160,210)
		else
			animSetWindow(optionsBG1, 80,20, 160,#t_EXresCfg*15)
		end
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_EXresCfg)
		for i=1, #t_EXresCfg do
			if i > EXresCfg - cursorPosY then
				textImgDraw(f_updateTextImg(t_EXresCfg[i].id, font2, 0, 1, t_EXresCfg[i].text, 85, 15+i*15-moveTxt))
			end
		end
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
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
	{id = '', text = 'Audio Panning',   varID = textImgNew(), varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{id = '', text = 'Sample Rate',     varID = textImgNew(), varText = freq},
	{id = '', text = 'Channels',        varID = textImgNew(), varText = s_channels},
	{id = '', text = 'Buffer Samples',  varID = textImgNew(), varText = buffer},
	{id = '', text = 'Main Menu Song', 	varID = textImgNew(), varText = data.menuSong},
	{id = '', text = 'Challenger Select Song', 	varID = textImgNew(), varText = data.challengerSong},
	{id = '', text = '          BACK'},
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
			f_menuMusic()
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
		--Audio Panning
		elseif audioCfg == 4 then
			if commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				if pan_str < 160 then
					pan_str = pan_str + 40
				else
					pan_str = 0
				end
				modified = 1
			elseif commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
				if pan_str > 0 then
					pan_str = pan_str - 40
				else
					pan_str = 160
				end
				modified = 1
			end
			setPanStr(pan_str / 100);
		--Sample Rate
		elseif audioCfg == 5 then
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
		elseif audioCfg == 6 then
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
		elseif audioCfg == 7 then
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
		--Main Menu Song
		elseif audioCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.menuSong == 'Theme 1' then
				data.menuSong = 'Theme 2'
				f_menuMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.menuSong == 'Theme 2' then
				data.menuSong = 'Theme 3'
				f_menuMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.menuSong == 'Theme 3' then
				data.menuSong = 'Random'
				f_menuMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.menuSong == 'Random' then
				data.menuSong = 'Theme 1'
				f_menuMusic()
				modified = 1	
			elseif commandGetState(p1Cmd, 'l') and data.menuSong == 'Theme 1' then
				data.menuSong = 'Random'
				f_menuMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.menuSong == 'Theme 2' then
				data.menuSong = 'Theme 1'
				f_menuMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.menuSong == 'Theme 3' then
				data.menuSong = 'Theme 2'
				f_menuMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.menuSong == 'Random' then
				data.menuSong = 'Theme 3'
				f_menuMusic()
				modified = 1
			end
		--Challenger Select Song
		elseif audioCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			sndPlay(sysSnd, 100, 0)
			if commandGetState(p1Cmd, 'r') and data.challengerSong == 'Fixed' then
				data.challengerSong = 'Original'
				f_challengerMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.challengerSong == 'Original' then
				data.challengerSong = 'Boss'
				f_challengerMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.challengerSong == 'Boss' then
				data.challengerSong = 'Random'
				f_challengerMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'r') and data.challengerSong == 'Random' then
				data.challengerSong = 'Fixed'
				f_challengerMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.challengerSong == 'Fixed' then
				data.challengerSong = 'Random'
				f_challengerMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.challengerSong == 'Original' then
				data.challengerSong = 'Fixed'
				f_challengerMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.challengerSong == 'Boss' then
				data.challengerSong = 'Original'
				f_challengerMusic()
				modified = 1
			elseif commandGetState(p1Cmd, 'l') and data.challengerSong == 'Random' then
				data.challengerSong = 'Boss'
				f_challengerMusic()
				modified = 1
			end		
		--Back
		elseif audioCfg == 10 and btnPalNo(p1Cmd) > 0 then
			sndPlay(sysSnd, 100, 2)
			f_menuMusic()
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetWindow(optionsBG1, 80,20, 160,#t_audioCfg*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		textImgDraw(txt_audioCfg)
		t_audioCfg[1].varText = gl_vol .. '%'
		t_audioCfg[2].varText = se_vol .. '%'
		t_audioCfg[3].varText = bgm_vol .. '%'
		t_audioCfg[4].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
		t_audioCfg[5].varText = freq
		t_audioCfg[6].varText = s_channels
		t_audioCfg[7].varText = buffer
		t_audioCfg[8].varText = data.menuSong
		t_audioCfg[9].varText = data.challengerSong
		setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)		
		setPanStr(pan_str / 100);
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
	--{id = '', text = 'Player 1 (Gamepad)'},
	{id = '', text = 'Default Controls'},
	{id = '', text = 'Test Controls'},
	{id = '', text = '          BACK'},
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
			--Player 1 Keyboard
			if inputCfg == 1 then
				sndPlay(sysSnd, 100, 1)
				if data.p1Controller == -1 then
					f_keyRead(0, -1)
					f_keyCfg(0, -1)
				else
					f_keyRead(2, -1)
					f_keyCfg(2, -1)
				end
			--Player 2 Keyboard
			elseif inputCfg == 2 then
				sndPlay(sysSnd, 100, 1)
				if data.p2Controller == -1 then
					f_keyRead(1, -1)
					f_keyCfg(1, -1)
				else
					f_keyRead(3, -1)
					f_keyCfg(3, -1)
				end
			--Player 1 Gamepad
			--elseif inputCfg == 3 then
				--sndPlay(sysSnd, 100, 1)
				--if data.p1Controller == -1 then
					--f_padRead(2, 0)
					--f_keyCfg(2, 0)
				--else
					--f_padRead(0, 0)
					--f_keyCfg(0, 0)
				--end
			--Default Inputs
			elseif inputCfg == 3 then
				sndPlay(sysSnd, 100, 1)
				f_inputDefault()
			--Input Test
			elseif inputCfg == 4 then
				sndPlay(sysSnd, 100, 1)
				f_saveCfg() --Save and Load New Inputs (Only for Match, Reboot for Apply to Main Menu)
				setRoundTime(-1)
				data.p2In = 2
				data.stageMenu = false
				data.versusScreen = false
				data.p1TeamMenu = {mode = 0, chars = 1}				
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p2Char = {t_charAdd['training/sandbag.def']}
				data.gameMode = 'training'
				setGameType(4)
				textImgSetText(txt_mainSelect, 'INPUT TEST')
				script.select.f_selectSimple()
			--Back
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
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

function f_swapController(playerOld, playerNew, controllerOld, controllerNew)
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerOld .. '%]%.set%(\n*%s*' .. controllerOld, 'in.new[' .. playerNew .. 'deleteMe].set(\n  ' .. controllerOld)
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNew .. '%]%.set%(\n*%s*' .. controllerNew, 'in.new[' .. playerOld .. '].set(\n  ' .. controllerNew)
	s_configSSZ = s_configSSZ:gsub('deleteMe', '')
end

t_newinput = {
	{id = '', text = "Press any key to assign"},--{id = '', text = "Enter new input..."},
}
for i=1, #t_newinput do
	t_newinput[i].id = createTextImg(font2, 0, -1, t_newinput[i].text, 236, 180+i*15)
end

--;===========================================================
--; KEYBOARD/JOYSTICK SETTINGS
--;===========================================================
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
	{id = '', text = 'BACK'},
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
			--Up, Down, Left, Right, A, B, C, X, Y, Z, Start
			if keyCfg < #t_keyCfg then
				sndPlay(sysSnd, 100, 1)
				t_keyCfg[keyCfg].varText = f_readInput(t_keyCfg[keyCfg].varText)
			--Back
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
			--Keyboard
			if kpCfg == 1 then
				return swap1
			--Keypad (Numpad)
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
		in ipairs(script.randomtest.strsplit(',', tmp)) --split string using "," delimiter
	do
		t_keyCfg[i].varText = c
	end
end

--for some reason doesn't work when nested inside f_keyRead
function f_padRead(playerNo, controller)
	local tmp = s_configSSZ:match('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);')
	local tmp = tmp:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
	local tmp = tmp:gsub('([^,%s]*)%s*(,)\n*%s*', '%1%2')
	local tmp = tmp:gsub('([^%)%s]*)%s*%);', '%1')
	for i, c
		in ipairs(script.randomtest.strsplit(',', tmp)) --split string using "," delimiter
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
		--if spaceKey() then
			--getKeyboard = 'SPACE'
			--sndPlay(sysSnd, 100, 1)
			--break
			--end	
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
	--Keyboard
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+2 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo+2 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+4 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo+4 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+6 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
	'in.new[' .. playerNo+6 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyCfg[1].varText .. ',\n  (int)k_t::' .. t_keyCfg[2].varText .. ',\n  (int)k_t::' .. t_keyCfg[3].varText .. ',\n  (int)k_t::' .. t_keyCfg[4].varText .. ',\n  (int)k_t::' .. t_keyCfg[5].varText .. ',\n  (int)k_t::' .. t_keyCfg[6].varText .. ',\n  (int)k_t::' .. t_keyCfg[7].varText .. ',\n  (int)k_t::' .. t_keyCfg[8].varText .. ',\n  (int)k_t::' .. t_keyCfg[9].varText .. ',\n  (int)k_t::' .. t_keyCfg[10].varText .. ',\n  (int)k_t::' .. t_keyCfg[11].varText .. ');')		
	--Gamepad
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
	'in.new[' .. playerNo+8 .. '].set(\n  ' .. controller .. ', ' .. t_keyCfg[1].varText .. ', ' .. t_keyCfg[2].varText .. ', ' .. t_keyCfg[3].varText .. ', ' .. t_keyCfg[4].varText .. ', ' .. t_keyCfg[5].varText .. ', ' .. t_keyCfg[6].varText .. ', ' .. t_keyCfg[7].varText .. ', ' .. t_keyCfg[8].varText .. ', ' .. t_keyCfg[9].varText .. ', ' .. t_keyCfg[10].varText .. ', ' .. t_keyCfg[11].varText .. ');')
end
