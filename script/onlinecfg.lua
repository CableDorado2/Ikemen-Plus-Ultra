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
		os.exit()
	end
end