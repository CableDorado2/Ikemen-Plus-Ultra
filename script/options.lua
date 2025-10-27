--;===========================================================
--; OPTIONS SCREENPACK DEFINITION
--;===========================================================
--Scrolling background
optionsBG0 = animNew(sprSys, [[
100,0, 0,0, -1
]])
animAddPos(optionsBG0, 160, 0)
animSetTile(optionsBG0, 1, 1)
animSetColorKey(optionsBG0, -1)

--Transparent background
optionsBG1 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(optionsBG1, 30, 20)
animSetAlpha(optionsBG1, 20, 100)
animUpdate(optionsBG1)

--Transparent background 2
optionsBG2 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(optionsBG2, 0, 20)
animSetAlpha(optionsBG2, 20, 100)
animUpdate(optionsBG2)

--Transparent Info background
infoBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(infoBG, 20, 20)
animSetAlpha(infoBG, 20, 100)
animUpdate(infoBG)

--Up Arrow
optionsUpArrow = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(optionsUpArrow, 242, 23)
animSetScale(optionsUpArrow, 0.5, 0.5)
animUpdate(optionsUpArrow)

--Down Arrow
optionsDownArrow = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(optionsDownArrow, 242, 190)
animSetScale(optionsDownArrow, 0.5, 0.5)
animUpdate(optionsDownArrow)

--Up Arrow for Player 1 Controls Cfg
optionsUpArrowP1 = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(optionsUpArrowP1, 5, 23)
animSetScale(optionsUpArrowP1, 0.5, 0.5)
animUpdate(optionsUpArrowP1)

--Down Arrow for Player 1 Controls Cfg
optionsDownArrowP1 = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(optionsDownArrowP1, 5, 188)
animSetScale(optionsDownArrowP1, 0.5, 0.5)
animUpdate(optionsDownArrowP1)

--Up Arrow for Player 2 Controls Cfg
optionsUpArrowP2 = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(optionsUpArrowP2, 303, 23)
animSetScale(optionsUpArrowP2, 0.5, 0.5)
animUpdate(optionsUpArrowP2)

--Down Arrow for Player 2 Controls Cfg
optionsDownArrowP2 = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(optionsDownArrowP2, 303, 188)
animSetScale(optionsDownArrowP2, 0.5, 0.5)
animUpdate(optionsDownArrowP2)

--Input Hints Panel
function drawCfgInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","30,"..inputHintYPos,"d","50,"..inputHintYPos,"l","70,"..inputHintYPos,"r","90,"..inputHintYPos,"s","150,"..inputHintYPos,"e","215,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 111, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 171, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 236, hintFontYPos)
end

local modified = 0
local needReload = 0
local updateVars = false

--;===========================================================
--; OPTIONS VARS
--;===========================================================
function f_loadCfg(all)
local all = all or false
--;===========================================================
--; DATA_SAV.LUA
--;===========================================================
	if all then
	--Data loading from data_sav.lua
		local file = io.open(saveCfgPath,"r")
		s_dataLUA = file:read("*all")
		file:close()
	--Apply settings from data_sav.lua
		disableGamepad(data.disablePadP1,data.disablePadP2)
	end
--;===========================================================
--; CONFIG.SSZ
--;===========================================================
--Data loading from config.ssz
	local file = io.open(saveCoreCfgPath,"r")
	s_configSSZ = file:read("*all")
	file:close()
--Apply settings from config.ssz
--Video Settings
	resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
	resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
	b_fullscreenMode = s_configSSZ:match('const bool FullScreenExclusive%s*=%s*([^;%s]+)')
	b_screenMode = s_configSSZ:match('const bool FullScreen%s*=%s*([^;%s]+)')
	b_aspectMode = s_configSSZ:match('const bool AspectRatio%s*=%s*([^;%s]+)')
	if all then b_openGL = s_configSSZ:match('const bool OpenGL%s*=%s*([^;%s]+)') end
	windowType = tonumber(s_configSSZ:match('const int WindowType%s*=%s*(%d+)'))
	brightnessAdjust = tonumber(s_configSSZ:match('const int Brightness%s*=%s*(%d+)'))
	opacityAdjust = math.floor(tonumber(s_configSSZ:match('const float Opacity%s*=%s*(%d%.*%d*)') * 100))
--Audio Settings
	gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
	se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
	bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
	pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))
	vid_vol = tonumber(s_configSSZ:match('const int VideoVol%s*=%s*(%d+)'))
--Perfomance Settings
	if all then
		HelperMaxEngine = tonumber(s_configSSZ:match('const int HelperMax%s*=%s*(%d+)'))
		PlayerProjectileMaxEngine = tonumber(s_configSSZ:match('const int PlayerProjectileMax%s*=%s*(%d+)'))
		ExplodMaxEngine = tonumber(s_configSSZ:match('const int ExplodMax%s*=%s*(%d+)'))
		AfterImageMaxEngine = tonumber(s_configSSZ:match('const int AfterImageMax%s*=%s*(%d+)'))
		b_saveMemory = s_configSSZ:match('const bool SaveMemory%s*=%s*([^;%s]+)')
	end
--Game Settings
	gameSpeed = tonumber(s_configSSZ:match('const int GameSpeed%s*=%s*(%d+)'))
--Input Settings
	data.p1Gamepad = tonumber(s_configSSZ:match('in%.new%[2%]%.set%(\n%s*(%-*%d+)'))
	data.p2Gamepad = tonumber(s_configSSZ:match('in%.new%[3%]%.set%(\n%s*(%-*%d+)'))
	
--Before was on f_loadEXCfg():

--Data loading from sound.ssz
	local file = io.open("lib/sound.ssz","r")
	s_soundSSZ = file:read("*all")
	file:close()
--Apply settings from sound.ssz
	freq = tonumber(s_soundSSZ:match('const int Freq%s*=%s*(%d+)'))
	channels = tonumber(s_soundSSZ:match('const int Channels%s*=%s*(%d+)'))
	buffer = tonumber(s_soundSSZ:match('const int BufferSamples%s*=%s*(%d+)'))
	
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

	if channels == 6 then
		s_channels = "5.1"
	elseif channels == 4 then
		s_channels = "Quad"
	elseif channels == 2 then
		s_channels = "Stereo"
	elseif channels == 1 then
		s_channels = "Mono"
	end
--Convert Bool String loaded from SSZ to lua bool
	if all then
		if b_openGL == "true" then
			b_openGL = true
		elseif b_openGL == "false" then
			b_openGL = false
		end
	end
	
	if b_screenMode == "true" then
		b_screenMode = true
		s_screenMode = "Fullscreen"
	elseif b_screenMode == "false" then
		b_screenMode = false
		s_screenMode = "Windowed"
	end
	
	if b_fullscreenMode == "true" then
		b_fullscreenMode = true
	elseif b_fullscreenMode == "false" then
		b_fullscreenMode = false
	end
	
	if b_aspectMode == "true" then
		b_aspectMode = true
	elseif b_aspectMode == "false" then
		b_aspectMode = false
	end
	
	opacityAdjust = f_minMax(opacityAdjust,0,100)
	
	if all then
		if b_saveMemory == "true" then
			b_saveMemory = true
			s_saveMemory = "Yes"
		elseif b_saveMemory == "false" then
			b_saveMemory = false
			s_saveMemory = "No"
		end
		s_disablePadP1 = data.disablePadP1 and "Disabled" or "Enabled"
		s_disablePadP2 = data.disablePadP2 and "Disabled" or "Enabled"
	end
end
f_loadCfg(true)

function f_loadEXCfg()
--Data loading from data.lifebar
	local file = io.open(data.lifebar,"r")
	s_lifebarDEF = file:read("*all")
	file:close()
--Apply settings from data.lifebar
	data.roundsNum = tonumber(s_lifebarDEF:match('match.wins%s*=%s*(%d+)'))
	drawNum = tonumber(s_lifebarDEF:match('match.maxdrawgames%s*=%s*(%d+)'))
--Variable setting based on loaded data
	if gameSpeed == 48 then
		s_gameSpeed = "Slow"
	elseif gameSpeed == 60 then
		s_gameSpeed = "Normal"
	elseif gameSpeed == 72 then
		s_gameSpeed = "Turbo"
	end
end

function f_loadNETCfg()
--Data loading from data_netsav.lua
	local file = io.open(saveNetCfgPath,"r")
	s_dataLUA = file:read("*all")
	file:close()
--Data loading from configNet.ssz
	local file = io.open(saveNetCoreCfgPath,"r")
	s_configSSZ = file:read("*all")
	file:close()
--Apply settings from configNet.ssz
	HelperMaxEngine = tonumber(s_configSSZ:match('const int HelperMax%s*=%s*(%d+)'))
	PlayerProjectileMaxEngine = tonumber(s_configSSZ:match('const int PlayerProjectileMax%s*=%s*(%d+)'))
	ExplodMaxEngine = tonumber(s_configSSZ:match('const int ExplodMax%s*=%s*(%d+)'))
	AfterImageMaxEngine = tonumber(s_configSSZ:match('const int AfterImageMax%s*=%s*(%d+)'))
	gameSpeed = tonumber(s_configSSZ:match('const int GameSpeed%s*=%s*(%d+)'))
end

function f_saveCfg()
--;===========================================================
--; DATA_SAV.LUA
--;===========================================================
	local t_saves = {
	--Online Data
		['data.userName'] = data.userName,
		['data.connectMode'] = data.connectMode,
		['data.ftcontrol'] = data.ftcontrol,
	--Music Data
		['data.menuSong'] = data.menuSong,
		['data.menuSongFolder'] = data.menuSongFolder,
		['data.selectSong'] = data.selectSong,
		['data.selectSongFolder'] = data.selectSongFolder,
		['data.challengerSong'] = data.challengerSong,
		['data.challengerSongFolder'] = data.challengerSongFolder,
		['data.bgmDisplay'] = data.bgmDisplay,
	--System Data
		['data.language'] = data.language,
		['data.clock'] = data.clock,
		['data.dateFormat'] = data.dateFormat,
		['data.attractMode'] = data.attractMode,
		['data.vsDisplayWin'] = data.vsDisplayWin,
		['data.winscreen'] = data.winscreen,
		['data.serviceType'] = data.serviceType,
		['data.orderSelType'] = data.orderSelType,
		['data.portraitDisplay'] = data.portraitDisplay,
		['data.sffConversion'] = data.sffConversion,
	--Game Data
		['data.difficulty'] = data.difficulty,
		['data.roundTime'] = data.roundTime,
		['data.roundsNum'] = data.roundsNum,
		['data.lifebar'] = data.lifebar,
		['data.lifeMul'] = data.lifeMul,
		['data.aipal'] = data.aipal,
		['data.aiRamping'] = data.aiRamping,
		['data.kumite'] = data.kumite,
		['data.quickCont'] = data.quickCont,
	--Team Data
		['data.team1VS2Life'] = data.team1VS2Life,
		['data.turnsRecoveryRate'] = data.turnsRecoveryRate,
		['data.teamLifeShare'] = data.teamLifeShare,
		['data.teamPowerShare'] = data.teamPowerShare,
		['data.teamDuplicates'] = data.teamDuplicates,
		['data.numTurns'] = data.numTurns,
		['data.numSimul'] = data.numSimul,
		['data.simulType'] = data.simulType,
		['data.coopenemy'] = data.coopenemy,
	--Zoom Data
		['data.zoomActive'] = data.zoomActive,
		['data.zoomMin'] = data.zoomMin,
		['data.zoomMax'] = data.zoomMax,
		['data.zoomSpeed'] = data.zoomSpeed,
	--Character Select Global Data
		['data.selectType'] = data.selectType,
		['data.palType'] = data.palType,
		['data.randomPortrait'] = data.randomPortrait,
		['data.randomCharRematch'] = data.randomCharRematch,
		['data.charInfo'] = data.charInfo,
	--Character Select Config
		['data.selectRows'] = data.selectRows,
		['data.selectColumns'] = data.selectColumns,
		['data.offsetRows'] = data.offsetRows,
		['data.offsetColumns'] = data.offsetColumns,
		['data.wrappingX'] = data.wrappingX,
		['data.wrappingY'] = data.wrappingY,
		['data.p1FaceX'] = data.p1FaceX,
		['data.p1FaceY'] = data.p1FaceY,
		['data.p2FaceX'] = data.p2FaceX,
		['data.p2FaceY'] = data.p2FaceY,
		['data.cellSizeX'] = data.cellSizeX,
		['data.cellSizeY'] = data.cellSizeY,
		['data.cellSpacingX'] = data.cellSpacingX,
		['data.cellSpacingY'] = data.cellSpacingY,
		['data.cellScaleX'] = data.cellScaleX,
		['data.cellScaleY'] = data.cellScaleY,
		['data.p1SelX'] = data.p1SelX,
		['data.p1SelY'] = data.p1SelY,
		['data.p2SelX'] = data.p2SelX,
		['data.p2SelY'] = data.p2SelY,
	--Stage Select Data
		['data.stageType'] = data.stageType,
		['data.stageInfo'] = data.stageInfo,
		['data.randomStagePortrait'] = data.randomStagePortrait,
		['data.randomStageRematch'] = data.randomStageRematch,
	--Timers Data
		['data.selectTime'] = data.selectTime,
		['data.stageTime'] = data.stageTime,
		['data.orderTime'] = data.orderTime,
		['data.rematchTime'] = data.rematchTime,
		['data.serviceTime'] = data.serviceTime,
		['data.attractTime'] = data.attractTime,
		['data.destinyTime'] = data.destinyTime,
	--Input Data
		['data.disablePadP1'] = data.disablePadP1,
		['data.disablePadP2'] = data.disablePadP2,
	--Engine Data
		['data.debugMode'] = data.debugMode,
		['data.debugLog'] = data.debugLog,
		['data.engineMode'] = data.engineMode
	}
--Save Data to data_sav.lua
	s_dataLUA = f_strSub(s_dataLUA, t_saves)
	local file = io.open(saveCfgPath,"w+")
	file:write(s_dataLUA)
	file:close()
--;===========================================================
--; CONFIG.SSZ
--;===========================================================
--Video Settings
	s_configSSZ = s_configSSZ:gsub('const int Width%s*=%s*%d+', 'const int Width = ' .. resolutionWidth)
	s_configSSZ = s_configSSZ:gsub('const int Height%s*=%s*%d+', 'const int Height = ' .. resolutionHeight)
	if b_screenMode then
		s_configSSZ = s_configSSZ:gsub('const bool FullScreen%s*=%s*[^;%s]+', 'const bool FullScreen = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool FullScreen%s*=%s*[^;%s]+', 'const bool FullScreen = false')
	end
	if b_fullscreenMode then
		s_configSSZ = s_configSSZ:gsub('const bool FullScreenExclusive%s*=%s*[^;%s]+', 'const bool FullScreenExclusive = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool FullScreenExclusive%s*=%s*[^;%s]+', 'const bool FullScreenExclusive = false')
	end
	if b_aspectMode then
		s_configSSZ = s_configSSZ:gsub('const bool AspectRatio%s*=%s*[^;%s]+', 'const bool AspectRatio = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool AspectRatio%s*=%s*[^;%s]+', 'const bool AspectRatio = false')
	end
	if b_openGL then
		s_configSSZ = s_configSSZ:gsub('const bool OpenGL%s*=%s*[^;%s]+', 'const bool OpenGL = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool OpenGL%s*=%s*[^;%s]+', 'const bool OpenGL = false')
	end
	s_configSSZ = s_configSSZ:gsub('const int WindowType%s*=%s*%d+', 'const int WindowType = ' .. windowType)
	s_configSSZ = s_configSSZ:gsub('const int Brightness%s*=%s*%d+', 'const int Brightness = ' .. brightnessAdjust)
	s_configSSZ = s_configSSZ:gsub('const float Opacity%s*=%s*%d%.*%d*', 'const float Opacity = ' .. opacityAdjust / 100)
--Audio Settings
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	s_configSSZ = s_configSSZ:gsub('const int VideoVol%s*=%s*%d+', 'const int VideoVol = ' .. vid_vol)
--Perfomance Settings
	s_configSSZ = s_configSSZ:gsub('const int HelperMax%s*=%s*%d+', 'const int HelperMax = ' .. HelperMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int PlayerProjectileMax%s*=%s*%d+', 'const int PlayerProjectileMax = ' .. PlayerProjectileMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int ExplodMax%s*=%s*%d+', 'const int ExplodMax = ' .. ExplodMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int AfterImageMax%s*=%s*%d+', 'const int AfterImageMax = ' .. AfterImageMaxEngine)
	if b_saveMemory then
		s_saveMemory = s_saveMemory:gsub('const bool SaveMemory%s*=%s*[^;%s]+', 'const bool SaveMemory = true')
	else
		s_saveMemory = s_saveMemory:gsub('const bool SaveMemory%s*=%s*[^;%s]+', 'const bool SaveMemory = false')
	end
--Game Settings
	s_configSSZ = s_configSSZ:gsub('const int GameSpeed%s*=%s*%d+', 'const int GameSpeed = ' .. gameSpeed)
--System Settings	
	s_configSSZ = s_configSSZ:gsub('listenPort%s*=%s*"%w+"', 'listenPort = "' .. getListenPort() .. '"')
	--s_configSSZ = s_configSSZ:gsub('UserName%s*=%s*"%w+"', 'UserName = "' .. getUserName() .. '"')
--Save Data to config.ssz
	local file = io.open(saveCoreCfgPath,"w+")
	file:write(s_configSSZ)
	file:close()
--Extra Audio Settings
	s_soundSSZ = s_soundSSZ:gsub('const int Freq%s*=%s*%d+', 'const int Freq = ' .. freq)
	s_soundSSZ = s_soundSSZ:gsub('const int Channels%s*=%s*%d+', 'const int Channels = ' .. channels)
	s_soundSSZ = s_soundSSZ:gsub('const int BufferSamples%s*=%s*%d+', 'const int BufferSamples = ' .. buffer)
--Save Data to sound.ssz
	local file = io.open("lib/sound.ssz","w+")
	file:write(s_soundSSZ)
	file:close()
--;===========================================================
--; FIGHT.DEF
--;===========================================================
--Lifebar Settings
	s_lifebarDEF = s_lifebarDEF:gsub('match.wins%s*=%s*%d+', 'match.wins = ' .. data.roundsNum)
	s_lifebarDEF = s_lifebarDEF:gsub('match.maxdrawgames%s*=%s*%d+', 'match.maxdrawgames = ' .. drawNum)
--Save Data to lifebar selected
	local file = io.open(data.lifebar,"w+")
	file:write(s_lifebarDEF)
	file:close()
	loadLifebar(data.lifebar) --Reload lifebar with new settings
--;===========================================================
--; RESTART
--;===========================================================
--Reload game if needed
	if needReload == 1 then
		f_resetEngine()
	end
end

function f_netsaveCfg()
--;===========================================================
--; DATA_SAV.LUA
--;===========================================================
	local t_netsaves = {
		['data.lifeMul'] = data.lifeMul,
		['data.team1VS2Life'] = data.team1VS2Life,
		['data.turnsRecoveryRate'] = data.turnsRecoveryRate,
		['data.teamLifeShare'] = data.teamLifeShare,
		['data.teamPowerShare'] = data.teamPowerShare,
		['data.teamDuplicates'] = data.teamDuplicates,
		['data.zoomActive'] = data.zoomActive,
		['data.zoomMin'] = data.zoomMin,
		['data.zoomMax'] = data.zoomMax,
		['data.zoomSpeed'] = data.zoomSpeed,
		['data.roundTime'] = data.roundTime,
		['data.roundsNum'] = data.roundsNum,
		['data.numTurns'] = data.numTurns,
		['data.numSimul'] = data.numSimul,
		['data.simulType'] = data.simulType,
		['data.difficulty'] = data.difficulty,
		['data.quickCont'] = data.quickCont,
		['data.vsDisplayWin'] = data.vsDisplayWin,
		['data.aipal'] = data.aipal,
		['data.kumite'] = data.kumite,
		['data.aiRamping'] = data.aiRamping,
		['data.lifebar'] = data.lifebar,
		['data.selectType'] = data.selectType,
		['data.palType'] = data.palType,
		['data.stageType'] = data.stageType,
		['data.winscreen'] = data.winscreen,
		['data.ftcontrol'] = data.ftcontrol,
		['data.portraitDisplay'] = data.portraitDisplay,
		['data.coopenemy'] = data.coopenemy
	}
--Save Data to data_netsav.lua
	s_dataLUA = f_strSub(s_dataLUA, t_netsaves)
	local file = io.open(saveNetCfgPath,"w+")
	file:write(s_dataLUA)
	file:close()
--;===========================================================
--; CONFIG.SSZ
--;===========================================================	
	s_configSSZ = s_configSSZ:gsub('const int HelperMax%s*=%s*%d+', 'const int HelperMax = ' .. HelperMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int PlayerProjectileMax%s*=%s*%d+', 'const int PlayerProjectileMax = ' .. PlayerProjectileMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int ExplodMax%s*=%s*%d+', 'const int ExplodMax = ' .. ExplodMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int AfterImageMax%s*=%s*%d+', 'const int AfterImageMax = ' .. AfterImageMaxEngine)
	s_configSSZ = s_configSSZ:gsub('const int Width%s*=%s*%d+', 'const int Width = ' .. resolutionWidth)
	s_configSSZ = s_configSSZ:gsub('const int Height%s*=%s*%d+', 'const int Height = ' .. resolutionHeight)
	s_configSSZ = s_configSSZ:gsub('const int GameSpeed%s*=%s*%d+', 'const int GameSpeed = ' .. gameSpeed)
--Save Data to configNet.ssz
	local file = io.open(saveNetCoreCfgPath,"w+")
	file:write(s_configSSZ)
	file:close()
--;===========================================================
--; FIGHT.DEF
--;===========================================================
	s_lifebarDEF = s_lifebarDEF:gsub('match.wins%s*=%s*%d+', 'match.wins = ' .. data.roundsNum)
	s_lifebarDEF = s_lifebarDEF:gsub('match.maxdrawgames%s*=%s*%d+', 'match.maxdrawgames = ' .. drawNum)
--Save Data to lifebar selected
	local file = io.open(data.lifebar,"w+")
	file:write(s_lifebarDEF)
	file:close()
	loadLifebar(data.lifebar) --Reload lifebar
end

--;===========================================================
--; LOAD DEFAULT DATA
--;===========================================================
--Set Offline game Default Options shared with Online game Below
function f_onlineDefault()
	f_gameDefault()
	f_systemDefault()
	f_selectGlobalDefault()
	f_stageDefault()
	f_timeDefault()
	f_teamDefault()
	f_zoomDefault()
	f_engineDefault()
	f_vnDefault()
	data.ftcontrol = -1
end

--Set ONLY Offline Default Options Below
function f_offlineDefault()
	f_videoDefault()
	f_audioDefault()
	f_songDefault()
	f_inputDefault()
	f_netplayDefault()
end

--Default Game Values
function f_gameDefault()
	data.difficulty = 8
	data.roundTime = 99
	data.lifebar = fightDef
	data.roundsNum = 2
	drawNum = 2
	data.lifeMul = 100
	data.aipal = "Default"
	data.aiRamping = true
	data.kumite = 100
	gameSpeed = 60
	s_gameSpeed = "Normal"
	data.quickCont = true
end

--Default Team Values
function f_teamDefault()
	data.team1VS2Life = 120
	data.turnsRecoveryRate = 300
	data.teamLifeShare = false
	data.teamPowerShare = true
	data.teamDuplicates = true
	data.numTurns = 4
	data.numSimul = 4
	data.simulType = "Assist"
	data.coopenemy = "Simul"
end

--Default Zoom Values
function f_zoomDefault()
	data.zoomActive = true
	data.zoomMin = 0.75
	data.zoomMax = 1.1
	data.zoomSpeed = 1.0
end

--Default System Values
function f_systemDefault()
	if not onlinegame then
		data.language = "ENGLISH"
		data.clock = 1
		data.dateFormat = 1
	end
	data.attractMode = false
	data.vsDisplayWin = true
	data.winscreen = "Classic"
	data.serviceType = "Button"
	data.orderSelType = "Cursor"
	data.portraitDisplay = "Portrait"
end

--Default Character Select Global Values
function f_selectGlobalDefault()
	data.selectType = "Advanced"
	data.palType = "Classic"
	data.randomPortrait = "Simple"
	data.randomCharRematch = "Variable"
	data.charInfo = "Author"
end

--Default Character Select Config Values
function f_selectDefault()
	data.selectRows = 2
	data.selectColumns = 5
	data.offsetRows = 1
	data.offsetColumns = 0
	data.wrappingX = true
	data.wrappingY = true
	if data.selectType == "Advanced" then
		data.p1FaceX = 3
	elseif data.selectType == "Simple" then
		data.p1FaceX = 90
	end
	data.p1FaceY = 168
	data.p2FaceX = 176
	data.p2FaceY = 168
	data.cellSizeX = 27
	data.cellSizeY = 24.5
	data.cellSpacingX = 2
	data.cellSpacingY = 2
	data.cellScaleX = 1
	data.cellScaleY = 0.9
	data.p1SelX = 0
	data.p1SelY = 0
	data.p2SelX = 4
	data.p2SelY = 0
end

--Default Stage Select Values
function f_stageDefault()
	data.stageType = "Modern"
	data.stageInfo = "All"
	data.randomStagePortrait = "Simple"
	data.randomStageRematch = "Variable"
end

--Default Timers Values
function f_timeDefault()
	data.selectTime = 31
	data.stageTime = 21
	data.orderTime = 16
	data.rematchTime = 16
	data.serviceTime = 16
	data.attractTime = 11
	data.destinyTime = 31
end

--Default Songs Values
function f_songDefault()
	data.menuSong = "Random"
	data.menuSongFolder = 3
	data.selectSong = "Random"
	data.selectSongFolder = 4
	data.challengerSong = "Random"
	data.challengerSongFolder = 4
	data.bgmDisplay = true
end

--Default Video Values
function f_videoDefault()
	b_saveMemory = false
	s_saveMemory = "No"
	b_openGL = false
	b_screenMode = false
	s_screenMode = "Windowed"
	setScreenMode(b_screenMode)
	b_fullscreenMode = false
	setFullScreenMode(b_fullscreenMode)
	b_aspectMode = false
	setAspectRatio(b_aspectMode)
	windowType = 1
	setWindowType(windowType)
	resolutionWidth = 640
	resolutionHeight = 480
	setGameRes(resolutionWidth, resolutionHeight)
	brightnessAdjust = 256
	setBrightness(brightnessAdjust)
	opacityAdjust = 100
	setOpacity(opacityAdjust / 100)
end

--Default Audio Values
function f_audioDefault()
	gl_vol = 80
	se_vol = 80
	bgm_vol = 50
	setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
	vid_vol = 100
	setVideoVolume(vid_vol)
	pan_str = 80
	setPanStr(pan_str / 100)
	freq = 48000
	channels = 2
	s_channels = "Stereo"
	buffer = 2048
end

--Default Engine Values
function f_engineDefault()
	data.debugMode = false
	data.debugLog = false
	--data.engineMode = "FG"
	HelperMaxEngine = 56
	PlayerProjectileMaxEngine = 50
	ExplodMaxEngine = 256
	AfterImageMaxEngine = 8
end

--Default Netplay Values
function f_netplayDefault()
	data.connectMode = "Direct"
	setListenPort(7500)
	data.userName = "PLAYER" --setUserName('PLAYER')
end

--Default Visual Novel Values
function f_vnDefault()
	data.VNdelay = 3
	data.VNtxtBGTransD = 0
	data.VNtxtBGTransS = 255
	data.VNdisplayName = true
	data.VNautoSkip = false
end

--Default Inputs Values
function f_inputDefault()
--Reset P1
	f_p1keyboardBattleDefault()
	f_p1gamepadBattleDefault()
	f_p1keyboardMenuDefault()
	f_p1gamepadMenuDefault()
--Reset P2
	f_p2keyboardBattleDefault()
	f_p2gamepadBattleDefault()
	f_p2keyboardMenuDefault()
	f_p2gamepadMenuDefault()
--Reset Gamepads
	data.p1Gamepad = 0
	data.p2Gamepad = 1
	f_swapGamepad(0, 1)
	data.disablePadP1 = false
	s_disablePadP1 = "Enabled"
	data.disablePadP2 = false
	s_disablePadP2 = "Enabled"
end

--Default P1 KEYBOARD BATTLE
function f_p1keyboardBattleDefault()
	t_keyBattleCfg[1].keyboard = 'UP'
	t_keyBattleCfg[2].keyboard = 'DOWN'
	t_keyBattleCfg[3].keyboard = 'LEFT'
	t_keyBattleCfg[4].keyboard = 'RIGHT'
	t_keyBattleCfg[5].keyboard = 'a'
	t_keyBattleCfg[6].keyboard = 's'
	t_keyBattleCfg[7].keyboard = 'd'
	t_keyBattleCfg[8].keyboard = 'z'
	t_keyBattleCfg[9].keyboard = 'x'
	t_keyBattleCfg[10].keyboard = 'c'
	t_keyBattleCfg[11].keyboard = 'q'
	t_keyBattleCfg[12].keyboard = 'e'
	t_keyBattleCfg[13].keyboard = 'v'
	t_keyBattleCfg[14].keyboard = 'f'
	setInputConfig(0, -1, t_keyBattleCfg[1].keyboard, t_keyBattleCfg[2].keyboard, t_keyBattleCfg[3].keyboard, t_keyBattleCfg[4].keyboard, t_keyBattleCfg[5].keyboard, t_keyBattleCfg[6].keyboard, t_keyBattleCfg[7].keyboard, t_keyBattleCfg[8].keyboard, t_keyBattleCfg[9].keyboard, t_keyBattleCfg[10].keyboard, t_keyBattleCfg[11].keyboard, t_keyBattleCfg[12].keyboard, t_keyBattleCfg[13].keyboard, t_keyBattleCfg[14].keyboard) --Apply and Load New Controls
	f_keyBattleSave(0,-1)
end

--Default P2 KEYBOARD BATTLE
function f_p2keyboardBattleDefault()
	t_keyBattleCfg2[1].keyboard = 'KP_8'
	t_keyBattleCfg2[2].keyboard = 'KP_2'
	t_keyBattleCfg2[3].keyboard = 'KP_4'
	t_keyBattleCfg2[4].keyboard = 'KP_6'
	t_keyBattleCfg2[5].keyboard = 'u'
	t_keyBattleCfg2[6].keyboard = 'i'
	t_keyBattleCfg2[7].keyboard = 'o'
	t_keyBattleCfg2[8].keyboard = 'j'
	t_keyBattleCfg2[9].keyboard = 'k'
	t_keyBattleCfg2[10].keyboard = 'l'
	t_keyBattleCfg2[11].keyboard = 'KP_7'
	t_keyBattleCfg2[12].keyboard = 'KP_9'
	t_keyBattleCfg2[13].keyboard = 'KP_5'
	t_keyBattleCfg2[14].keyboard = 'KP_0'
	setInputConfig(1, -1, t_keyBattleCfg2[1].keyboard, t_keyBattleCfg2[2].keyboard, t_keyBattleCfg2[3].keyboard, t_keyBattleCfg2[4].keyboard, t_keyBattleCfg2[5].keyboard, t_keyBattleCfg2[6].keyboard, t_keyBattleCfg2[7].keyboard, t_keyBattleCfg2[8].keyboard, t_keyBattleCfg2[9].keyboard, t_keyBattleCfg2[10].keyboard, t_keyBattleCfg2[11].keyboard, t_keyBattleCfg2[12].keyboard, t_keyBattleCfg2[13].keyboard, t_keyBattleCfg2[14].keyboard) --Apply and Load New Controls
	f_keyBattleSave(1,-1)
end

--Default P1 GAMEPAD BATTLE
function f_p1gamepadBattleDefault() --PS3 Gamepad Layout
	t_keyBattleCfg[1].gamepad = '-3'
	t_keyBattleCfg[2].gamepad = '-4'
	t_keyBattleCfg[3].gamepad = '-1'
	t_keyBattleCfg[4].gamepad = '-2'
	t_keyBattleCfg[5].gamepad = '0'
	t_keyBattleCfg[6].gamepad = '1'
	t_keyBattleCfg[7].gamepad = '4'
	t_keyBattleCfg[8].gamepad = '2'
	t_keyBattleCfg[9].gamepad = '3'
	t_keyBattleCfg[10].gamepad = '5'
	t_keyBattleCfg[11].gamepad = '8'
	t_keyBattleCfg[12].gamepad = '9'
	t_keyBattleCfg[13].gamepad = '-10'
	t_keyBattleCfg[14].gamepad = '6'
	setInputConfig(2, 0, t_keyBattleCfg[1].gamepad, t_keyBattleCfg[2].gamepad, t_keyBattleCfg[3].gamepad, t_keyBattleCfg[4].gamepad, t_keyBattleCfg[5].gamepad, t_keyBattleCfg[6].gamepad, t_keyBattleCfg[7].gamepad, t_keyBattleCfg[8].gamepad, t_keyBattleCfg[9].gamepad, t_keyBattleCfg[10].gamepad, t_keyBattleCfg[11].gamepad, t_keyBattleCfg[12].gamepad, t_keyBattleCfg[13].gamepad, t_keyBattleCfg[14].gamepad) --Apply and Load New Controls
	f_keyBattleSave(2,0)
end

--Default P2 GAMEPAD BATTLE
function f_p2gamepadBattleDefault()
	t_keyBattleCfg2[1].gamepad = '-3'
	t_keyBattleCfg2[2].gamepad = '-4'
	t_keyBattleCfg2[3].gamepad = '-1'
	t_keyBattleCfg2[4].gamepad = '-2'
	t_keyBattleCfg2[5].gamepad = '0'
	t_keyBattleCfg2[6].gamepad = '1'
	t_keyBattleCfg2[7].gamepad = '4'
	t_keyBattleCfg2[8].gamepad = '2'
	t_keyBattleCfg2[9].gamepad = '3'
	t_keyBattleCfg2[10].gamepad = '5'
	t_keyBattleCfg2[11].gamepad = '8'
	t_keyBattleCfg2[12].gamepad = '9'
	t_keyBattleCfg2[13].gamepad = '-10'
	t_keyBattleCfg2[14].gamepad = '6'
	setInputConfig(3, 1, t_keyBattleCfg2[1].gamepad, t_keyBattleCfg2[2].gamepad, t_keyBattleCfg2[3].gamepad, t_keyBattleCfg2[4].gamepad, t_keyBattleCfg2[5].gamepad, t_keyBattleCfg2[6].gamepad, t_keyBattleCfg2[7].gamepad, t_keyBattleCfg2[8].gamepad, t_keyBattleCfg2[9].gamepad, t_keyBattleCfg2[10].gamepad, t_keyBattleCfg2[11].gamepad, t_keyBattleCfg2[12].gamepad, t_keyBattleCfg2[13].gamepad, t_keyBattleCfg2[14].gamepad) --Apply and Load New Controls
	f_keyBattleSave(3,1)
end

--Default P1 KEYBOARD MENU
function f_p1keyboardMenuDefault()
	t_keyMenuCfg[1].keyboard = 'UP'
	t_keyMenuCfg[2].keyboard = 'DOWN'
	t_keyMenuCfg[3].keyboard = 'LEFT'
	t_keyMenuCfg[4].keyboard = 'RIGHT'
	t_keyMenuCfg[5].keyboard = 'a'
	t_keyMenuCfg[6].keyboard = 's'
	t_keyMenuCfg[7].keyboard = 'd'
	t_keyMenuCfg[8].keyboard = 'z'
	t_keyMenuCfg[9].keyboard = 'x'
	t_keyMenuCfg[10].keyboard = 'c'
	t_keyMenuCfg[11].keyboard = 'q'
	t_keyMenuCfg[12].keyboard = 'e'
	t_keyMenuCfg[13].keyboard = 'BACKSPACE'
	t_keyMenuCfg[14].keyboard = 'RETURN'
	setInputConfig(10, -1, t_keyMenuCfg[1].keyboard, t_keyMenuCfg[2].keyboard, t_keyMenuCfg[3].keyboard, t_keyMenuCfg[4].keyboard, t_keyMenuCfg[5].keyboard, t_keyMenuCfg[6].keyboard, t_keyMenuCfg[7].keyboard, t_keyMenuCfg[8].keyboard, t_keyMenuCfg[9].keyboard, t_keyMenuCfg[10].keyboard, t_keyMenuCfg[11].keyboard, t_keyMenuCfg[12].keyboard, t_keyMenuCfg[13].keyboard, t_keyMenuCfg[14].keyboard) --Apply and Load New Controls
	f_keyMenuSave(10,-1)
end

--Default P2 KEYBOARD MENU
function f_p2keyboardMenuDefault()
	t_keyMenuCfg2[1].keyboard = 'KP_8'
	t_keyMenuCfg2[2].keyboard = 'KP_2'
	t_keyMenuCfg2[3].keyboard = 'KP_4'
	t_keyMenuCfg2[4].keyboard = 'KP_6'
	t_keyMenuCfg2[5].keyboard = 'u'
	t_keyMenuCfg2[6].keyboard = 'i'
	t_keyMenuCfg2[7].keyboard = 'o'
	t_keyMenuCfg2[8].keyboard = 'j'
	t_keyMenuCfg2[9].keyboard = 'k'
	t_keyMenuCfg2[10].keyboard = 'l'
	t_keyMenuCfg2[11].keyboard = 'KP_7'
	t_keyMenuCfg2[12].keyboard = 'KP_9'
	t_keyMenuCfg2[13].keyboard = 'KP_PERIOD'
	t_keyMenuCfg2[14].keyboard = 'KP_ENTER'
	setInputConfig(11, -1, t_keyMenuCfg2[1].keyboard, t_keyMenuCfg2[2].keyboard, t_keyMenuCfg2[3].keyboard, t_keyMenuCfg2[4].keyboard, t_keyMenuCfg2[5].keyboard, t_keyMenuCfg2[6].keyboard, t_keyMenuCfg2[7].keyboard, t_keyMenuCfg2[8].keyboard, t_keyMenuCfg2[9].keyboard, t_keyMenuCfg2[10].keyboard, t_keyMenuCfg2[11].keyboard, t_keyMenuCfg2[12].keyboard, t_keyMenuCfg2[13].keyboard, t_keyMenuCfg2[14].keyboard) --Apply and Load New Controls
	f_keyMenuSave(11,-1)
end

--Default P1 GAMEPAD MENU
function f_p1gamepadMenuDefault() --PS3 Gamepad Layout
	t_keyMenuCfg[1].gamepad = '-7'
	t_keyMenuCfg[2].gamepad = '-8'
	t_keyMenuCfg[3].gamepad = '-5'
	t_keyMenuCfg[4].gamepad = '-6'
	t_keyMenuCfg[5].gamepad = '2'
	t_keyMenuCfg[6].gamepad = '3'
	t_keyMenuCfg[7].gamepad = '4'
	t_keyMenuCfg[8].gamepad = '5'
	t_keyMenuCfg[9].gamepad = '8'
	t_keyMenuCfg[10].gamepad = '9'
	t_keyMenuCfg[11].gamepad = '6'
	t_keyMenuCfg[12].gamepad = '0'
	t_keyMenuCfg[13].gamepad = '1'
	t_keyMenuCfg[14].gamepad = '7'
	setInputConfig(12, 0, t_keyMenuCfg[1].gamepad, t_keyMenuCfg[2].gamepad, t_keyMenuCfg[3].gamepad, t_keyMenuCfg[4].gamepad, t_keyMenuCfg[5].gamepad, t_keyMenuCfg[6].gamepad, t_keyMenuCfg[7].gamepad, t_keyMenuCfg[8].gamepad, t_keyMenuCfg[9].gamepad, t_keyMenuCfg[10].gamepad, t_keyMenuCfg[11].gamepad, t_keyMenuCfg[12].gamepad, t_keyMenuCfg[13].gamepad, t_keyMenuCfg[14].gamepad) --Apply and Load New Controls
	f_keyMenuSave(12,0)
end

--Default P2 GAMEPAD MENU
function f_p2gamepadMenuDefault()
	t_keyMenuCfg2[1].gamepad = '-7'
	t_keyMenuCfg2[2].gamepad = '-8'
	t_keyMenuCfg2[3].gamepad = '-5'
	t_keyMenuCfg2[4].gamepad = '-6'
	t_keyMenuCfg2[5].gamepad = '2'
	t_keyMenuCfg2[6].gamepad = '3'
	t_keyMenuCfg2[7].gamepad = '4'
	t_keyMenuCfg2[8].gamepad = '5'
	t_keyMenuCfg2[9].gamepad = '8'
	t_keyMenuCfg2[10].gamepad = '9'
	t_keyMenuCfg2[11].gamepad = '6'
	t_keyMenuCfg2[12].gamepad = '0'
	t_keyMenuCfg2[13].gamepad = '1'
	t_keyMenuCfg2[14].gamepad = '7'
	setInputConfig(13, 1, t_keyMenuCfg2[1].gamepad, t_keyMenuCfg2[2].gamepad, t_keyMenuCfg2[3].gamepad, t_keyMenuCfg2[4].gamepad, t_keyMenuCfg2[5].gamepad, t_keyMenuCfg2[6].gamepad, t_keyMenuCfg2[7].gamepad, t_keyMenuCfg2[8].gamepad, t_keyMenuCfg2[9].gamepad, t_keyMenuCfg2[10].gamepad, t_keyMenuCfg2[11].gamepad, t_keyMenuCfg2[12].gamepad, t_keyMenuCfg2[13].gamepad, t_keyMenuCfg2[14].gamepad) --Apply and Load New Controls
	f_keyMenuSave(13,1)
end

--;===========================================================
--; INFO STUFF
--;===========================================================
txt_exitInfo = createTextImg(jgFnt, 5, 0, "INFORMATION", 159, 63)
txt_Warning = createTextImg(jgFnt, 5, 0, "WARNING", 159, 63)
txt_okOptions = createTextImg(jgFnt, 5, 0, "OK", 159, 143)

--Info Window BG
infoOptionsWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(infoOptionsWindowBG, 83.5, 130)
animSetScale(infoOptionsWindowBG, 1, 0.3)
animUpdate(infoOptionsWindowBG)

--Input Hints Panel
function drawInfoCfgInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("s","132,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
end

--;===========================================================
--; REBOOT INFORMATION
--;===========================================================
t_exitInfo = {
	{text = ""},
	{text = "Some selected options require restart Ikemen. Press"},
	{text = "start key to reboot Ikemen and load your new settings."},
	{text = ""},
}
for i=1, #t_exitInfo do
	t_exitInfo[i]['id'] = createTextImg(font2, 0, 1, t_exitInfo[i].text, 25, 65+i*15)
end

function f_exitInfo()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			sndPlay(sndSys, 100, 2)
			f_saveCfg()
			break
		end
	--Draw BG
		animDraw(f_animVelocity(optionsBG0, -1, -1))
	--Draw Info Title Text
		textImgDraw(txt_exitInfo)
	--Draw Above Window BG
		animSetScale(infoBG, 300, 111)
		animSetWindow(infoBG, 0,70, 295.5,#t_exitInfo*15)
		animDraw(infoBG)
	--Draw Above Info Text
		for i=1, #t_exitInfo do
			textImgDraw(t_exitInfo[i].id)
		end
	--Draw Message Menu BG
		animDraw(infoOptionsWindowBG)
	--Draw OK Below Info Text
		textImgDraw(txt_okOptions)
	--Draw Below Cursor
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ASPECT RATIO WARNING
--;===========================================================
t_resWarning = {
	{text = ""},
	{text = "Non 4:3 resolutions requires stages coded for different"},
	{text = "aspect ratio. Change it back to 4:3 if stages look off."},
	{text = ""},
}
for i=1, #t_resWarning do
	t_resWarning[i]['id'] = createTextImg(font2, 0, 1, t_resWarning[i].text, 25, 65+i*15)
end

function f_resWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			sndPlay(sndSys, 100, 1)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_Warning)
		animSetScale(infoBG, 300, 111)
		animSetWindow(infoBG, 0,70, 297,#t_resWarning*15)
		animDraw(infoBG)
		for i=1, #t_resWarning do
			textImgDraw(t_resWarning[i].id)
		end
		animDraw(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; OPENGL 2.0 WARNING
--;===========================================================
t_glWarning = {
	{text = ""},
	{text = "If your system doesn't support OpenGL 2.0 or later"},
	{text = "edit in save/config.ssz: const bool OpenGL = false"},
	{text = ""},
}
for i=1, #t_glWarning do
	t_glWarning[i]['id'] = createTextImg(font2, 0, 1, t_glWarning[i].text, 25, 65+i*15)
end

function f_glWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			sndPlay(sndSys, 100, 1)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_Warning)
		animSetScale(infoBG, 300, 111)
		animSetWindow(infoBG, 0,70, 296,#t_glWarning*15)
		animDraw(infoBG)
		for i=1, #t_glWarning do
			textImgDraw(t_glWarning[i].id)
		end
		animDraw(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SAVE MEMORY WARNING
--;===========================================================
t_memWarning = {
	{text = ""},
	{text = "Enabling 'Save memory' option negatively affects FPS."},
	{text = "It's not yet known if disabling it has any drawbacks."},
	{text = ""},
}
for i=1, #t_memWarning do
	t_memWarning[i]['id'] = createTextImg(font2, 0, 1, t_memWarning[i].text, 25, 65+i*15)
end

function f_memWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			sndPlay(sndSys, 100, 1)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_Warning)
		animSetScale(infoBG, 300, 111)
		animSetWindow(infoBG, 0,70, 297,#t_memWarning*15)
		animDraw(infoBG)
		for i=1, #t_memWarning do
			textImgDraw(t_memWarning[i].id)
		end
		animDraw(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; WORK IN PROGRESS INFORMATION
--;===========================================================
t_wip = {
	{text = "This option is still Under Development."},
}
for i=1, #t_wip do
	t_wip[i]['id'] = createTextImg(font2, 0, 0, t_wip[i].text, 160, 197+i*15)
end

--;===========================================================
--; ONLINE INFORMATION
--;===========================================================
t_locked = {
	{text = "This option is Unavailable in Online Mode."},
}
for i=1, #t_locked do
	t_locked[i]['id'] = createTextImg(font2, 0, 0, t_locked[i].text, 160, 197+i*15)
end

--;===========================================================
--; SAVE CONFIGURATION INFORMATION
--;===========================================================
t_restart = {
	{text = "The changes that you have made"},
	{text = "require Save and Back."},
}
for i=1, #t_restart do
	t_restart[i]['id'] = createTextImg(font2, 0, 0, t_restart[i].text, 160, 182+i*15)
end

--;===========================================================
--; DEFAULT VALUES MESSAGE
--;===========================================================
txt_defaultquestion = createTextImg(jgFnt, 0, 0, "", 160, 110)

t_defaultMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

--Default Window BG
defaultWindowBG = animNew(sprIkemen, [[
230,1, 0,0,
]])
animSetPos(defaultWindowBG, 83.5, 97)
animSetScale(defaultWindowBG, 1, 1)
animUpdate(defaultWindowBG)

function f_defaultMenu()
	cmdInput()
--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sndSys, 100, 0)
		defaultMenu = defaultMenu - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sndSys, 100, 0)
		defaultMenu = defaultMenu + 1
	end
	if defaultMenu < 1 then
		defaultMenu = #t_defaultMenu
		if #t_defaultMenu > 4 then
			cursorPosYDefault = 4
		else
			cursorPosYDefault = #t_defaultMenu-1
		end
	elseif defaultMenu > #t_defaultMenu then
		defaultMenu = 1
		cursorPosYDefault = 0
	elseif (commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) and cursorPosYDefault > 0 then
		cursorPosYDefault = cursorPosYDefault - 1
	elseif (commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) and cursorPosYDefault < 4 then
		cursorPosYDefault = cursorPosYDefault + 1
	end
	if cursorPosYDefault == 4 then
		moveTxtDefault = (defaultMenu - 5) * 13
	elseif cursorPosYDefault == 0 then
		moveTxtDefault = (defaultMenu - 1) * 13
	end
	if not resetStats then
	--Draw Fade BG
		animDraw(fadeWindowBG)
	end
--Draw Menu BG
	animDraw(defaultWindowBG)
--Draw Title
	if resetStats == true then
		textImgSetText(txt_defaultquestion, "ARE YOU SURE?")
		textImgSetScale(txt_defaultquestion, 1, 1)
	else
		textImgSetText(txt_defaultquestion, "LOAD DEFAULT SETTINGS?")
		textImgSetScale(txt_defaultquestion, 0.8, 0.8)
	end
	textImgDraw(txt_defaultquestion)
--Draw Table Text
	for i=1, #t_defaultMenu do
		if i == defaultMenu then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_defaultMenu[i].id, jgFnt, bank, 0, t_defaultMenu[i].text, 159, 120+i*13-moveTxtDefault))
	end
--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYDefault*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
--Draw Input Hints Panel
	drawConfirmInputHints()
--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sndSys, 100, 2)
		f_defaultReset()
	elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
	--YES
		if defaultMenu == 1 then
			sndPlay(sndSys, 100, 1)
			modified = 1
			updateVars = true
			if defaultAll then
				f_onlineDefault() --Set Default Options for Online/Offline Game
				f_offlineDefault() --Set ONLY Default Options for Offline Game
				needReload = 1
			elseif defaultGame then
				f_gameDefault()
			elseif defaultTeam then
				f_teamDefault()
			elseif defaultZoom then
				f_zoomDefault()
			elseif defaultSystem then
				f_systemDefault()
			elseif defaultSelect then
				f_selectGlobalDefault()
			elseif defaultRoster then
				f_selectDefault()
			elseif defaultStage then
				f_stageDefault()
			elseif defaultTime then
				f_timeDefault()
			elseif defaultAudio then
				f_audioDefault()
				needReload = 1
			elseif defaultSong then
				f_songDefault()
			elseif defaultVideo then
				f_videoDefault()
				needReload = 1
			elseif defaultInput then
				f_inputDefault()
			elseif defaultNetplay then
				f_netplayDefault()
			elseif defaultEngine then
				f_engineDefault()
				needReload = 1
			elseif defaultVN then
				f_vnDefault()
			elseif resetStats then
				f_defaultStats()
			end
	--NO
		else
			sndPlay(sndSys, 100, 2)
		end
		f_defaultReset()
	end
end

function f_defaultReset()
	moveTxtDefault = 0
--Cursor pos in NO
	cursorPosYDefault = 1
	defaultMenu = 2
--Reset
	defaultScreen = false
	defaultAll = false
	defaultGame = false
	defaultTeam = false
	defaultZoom = false
	defaultSystem = false
	defaultSelect = false
	defaultRoster = false
	defaultStage = false
	defaultTime = false
	defaultVideo = false
	defaultAudio = false
	defaultSong = false
	defaultInput = false
	defaultNetplay = false
	defaultEngine = false
	defaultVN = false
	resetStats = false
end

--;===========================================================
--; SETTINGS MENU
--;===========================================================
txt_mainCfg = createTextImg(jgFnt, 0, 0, "OPTIONS", 159, 13)

t_mainCfg = {
	{text = "Game Settings",	  			 gotomenu = "if data.engineMode == 'FG' then f_gameCfg() elseif data.engineMode == 'VN' then f_gameVNcfg() end"},
	{text = "System Settings",  			 gotomenu = "if data.engineMode == 'FG' then f_UICfg() else sndPlay(sndIkemen, 200, 0) end"},
	{text = "Video Settings",  				 gotomenu = "f_videoCfg()"},
	{text = "Audio Settings",  				 gotomenu = "f_audioCfg()"},
	{text = "Input Settings",  				 gotomenu = "f_inputCfg()"},
	{text = "Netplay Settings",  			 gotomenu = "f_netplayCfg()"},
	{text = "Engine Settings",  			 gotomenu = "f_engineCfg()"},
	{text = "All Default Values",			 gotomenu = "sndPlay(sndSys, 100, 1) defaultAll = true defaultScreen = true"},
	{text = "              Save and Back",   gotomenu = "exitSaveCfg = true"},
	{text = "          Back Without Saving", gotomenu = "exitNoSaveCfg = true"},
}
for i=1, #t_mainCfg do
	t_mainCfg[i]['varID'] = textImgNew()
end
--Access to Online Settings from Offline Mode (Only for Dev Purposes, Delete when test are finished)
table.insert(t_mainCfg,#t_mainCfg+1,{text = "Online Test Config", gotomenu = "f_onlineCfg()", varID = textImgNew()})

function f_mainCfg()
	cmdInput()
	f_loadCfg()
	f_loadEXCfg()
	local cursorPosY = 1
	local moveTxt = 0
	local mainCfg = 1
	local bufl = 0
	local bufr = 0
	local bufu = 0
	local bufd = 0
	local maxItems = 12
	local t = 0
	exitSaveCfg = false
	exitNoSaveCfg = false
	f_defaultReset()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if not defaultScreen then --Stay in Options screen (For Pop-Ups messages)
		--Save and Back
			if esc() or exitSaveCfg or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				if data.portraitDisplay == "Sprite" or data.portraitDisplay == "Mixed" then
					data.sffConversion = true
					--needReload = 1
				else
					data.sffConversion = false
				end
				if data.erase then --reset stats files
					init_generalStats()
					init_unlocksStats()
					f_saveStats()
					f_saveVN()
					data.erase = false
				end
				if needReload == 1 then
					f_exitInfo()
				end
				f_saveCfg()
				if data.engineMode == "VN" then f_saveVN() end
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
				break
		--Back Without Save
			elseif exitNoSaveCfg then
				assert(loadfile(saveCfgPath))() --Load old data no saved
				if data.engineMode == "VN" then assert(loadfile(saveVNPath))() end
				f_loadCfg()
				f_loadEXCfg()
				setFullScreenMode(b_fullscreenMode)
				setScreenMode(b_screenMode)
				setAspectRatio(b_aspectMode)
				setWindowType(windowType)
				setGameRes(resolutionWidth, resolutionHeight)
				setBrightness(brightnessAdjust)
				setOpacity(opacityAdjust / 100)
				setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
				setVideoVolume(vid_vol)
				setPanStr(pan_str / 100)
				needReload = 0
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
				break
		--Up
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				mainCfg = mainCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Down
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				mainCfg = mainCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Common Enter Actions
			elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				f_gotoFunction(t_mainCfg[mainCfg]) --Functions are called from t_mainCfg table
			end
		--Cursor position calculation
			if mainCfg < 1 then
				mainCfg = #t_mainCfg
				if #t_mainCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_mainCfg
				end
			elseif mainCfg > #t_mainCfg then
				mainCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (mainCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (mainCfg - 1) * 15
			end	
			if #t_mainCfg <= maxItems then
				maxMainCfg = #t_mainCfg
			elseif mainCfg - cursorPosY > 0 then
				maxMainCfg = mainCfg + maxItems - cursorPosY
			else
				maxMainCfg = maxItems
			end
		end
	--Draw Menu BG
		animDraw(f_animVelocity(optionsBG0, -1, -1))
	--Draw Transparent Table BG
		animSetScale(optionsBG1, 220, maxMainCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
	--Draw Title Menu
		textImgDraw(txt_mainCfg)
		if not defaultScreen then
		--Draw Table Cursor
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	--Draw Text for Table
		for i=1, maxMainCfg do	
			if i > mainCfg - cursorPosY then
				if t_mainCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_mainCfg[i].varID, font2, 0, 1, t_mainCfg[i].text, 85, 15+i*15-moveTxt))
					--textImgDraw(f_updateTextImg(t_mainCfg[i].varID, font2, 0, -1, t_mainCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
	--Draw Up Animated Cursor
		if maxMainCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
	--Draw Down Animated Cursor
		if #t_mainCfg > maxItems and maxMainCfg < #t_mainCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
	--Draw Info
		if needReload == 1 then
			for i=1, #t_restart do
				if t%60 < 40 then
					textImgDraw(t_restart[i].id)
				end
				t = t >= 60 and 0 or t + 1
			end
		end
		if defaultScreen then
			f_defaultMenu() --Show Default Screen Message
		else
			drawCfgInputHints()
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; NETPLAY SETTINGS
--;===========================================================
txt_netplayCfg = createTextImg(jgFnt, 0, 0, "NETPLAY SETTINGS", 159, 13)
txt_bar = createTextImg(opFnt, 0, 0, "|", 235, 17.5+5*15, .5, .5)

t_netplayCfg = {
	{text = "Username",        		 varText = data.userName},
	{text = "Port Change",        	 varText = getListenPort()},
	{text = "Connection Type",		 varText = data.connectMode},
--[[
	{text = "Input Delay",		 	 varText = from 0 to 4},
	{text = "Show Input Delay",	 	 varText = Yes/No},
	{text = "Show Username",	 	 varText = Yes/No},
]]
	{text = "Default Values",  	 	 varText = ""},
	{text = "          BACK", 		 varText = ""},
}
for i=1, #t_netplayCfg do
	t_netplayCfg[i]['varID'] = textImgNew()
end

function f_netplayCfg()
	cmdInput()
	f_loadNETCfg()
	f_loadEXCfg()
	local cursorPosY = 1
	local moveTxt = 0
	local netplayCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	--
	local onlinePort = ""
	local portEdit = false
	local playerName = ""
	local nameEdit = false
	local editDone = true
	sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen and editDone then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				netplayCfg = netplayCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				netplayCfg = netplayCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Edit Player Name
			elseif netplayCfg == 1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				playerName = ""
				nameEdit = true
				editDone = false
				i = 0
				commandBufReset(p1Cmd)
				commandBufReset(p2Cmd)
		--Edit Online Port
			elseif netplayCfg == 2 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				onlinePort = ""
				portEdit = true
				editDone = false
				i = 0
				commandBufReset(p1Cmd)
				commandBufReset(p2Cmd)
		--Netplay Connection Type
			elseif netplayCfg == 3 then
				if (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.connectMode == "Direct" then
					sndPlay(sndSys, 100, 0)
					data.connectMode = "Database"
					modified = 1
				--elseif (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.connectMode == "Database" then
					--data.connectMode = "Server"
					--modified = 1
				--elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.connectMode == "Server" then
					--data.connectMode = "Database"
					--modified = 1
				elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.connectMode == "Database" then
					sndPlay(sndSys, 100, 0)
					data.connectMode = "Direct"
					modified = 1
				end
		--Default Values
			elseif netplayCfg == #t_netplayCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultNetplay = true
				defaultScreen = true
		--BACK
			elseif netplayCfg == #t_netplayCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if netplayCfg < 1 then
				netplayCfg = #t_netplayCfg
				if #t_netplayCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_netplayCfg
				end
			elseif netplayCfg > #t_netplayCfg then
				netplayCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (netplayCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (netplayCfg - 1) * 15
			end	
			if #t_netplayCfg <= maxItems then
				maxnetplayCfg = #t_netplayCfg
			elseif netplayCfg - cursorPosY > 0 then
				maxnetplayCfg = netplayCfg + maxItems - cursorPosY
			else
				maxnetplayCfg = maxItems
			end
		--Update Values
			t_netplayCfg[1].varText = data.userName
			t_netplayCfg[2].varText = getListenPort()
			t_netplayCfg[3].varText = data.connectMode
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxnetplayCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_netplayCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	--Player Name Change
		if not editDone and nameEdit then
			if esc() then
				clearInputText()
				sndPlay(sndSys, 100, 2)
				t_netplayCfg[1].varText = data.userName--getUserName()
				nameEdit = false
				editDone = true
			end
			playerName = inputText('',true) --For not numbers use inputText('text',true)
			if clipboardPaste() then
				if string.match(getClipboardText(), '^([^"]*)$') then
					setInputText(getClipboardText())
				else
					sndPlay(sndIkemen, 200, 0)
				end
			end
			if playerName:len() > 5 then
				playerName = playerName:sub(1,16)
				setInputText(playerName)
			end
			if playerName ~= '' and playerName ~= nil then
				if playerName:match('^"*(%")$') then
					playerName = playerName:gsub('^("*)[%"]$','%1')
				--[[
					What if you want to get certain pieces out of a string of text?
					This can be done by wrapping parts of a pattern in ( ), and the contents of each of these captures
					will be returned from string.match.
					string.match("foo: 123 bar: 456", '(%a+):%s*(%d+)%s+(%a+):%s*(%d+)') -- %a: letter %s: whitespace
					foo 123 bar 456
				]]
					setInputText(playerName)
				end
			end
			if returnKey() then --If you are using a keyboard, use enter key to accept
			--if commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				commandBufReset(p1Cmd)
				commandBufReset(p2Cmd)
				if playerName ~= '' and playerName ~= nil then
					clearInputText()
					sndPlay(sndSys, 100, 1)
					data.userName = (tostring(playerName))
					modified = 1
					nameEdit = false
					editDone = true
				else 
					sndPlay(sndIkemen, 200, 0)
				end
			end
			if not editDone and nameEdit then
				t_netplayCfg[1].varText = playerName
			end
		end
	--Online Port Change
		if not editDone and portEdit then
			if esc() then
				clearInputText()
				sndPlay(sndSys, 100, 2)
				t_netplayCfg[2].varText = getListenPort()
				portEdit = false
				editDone = true
			end
			onlinePort = inputText('num',true)
			if clipboardPaste() then
				if string.match(getClipboardText(),'^%d+$') then 
					setInputText(getClipboardText())
				else
					sndPlay(sndIkemen, 200, 0)
				end
			end
			if onlinePort:len() > 5 then
				onlinePort = onlinePort:sub(1,5)
				setInputText(onlinePort)
			end
			if onlinePort ~= '' and onlinePort ~= nil then
				if tonumber(onlinePort) ~= nil then --Input is a valid Number
					if tonumber(onlinePort) > 65535 then
						onlinePort = '65535'
						setInputText(onlinePort)
					elseif onlinePort:match('^.*(%.)$') then --Allow Points: match('^0(%d+)$')
						onlinePort = onlinePort:gsub('^(.*)[%.]$','%1') --Allow Points: gsub('^0(%d+)$','%1')
						setInputText(onlinePort)
					end
				end
			end
			if returnKey() then --If you are using a keyboard, use enter key to accept
			--if commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				commandBufReset(p1Cmd)
				commandBufReset(p2Cmd)
				if onlinePort ~= '' and onlinePort ~= nil and tonumber(onlinePort) ~= nil then --Port is a valid Number
					clearInputText()
					sndPlay(sndSys, 100, 1)
					setListenPort(tonumber(onlinePort))
					modified = 1
					portEdit = false
					editDone = true
				else 
					sndPlay(sndIkemen, 200, 0)
				end
			end
			if not editDone and portEdit then
				t_netplayCfg[2].varText = onlinePort
			end
		end
	--Draw Blinking Cursor for Username and Online Port Fields
		if not editDone then
			if i%60 < 30 then
				textImgPosDraw(txt_bar,235+1.5,17.5+cursorPosY*15)
			end
			i = i >= 60 and 0 or i + 1
		end
		for i=1, maxnetplayCfg do
			if i > netplayCfg - cursorPosY then
				if t_netplayCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_netplayCfg[i].varID, font2, 0, 1, t_netplayCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_netplayCfg[i].varID, font2, 0, -1, t_netplayCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxnetplayCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_netplayCfg > maxItems and maxnetplayCfg < #t_netplayCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ONLINE SETTINGS (TEMPORARY FOR WHEN BOTH PLAYERS ARE CONNECTED)
--;===========================================================
txt_onlineCfg = createTextImg(jgFnt, 0, 0, "ONLINE SETTINGS", 159, 13)

t_onlineCfg = {
	{text = "Game Settings",		varText = ""},
	{text = "Engine Settings",		varText = ""},
	{text = "Lobby Settings",		varText = ""},
	{text = "      SAVE AND PLAY",	varText = ""},
}
for i=1, #t_onlineCfg do
	t_onlineCfg[i]['varID'] = textImgNew()
end

function f_onlineCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local onlineCfg = 1
	local bufl = 0
	local bufr = 0
	local bufu = 0
	local bufd = 0
	local maxItems = 12
	f_defaultReset() --To avoid maxCfg erros when enter in any sub-menu when reset settings
	--sndPlay(sndSys, 100, 1)
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			onlineCfg = onlineCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			onlineCfg = onlineCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			sndPlay(sndSys, 100, 1)
		--Game Settings
			if onlineCfg == 1 then
				f_gameCfg()
		--Engine Settings
			elseif onlineCfg == 2 then
				f_engineCfg()
		--Lobby Settings
			elseif onlineCfg == 3 then
				f_lobbyCfg()
		--Save and Play
			elseif onlineCfg == 4 then
				--data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade) --Delete?
				if modified == 1 then
					f_netsaveCfg()
				end
				f_mainLobby() --Declared in main.lua
				break
			end
		end
		if onlineCfg < 1 then
			onlineCfg = #t_onlineCfg
			if #t_onlineCfg > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_onlineCfg
			end
		elseif onlineCfg > #t_onlineCfg then
			onlineCfg = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (onlineCfg - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (onlineCfg - 1) * 15
		end	
		if #t_onlineCfg <= maxItems then
			maxOnlineCfg = #t_onlineCfg
		elseif onlineCfg - cursorPosY > 0 then
			maxOnlineCfg = onlineCfg + maxItems - cursorPosY
		else
			maxOnlineCfg = maxItems
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxOnlineCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_onlineCfg)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxOnlineCfg do	
			if i > onlineCfg - cursorPosY then
				if t_onlineCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_onlineCfg[i].varID, font2, 0, 1, t_onlineCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_onlineCfg[i].varID, font2, 0, -1, t_onlineCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxOnlineCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_onlineCfg > maxItems and maxOnlineCfg < #t_onlineCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; NETPLAY LOBBY SETTINGS (WIP)
--;===========================================================
txt_lobbyCfg = createTextImg(jgFnt, 0, 0, "NETPLAY ROOM SETTINGS", 159, 13)

t_lobbyCfg = {
	{text = "VS Match",			varText = data.ftcontrol},
	{text = "Room Name",		varText = ""},
	{text = "Pause Menu",		varText = "No"},
	{text = "Looby Size",		varText = "2"},
	{text = "Spectate",			varText = "No"},
	{text = "Private Game",		varText = "Yes"},
	{text = "Show Names",		varText = "No"},
	{text = "Show Input Delay",	varText = "No"},
	{text = "          BACK",  	varText = ""},
}
for i=1, #t_lobbyCfg do
	t_lobbyCfg[i]['varID'] = textImgNew()
end

function f_lobbyCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local lobbyCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	--sndPlay(sndSys, 100, 1)
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			lockSetting = false
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			lockSetting = false
			lobbyCfg = lobbyCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			lockSetting = false
			lobbyCfg = lobbyCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
	--Ranked Matchs
		elseif lobbyCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
			sndPlay(sndSys, 100, 0)
			if (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.ftcontrol == -1 then
				data.ftcontrol = 2
			elseif (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.ftcontrol == 2 then
				data.ftcontrol = 3
			elseif (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.ftcontrol == 3 then
				data.ftcontrol = 5
			elseif (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.ftcontrol == 5 then
				data.ftcontrol = 10
			elseif (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.ftcontrol == 10 then
				data.ftcontrol = 15
			elseif (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) and data.ftcontrol == 15 then
				data.ftcontrol = 20
			elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.ftcontrol == 20 then
				data.ftcontrol = 15
			elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.ftcontrol == 15 then
				data.ftcontrol = 10
			elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.ftcontrol == 10 then
				data.ftcontrol = 5
			elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.ftcontrol == 5 then
				data.ftcontrol = 3
			elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.ftcontrol == 3 then
				data.ftcontrol = 2
			elseif (commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) and data.ftcontrol == 2 then
				data.ftcontrol = -1
			end
	--WIP
		elseif (lobbyCfg == 2 or lobbyCfg == 3 or lobbyCfg == 4 or lobbyCfg == 5 or lobbyCfg == 6 or lobbyCfg == 7 or lobbyCfg == 8) and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			lockSetting = true
	--BACK
		elseif lobbyCfg == 9 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
			sndPlay(sndSys, 100, 2)
			break
		end
		if lobbyCfg < 1 then
			lobbyCfg = #t_lobbyCfg
			if #t_lobbyCfg > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_lobbyCfg
			end
		elseif lobbyCfg > #t_lobbyCfg then
			lobbyCfg = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (lobbyCfg - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (lobbyCfg - 1) * 15
		end	
		if #t_lobbyCfg <= maxItems then
			maxlobbyCfg = #t_lobbyCfg
		elseif lobbyCfg - cursorPosY > 0 then
			maxlobbyCfg = lobbyCfg + maxItems - cursorPosY
		else
			maxlobbyCfg = maxItems
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxlobbyCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_lobbyCfg)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if lockSetting then
			for i=1, #t_wip do
				textImgDraw(t_wip[i].id)
			end
		end	
		if data.ftcontrol == -1 then
			t_lobbyCfg[1].varText = "Unranked/FFA"
		else
			t_lobbyCfg[1].varText = "Ranked/FT"..data.ftcontrol
		end		
		for i=1, maxlobbyCfg do	
			if i > lobbyCfg - cursorPosY then
				if t_lobbyCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_lobbyCfg[i].varID, font2, 0, 1, t_lobbyCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_lobbyCfg[i].varID, font2, 0, -1, t_lobbyCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxlobbyCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_lobbyCfg > maxItems and maxlobbyCfg < #t_lobbyCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawCfgInputHints()
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; GAMEPLAY SETTINGS
--;===========================================================
txt_gameCfg = createTextImg(jgFnt, 0, 0, "GAME SETTINGS", 159, 13)

t_gameCfg = {
	{text = "Difficulty Level",      varText = data.difficulty},
	{text = "Time Limit",         	 varText = data.roundTime},
	{text = "Rounds to Win",      	 varText = data.roundsNum},
	{text = "Max Draw Games",      	 varText = drawNum},
	{text = "Life",               	 varText = data.lifeMul.."%"},
	{text = "Game Speed",  	         varText = s_gameSpeed},
	{text = "Quick Arcade Continue", varText = ""},
--[[
	{text = "Dizzy", 				 varText = data.stun},
	{text = "Guard Break", 			 varText = data.guardBreak},
]]
	{text = "AI Palette",  	    	 varText = data.aipal},
	{text = "AI Ramping",            varText = ""},
	{text = "VS Kumite Amount",  	 varText = data.kumite},
	{text = "Team Settings",  		 varText = ""},
	{text = "Zoom Settings",  		 varText = ""},
	{text = "Default Values",		 varText = ""},
	{text = "          BACK",  		 varText = ""},
}
for i=1, #t_gameCfg do
	t_gameCfg[i]['varID'] = textImgNew()
end

function f_gameCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local gameCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				lockSetting = false --Boolean to remove the Lock setting message, if the above or below option is available for online settings
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				lockSetting = false --Boolean to remove the Lock setting message, if the above or below option is available for online settings
				sndPlay(sndSys, 100, 0)
				gameCfg = gameCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				lockSetting = false --Boolean to remove the Lock setting message, if the above or below option is available for online settings
				sndPlay(sndSys, 100, 0)
				gameCfg = gameCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Difficulty Level
			elseif gameCfg == 1 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.difficulty < 8 then sndPlay(sndSys, 100, 0) end
					if data.difficulty < 8 then
						data.difficulty = data.difficulty + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.difficulty > 1 then sndPlay(sndSys, 100, 0) end
					if data.difficulty > 1 then
						data.difficulty = data.difficulty - 1
					end
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
		--Round Time
			elseif gameCfg == 2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.roundTime < 1000 then
						data.roundTime = data.roundTime + 1
					else
						data.roundTime = -1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.roundTime > -1 then
						data.roundTime = data.roundTime - 1
					else
						data.roundTime = 1000
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.roundsNum < 5 then sndPlay(sndSys, 100, 0) end
					if data.roundsNum < 5 then
						data.roundsNum = data.roundsNum + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.roundsNum > 1 then sndPlay(sndSys, 100, 0) end
					if data.roundsNum > 1 then
						data.roundsNum = data.roundsNum - 1
					end
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
		--Max Draw Games
			elseif gameCfg == 4 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and drawNum < 2 then sndPlay(sndSys, 100, 0) end
					if drawNum < 2 then
						drawNum = drawNum + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and drawNum > 0 then sndPlay(sndSys, 100, 0) end
					if drawNum > 0 then
						drawNum = drawNum - 1
					end
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
		--Life
			elseif gameCfg == 5 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.lifeMul < 300 then sndPlay(sndSys, 100, 0) end
					if data.lifeMul < 300 then 
						data.lifeMul = data.lifeMul + 10
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.lifeMul > 10 then sndPlay(sndSys, 100, 0) end
					if data.lifeMul > 10 then
						data.lifeMul = data.lifeMul - 10
					end
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
		--Game Speed
			elseif gameCfg == 6 then
				if onlinegame then --Detects if this option needs to be locked in online settings
					lockSetting = true --Boolean to show a Lock setting message
				else --allow use the option offline
					if commandGetState(p1Cmd, 'r') and gameSpeed < 72 then
						sndPlay(sndSys, 100, 0)
						if gameSpeed < 48 then
							gameSpeed = 48
							s_gameSpeed = "Slow"
						elseif gameSpeed < 60 then
							gameSpeed = 60
							s_gameSpeed = "Normal"
						elseif gameSpeed < 72 then
							gameSpeed = 72
							s_gameSpeed = "Turbo"
						end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and gameSpeed > 48 then
						sndPlay(sndSys, 100, 0)
						if gameSpeed >= 64 then
							gameSpeed = 60
							s_gameSpeed = "Normal"
						elseif gameSpeed >= 56 then
							gameSpeed = 48
							s_gameSpeed = "Slow"
						end
						modified = 1
					end
				end
		--Quick Continue for Arcade
			elseif gameCfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.quickCont then
					data.quickCont = false
				else
					data.quickCont = true
				end
				modified = 1
		--AI Palette
			elseif gameCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.aipal == "Default" then data.aipal = "Random"
				elseif data.aipal == "Random" then data.aipal = "Default"
				end
				modified = 1
		--AI Ramping
			elseif gameCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.aiRamping then
					data.aiRamping = false
				else
					data.aiRamping = true
				end
				modified = 1
		--VS Kumite Amount
			elseif gameCfg == 10 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.kumite < 1000 then
						data.kumite = data.kumite + 1
					else
						data.kumite = 1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.kumite > 0 then
						data.kumite = data.kumite - 1
					else
						data.kumite = 1000
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		--Team Settings
			elseif gameCfg == 11 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				f_teamCfg()
		--Zoom Settings
			elseif gameCfg == 12 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then	
				sndPlay(sndSys, 100, 1)
				f_zoomCfg()
		--Default Values
			elseif gameCfg == #t_gameCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultGame = true
				defaultScreen = true
		--BACK
			elseif gameCfg == #t_gameCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if gameCfg < 1 then
				gameCfg = #t_gameCfg
				if #t_gameCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_gameCfg
				end
			elseif gameCfg > #t_gameCfg then
				gameCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (gameCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (gameCfg - 1) * 15
			end	
			if #t_gameCfg <= maxItems then
				maxGameCfg = #t_gameCfg
			elseif gameCfg - cursorPosY > 0 then
				maxGameCfg = gameCfg + maxItems - cursorPosY
			else
				maxGameCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxGameCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_gameCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if lockSetting then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end
		t_gameCfg[1].varText = data.difficulty
		if data.roundTime ~= -1 then
			t_gameCfg[2].varText = data.roundTime
		else
			t_gameCfg[2].varText = "Infinite"
		end
		t_gameCfg[3].varText = data.roundsNum
		t_gameCfg[4].varText = drawNum		
		t_gameCfg[5].varText = data.lifeMul.."%"
		t_gameCfg[6].varText = s_gameSpeed
		if data.quickCont then t_gameCfg[7].varText = "Yes" else t_gameCfg[7].varText = "No" end
		t_gameCfg[8].varText = data.aipal
		if data.aiRamping then t_gameCfg[9].varText = "Yes" else t_gameCfg[9].varText = "No" end
		t_gameCfg[10].varText = data.kumite
		for i=1, maxGameCfg do	
			if i > gameCfg - cursorPosY then
				if t_gameCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_gameCfg[i].varID, font2, 0, 1, t_gameCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_gameCfg[i].varID, font2, 0, -1, t_gameCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxGameCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_gameCfg > maxItems and maxGameCfg < #t_gameCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; TEAM SETTINGS
--;===========================================================
txt_teamCfg = createTextImg(jgFnt, 0, 0, "TEAM SETTINGS", 159, 13)

t_teamCfg = {
	{text = "Single VS Team Life",     	varText = data.team1VS2Life.."%"},
	{text = "Turns HP Recovery",       	varText = data.turnsRecoveryRate.."%"},
	{text = "Life Share", 				varText = ""},
	{text = "Power Share", 				varText = ""},
	{text = "Team Duplicates",			varText = ""},
	{text = "Turns Players Limit",     	varText = data.numTurns},
	{text = "Simul Players Limit",     	varText = data.numSimul},
	{text = "Simul Type",              	varText = data.simulType},
	{text = "Co-Op CPU Team",          	varText = data.coopenemy},
	{text = "Default Values",  	  		varText = ""},
	{text = "          BACK",  			varText = ""},
}
for i=1, #t_teamCfg do
	t_teamCfg[i]['varID'] = textImgNew()
end

function f_teamCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local teamCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	--sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				teamCfg = teamCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				teamCfg = teamCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--P1 Vs Team Life
			elseif teamCfg == 1 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.team1VS2Life < 3000 then sndPlay(sndSys, 100, 0) end
					if data.team1VS2Life < 3000 then
						data.team1VS2Life = data.team1VS2Life + 10
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.team1VS2Life > 10 then sndPlay(sndSys, 100, 0) end
					if data.team1VS2Life > 10 then
						data.team1VS2Life = data.team1VS2Life - 10
					end
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
		--Turns HP Recovery
			elseif teamCfg == 2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.turnsRecoveryRate < 3000 then sndPlay(sndSys, 100, 0) end
					if data.turnsRecoveryRate < 3000 then 
						data.turnsRecoveryRate = data.turnsRecoveryRate + 10
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.turnsRecoveryRate > 10 then	sndPlay(sndSys, 100, 0) end
					if data.turnsRecoveryRate > 10 then
						data.turnsRecoveryRate = data.turnsRecoveryRate - 10
					end
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
		--Team Life Share
			elseif teamCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.teamLifeShare then
					data.teamLifeShare = false
				else
					data.teamLifeShare = true
				end
				modified = 1
		--Team Power Share
			elseif teamCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.teamPowerShare then
					data.teamPowerShare = false
				else
					data.teamPowerShare = true
				end
				modified = 1
		--Team Duplicates
			elseif teamCfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.teamDuplicates then
					data.teamDuplicates = false
				else
					data.teamDuplicates = true
				end
				modified = 1
		--Turns Limit (by default also requires editing 'if(!.m.inRange!int?(1, 4, nt)){' in ssz/system-script.ssz)
			elseif teamCfg == 6 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.numTurns < 4 then sndPlay(sndSys, 100, 0) end
					if data.numTurns < 4 then
						data.numTurns = data.numTurns + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.numTurns > 2 then sndPlay(sndSys, 100, 0) end
					if data.numTurns > 2 then
						data.numTurns = data.numTurns - 1
					end
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
		--Simul Limit (by default also requires editing 'const int maxSimul = 4;' in ssz/common.ssz)
			elseif teamCfg == 7 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.numSimul < 4 then sndPlay(sndSys, 100, 0) end
					if data.numSimul < 4 then
						data.numSimul = data.numSimul + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.numSimul > 2 then sndPlay(sndSys, 100, 0) end
					if data.numSimul > 2 then
						data.numSimul = data.numSimul - 1
					end
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
		--Simul Type (Fixed by Strong FS)
			elseif teamCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.simulType == "Tag" then
					data.simulType = "Assist"
				else
					data.simulType = "Tag"
				end
				modified = 1
		--Co-Op CPU Team Mode
			elseif teamCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.coopenemy == "Single" then
					sndPlay(sndSys, 100, 0)
					data.coopenemy = "Simul"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.coopenemy == "Simul" then
					sndPlay(sndSys, 100, 0)
					data.coopenemy = "Turns"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.coopenemy == "Simul" then
					sndPlay(sndSys, 100, 0)
					data.coopenemy = "Single"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.coopenemy == "Turns" then
					sndPlay(sndSys, 100, 0)
					data.coopenemy = "Simul"
					modified = 1
				end
		--Default Values
			elseif teamCfg == #t_teamCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultTeam = true
				defaultScreen = true
		--BACK
			elseif teamCfg == #t_teamCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if teamCfg < 1 then
				teamCfg = #t_teamCfg
				if #t_teamCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_teamCfg
				end
			elseif teamCfg > #t_teamCfg then
				teamCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (teamCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (teamCfg - 1) * 15
			end	
			if #t_teamCfg <= maxItems then
				maxTeamCfg = #t_teamCfg
			elseif teamCfg - cursorPosY > 0 then
				maxTeamCfg = teamCfg + maxItems - cursorPosY
			else
				maxTeamCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxTeamCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_teamCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		t_teamCfg[1].varText = data.team1VS2Life.."%"
		t_teamCfg[2].varText = data.turnsRecoveryRate.."%"
		if data.teamLifeShare then t_teamCfg[3].varText = "Yes" else t_teamCfg[3].varText = "No" end
		if data.teamPowerShare then t_teamCfg[4].varText = "Yes" else t_teamCfg[4].varText = "No" end
		if data.teamDuplicates then t_teamCfg[5].varText = "Yes" else t_teamCfg[5].varText = "No" end
		t_teamCfg[6].varText = data.numTurns
		t_teamCfg[7].varText = data.numSimul
		t_teamCfg[8].varText = data.simulType
		t_teamCfg[9].varText = data.coopenemy
		for i=1, maxTeamCfg do
			if i > teamCfg - cursorPosY then
				if t_teamCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_teamCfg[i].varID, font2, 0, 1, t_teamCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_teamCfg[i].varID, font2, 0, -1, t_teamCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxTeamCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_teamCfg > maxItems and maxTeamCfg < #t_teamCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ZOOM SETTINGS
--;===========================================================
txt_zoomCfg = createTextImg(jgFnt, 0, 0, "ZOOM SETTINGS", 159, 13)

t_zoomCfg = {
	{text = "Zoom Active",    			varText = ""},
	{text = "Max Zoom Out",   			varText = data.zoomMin},
	{text = "Max Zoom In",    			varText = data.zoomMax},
	{text = "Zoom Speed",     			varText = data.zoomSpeed},
	{text = "Default Values",  	 		varText = ""},
	{text = "          BACK", 			varText = ""},
}
for i=1, #t_zoomCfg do
	t_zoomCfg[i]['varID'] = textImgNew()
end

function f_zoomCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local zoomCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	--sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				zoomCfg = zoomCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				zoomCfg = zoomCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Zoom Active
			elseif zoomCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.zoomActive then
					data.zoomActive = false
				else
					data.zoomActive = true
				end
				modified = 1
		--Max Zoom Out
			elseif zoomCfg == 2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.zoomMin < 10 then sndPlay(sndSys, 100, 0) end
					if data.zoomMin < 10 then
						data.zoomMin = data.zoomMin + 0.05
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.zoomMin > 0.05 then	sndPlay(sndSys, 100, 0) end
					if data.zoomMin > 0.05 then
						data.zoomMin = data.zoomMin - 0.05
					end
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
		--Max Zoom In
			elseif zoomCfg == 3 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.zoomMax < 10 then sndPlay(sndSys, 100, 0) end
					if data.zoomMax < 10 then
						data.zoomMax = data.zoomMax + 0.05
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.zoomMax > 0.05 then	sndPlay(sndSys, 100, 0) end
					if data.zoomMax > 0.05 then 
						data.zoomMax = data.zoomMax - 0.05
					end
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
		--Zoom Speed
			elseif zoomCfg == 4 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.zoomSpeed < 10 then	sndPlay(sndSys, 100, 0) end
					if data.zoomSpeed < 10 then
						data.zoomSpeed = data.zoomSpeed + 0.1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.zoomSpeed > 0.2 then sndPlay(sndSys, 100, 0) end
					if data.zoomSpeed > 0.2 then
						data.zoomSpeed = data.zoomSpeed - 0.1
					end
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
		--Default Values
			elseif zoomCfg == #t_zoomCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultZoom = true
				defaultScreen = true
		--BACK
			elseif zoomCfg == #t_zoomCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if zoomCfg < 1 then
				zoomCfg = #t_zoomCfg
				if #t_zoomCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_zoomCfg
				end
			elseif zoomCfg > #t_zoomCfg then
				zoomCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (zoomCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (zoomCfg - 1) * 15
			end	
			if #t_zoomCfg <= maxItems then
				maxZoomCfg = #t_zoomCfg
			elseif zoomCfg - cursorPosY > 0 then
				maxZoomCfg = zoomCfg + maxItems - cursorPosY
			else
				maxZoomCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxZoomCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_zoomCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if data.zoomActive then t_zoomCfg[1].varText = "Yes" else t_zoomCfg[1].varText = "No" end
		t_zoomCfg[2].varText = data.zoomMin
		t_zoomCfg[3].varText = data.zoomMax
		t_zoomCfg[4].varText = data.zoomSpeed
		for i=1, maxZoomCfg do
			if i > zoomCfg - cursorPosY then
				if t_zoomCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_zoomCfg[i].varID, font2, 0, 1, t_zoomCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_zoomCfg[i].varID, font2, 0, -1, t_zoomCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxZoomCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_zoomCfg > maxItems and maxZoomCfg < #t_zoomCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SYSTEM SETTINGS
--;===========================================================
txt_UICfg = createTextImg(jgFnt, 0, 0, "SYSTEM SETTINGS", 159, 13)

t_UICfg = {
	{text = "Language", 		         varText = data.language},
	{text = "Clock Format",              varText = ""},
	{text = "Date Format",               varText = ""},
	{text = "Attract Mode",  	      	 varText = ""},
	{text = "Portrait Display",		     varText = data.portraitDisplay},
	{text = "Versus Win Counter",  	     varText = ""},
	{text = "Win Screen",	    		 varText = data.winscreen},
	{text = "Service Interaction",		 varText = data.serviceType},
	{text = "Order Select Type",		 varText = data.orderSelType},
	{text = "Character Select Settings", varText = ""},
	{text = "Stage Select Settings",     varText = ""},
	{text = "Timers Settings",  	  	 varText = ""},
	{text = "Songs Settings",	 		 varText = ""},
	{text = "Default Settings",  	  	 varText = ""},
	{text = "          BACK",  		     varText = ""},
}
for i=1, #t_UICfg do
	t_UICfg[i]['varID'] = textImgNew()
end

function f_UICfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local UICfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				lockSetting = false
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				lockSetting = false
				sndPlay(sndSys, 100, 0)
				UICfg = UICfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				lockSetting = false
				sndPlay(sndSys, 100, 0)
				UICfg = UICfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Language Settings
			elseif UICfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if onlinegame then
					lockSetting = true
				else
				--[[
					if commandGetState(p1Cmd, 'r') and data.language == "ENGLISH" then
						sndPlay(sndSys, 100, 0)
						data.language = "SPANISH"
						modified = 1
						needReload = 1
					elseif commandGetState(p1Cmd, 'r') and data.language == "SPANISH" then
						sndPlay(sndSys, 100, 0)
						data.language = "JAPANESE"
						modified = 1
						needReload = 1
					elseif commandGetState(p1Cmd, 'l') and data.language == "SPANISH" then
						sndPlay(sndSys, 100, 0)
						data.language = "ENGLISH"
						modified = 1
						needReload = 1
					elseif commandGetState(p1Cmd, 'l') and data.language == "JAPANESE" then
						sndPlay(sndSys, 100, 0)
						data.language = "SPANISH"
						modified = 1
						needReload = 1
					end
				]]
				end
		--Clock Format Display
			elseif UICfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if onlinegame then
					lockSetting = true
				else
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if commandGetState(p1Cmd, 'r') and data.clock < #t_clockFormats then sndPlay(sndSys, 100, 0) end
						if data.clock < #t_clockFormats then
							data.clock = data.clock + 1
						end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if commandGetState(p1Cmd, 'l') and data.clock > 1 then sndPlay(sndSys, 100, 0) end
						if data.clock > 1 then
							data.clock = data.clock - 1
						end
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
				end
		--Date Format Display
			elseif UICfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if onlinegame then
					lockSetting = true
				else
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if commandGetState(p1Cmd, 'r') and data.dateFormat < #t_dateFormats then sndPlay(sndSys, 100, 0) end
						if data.dateFormat < #t_dateFormats then
							data.dateFormat = data.dateFormat + 1
						end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if commandGetState(p1Cmd, 'l') and data.dateFormat > 1 then sndPlay(sndSys, 100, 0) end
						if data.dateFormat > 1 then
							data.dateFormat = data.dateFormat - 1
						end
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
				end
		--Attract Mode
			elseif UICfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.attractMode then
						data.attractMode = false
					else
						data.attractMode = true
					end
					modified = 1
					needReload = 1
				end
		--Character Portrait Display Type
			elseif UICfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.portraitDisplay == "Portrait" then
					sndPlay(sndSys, 100, 0)
					data.portraitDisplay = "Sprite"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.portraitDisplay == "Sprite" then
					sndPlay(sndSys, 100, 0)
					data.portraitDisplay = "Mixed"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.portraitDisplay == "Sprite" then
					sndPlay(sndSys, 100, 0)
					data.portraitDisplay = "Portrait"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.portraitDisplay == "Mixed" then
					sndPlay(sndSys, 100, 0)
					data.portraitDisplay = "Sprite"
					modified = 1	
				end
		--Display Versus Win Counter
			elseif UICfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.vsDisplayWin then
						data.vsDisplayWin = false
					else
						data.vsDisplayWin = true
					end
					modified = 1
				end
		--Win Screen Display Type
			elseif UICfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.winscreen == "Classic" then
					sndPlay(sndSys, 100, 0)
					data.winscreen = "Modern"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.winscreen == "Modern" then
					sndPlay(sndSys, 100, 0)
					data.winscreen = "Fixed"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.winscreen == "Fixed" then
					sndPlay(sndSys, 100, 0)
					data.winscreen = "Modern"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.winscreen == "Modern" then
					sndPlay(sndSys, 100, 0)
					data.winscreen = "Classic"
					modified = 1
				end
		--Service Interaction Type
			elseif UICfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.serviceType == "Button" then
					data.serviceType = "Cursor"
				elseif data.serviceType == "Cursor" then
					data.serviceType = "Button"
				end
				modified = 1
		--Order Select Interaction Type
			elseif UICfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.orderSelType == "Button" then
					data.orderSelType = "Cursor"
				elseif data.orderSelType == "Cursor" then
					data.orderSelType = "Button"
				end
				modified = 1
		--Character Select Settings
			elseif UICfg == 10 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				f_selectCfg()
		--Stage Select Settings
			elseif UICfg == 11 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				f_stageCfg()
		--Timers Settings
			elseif UICfg == 12 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				f_timeCfg()
		--System Songs Settings
			elseif UICfg == 13 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 1)
					f_songCfg()
				end
		--Default Values
			elseif UICfg == #t_UICfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultSystem = true
				defaultScreen = true
		--BACK
			elseif UICfg == #t_UICfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if UICfg < 1 then
				UICfg = #t_UICfg
				if #t_UICfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_UICfg
				end
			elseif UICfg > #t_UICfg then
				UICfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (UICfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (UICfg - 1) * 15
			end	
			if #t_UICfg <= maxItems then
				maxUICfg = #t_UICfg
			elseif UICfg - cursorPosY > 0 then
				maxUICfg = UICfg + maxItems - cursorPosY
			else
				maxUICfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxUICfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_UICfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if lockSetting then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end	
		t_UICfg[1].varText = data.language
		t_UICfg[2].varText = os.date(t_clockFormats[data.clock].locale)
		t_UICfg[3].varText = os.date(t_dateFormats[data.dateFormat])
		if data.attractMode then t_UICfg[4].varText = "Enabled" else t_UICfg[4].varText = "Disabled" end
		t_UICfg[5].varText = data.portraitDisplay
		if data.vsDisplayWin then t_UICfg[6].varText = "Yes" else t_UICfg[6].varText = "No" end
		t_UICfg[7].varText = data.winscreen
		t_UICfg[8].varText = data.serviceType
		t_UICfg[9].varText = data.orderSelType
		for i=1, maxUICfg do
			if i > UICfg - cursorPosY then
				if t_UICfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_UICfg[i].varID, font2, 0, 1, t_UICfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_UICfg[i].varID, font2, 0, -1, t_UICfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxUICfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_UICfg > maxItems and maxUICfg < #t_UICfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CHARACTER SELECT SETTINGS
--;===========================================================
txt_selectCfg = createTextImg(jgFnt, 0, 0, "CHARACTER SELECT SETTINGS", 159, 13)

t_selectCfg = {
	{text = "Edit Roster",	   	     	varText = ""},
	{text = "Roster Type",	   	     	varText = data.selectType},
	{text = "Palette Select",	    	varText = data.palType},
	{text = "Information",    			varText = data.charInfo},
	{text = "Random Portrait",	     	varText = data.randomPortrait},
	{text = "Random Select Rematch",	varText = data.randomCharRematch},
	{text = "Default Values",  	 		varText = ""},
	{text = "          BACK", 			varText = ""},
}
for i=1, #t_selectCfg do
	t_selectCfg[i]['varID'] = textImgNew()
end

function f_selectCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local selectCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	--sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				selectCfg = selectCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				selectCfg = selectCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Character Select Roster Config
			elseif selectCfg == 1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				f_rosterCfg()
		--Character Select Display Type
			elseif selectCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.selectType == "Advanced" then data.selectType = "Simple"
					elseif data.selectType == "Simple" then data.selectType = "Advanced"
					end
					modified = 1
				end
		--Character Palette Select Display Type
			elseif selectCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.palType == "Classic" then data.palType = "Modern"
				elseif data.palType == "Modern" then data.palType = "Classic"
				end
				modified = 1
		--Character Info Display
			elseif selectCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.charInfo == "None" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "Author"
					modified = 1
			--[[
				elseif commandGetState(p1Cmd, 'r') and data.charInfo == "Author" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "Series"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.charInfo == "Series" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "Title"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.charInfo == "Title" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "All"
					modified = 1
			]]
				elseif commandGetState(p1Cmd, 'l') and data.charInfo == "Author" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "None"
					modified = 1
			--[[
				elseif commandGetState(p1Cmd, 'l') and data.charInfo == "Series" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "Author"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.charInfo == "Title" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "Series"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.charInfo == "All" then
					sndPlay(sndSys, 100, 0)
					data.charInfo = "Title"
					modified = 1
			]]
				end
		--Character Random Portrait Display Type
			elseif selectCfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.randomPortrait == "Simple" then
					sndPlay(sndSys, 100, 0)
					data.randomPortrait = "Fixed"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.randomPortrait == "Fixed" then
					sndPlay(sndSys, 100, 0)
					data.randomPortrait = "Roulette"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.randomPortrait == "Fixed" then
					sndPlay(sndSys, 100, 0)
					data.randomPortrait = "Simple"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.randomPortrait == "Roulette" then
					sndPlay(sndSys, 100, 0)
					data.randomPortrait = "Fixed"
					modified = 1	
				end
		--Character Random Selection in Rematch
			elseif selectCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.randomCharRematch == "Variable" then data.randomCharRematch = "Fixed"
				elseif data.randomCharRematch == "Fixed" then data.randomCharRematch = "Variable"
				end
				modified = 1
		--Default Values
			elseif selectCfg == #t_selectCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultSelect = true
				defaultScreen = true
		--BACK
			elseif selectCfg == #t_selectCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if selectCfg < 1 then
				selectCfg = #t_selectCfg
				if #t_selectCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_selectCfg
				end
			elseif selectCfg > #t_selectCfg then
				selectCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (selectCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (selectCfg - 1) * 15
			end	
			if #t_selectCfg <= maxItems then
				maxselectCfg = #t_selectCfg
			elseif selectCfg - cursorPosY > 0 then
				maxselectCfg = selectCfg + maxItems - cursorPosY
			else
				maxselectCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxselectCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_selectCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		t_selectCfg[2].varText = data.selectType
		t_selectCfg[3].varText = data.palType
		t_selectCfg[4].varText = data.charInfo
		t_selectCfg[5].varText = data.randomPortrait
		t_selectCfg[6].varText = data.randomCharRematch
		for i=1, maxselectCfg do
			if i > selectCfg - cursorPosY then
				if t_selectCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_selectCfg[i].varID, font2, 0, 1, t_selectCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_selectCfg[i].varID, font2, 0, -1, t_selectCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxselectCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_selectCfg > maxItems and maxselectCfg < #t_selectCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; CHARACTER SELECT ROSTER CONFIG
--;===========================================================
txt_rosterCfg = createTextImg(jgFnt, 0, 0, "ROSTER CONFIG", 159, 13)

--Simple Roster
t_rosterCfg1 = {
	{text = "Rows",	   			     	varText = data.selectRows},
	{text = "Columns",		   	     	varText = data.selectColumns},
	{text = "Wrapping X",		   	    varText = data.wrappingX},
	{text = "Wrapping Y",		   	    varText = data.wrappingY},
	{text = "Cells Pos X",	    		varText = data.p1FaceX},
	{text = "Cells Pos Y",    			varText = data.p1FaceY},
	{text = "Cells Size X",	    		varText = data.cellSizeX},
	{text = "Cells Size Y",    			varText = data.cellSizeY},
	{text = "Cells Spacing X",     		varText = data.cellSpacingX},
	{text = "Cells Spacing Y",     		varText = data.cellSpacingY},
	{text = "Cells Scale X",     		varText = data.cellScaleX},
	{text = "Cells Scale Y",     		varText = data.cellScaleY},
	{text = "P1 Cursor Start Cell X",   varText = data.p1SelX},
	{text = "P1 Cursor Start Cell Y",   varText = data.p1SelY},
	{text = "P2 Cursor Start Cell X",   varText = data.p2SelX},
	{text = "P2 Cursor Start Cell Y",   varText = data.p2SelY},
	{text = "Default Values",  	 		varText = ""},
	--{text = "Reload Select.def", 	 	varText = ""},
	{text = "          BACK", 			varText = ""},
}
for i=1, #t_rosterCfg1 do
	t_rosterCfg1[i]['varID'] = textImgNew()
end

--Advanced Roster (BlazBlue Cross Tag Battle Roster Type)
t_rosterCfg2 = {
	{text = "Rows",	   			     	varText = data.selectRows},
	{text = "Columns",		   	     	varText = data.selectColumns},
	{text = "Hidden Rows",	    	 	varText = data.offsetRows},
	{text = "Hidden Columns",	   	    varText = data.offsetColumns},
	{text = "Wrapping X",		   	    varText = data.wrappingX},
	{text = "Wrapping Y",		   	    varText = data.wrappingY},
	{text = "P1 Cells Pos X",	    	varText = data.p1FaceX},
	{text = "P1 Cells Pos Y",	   		varText = data.p1FaceY},
	{text = "P2 Cells Pos X",	    	varText = data.p2FaceX},
	{text = "P2 Cells Pos Y",	   		varText = data.p2FaceY},
	{text = "Cells Size X",	    		varText = data.cellSizeX},
	{text = "Cells Size Y",    			varText = data.cellSizeY},
	{text = "Cells Spacing X",     		varText = data.cellSpacingX},
	{text = "Cells Spacing Y",     		varText = data.cellSpacingY},
	{text = "Cells Scale X",     		varText = data.cellScaleX},
	{text = "Cells Scale Y",     		varText = data.cellScaleY},
	{text = "P1 Cursor Start Cell X",   varText = data.p1SelX},
	{text = "P1 Cursor Start Cell Y",   varText = data.p1SelY},
	{text = "P2 Cursor Start Cell X",   varText = data.p2SelX},
	{text = "P2 Cursor Start Cell Y",   varText = data.p2SelY},
	{text = "Default Values",  	 		varText = ""},
	--{text = "Reload Select.def", 	 	varText = ""},
	{text = "          BACK", 			varText = ""},
}
for i=1, #t_rosterCfg2 do
	t_rosterCfg2[i]['varID'] = textImgNew()
end

--Up Arrow
rosterCfgUpArrow = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(rosterCfgUpArrow, 242, 23)
animSetScale(rosterCfgUpArrow, 0.5, 0.5)
animUpdate(rosterCfgUpArrow)

--Down Arrow
rosterCfgDownArrow = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(rosterCfgDownArrow, 242, 40)
animSetScale(rosterCfgDownArrow, 0.5, 0.5)
animUpdate(rosterCfgDownArrow)

function f_rosterCfg()
	cmdInput()
	local editDone = true
	local newValue = ""
	local cursorPosY = 1
	local moveTxt = 0
	local rosterCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	if data.selectType == "Simple" then	t_rosterCfg = t_rosterCfg1 elseif data.selectType == "Advanced" then t_rosterCfg = t_rosterCfg2 end --Load different table settings values for specific roster type
	--sndPlay(sndSys, 100, 1)
	while true do
		if defaultScreen == false and editDone then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				rosterCfg = rosterCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				rosterCfg = rosterCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			end
		--Settings for Simple Roster
			if data.selectType == "Simple" then
			--Character Select Rows Number
				if rosterCfg == 1 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						--if data.selectRows < 100 then
							data.selectRows = data.selectRows + 1
							if not validCells() then data.selectRows = data.selectRows - 1 end
						--else
							--data.selectRows = 1
						--end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.selectRows > 1 then
							data.selectRows = data.selectRows - 1
						--else
							--data.selectRows = 100
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			--Character Select Columns Number
				elseif rosterCfg == 2 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						--if data.selectColumns < 100 then
							data.selectColumns = data.selectColumns + 1
							if not validCells() then data.selectColumns = data.selectColumns - 1 end
						--else
							--data.selectColumns = 1
						--end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.selectColumns > 1 then
							data.selectColumns = data.selectColumns - 1
						--else
							--data.selectColumns = 100
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			--Character Select Cells Wrapping (X Axis)
				elseif rosterCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
					sndPlay(sndSys, 100, 0)
					if data.wrappingX then data.wrappingX = false
					else data.wrappingX = true
					end
					modified = 1
			--Character Select Cells Wrapping (Y Axis)
				elseif rosterCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
					sndPlay(sndSys, 100, 0)
					if data.wrappingY then data.wrappingY = false
					else data.wrappingY = true
					end
					modified = 1
			--Character Select Draw Cells Position (X Axis)
				elseif rosterCfg == 5 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if data.p1FaceX < 320 then
							data.p1FaceX = data.p1FaceX + 0.1
						else
							data.p1FaceX = -50
						end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.p1FaceX > -50 then
							data.p1FaceX = data.p1FaceX - 0.1
						else
							data.p1FaceX = 320
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
						modified = 1
				--Activate Manual Keyboard Entry
					elseif btnPalNo(p1Cmd, true) > 0 then
						sndPlay(sndSys, 100, 1)
						editDone = false
						i = 0
						commandBufReset(p1Cmd)
						commandBufReset(p2Cmd)
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
			--Character Select Draw Cells Position (Y Axis)
				elseif rosterCfg == 6 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if data.p1FaceY < 240 then
							data.p1FaceY = data.p1FaceY + 0.1
						else
							data.p1FaceY = 0
						end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.p1FaceY > 0 then
							data.p1FaceY = data.p1FaceY - 0.1
						else
							data.p1FaceY = 240
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
						modified = 1
				--Activate Manual Keyboard Entry
					elseif btnPalNo(p1Cmd, true) > 0 then
						sndPlay(sndSys, 100, 1)
						editDone = false
						i = 0
						commandBufReset(p1Cmd)
						commandBufReset(p2Cmd)
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
				end
		--Settings for Advanced Roster
			elseif data.selectType == "Advanced" then
			--Character Select Rows Number
				if rosterCfg == 1 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						--if data.selectRows < 100 then
							data.selectRows = data.selectRows + 1
							if not validCells() then data.selectRows = data.selectRows - 1 end
						--else
							--data.selectRows = 1
						--end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.selectRows > 1 then
							data.selectRows = data.selectRows - 1
						--else
							--data.selectRows = 100
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			--Character Select Columns Number
				elseif rosterCfg == 2 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						--if data.selectColumns < 100 then
							data.selectColumns = data.selectColumns + 1
							if not validCells() then data.selectColumns = data.selectColumns - 1 end
						--else
							--data.selectColumns = 1
						--end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.selectColumns > 1 then
							data.selectColumns = data.selectColumns - 1
						--else
							--data.selectColumns = 100
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			--Character Select Hidden Rows Number
				elseif rosterCfg == 3 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						--if data.offsetRows < 1000 then
							data.offsetRows = data.offsetRows + 1
							if not validCells() then data.offsetRows = data.offsetRows - 1 end
						--else
							--data.offsetRows = 0
						--end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.offsetRows > 0 then
							data.offsetRows = data.offsetRows - 1
						--else
							--data.offsetRows = 1000
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			--Character Select Hidden Columns Number
				elseif rosterCfg == 4 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						--if data.offsetColumns < 1000 then
							data.offsetColumns = data.offsetColumns + 1
							if not validCells() then data.offsetColumns = data.offsetColumns - 1 end
						--else
							--data.offsetColumns = 0
						--end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.offsetColumns > 0 then
							data.offsetColumns = data.offsetColumns - 1
						--else
							--data.offsetColumns = 1000
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			--Character Select Cells Wrapping (X Axis)
				elseif rosterCfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
					sndPlay(sndSys, 100, 0)
					if data.wrappingX then data.wrappingX = false
					else data.wrappingX = true
					end
					modified = 1
			--Character Select Cells Wrapping (Y Axis)
				elseif rosterCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
					sndPlay(sndSys, 100, 0)
					if data.wrappingY then data.wrappingY = false
					else data.wrappingY = true
					end
					modified = 1
			--Character Select Draw [PLAYER 1] Cells Position (X Axis)
				elseif rosterCfg == 7 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if data.p1FaceX < 320 then
							data.p1FaceX = data.p1FaceX + 0.1
						else
							data.p1FaceX = -50
						end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.p1FaceX > -50 then
							data.p1FaceX = data.p1FaceX - 0.1
						else
							data.p1FaceX = 320
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
						modified = 1
				--Activate Manual Keyboard Entry
					elseif btnPalNo(p1Cmd, true) > 0 then
						sndPlay(sndSys, 100, 1)
						editDone = false
						i = 0
						commandBufReset(p1Cmd)
						commandBufReset(p2Cmd)
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
			--Character Select Draw [PLAYER 1] Cells Position (Y Axis)
				elseif rosterCfg == 8 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if data.p1FaceY < 240 then
							data.p1FaceY = data.p1FaceY + 0.1
						else
							data.p1FaceY = 0
						end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.p1FaceY > 0 then
							data.p1FaceY = data.p1FaceY - 0.1
						else
							data.p1FaceY = 240
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
						modified = 1
				--Activate Manual Keyboard Entry
					elseif btnPalNo(p1Cmd, true) > 0 then
						sndPlay(sndSys, 100, 1)
						editDone = false
						i = 0
						commandBufReset(p1Cmd)
						commandBufReset(p2Cmd)
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
			--Character Select Draw [PLAYER 2] Cells Position (X Axis)
				elseif rosterCfg == 9 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if data.p2FaceX < 320 then
							data.p2FaceX = data.p2FaceX + 0.1
						else
							data.p2FaceX = -50
						end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.p2FaceX > -50 then
							data.p2FaceX = data.p2FaceX - 0.1
						else
							data.p2FaceX = 320
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
						modified = 1
				--Activate Manual Keyboard Entry
					elseif btnPalNo(p1Cmd, true) > 0 then
						sndPlay(sndSys, 100, 1)
						editDone = false
						i = 0
						commandBufReset(p1Cmd)
						commandBufReset(p2Cmd)
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
			--Character Select Draw [PLAYER 2] Cells Position (Y Axis)
				elseif rosterCfg == 10 then
					if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
						if data.p2FaceY < 240 then
							data.p2FaceY = data.p2FaceY + 0.1
						else
							data.p2FaceY = 0
						end
						if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						modified = 1
					elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
						if data.p2FaceY > 0 then
							data.p2FaceY = data.p2FaceY - 0.1
						else
							data.p2FaceY = 240
						end
						if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
						modified = 1
				--Activate Manual Keyboard Entry
					elseif btnPalNo(p1Cmd, true) > 0 then
						sndPlay(sndSys, 100, 1)
						editDone = false
						i = 0
						commandBufReset(p1Cmd)
						commandBufReset(p2Cmd)
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
				end
			end
		--Common Rosters Settings
		--Character Select Cells Size (X Axis)
			if rosterCfg == #t_rosterCfg-11 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.cellSizeX < 500 then
						data.cellSizeX = data.cellSizeX + 0.1
					else
						data.cellSizeX = 0.1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.cellSizeX > 0.1 then
						data.cellSizeX = data.cellSizeX - 0.1
					else
						data.cellSizeX = 500
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
			--Activate Manual Keyboard Entry
				elseif btnPalNo(p1Cmd, true) > 0 then
					sndPlay(sndSys, 100, 1)
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
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
		--Character Select Cells Size (Y Axis)
			elseif rosterCfg == #t_rosterCfg-10 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.cellSizeY < 500 then
						data.cellSizeY = data.cellSizeY + 0.1
					else
						data.cellSizeY = 0.1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.cellSizeY > 0.1 then
						data.cellSizeY = data.cellSizeY - 0.1
					else
						data.cellSizeY = 500
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
			--Activate Manual Keyboard Entry
				elseif btnPalNo(p1Cmd, true) > 0 then
					sndPlay(sndSys, 100, 1)
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
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
		--Character Select Cells Spacing (X Axis)
			elseif rosterCfg == #t_rosterCfg-9 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.cellSpacingX < 500 then
						data.cellSpacingX = data.cellSpacingX + 0.1
					else
						data.cellSpacingX = 0.1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.cellSpacingX > 0.1 then
						data.cellSpacingX = data.cellSpacingX - 0.1
					else
						data.cellSpacingX = 500
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
			--Activate Manual Keyboard Entry
				elseif btnPalNo(p1Cmd, true) > 0 then
					sndPlay(sndSys, 100, 1)
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
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
		--Character Select Cells Spacing (Y Axis)
			elseif rosterCfg == #t_rosterCfg-8 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.cellSpacingY < 500 then
						data.cellSpacingY = data.cellSpacingY + 0.1
					else
						data.cellSpacingY = 0.1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.cellSpacingY > 0.1 then
						data.cellSpacingY = data.cellSpacingY - 0.1
					else
						data.cellSpacingY = 500
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
			--Activate Manual Keyboard Entry
				elseif btnPalNo(p1Cmd, true) > 0 then
					sndPlay(sndSys, 100, 1)
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
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
		--Character Select Cells Scale (X Axis)
			elseif rosterCfg == #t_rosterCfg-7 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.cellScaleX < 10 then
						data.cellScaleX = data.cellScaleX + 0.1
					else
						data.cellScaleX = 0.1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.cellScaleX > 0.1 then
						data.cellScaleX = data.cellScaleX - 0.1
					else
						data.cellScaleX = 10
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
			--Activate Manual Keyboard Entry
				elseif btnPalNo(p1Cmd, true) > 0 then
					sndPlay(sndSys, 100, 1)
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
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
		--Character Select Cells Scale (Y Axis)
			elseif rosterCfg == #t_rosterCfg-6 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.cellScaleY < 10 then
						data.cellScaleY = data.cellScaleY + 0.1
					else
						data.cellScaleY = 0.1
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.cellScaleY > 0.1 then
						data.cellScaleY = data.cellScaleY - 0.1
					else
						data.cellScaleY = 10
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
			--Activate Manual Keyboard Entry
				elseif btnPalNo(p1Cmd, true) > 0 then
					sndPlay(sndSys, 100, 1)
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
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
		--Character Select [PLAYER 1] Cursor Start (X Axis)
			elseif rosterCfg == #t_rosterCfg-5 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.p1SelX < data.selectColumns-1 then
						data.p1SelX = data.p1SelX + 1
					else
						data.p1SelX = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.p1SelX > 0 then
						data.p1SelX = data.p1SelX - 1
					else
						data.p1SelX = data.selectColumns-1
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		--Character Select [PLAYER 1] Cursor Start (Y Axis)
			elseif rosterCfg == #t_rosterCfg-4 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.p1SelY < data.selectRows-1 then
						data.p1SelY = data.p1SelY + 1
					else
						data.p1SelY = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.p1SelY > 0 then
						data.p1SelY = data.p1SelY - 1
					else
						data.p1SelY = data.selectRows-1
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		--Character Select [PLAYER 2] Cursor Start (X Axis)
			elseif rosterCfg == #t_rosterCfg-3 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.p2SelX < data.selectColumns-1 then
						data.p2SelX = data.p2SelX + 1
					else
						data.p2SelX = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.p2SelX > 0 then
						data.p2SelX = data.p2SelX - 1
					else
						data.p2SelX = data.selectColumns-1
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		--Character Select [PLAYER 2] Cursor Start (Y Axis)
			elseif rosterCfg == #t_rosterCfg-2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.p2SelY < data.selectRows-1 then
						data.p2SelY = data.p2SelY + 1
					else
						data.p2SelY = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.p2SelY > 0 then
						data.p2SelY = data.p2SelY - 1
					else
						data.p2SelY = data.selectRows-1
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		--Default Values
			elseif rosterCfg == #t_rosterCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultRoster = true
				defaultScreen = true
		--Reload Select.def
		--[[
			elseif rosterCfg == #t_rosterCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				assert(loadfile("script/loader.lua"))()
		]]
		--BACK
			elseif rosterCfg == #t_rosterCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if rosterCfg < 1 then
				rosterCfg = #t_rosterCfg
				if #t_rosterCfg > 2 then
					cursorPosY = 2
				else
					cursorPosY = #t_rosterCfg
				end
			elseif rosterCfg > #t_rosterCfg then
				rosterCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 2 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 2 then
				moveTxt = (rosterCfg - 2) * 15
			elseif cursorPosY == 1 then
				moveTxt = (rosterCfg - 1) * 15
			end	
			if #t_rosterCfg <= 2 then
				maxrosterCfg = #t_rosterCfg
			elseif rosterCfg - cursorPosY > 0 then
				maxrosterCfg = rosterCfg + 2 - cursorPosY
			else
				maxrosterCfg = 2
			end
	--Manual Keyboard Entry
		elseif not editDone then
			if esc() then
				clearInputText()
				sndPlay(sndSys, 100, 2)
				editDone = true
			end
			newValue = inputText('num',true)
			if clipboardPaste() then
				if string.match(getClipboardText(),'^%d+$') then 
					setInputText(getClipboardText())
				else
					sndPlay(sndIkemen, 200, 0)
				end
			end
			if newValue:len() > 7 then
				newValue = newValue:sub(1,7)
				setInputText(newValue)
			end
			if newValue ~= '' and newValue ~= nil then
				if tonumber(newValue) ~= nil then --Input Value is a valid Number
					if tonumber(newValue) > 350 then
						newValue = 350
						setInputText(newValue)
					elseif newValue:match('^0(%d+)$') then
						newValue = newValue:gsub('^0(%d+)$','%1')
						setInputText(newValue)
					end
				end
			end
			if returnKey() then --If you are using a keyboard, use enter key to accept
			--if commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				if newValue ~= '' and newValue ~= nil and tonumber(newValue) ~= nil then --Value entered is a valid Number
					clearInputText()
					sndPlay(sndSys, 100, 1)
					if data.selectType == "Simple" then
						if rosterCfg == 5 then data.p1FaceX = tonumber(newValue)
						elseif rosterCfg == 6 then data.p1FaceY = tonumber(newValue)
						end
					elseif data.selectType == "Advanced" then
						if rosterCfg == 7 then data.p1FaceX = tonumber(newValue)
						elseif rosterCfg == 8 then data.p1FaceY = tonumber(newValue)
						elseif rosterCfg == 9 then data.p2FaceX = tonumber(newValue)
						elseif rosterCfg == 10 then data.p2FaceY = tonumber(newValue)
						end
					end
					if rosterCfg == #t_rosterCfg-11 then data.cellSizeX = tonumber(newValue)
					elseif rosterCfg == #t_rosterCfg-10 then data.cellSizeY = tonumber(newValue)
					elseif rosterCfg == #t_rosterCfg-9 then data.cellSpacingX = tonumber(newValue)
					elseif rosterCfg == #t_rosterCfg-8 then data.cellSpacingY = tonumber(newValue)
					elseif rosterCfg == #t_rosterCfg-7 then data.cellScaleX = tonumber(newValue)
					elseif rosterCfg == #t_rosterCfg-6 then data.cellScaleY = tonumber(newValue)
					end
					modified = 1
					editDone = true
				else
					sndPlay(sndIkemen, 200, 0)
				end
			end
			t_rosterCfg[rosterCfg].varText = newValue
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
	--REAL TIME Test
	--Roster 1
		setSelColRow(data.selectColumns, data.selectRows)
		setSelCellSize(data.cellSizeX+data.cellSpacingX, data.cellSizeY+data.cellSpacingY)
		setSelCellScale(data.cellScaleX, data.cellScaleY)
		drawFace(data.p1FaceX, data.p1FaceY, 0) --Draw Character Face Portrait
		f_randomSlot() --Draw Random Slots
		for i=0, data.selectColumns-1 do
			for j=0, data.selectRows-1 do
				--local p1charSlot = data.p1SelX+i+data.selectColumns*(data.p1SelY+j)
				--if getCharName(p1charSlot) ~= '' then
					animPosDraw(selectCell, data.p1FaceX+i*(data.cellSizeX+data.cellSpacingX), data.p1FaceY+j*(data.cellSizeY+data.cellSpacingY)) --Draw cell sprite for each selectColumns and selectRow
					animSetScale(selectCell, data.cellScaleX, data.cellScaleY)
				--end
			end
		end
	--Roster 2
		if data.selectType == "Advanced" then
			drawFace(data.p2FaceX, data.p2FaceY, 0)
			for i=0, data.selectColumns-1 do
				for j=0, data.selectRows-1 do
					animPosDraw(selectCell, data.p2FaceX+i*(data.cellSizeX+data.cellSpacingX), data.p2FaceY+j*(data.cellSizeY+data.cellSpacingY))
					animSetScale(selectCell, data.cellScaleX, data.cellScaleY)
				end
			end
		end
		animPosDraw(p1ActiveCursor, data.p1FaceX+data.p1SelX*(data.cellSizeX+data.cellSpacingX), data.p1FaceY+(data.p1SelY-0)*(data.cellSizeY+data.cellSpacingY))
		animSetScale(p1ActiveCursor, data.cellScaleX, data.cellScaleY)
		if data.selectType == "Simple" then animPosDraw(p2ActiveCursor, data.p1FaceX+data.p2SelX*(data.cellSizeX+data.cellSpacingX), data.p1FaceY+(data.p2SelY-0)*(data.cellSizeY+data.cellSpacingY))
		elseif data.selectType == "Advanced" then animPosDraw(p2ActiveCursor, data.p2FaceX+data.p2SelX*(data.cellSizeX+data.cellSpacingX), data.p2FaceY+(data.p2SelY-0)*(data.cellSizeY+data.cellSpacingY)) --For roster 2
		end
		animSetScale(p2ActiveCursor, data.cellScaleX, data.cellScaleY)
	--
		animSetScale(optionsBG1, 220, maxrosterCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,30)
		animDraw(optionsBG1)
		textImgDraw(txt_rosterCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	--Draw Blinking Cursor for Manual Keyboard Entry Field
		if not editDone then
			if i%60 < 30 then
				textImgPosDraw(txt_bar,235+1.5,17.5+cursorPosY*15)
			end
			i = i >= 60 and 0 or i + 1
		end
		if data.debugMode then f_drawQuickText(txt_characterNomber, font1, 1, 0, "SELECT.DEF LOADED SLOTS: "..#t_selChars, 160, 60) end
		if data.debugMode then f_drawQuickText(txt_emptyCellTest, font1, 1, 0, getCharName(data.p1SelX+data.selectColumns*data.p1SelY), 160, 70) end
		t_rosterCfg[1].varText = data.selectRows
		t_rosterCfg[2].varText = data.selectColumns
		if data.selectType == "Simple" then
			if data.wrappingX then t_rosterCfg[3].varText = "Yes" else t_rosterCfg[3].varText = "No" end
			if data.wrappingY then t_rosterCfg[4].varText = "Yes" else t_rosterCfg[4].varText = "No" end
		elseif data.selectType == "Advanced" then
			t_rosterCfg[3].varText = data.offsetRows
			t_rosterCfg[4].varText = data.offsetColumns
			if data.wrappingX then t_rosterCfg[5].varText = "Yes" else t_rosterCfg[5].varText = "No" end
			if data.wrappingY then t_rosterCfg[6].varText = "Yes" else t_rosterCfg[6].varText = "No" end
		end
		if editDone then
			if data.selectType == "Simple" then
				t_rosterCfg[5].varText = data.p1FaceX
				t_rosterCfg[6].varText = data.p1FaceY
			elseif data.selectType == "Advanced" then
				t_rosterCfg[7].varText = data.p1FaceX
				t_rosterCfg[8].varText = data.p1FaceY
				t_rosterCfg[9].varText = data.p2FaceX
				t_rosterCfg[10].varText = data.p2FaceY
			end
			t_rosterCfg[#t_rosterCfg-11].varText = data.cellSizeX
			t_rosterCfg[#t_rosterCfg-10].varText = data.cellSizeY
			t_rosterCfg[#t_rosterCfg-9].varText = data.cellSpacingX
			t_rosterCfg[#t_rosterCfg-8].varText = data.cellSpacingY
			t_rosterCfg[#t_rosterCfg-7].varText = data.cellScaleX
			t_rosterCfg[#t_rosterCfg-6].varText = data.cellScaleY
		end
		t_rosterCfg[#t_rosterCfg-5].varText = data.p1SelX
		t_rosterCfg[#t_rosterCfg-4].varText = data.p1SelY
		t_rosterCfg[#t_rosterCfg-3].varText = data.p2SelX
		t_rosterCfg[#t_rosterCfg-2].varText = data.p2SelY
		for i=1, maxrosterCfg do
			if i > rosterCfg - cursorPosY then
				if t_rosterCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_rosterCfg[i].varID, font2, 0, 1, t_rosterCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_rosterCfg[i].varID, font2, 0, -1, t_rosterCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxrosterCfg > 2 then
			animDraw(rosterCfgUpArrow)
			animUpdate(rosterCfgUpArrow)
		end
		if #t_rosterCfg > 2 and maxrosterCfg < #t_rosterCfg then
			animDraw(rosterCfgDownArrow)
			animUpdate(rosterCfgDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; STAGE SELECT SETTINGS
--;===========================================================
txt_stageCfg = createTextImg(jgFnt, 0, 0, "STAGE SELECT SETTINGS", 159, 13)

t_stageCfg = {
	{text = "Presentation",	         varText = data.stageType},
	{text = "Random Portrait",   	 varText = data.randomStagePortrait},
	{text = "Information",      	 varText = data.stageInfo},
	{text = "Random Select Rematch", varText = data.randomStageRematch},
	{text = "Default Values",  	 	 varText = ""},
	{text = "          BACK", 		 varText = ""},
}
for i=1, #t_stageCfg do
	t_stageCfg[i]['varID'] = textImgNew()
end

function f_stageCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local stageCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	--sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				stageCfg = stageCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				stageCfg = stageCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Stage Select Display Type
			elseif stageCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.stageType == "Classic" then
					sndPlay(sndSys, 100, 0)
					data.stageType = "Modern"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.stageType == "Modern" then
					sndPlay(sndSys, 100, 0)
					data.stageType = "Classic"--data.stageType = "Chart"(SF X TK)
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.stageType == "Classic" then
					sndPlay(sndSys, 100, 0)
					data.stageType = "Modern"--data.stageType = "Chart"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.stageType == "Modern" then
					sndPlay(sndSys, 100, 0)
					data.stageType = "Classic"
					modified = 1
				end
		--Random Stage Portrait Display Type
			elseif stageCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.randomStagePortrait == "Simple" then
					sndPlay(sndSys, 100, 0)
					data.randomStagePortrait = "Fixed"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.randomStagePortrait == "Fixed" then
					sndPlay(sndSys, 100, 0)
					data.randomStagePortrait = "Roulette"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.randomStagePortrait == "Fixed" then
					sndPlay(sndSys, 100, 0)
					data.randomStagePortrait = "Simple"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.randomStagePortrait == "Roulette" then
					sndPlay(sndSys, 100, 0)
					data.randomStagePortrait = "Fixed"
					modified = 1	
				end
		--Stage Info Display
			elseif stageCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.stageInfo == "None" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "Author"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.stageInfo == "Author" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "Location"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.stageInfo == "Location" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "Time"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.stageInfo == "Time" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "All"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.stageInfo == "Author" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "None"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.stageInfo == "Location" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "Author"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.stageInfo == "Time" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "Location"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.stageInfo == "All" then
					sndPlay(sndSys, 100, 0)
					data.stageInfo = "Time"
					modified = 1
				end
		--Random Stage Selection in Rematch
			elseif stageCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.randomStageRematch == "Variable" then data.randomStageRematch = "Fixed"
				elseif data.randomStageRematch == "Fixed" then data.randomStageRematch = "Variable"
				end
				modified = 1
		--Default Values
			elseif stageCfg == #t_stageCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultStage = true
				defaultScreen = true
		--BACK
			elseif stageCfg == #t_stageCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if stageCfg < 1 then
				stageCfg = #t_stageCfg
				if #t_stageCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_stageCfg
				end
			elseif stageCfg > #t_stageCfg then
				stageCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (stageCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (stageCfg - 1) * 15
			end	
			if #t_stageCfg <= maxItems then
				maxstageCfg = #t_stageCfg
			elseif stageCfg - cursorPosY > 0 then
				maxstageCfg = stageCfg + maxItems - cursorPosY
			else
				maxstageCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxstageCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_stageCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		t_stageCfg[1].varText = data.stageType
		t_stageCfg[2].varText = data.randomStagePortrait
		t_stageCfg[3].varText = data.stageInfo
		t_stageCfg[4].varText = data.randomStageRematch
		for i=1, maxstageCfg do
			if i > stageCfg - cursorPosY then
				if t_stageCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_stageCfg[i].varID, font2, 0, 1, t_stageCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_stageCfg[i].varID, font2, 0, -1, t_stageCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxstageCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_stageCfg > maxItems and maxstageCfg < #t_stageCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; TIMERS SETTINGS
--;===========================================================
txt_timeCfg = createTextImg(jgFnt, 0, 0, "TIMERS SETTINGS", 159, 13)

t_timeCfg = {
	{text = "Character Select", varText = data.selectTime .." Seconds"},
	{text = "Stage Select",   	varText = data.stageTime .." Seconds"},
	{text = "Order Select",     varText = data.orderTime .." Seconds"},
	{text = "Rematch Option",	varText = data.rematchTime .." Seconds"},
	{text = "Service Screen", 	varText = data.serviceTime .." Seconds"},
	{text = "Attract Title", 	varText = data.attractTime .." Seconds"},
	{text = "Tower Select", 	varText = data.destinyTime .." Seconds"},
	{text = "Default Values",  	varText = ""},
	{text = "          BACK", 	varText = ""},
}
for i=1, #t_timeCfg do
	t_timeCfg[i]['varID'] = textImgNew()
end

function f_timeCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local timeCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	--sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				timeCfg = timeCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				timeCfg = timeCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Character Select Time
			elseif timeCfg == 1 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.selectTime < 61 then sndPlay(sndSys, 100, 0) end
					if data.selectTime == -1 then
						data.selectTime = 11
					elseif data.selectTime < 61 then
						data.selectTime = data.selectTime + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.selectTime > 11 then sndPlay(sndSys, 100, 0) end
					if data.selectTime > 11 then
						data.selectTime = data.selectTime - 1
					elseif data.selectTime == 11 then
						data.selectTime = -1
					end
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
		--Stage Select Time
			elseif timeCfg == 2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.stageTime < 61 then sndPlay(sndSys, 100, 0) end
					if data.stageTime == -1 then
						data.stageTime = 11
					elseif data.stageTime < 61 then
						data.stageTime = data.stageTime + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.stageTime > 11 then sndPlay(sndSys, 100, 0) end
					if data.stageTime > 11 then
						data.stageTime = data.stageTime - 1
					elseif data.stageTime == 11 then
						data.stageTime = -1
					end
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
		--Order Select Time
			elseif timeCfg == 3 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.orderTime < 61 then sndPlay(sndSys, 100, 0) end
					if data.orderTime == -1 then
						data.orderTime = 11
					elseif data.orderTime < 61 then
						data.orderTime = data.orderTime + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.orderTime > 11 then sndPlay(sndSys, 100, 0) end
					if data.orderTime > 11 then
						data.orderTime = data.orderTime - 1
					elseif data.orderTime == 11 then
						data.orderTime = -1
					end
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
		--Rematch Option Time
			elseif timeCfg == 4 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.rematchTime < 61 then sndPlay(sndSys, 100, 0) end
					if data.rematchTime == -1 then
						data.rematchTime = 11
					elseif data.rematchTime < 61 then
						data.rematchTime = data.rematchTime + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.rematchTime > 11 then sndPlay(sndSys, 100, 0) end
					if data.rematchTime > 11 then
						data.rematchTime = data.rematchTime - 1
					elseif data.rematchTime == 11 then
						data.rematchTime = -1
					end
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
		--Service Select Time
			elseif timeCfg == 5 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.serviceTime < 61 then sndPlay(sndSys, 100, 0) end
					if data.serviceTime == -1 then
						data.serviceTime = 11
					elseif data.serviceTime < 61 then
						data.serviceTime = data.serviceTime + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.serviceTime > 11 then sndPlay(sndSys, 100, 0) end
					if data.serviceTime > 11 then
						data.serviceTime = data.serviceTime - 1
					elseif data.serviceTime == 11 then
						data.serviceTime = -1
					end
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
		--Attract Title Screen Time
			elseif timeCfg == 6 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.attractTime < 61 then sndPlay(sndSys, 100, 0) end
					if data.attractTime == -1 then
						data.attractTime = 11
					elseif data.attractTime < 61 then
						data.attractTime = data.attractTime + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.attractTime > 11 then sndPlay(sndSys, 100, 0) end
					if data.attractTime > 11 then
						data.attractTime = data.attractTime - 1
					elseif data.attractTime == 11 then
						data.attractTime = -1
					end
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
		--Tower/Choose Your Destiny Time
			elseif timeCfg == 7 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.destinyTime < 61 then sndPlay(sndSys, 100, 0) end
					if data.destinyTime == -1 then
						data.destinyTime = 11
					elseif data.destinyTime < 61 then
						data.destinyTime = data.destinyTime + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.destinyTime > 11 then sndPlay(sndSys, 100, 0) end
					if data.destinyTime > 11 then
						data.destinyTime = data.destinyTime - 1
					elseif data.destinyTime == 11 then
						data.destinyTime = -1
					end
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
		--Default Values
			elseif timeCfg == #t_timeCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultTime = true
				defaultScreen = true
		--BACK
			elseif timeCfg == #t_timeCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if timeCfg < 1 then
				timeCfg = #t_timeCfg
				if #t_timeCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_timeCfg
				end
			elseif timeCfg > #t_timeCfg then
				timeCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (timeCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (timeCfg - 1) * 15
			end	
			if #t_timeCfg <= maxItems then
				maxtimeCfg = #t_timeCfg
			elseif timeCfg - cursorPosY > 0 then
				maxtimeCfg = timeCfg + maxItems - cursorPosY
			else
				maxtimeCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxtimeCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_timeCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if data.selectTime ~= -1 then t_timeCfg[1].varText = data.selectTime .." Seconds" else t_timeCfg[1].varText = "Infinite" end
		if data.stageTime ~= -1 then t_timeCfg[2].varText = data.stageTime .." Seconds" else t_timeCfg[2].varText = "Infinite" end
		if data.orderTime ~= -1 then t_timeCfg[3].varText = data.orderTime .." Seconds" else t_timeCfg[3].varText = "Infinite" end
		if data.rematchTime ~= -1 then t_timeCfg[4].varText = data.rematchTime .." Seconds" else t_timeCfg[4].varText = "Infinite" end
		if data.serviceTime ~= -1 then t_timeCfg[5].varText = data.serviceTime .." Seconds" else t_timeCfg[5].varText = "Infinite" end
		if data.attractTime ~= -1 then t_timeCfg[6].varText = data.attractTime .." Seconds" else t_timeCfg[6].varText = "Infinite" end
		if data.destinyTime ~= -1 then t_timeCfg[7].varText = data.destinyTime .." Seconds" else t_timeCfg[7].varText = "Infinite" end
		for i=1, maxtimeCfg do
			if i > timeCfg - cursorPosY then
				if t_timeCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_timeCfg[i].varID, font2, 0, 1, t_timeCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_timeCfg[i].varID, font2, 0, -1, t_timeCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxtimeCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_timeCfg > maxItems and maxtimeCfg < #t_timeCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SYSTEM SONGS SETTINGS
--;===========================================================
txt_songCfg = createTextImg(jgFnt, 0, 0, "SYSTEM SONG SETTINGS", 159, 13)

t_songCfg = {
	{text = "Main Menu"					 },
	{text = "Character Select"			 },
	{text = "Challenger"				 },
	{text = "Display BGM Name In-Match"	 },
	{text = "Default Values"			 },
	{text = "                       BACK"},
}
for i=1, #t_songCfg do
	t_songCfg[i]['varID'] = textImgNew()
	t_songCfg[i]['varText'] = ""
end

function f_setCfgSong()
	if songsSettings == true then --Only save if you come from this option script
		if selectedSong == nil then --Get previous data
			if songCfg == 1 then
				data.menuSong = data.menuSong
			elseif songCfg == 2 then
				data.selectSong = data.selectSong
			elseif songCfg == 3 then
				data.challengerSong = data.challengerSong
			end
		else --If you selected a song item
			if songCfg == 1 then
				data.menuSong = selectedSong
				if selectedSong == "Random" then data.menuSongFolder = folderRefer end --If you selected random song item, save folder selected to randomize from it
			elseif songCfg == 2 then
				data.selectSong = selectedSong
				if selectedSong == "Random" then data.selectSongFolder = folderRefer end
			elseif songCfg == 3 then
				data.challengerSong = selectedSong
				if selectedSong == "Random" then data.challengerSongFolder = folderRefer end
			end
		end
		modified = 1
		songsSettings = false
	end
end

function f_songCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	songCfg = 1 --To recognize f_setCfgSong()
	--sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				if data.attractMode then playBGM(bgmTitle) else	f_menuMusic() end
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				songCfg = songCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				songCfg = songCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			end
		--Set Main Menu Song
			if songCfg == 1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				songsSettings = true --For identify purposes
				f_songMenu() --Go to Sound Test
		--Set Character Select Song
			elseif songCfg == 2 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				songsSettings = true
				f_songMenu()
		--Set Challenger Select Song
			elseif songCfg == 3 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				songsSettings = true
				f_songMenu()
		--Display BGM Name
			elseif songCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then 
				sndPlay(sndSys, 100, 1)
				if data.bgmDisplay then data.bgmDisplay = false else data.bgmDisplay = true end
				modified = true
		--Default Values
			elseif songCfg == #t_songCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultSong = true
				defaultScreen = true
		--BACK
			elseif songCfg == #t_songCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				if data.attractMode then playBGM(bgmTitle) else	f_menuMusic() end
				break
			end
		--Setting Menu Logic
			if songCfg < 1 then
				songCfg = #t_songCfg
				if #t_songCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_songCfg
				end
			elseif songCfg > #t_songCfg then
				songCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (songCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (songCfg - 1) * 15
			end
			if #t_songCfg <= maxItems then
				maxsongCfg = #t_songCfg
			elseif songCfg - cursorPosY > 0 then
				maxsongCfg = songCfg + maxItems - cursorPosY
			else
				maxsongCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG2, 320, maxsongCfg*15)
		animSetWindow(optionsBG2, 2,20, 316.5,210)
		animDraw(optionsBG2)
		textImgDraw(txt_songCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 2,5+cursorPosY*15, 316.5,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		t_songCfg[1].varText = data.menuSong
		t_songCfg[2].varText = data.selectSong
		t_songCfg[3].varText = data.challengerSong
		if data.bgmDisplay then t_songCfg[4].varText = "Enabled" else t_songCfg[4].varText = "Disabled" end
		for i=1, maxsongCfg do
			if i > songCfg - cursorPosY then
				if t_songCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_songCfg[i].varID, font2, 0, 1, t_songCfg[i].text, 6, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_songCfg[i].varID, font2, 0, -1, t_songCfg[i].varText, 315, 15+i*15-moveTxt))
				end
			end
		end
		if maxsongCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_songCfg > maxItems and maxsongCfg < #t_songCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawListInputHints()
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; AUDIO SETTINGS
--;===========================================================
txt_audioCfg = createTextImg(jgFnt, 0, 0, "AUDIO SETTINGS", 159, 13)

t_audioCfg = {
	{text = "Master Volume",	varText = gl_vol.."%"},
	{text = "BGM Volume",		varText = bgm_vol.."%"},
	{text = "SFX Volume",		varText = se_vol.."%"},
	{text = "Movie Volume",		varText = vid_vol.."%"},
	{text = "Panning Range",   	varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{text = "Sample Rate",     	varText = freq},
	{text = "Channels",        	varText = s_channels},
	{text = "Buffer Samples",  	varText = buffer},
	{text = "Default Values",	varText = ""},
	{text = "          BACK",  	varText = ""},
}
for i=1, #t_audioCfg do
	t_audioCfg[i]['varID'] = textImgNew()
end

function f_audioCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local audioCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				audioCfg = audioCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				audioCfg = audioCfg + 1
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
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if gl_vol > 0 then
						gl_vol = gl_vol - 1
					else
						gl_vol = 100
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			elseif audioCfg == 2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if bgm_vol < 100 then
						bgm_vol = bgm_vol + 1
					else
						bgm_vol = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if bgm_vol > 0 then
						bgm_vol = bgm_vol - 1
					else
						bgm_vol = 100
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			elseif audioCfg == 3 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if se_vol < 100 then
						se_vol = se_vol + 1
					else
						se_vol = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if se_vol > 0 then
						se_vol = se_vol - 1
					else
						se_vol = 100
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		--Movie Volume
			elseif audioCfg == 4 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if vid_vol < 200 then
						vid_vol = vid_vol + 1
					else
						vid_vol = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if vid_vol > 0 then
						vid_vol = vid_vol - 1
					else
						vid_vol = 200
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
				end
				setVideoVolume(vid_vol)
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
		--Audio Panning Range
			elseif audioCfg == 5 then
				if commandGetState(p1Cmd, 'r') and pan_str < 160 then
					sndPlay(sndSys, 100, 0)
					pan_str = pan_str + 40
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and pan_str > 0 then
					sndPlay(sndSys, 100, 0)
					pan_str = pan_str - 40
					modified = 1
				end
				setPanStr(pan_str / 100)
		--Sample Rate
			elseif audioCfg == 6 then
				if commandGetState(p1Cmd, 'r') and freq < 96000 then
					sndPlay(sndSys, 100, 0)
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
					sndPlay(sndSys, 100, 0)
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
			elseif audioCfg == 7 then
				if commandGetState(p1Cmd, 'r') and  channels < 6 then
					sndPlay(sndSys, 100, 0)
					if channels < 2 then
						channels = 2
						s_channels = "Stereo"
					elseif channels < 4 then
						channels = 4
						s_channels = "Quad"
					elseif channels < 6 then
						channels = 6
						s_channels = "5.1"
					end
					modified = 1
					needReload = 1
				elseif commandGetState(p1Cmd, 'l') and channels >= 2 then
					sndPlay(sndSys, 100, 0)
					if channels >= 6 then
						channels = 4
						s_channels = "Quad"
					elseif channels >= 4 then
						channels = 2
						s_channels = "Stereo"
					elseif channels >= 2 then
						channels = 1
						s_channels = "Mono"
					end
					modified = 1
					needReload = 1
				end
		--Buffer Samples
			elseif audioCfg == 8 then
				if commandGetState(p1Cmd, 'r') and buffer < 8192 then
					sndPlay(sndSys, 100, 0)
					buffer = buffer * 2
					modified = 1
					needReload = 1
				elseif commandGetState(p1Cmd, 'l') and buffer >= 1024 then
					sndPlay(sndSys, 100, 0)
					buffer = buffer / 2
					modified = 1
					needReload = 1
				end
		--Default Values
			elseif audioCfg == #t_audioCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultAudio = true
				defaultScreen = true
		--BACK
			elseif audioCfg == #t_audioCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if audioCfg < 1 then
				audioCfg = #t_audioCfg
				if #t_audioCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_audioCfg
				end
			elseif audioCfg > #t_audioCfg then
				audioCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (audioCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (audioCfg - 1) * 15
			end
			if #t_audioCfg <= maxItems then
				maxAudioCfg = #t_audioCfg
			elseif audioCfg - cursorPosY > 0 then
				maxAudioCfg = audioCfg + maxItems - cursorPosY
			else
				maxAudioCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxAudioCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_audioCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		t_audioCfg[1].varText = gl_vol.."%"
		t_audioCfg[2].varText = bgm_vol.."%"
		t_audioCfg[3].varText = se_vol.."%"
		t_audioCfg[4].varText = vid_vol.."%"
		t_audioCfg[5].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
		t_audioCfg[6].varText = freq
		t_audioCfg[7].varText = s_channels
		t_audioCfg[8].varText = buffer
		setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
		setPanStr(pan_str / 100)
		for i=1, maxAudioCfg do
			if i > audioCfg - cursorPosY then
				if t_audioCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font2, 0, 1, t_audioCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font2, 0, -1, t_audioCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxAudioCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_audioCfg > maxItems and maxAudioCfg < #t_audioCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ENGINE SETTINGS
--;===========================================================
txt_engineCfg = createTextImg(jgFnt, 0, 0, "ENGINE SETTINGS", 159, 13)

t_engineCfg = {
	{text = "Debug Mode",  	      		varText = ""},
	{text = "Save Debug Logs",        	varText = ""},
	{text = "Generate Characters List", varText = ""},
	{text = "Generate Stages List", 	varText = ""},
	{text = "Engine Mode",        		varText = data.engineMode},
	{text = "HelperMax",              	varText = HelperMaxEngine},
	{text = "PlayerProjectileMax",		varText = PlayerProjectileMaxEngine},
	{text = "ExplodMax",              	varText = ExplodMaxEngine},
	{text = "AfterImageMax",          	varText = AfterImageMaxEngine},
	{text = "Erase/Reset Statistics", 	varText = ""},
	{text = "Default Settings",  	  	varText = ""},
	{text = "          BACK",  	  		varText = ""},
}
for i=1, #t_engineCfg do
	t_engineCfg[i]['varID'] = textImgNew()
end

function f_engineCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local engineCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				lockSetting = false
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				lockSetting = false
				sndPlay(sndSys, 100, 0)
				engineCfg = engineCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				lockSetting = false
				sndPlay(sndSys, 100, 0)
				engineCfg = engineCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end					
		--Debug Mode
			elseif engineCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.debugMode then
						data.debugMode = false
					else
						data.debugMode = true
					end
					modified = 1
				end
		--Print Debug Logs
			elseif engineCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.debugLog then
						data.debugLog = false
					else
						data.debugLog = true
					end
					modified = 1
				end
		--Generate Characters List
			elseif engineCfg == 3 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				generateCharsList("chars")
				sszOpen("save", "00_CharactersList.txt")
		--Generate Stages List
			elseif engineCfg == 4 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				generateStageList("stages")
				sszOpen("save", "00_ExtraStagesList.txt")
		--Engine Mode
			elseif engineCfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.engineMode == "VN" then
						data.engineMode = "FG"
					elseif data.engineMode == "FG" then
						data.engineMode = "VN"
					end
					modified = 1
					needReload = 1
				end
		--HelperMax
			elseif engineCfg == 6 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if HelperMaxEngine < 1000 then --You can increase this limit
						HelperMaxEngine = HelperMaxEngine + 1
					else
						HelperMaxEngine = 56 --Minimum Value
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if HelperMaxEngine > 56 then --Minimum Value
						HelperMaxEngine = HelperMaxEngine - 1
					else
						HelperMaxEngine = 1000 --You can increase this limit
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			elseif engineCfg == 7 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if PlayerProjectileMaxEngine < 1000 then --You can increase this limit
						PlayerProjectileMaxEngine = PlayerProjectileMaxEngine + 1
					else
						PlayerProjectileMaxEngine = 32 --Minimum Value
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if PlayerProjectileMaxEngine > 32 then --Minimum Value
						PlayerProjectileMaxEngine = PlayerProjectileMaxEngine - 1
					else
						PlayerProjectileMaxEngine = 1000 --You can increase this limit
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			elseif engineCfg == 8 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if ExplodMaxEngine < 1000 then --You can increase this limit
						ExplodMaxEngine = ExplodMaxEngine + 1
					else
						ExplodMaxEngine = 128 --Minimum Value
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if ExplodMaxEngine > 128 then --Minimum Value
						ExplodMaxEngine = ExplodMaxEngine - 1
					else
						ExplodMaxEngine = 1000 --You can increase this limit
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			elseif engineCfg == 9 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if AfterImageMaxEngine < 1000 then --You can increase this limit
						AfterImageMaxEngine = AfterImageMaxEngine + 1
					else
						AfterImageMaxEngine = 8 --Minimum Value
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if AfterImageMaxEngine > 8 then --Minimum Value
						AfterImageMaxEngine = AfterImageMaxEngine - 1
					else
						AfterImageMaxEngine = 1000 --You can increase this limit
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
			elseif engineCfg == 10 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then	
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 1)
					f_unlocksWarning()
				end
		--Default Values
			elseif engineCfg == #t_engineCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultEngine = true
				defaultScreen = true
		--BACK
			elseif engineCfg == #t_engineCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if engineCfg < 1 then
				engineCfg = #t_engineCfg
				if #t_engineCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_engineCfg
				end
			elseif engineCfg > #t_engineCfg then
				engineCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (engineCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (engineCfg - 1) * 15
			end	
			if #t_engineCfg <= maxItems then
				maxEngineCfg = #t_engineCfg
			elseif engineCfg - cursorPosY > 0 then
				maxEngineCfg = engineCfg + maxItems - cursorPosY
			else
				maxEngineCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxEngineCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_engineCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if lockSetting then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end
		if data.debugMode then t_engineCfg[1].varText = "Enabled" else t_engineCfg[1].varText = "Disabled" end
		if data.debugLog then t_engineCfg[2].varText = "Enabled" else t_engineCfg[2].varText = "Disabled" end
		if data.engineMode == "FG" then t_engineCfg[5].varText = "Fighting Game" elseif data.engineMode == "VN" then t_engineCfg[5].varText = "Visual Novel" end
		t_engineCfg[6].varText = HelperMaxEngine
		t_engineCfg[7].varText = PlayerProjectileMaxEngine
		t_engineCfg[8].varText = ExplodMaxEngine
		t_engineCfg[9].varText = AfterImageMaxEngine
		for i=1, maxEngineCfg do
			if i > engineCfg - cursorPosY then
				if t_engineCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_engineCfg[i].varID, font2, 0, 1, t_engineCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_engineCfg[i].varID, font2, 0, -1, t_engineCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxEngineCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_engineCfg > maxItems and maxEngineCfg < #t_engineCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VIDEO SETTINGS
--;===========================================================
txt_videoCfg = createTextImg(jgFnt, 0, 0, "VIDEO SETTINGS", 159, 13)

t_videoCfg = {
	{text = "Renderer", 	 	 varText = ""},
	{text = "Resolution",  		 varText = ""},
	{text = "Screen Mode",  	 varText = ""},
	{text = "Window Type", 		 varText = ""},
	{text = "Fullscreen Type",	 varText = ""},
	{text = "Keep Aspect Ratio", varText = ""},
	{text = "Window Opacity",	 varText = ""},
	{text = "Brightness",		 varText = ""},
	{text = "Save Memory", 	 	 varText = ""},
	{text = "Default Graphics",	 varText = ""},
	{text = "          BACK",  	 varText = ""},
}
for i=1, #t_videoCfg do
	t_videoCfg[i]['varID'] = textImgNew()
end

local function f_setVideoVars()
--Window Type
	txt_windowType = ""
	if windowType == 1 then
		txt_windowType = "Resizable"
	elseif windowType == 2 then
		txt_windowType = "Bordered A"
	elseif windowType == 3 then
		txt_windowType = "Bordered B"
	elseif windowType == 4 then
		txt_windowType = "No Decoration"
	else
		txt_windowType = "???"
	end
--FullScreen Type
	txt_fullscreenType = ""
	if b_fullscreenMode then txt_fullscreenType = "Exclusive" else txt_fullscreenType = "Borderless" end
--Aspect Ratio
	txt_aspectRatio = ""
	if b_aspectMode then txt_aspectRatio = "Yes" else txt_aspectRatio = "No" end
--Render Mode
	txt_renderMode = ""
	if b_openGL then txt_renderMode = "OpenGL 2.0" else txt_renderMode = "Software" end
end

function f_videoCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local videoCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	updateVars = true
	f_setVideoVars()
	sndPlay(sndSys, 100, 1)
	while true do
	--In case that use ALT+ENTER
		if b_fullscreenMode ~= getFullScreenMode() then
			if getFullScreenMode() then
				b_fullscreenMode = true
			else
				b_fullscreenMode = false
			end
			modified = 1
			updateVars = true
		end
		if b_screenMode ~= getScreenMode() then
			if getScreenMode() then
				b_screenMode = true
				s_screenMode = "Fullscreen"
			else
				b_screenMode = false
				s_screenMode = "Windowed"
			end
			modified = 1
			updateVars = true
		end
	--[[
		if b_aspectMode ~= getAspectRatio() then
			if getAspectRatio() then
				b_aspectMode = true
			else
				b_aspectMode = false
			end
			modified = 1
			updateVars = true
		end
	]]
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				lockSetting = false
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				lockSetting = false
				videoCfg = videoCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				lockSetting = false
				videoCfg = videoCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--(Software/OpenGL 2.0)
			elseif videoCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if not b_openGL then
					b_openGL = true
					f_glWarning()			
				else
					b_openGL = false
				end
				modified = 1
				needReload = 1
				updateVars = true
		--Resolution
			elseif videoCfg == 2 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				if f_resCfg() then
					modified = 1
					updateVars = true
				end
		--Screen Mode
			elseif videoCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if not b_screenMode then
					b_screenMode = true
					s_screenMode = "Fullscreen"
				else
					b_screenMode = false
					s_screenMode = "Windowed"
				end
				modified = 1
				updateVars = true
				setScreenMode(b_screenMode) --added via system-script.ssz
		--Window Type
			elseif videoCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and windowType < 4 then
					sndPlay(sndSys, 100, 0)
					windowType = windowType + 1
				elseif commandGetState(p1Cmd, 'l') and windowType > 1 then
					sndPlay(sndSys, 100, 0)
					windowType = windowType - 1
				end
				modified = 1
				updateVars = true
				setWindowType(windowType)
				--f_setVideoVars() --Set Var Text
		--Fullscreen Type
			elseif videoCfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if b_fullscreenMode then
					b_fullscreenMode = false
				else
					b_fullscreenMode = true
				end
				modified = 1
				updateVars = true
				setFullScreenMode(b_fullscreenMode)
				--f_setVideoVars() --Set Var Text
			--Apply FullScreen Type during execution
				if s_screenMode == "Fullscreen" then
					setScreenMode(false)
					setScreenMode(true)
				end
		--Keep Aspect Ratio
			elseif videoCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if not b_aspectMode then
					b_aspectMode = true
				else
					b_aspectMode = false
				end
				modified = 1
				updateVars = true
				setAspectRatio(b_aspectMode)
				--f_setVideoVars() --Set Var Text
		--Window Opacity Adjust
			elseif videoCfg == 7 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if opacityAdjust < 100 then
						opacityAdjust = opacityAdjust + 1
					else
						opacityAdjust = 0
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
					updateVars = true
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if opacityAdjust > 0 then
						opacityAdjust = opacityAdjust - 1
					else
						opacityAdjust = 100
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
					updateVars = true
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
		--Brightness Adjust
			elseif videoCfg == 8 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if brightnessAdjust < 256 then
						brightnessAdjust = brightnessAdjust + 1
					--else
						--brightnessAdjust = 50
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
					updateVars = true
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if brightnessAdjust > 50 then
						brightnessAdjust = brightnessAdjust - 1
					--else
						--brightnessAdjust = 256
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					modified = 1
					updateVars = true
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
		--Save Memory
			elseif videoCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd, true) > 0) then
				sndPlay(sndSys, 100, 0)
				if not b_saveMemory then
					b_saveMemory = true
					s_saveMemory = "Yes"
					f_memWarning()
				else
					b_saveMemory = false
					s_saveMemory = "No"
				end
				modified = 1
				needReload = 1
				updateVars = true
		--Default Values
			elseif videoCfg == #t_videoCfg-1 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultVideo = true
				defaultScreen = true
		--BACK
			elseif videoCfg == #t_videoCfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if videoCfg < 1 then
				videoCfg = #t_videoCfg
				if #t_videoCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_videoCfg
				end
			elseif videoCfg > #t_videoCfg then
				videoCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (videoCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (videoCfg - 1) * 15
			end	
			if #t_videoCfg <= maxItems then
				maxVideoCfg = #t_videoCfg
			elseif videoCfg - cursorPosY > 0 then
				maxVideoCfg = videoCfg + maxItems - cursorPosY
			else
				maxVideoCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxVideoCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_videoCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if updateVars then
			f_setVideoVars() --Set Vars Text
			t_videoCfg[1].varText = txt_renderMode
			t_videoCfg[2].varText = resolutionWidth.."x"..resolutionHeight
			t_videoCfg[3].varText = s_screenMode
			t_videoCfg[4].varText = txt_windowType
			t_videoCfg[5].varText = txt_fullscreenType
			t_videoCfg[6].varText = txt_aspectRatio
			t_videoCfg[7].varText = opacityAdjust.."%"
			t_videoCfg[8].varText = brightnessAdjust
			t_videoCfg[9].varText = s_saveMemory
			setOpacity(opacityAdjust / 100)
			setBrightness(brightnessAdjust)
			updateVars = false
		end
		for i=1, maxVideoCfg do
			if i > videoCfg - cursorPosY then
				if t_videoCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_videoCfg[i].varID, font2, 0, 1, t_videoCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_videoCfg[i].varID, font2, 0, -1, t_videoCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxVideoCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_videoCfg > maxItems and maxVideoCfg < #t_videoCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		cmdInput()
		refresh()
	end
end
--;===========================================================
--; RESOLUTIONS SETTINGS
--;===========================================================
txt_resCfg = createTextImg(jgFnt, 0, 0, "ASPECT RATIO SETTINGS", 159, 13)
txt_resCfgSet = createTextImg(jgFnt, 0, 0, "", 159, 13)

--4:3 RESOLUTIONS
t_resCfg4_3 = {
	{x = 320,  y = 240,  text = "320x240             (QVGA)"},
	{x = 512,  y = 384,  text = "512x384        (MACINTOSH)"},
	{x = 640,  y = 480,  text = "640x480              (VGA)"},
	{x = 800,  y = 600,  text = "800x600             (SVGA)"},
	{x = 960,  y = 720,  text = "960x720               (HD)"},
	{x = 1024, y = 768,  text = "1024x768             (XGA)"},
	{x = 1152, y = 864,  text = "1152x864            (XGA+)"},
	{x = 1200, y = 900,  text = "1200x900             (HD+)"},
	{x = 1280, y = 960,  text = "1280x960        (Quad-VGA)"},
	{x = 1440, y = 1080, text = "1440x1080            (FHD)"},
	{x = 1600, y = 1200, text = "1600x1200            (XGA)"},
	{x = 1920, y = 1440, text = "1920x1440          (UXGA+)"},
	{x = 2048, y = 1536, text = "2048x1536           (QXGA)"},
	{x = 3200, y = 2400, text = "3200x2400          (QUXGA)"},
	{x = 6400, y = 4800, text = "6400x4800          (HUXGA)"},
	{text = "          BACK "},
}
for i=1, #t_resCfg4_3 do
	t_resCfg4_3[i]['id'] = ''
end

--16:9 RESOLUTIONS
t_resCfg16_9 = {
	{x = 427,  y = 240,  text = "427x240        (ULTRA LOW)"},
	{x = 640,  y = 360,  text = "640x360              (LOW)"},
	{x = 853,  y = 480,  text = "853x480               (SD)"},
	{x = 1280, y = 720,  text = "1280x720              (HD)"},
	{x = 1600, y = 900,  text = "1600x900             (HD+)"},
	{x = 1920, y = 1080, text = "1920x1080        (FULL HD)"},
	{x = 2048, y = 1152, text = "2048x1152          (QWXGA)"},
	{x = 2560, y = 1440, text = "2560x1440            (QHD)"},
	{x = 3840, y = 2160, text = "3840x2160        (4K UHDV)"},
	{text = "          BACK"},
}
for i=1, #t_resCfg16_9 do
	t_resCfg16_9[i]['id'] = ''
end

--16:10 RESOLUTIONS
t_resCfg16_10 = {
	{x = 320,  y = 200,  text = "320x200              (CGA)"},
	{x = 1280, y = 800,  text = "1280x800            (WXGA)"},
	{x = 1440, y = 900,  text = "1440x900           (WXGA+)"},
	{x = 1680, y = 1050, text = "1680x1050         (WSXGA+)"},
	{x = 1920, y = 1200, text = "1920x1200          (WUXGA)"},
	{x = 2560, y = 1600, text = "2560x1600          (WQXGA)"},
	{x = 2880, y = 1800, text = "2880x1800  (RETINA DISPLAY)"},
	{x = 3840, y = 2400, text = "3840x2400         (WQUXGA)"},
	{x = 7680, y = 4800, text = "7680x4800         (WHUXGA)"},
	{text = "          BACK"},
}
for i=1, #t_resCfg16_10 do
	t_resCfg16_10[i]['id'] = ''
end

--EXTRA RESOLUTIONS
t_EXresCfg = {
	{x = 400,  y = 254,  text = "400x254           (ARCADE)"},
	{x = 400,  y = 508,  text = "400x508        (ARCADE x2)"},
	{x = 640,  y = 350,  text = "640x350         (EGA 11:6)"},
	{x = 720,  y = 348,  text = "720x348         (HGC 60:9)"},
	{x = 720,  y = 350,  text = "720x350        (MDA 72:35)"},
	{x = 720,  y = 360,  text = "720x360    (APPLE LISA 2:1)"},
	{x = 1024, y = 600,  text = "1024x600 (CANAIMA MG101A3)"},
	{x = 1360, y = 768,  text = "1360x768      (WXGA 85:48)"},
	{x = 1366, y = 728,  text = "1366x728 (CANAIMA EF10M12)"},
	{x = 1200, y = 762,  text = "1200x762       (ARCADE x3)"},
	{x = 1280, y = 1024, text = "1280x1024       (SXGA 5:4)"},
	{x = 1600, y = 1016, text = "1600x1016      (ARCADE x4)"},
	{x = 2048, y = 1080, text = "2048x1080        (2K 17:9)"},
	{x = 2560, y = 2048, text = "2560x2048       (QSXA 5:4)"},
	{x = 3200, y = 2048, text = "3200x2048    (WQSXA 25:16)"},
	{x = 4096, y = 2160, text = "4096x2160  (4K CINEMA 17:9)"},
	{x = 5120, y = 4096, text = "5120x4096      (HSXGA 5:4)"},
	{x = 6400, y = 4096, text = "6400x4096   (WHSXGA 25:16)"},
	{x = 7680, y = 4320, text = "7680x4320         (8K UHD)"},
	{text = "          BACK"},
}
for i=1, #t_EXresCfg do
	t_EXresCfg[i]['id'] = ''
end

--Aspect Ratio Menu Items
t_resCfg = {
	{text = "4:3 Resolutions",   aspectRatio = t_resCfg4_3,   title = "(4:3)"},
	{text = "16:9 Resolutions",  aspectRatio = t_resCfg16_9,  title = "(16:9)"},
	{text = "16:10 Resolutions", aspectRatio = t_resCfg16_10, title = "(16:10)"},
	{text = "Extra Resolutions", aspectRatio = t_EXresCfg, 	  title = ""},
	{text = "          BACK"},
}
for i=1, #t_resCfg do
	t_resCfg[i]['id'] = ''
end

function f_resCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			break
		end
		if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg = resCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg = resCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
		--BACK
			if resCfg == #t_resCfg then
				sndPlay(sndSys, 100, 2)
				break
		--Resolutions Menu
			else
				sndPlay(sndSys, 100, 1)
				f_resCfgSet(t_resCfg[resCfg].aspectRatio, t_resCfg[resCfg].title)
			end
		end
		if resCfg < 1 then
			resCfg = #t_resCfg
			if #t_resCfg > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_resCfg
			end
		elseif resCfg > #t_resCfg then
			resCfg = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (resCfg - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg - 1) * 15
		end	
		if #t_resCfg <= maxItems then
			maxResCfg = #t_resCfg
		elseif resCfg - cursorPosY > 0 then
			maxResCfg = resCfg + maxItems - cursorPosY
		else
			maxResCfg = maxItems
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxResCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_resCfg)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxResCfg do
			if i > resCfg - cursorPosY then
				t_resCfg[i].id = createTextImg(font2, 0, 1, t_resCfg[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_resCfg[i].id)
			end
		end
		if maxResCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_resCfg > maxItems and maxResCfg < #t_resCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
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
		cmdInput()
		refresh()
	end
end

function f_resCfgSet(t, title)
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfgSet = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	local t_aspectRatio = t
	local title = title
	for i=1, #t_aspectRatio do
		if t_aspectRatio[i].text == resolutionWidth.."x"..resolutionHeight then
			resCfgSet = i
			break
		end
	end
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfgSet = resCfgSet - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfgSet = resCfgSet + 1
		end
		if resCfgSet < 1 then
			resCfgSet = #t_aspectRatio
			if #t_aspectRatio > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_aspectRatio
			end
		elseif resCfgSet > #t_aspectRatio then
			resCfgSet = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (resCfgSet - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfgSet - 1) * 15
		end
		if #t_aspectRatio <= maxItems then
			maxresCfgSet = #t_aspectRatio
		elseif resCfgSet - cursorPosY > 0 then
			maxresCfgSet = resCfgSet + maxItems - cursorPosY
		else
			maxresCfgSet = maxItems
		end
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			if resCfgSet == #t_aspectRatio then
				sndPlay(sndSys, 100, 2)
				return false
			else
				sndPlay(sndSys, 100, 1)
				resolutionWidth = t_aspectRatio[resCfgSet].x
				resolutionHeight = t_aspectRatio[resCfgSet].y
				setGameRes(resolutionWidth, resolutionHeight)
				if (resolutionHeight / 3 * 4) ~= resolutionWidth then
					f_resWarning()
				end
				modified = 1
				needReload = 1
				return true
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxresCfgSet*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgSetText(txt_resCfgSet, "RESOLUTION SELECT "..title)
		textImgDraw(txt_resCfgSet)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxresCfgSet do
			if i > resCfgSet - cursorPosY then
				t_aspectRatio[i].id = createTextImg(font2, 0, 1, t_aspectRatio[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_aspectRatio[i].id)
			end
		end
		if maxresCfgSet > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_aspectRatio > maxItems and maxresCfgSet < #t_aspectRatio then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; INPUT SETTINGS
--;===========================================================
txt_inputCfg = createTextImg(jgFnt, 0, 0, "INPUT SETTINGS", 159, 13)

t_inputCfg = {
	{text = "Keyboard Config",  		 varText = ""},
	{text = "Gamepad Config",	  		 varText = ""},
	--{text = "Player 1 Gamepad Status", varText = s_disablePadP1},
	--{text = "Player 2 Gamepad Status", varText = s_disablePadP2},
	{text = "Swap Gamepads", 			 varText = ""},
	{text = "Test Controls",  		 	 varText = ""},
	{text = "Default Controls",  		 varText = ""},
	{text = "             BACK",  	 	 varText = ""},
}
for i=1, #t_inputCfg do
	t_inputCfg[i]['varID'] = textImgNew()
end

function f_inputCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local inputCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	f_defaultReset()
	padTester = 0
	padTesterActive = false
	sndPlay(sndSys, 100, 1)
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			end
			if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				inputCfg = inputCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				inputCfg = inputCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			--Keyboard Config
				if inputCfg == 1 then
					sndPlay(sndSys, 100, 1)
					f_keyMenu()
			--Gamepad Config
				elseif inputCfg == 2 then
					sndPlay(sndSys, 100, 1)
					padTesterActive = true
			--[[Player 1 Gamepad Status
				elseif inputCfg == 3 then
					sndPlay(sndSys, 100, 1)
					if not data.disablePadP1 then
						data.disablePadP1 = true
						s_disablePadP1 = "Disabled"
					else
						data.disablePadP1 = false
						s_disablePadP1 = "Enabled"
					end
					modified = 1
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
			]]
			--[[Player 2 Gamepad Status
				elseif inputCfg == 4 then
					sndPlay(sndSys, 100, 1)
					if not data.disablePadP2 then
						data.disablePadP2 = true
						s_disablePadP2 = "Disabled"
					else
						data.disablePadP2 = false
						s_disablePadP2 = "Enabled"
					end
					modified = 1
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
			]]
			--Swap Controller
				elseif inputCfg == 3 then
					sndPlay(sndSys, 100, 1)
					f_swapGamepad(data.p2Gamepad, data.p1Gamepad)
					if data.p1Gamepad == 0 then
						data.p1Gamepad = 1
						data.p2Gamepad = 0
					else
						data.p1Gamepad = 0
						data.p2Gamepad = 1
					end
					modified = 1
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
			--Input Test
				elseif inputCfg == 4 then
					if data.engineMode == "FG" then
						sndPlay(sndSys, 100, 1)
						f_testMenu()
					else
						sndPlay(sndIkemen, 200, 0)
					end
			--Default Values
				elseif inputCfg == #t_inputCfg-1 then
					sndPlay(sndSys, 100, 1)
					defaultInput = true
					defaultScreen = true
			--BACK
				else
					sndPlay(sndSys, 100, 2)
					break
				end
				--if inputCfg == 3 or inputCfg == 4 then disableGamepad(data.disablePadP1,data.disablePadP2) end
			end
			if padTester > 20 then
				if getInputID(data.p1Gamepad) == 101 and getInputID(data.p2Gamepad) == 101 then
					f_joyMenu()
				else
					f_tempWarning()
				end
				padTesterActive = false
			end
			if inputCfg < 1 then
				inputCfg = #t_inputCfg
				if #t_inputCfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_inputCfg
				end
			elseif inputCfg > #t_inputCfg then
				inputCfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (inputCfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (inputCfg - 1) * 15
			end	
			if #t_inputCfg <= maxItems then
				maxInputCfg = #t_inputCfg
			elseif inputCfg - cursorPosY > 0 then
				maxInputCfg = inputCfg + maxItems - cursorPosY
			else
				maxInputCfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 222, maxInputCfg*15)
		animSetWindow(optionsBG1, 68,20, 184,180)
		animDraw(optionsBG1)
		textImgDraw(txt_inputCfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 68,5+cursorPosY*15, 184,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		--t_inputCfg[3].varText = s_disablePadP1
		--t_inputCfg[4].varText = s_disablePadP2
		t_inputCfg[3].varText = "P1: "..data.p1Gamepad+1 .." | P2: "..data.p2Gamepad+1
		for i=1, maxInputCfg do
			if i > inputCfg - cursorPosY then
				if t_inputCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_inputCfg[i].varID, font2, 0, 1, t_inputCfg[i].text, 73, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_inputCfg[i].varID, font2, 0, -1, t_inputCfg[i].varText, 248, 15+i*15-moveTxt))
				end
			end
		end
		if maxInputCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_inputCfg > maxItems and maxInputCfg < #t_inputCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		if data.debugMode then
			f_drawQuickText(txt_keasdint, font1, 0, 0, padTester, 162, 30)
			f_drawQuickText(padu1, font1, 0, 0, getInputID(data.p1Gamepad), 188, 30)
			f_drawQuickText(padu2, font1, 0, 0, getInputID(data.p2Gamepad), 200, 30)
		end
		if padTesterActive then padTester = padTester + 1 else padTester = 0 end
		cmdInput()
		refresh()
	end
end

function f_swapController(playerOld, playerNew, controllerOld, controllerNew)
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerOld .. '%]%.set%(\n*%s*' .. controllerOld, 'in.new[' .. playerNew .. 'deleteMe].set(\n  ' .. controllerOld)
	s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNew .. '%]%.set%(\n*%s*' .. controllerNew, 'in.new[' .. playerOld .. '].set(\n  ' .. controllerNew)
	s_configSSZ = s_configSSZ:gsub('deleteMe', '')
end

function f_swapGamepad(gamepadP1, gamepadP2)
	s_configSSZ = s_configSSZ:gsub('in.new%[2%]%.set%(\n*%s*[01]', 'in.new[2].set(\n  ' .. gamepadP1) --P1 Battle
	s_configSSZ = s_configSSZ:gsub('in.new%[3%]%.set%(\n*%s*[01]', 'in.new[3].set(\n  ' .. gamepadP2) --P2 Battle
	s_configSSZ = s_configSSZ:gsub('in.new%[12%]%.set%(\n*%s*[01]', 'in.new[12].set(\n  ' .. gamepadP1) --P1 Menu
	s_configSSZ = s_configSSZ:gsub('in.new%[13%]%.set%(\n*%s*[01]', 'in.new[13].set(\n  ' .. gamepadP2) --P2 Menu
	swapGamepad(gamepadP1, gamepadP2)
end

--;===========================================================
--; INPUT TEST MENU
--;===========================================================
txt_inputTest = createTextImg(jgFnt, 0, 0, "BATTLE INPUT TEST", 159, 13)

--UP Button
TbuttonUp = animNew(sprGlyphs, [[48,0, 0,0, -1]])

--DOWN Button
TbuttonDown = animNew(sprGlyphs, [[42,0, 0,0, -1]])

--LEFT Button
TbuttonLeft = animNew(sprGlyphs, [[44,0, 0,0, -1]])

--RIGHT Button
TbuttonRight = animNew(sprGlyphs, [[46,0, 0,0, -1]])

--A Button
TbuttonA = animNew(sprGlyphs, [[1,0, 0,0, -1]])

--B Button
TbuttonB = animNew(sprGlyphs, [[2,0, 0,0, -1]])

--C Button
TbuttonC = animNew(sprGlyphs, [[3,0, 0,0, -1]])

--R Button
TbuttonR = animNew(sprGlyphs, [[28,0, 0,0, -1]])

--X Button
TbuttonX = animNew(sprGlyphs, [[24,0, 0,0, -1]])

--Y Button
TbuttonY = animNew(sprGlyphs, [[25,0, 0,0, -1]])

--Z Button
TbuttonZ = animNew(sprGlyphs, [[26,0, 0,0, -1]])

--L Button
TbuttonL = animNew(sprGlyphs, [[27,0, 0,0, -1]])

--Start Button
TbuttonS = animNew(sprGlyphs, [[51,0, 0,0, -1]])

--Input Hints Panel
function drawTestCfgInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawBattleInputHints("e","132,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 153, hintFontYPos)
end

function f_testMenu()
	cmdInput()
	setSysCtrl(0) --Load Battle Controls from config.ssz
	f_cmdCodeReset() --Secret Button Combination
	local alphaS = 20
	local alphaD = 100
	local alphaSB = 255
	local alphaDB = 0
	local scaleX = 0.35
	local scaleY = 0.35
--Button Pos X
	local posXup = 65
	local posXdo = 65
	local posXle = 45
	local posXri = 85
	local posXa = 110
	local posXb = 135
	local posXc = 160
	local posXx = 117
	local posXy = 140
	local posXz = 165
	local posXl = 190
	local posXr = 185
	local posXs = 215
--Button Pos Y
	local posYup = 45
	local posYdo = 85
	local posYle = 65
	local posYri = 65
	local posYa = 85
	local posYb = 80
	local posYc = 80
	local posYx = 60
	local posYy = 53
	local posYz = 53
	local posYl = 53
	local posYr = 80
	local posYs = 68
--Player 2 Assets Pos X and Y Distance
	local posXP2 = 0
	local posYP2 = 100
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			setSysCtrl(10) --Restore Menu Controls from config.ssz
			break
		end
	--Draw Assets
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_inputTest)
	--Player 1
		f_drawQuickSpr(TbuttonUp, posXup, posYup, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonDown, posXdo, posYdo, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonLeft, posXle, posYle, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonRight, posXri, posYri, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonA, posXa, posYa, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonB, posXb, posYb, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonC, posXc, posYc, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonX, posXx, posYx, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonY, posXy, posYy, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonZ, posXz, posYz, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonL, posXl, posYl, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonR, posXr, posYr, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonS, posXs, posYs, scaleX, scaleY, alphaS, alphaD)
	--Player 2
		f_drawQuickSpr(TbuttonUp, posXup+posXP2, posYup+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonDown, posXdo+posXP2, posYdo+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonLeft, posXle+posXP2, posYle+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonRight, posXri+posXP2, posYri+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonA, posXa+posXP2, posYa+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonB, posXb+posXP2, posYb+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonC, posXc+posXP2, posYc+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonX, posXx+posXP2, posYx+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonY, posXy+posXP2, posYy+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonZ, posXz+posXP2, posYz+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonL, posXl+posXP2, posYl+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonR, posXr+posXP2, posYr+posYP2, scaleX, scaleY, alphaS, alphaD)
		f_drawQuickSpr(TbuttonS, posXs+posXP2, posYs+posYP2, scaleX, scaleY, alphaS, alphaD)
	--SHOW BUTTONS FOR PLAYER 1 CONTROL
		if commandGetState(p1Cmd, 'holdu') then
			cmdCode = true
			f_drawQuickSpr(TbuttonUp, posXup, posYup, scaleX, scaleY, alphaSB, alphaDB)
		end
		if commandGetState(p1Cmd, 'holdd') then f_drawQuickSpr(TbuttonDown, posXdo, posYdo, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdl') then f_drawQuickSpr(TbuttonLeft, posXle, posYle, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdr') then f_drawQuickSpr(TbuttonRight, posXri, posYri, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holda') then f_drawQuickSpr(TbuttonA, posXa, posYa, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdb') then f_drawQuickSpr(TbuttonB, posXb, posYb, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdc') then f_drawQuickSpr(TbuttonC, posXc, posYc, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdx') then f_drawQuickSpr(TbuttonX, posXx, posYx, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdy') then f_drawQuickSpr(TbuttonY, posXy, posYy, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdz') then f_drawQuickSpr(TbuttonZ, posXz, posYz, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdq') then f_drawQuickSpr(TbuttonL, posXl, posYl, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holdw') then f_drawQuickSpr(TbuttonR, posXr, posYr, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p1Cmd, 'holds') then f_drawQuickSpr(TbuttonS, posXs, posYs, scaleX, scaleY, alphaSB, alphaDB) end
	--SHOW BUTTONS FOR PLAYER 2 CONTROL
		if commandGetState(p2Cmd, 'holdu') then f_drawQuickSpr(TbuttonUp, posXup+posXP2, posYup+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdd') then f_drawQuickSpr(TbuttonDown, posXdo+posXP2, posYdo+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdl') then f_drawQuickSpr(TbuttonLeft, posXle+posXP2, posYle+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdr') then f_drawQuickSpr(TbuttonRight, posXri+posXP2, posYri+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holda') then f_drawQuickSpr(TbuttonA, posXa+posXP2, posYa+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdb') then f_drawQuickSpr(TbuttonB, posXb+posXP2, posYb+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdc') then f_drawQuickSpr(TbuttonC, posXc+posXP2, posYc+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdx') then f_drawQuickSpr(TbuttonX, posXx+posXP2, posYx+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdy') then f_drawQuickSpr(TbuttonY, posXy+posXP2, posYy+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdz') then f_drawQuickSpr(TbuttonZ, posXz+posXP2, posYz+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdq') then f_drawQuickSpr(TbuttonL, posXl+posXP2, posYl+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holdw') then f_drawQuickSpr(TbuttonR, posXr+posXP2, posYr+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if commandGetState(p2Cmd, 'holds') then f_drawQuickSpr(TbuttonS, posXs+posXP2, posYs+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if cmdCode then f_cmdCode() end
		if data.debugMode then
			f_drawQuickText(txt_testW, font6, 0, 0, getInputKeyboard(), 160, 128) --Keyboard
			f_drawQuickText(txt_testW, font6, 0, 0, getInputID(data.p1Gamepad), 75, 79) --Gamepad P1
			f_drawQuickText(txt_testW, font6, 0, 0, getInputID(data.p2Gamepad), 75, 179) --Gamepad P2
		end
		drawTestCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; KEYBOARD MENU
--;===========================================================
txt_keyMenu = createTextImg(jgFnt, 0, 0, "KEYBOARD SETTINGS", 159, 13)

t_keyMenu = {
	{text = "Battle Controls"},
	{text = "Menu Controls"},
	{text = "          BACK"},
}
for i=1, #t_keyMenu do
	t_keyMenu[i]['id'] = ''
end

function f_keyMenu()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local keyMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			keyMenu = keyMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			keyMenu = keyMenu + 1
		end
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			if keyMenu == 1 or keyMenu == 2 then
				sndPlay(sndSys, 100, 1)
				controllerSet = 1 --Keyboard is the control to setup
				commandBufReset(p1Cmd)
				commandBufReset(p2Cmd)
			end
		--[KEYBOARD] BATTLE CONTROLS
			if keyMenu == 1 then
				if data.engineMode == "FG" then
					f_inputBattleRead(0, -1) --Player 1 Controls
					f_inputBattleRead(1, -1) --Player 2 Controls
					f_keyBattleCfg(0, -1)
				else
					sndPlay(sndIkemen, 200, 0)
				end
		--[KEYBOARD] MENU CONTROLS
			elseif keyMenu == 2 then
				f_inputMenuRead(0, -1)
				f_inputMenuRead(1, -1)
				f_keyMenuCfg(0, -1)
		--BACK
			else
				sndPlay(sndSys, 100, 2)
				break
			end
		end
		if keyMenu < 1 then
			keyMenu = #t_keyMenu
			if #t_keyMenu > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_keyMenu
			end
		elseif keyMenu > #t_keyMenu then
			keyMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (keyMenu - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (keyMenu - 1) * 15
		end	
		if #t_keyMenu <= maxItems then
			maxKeyMenu = #t_keyMenu
		elseif keyMenu - cursorPosY > 0 then
			maxKeyMenu = keyMenu + maxItems - cursorPosY
		else
			maxKeyMenu = maxItems
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxKeyMenu*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_keyMenu)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxKeyMenu do
			if i > keyMenu - cursorPosY then
				t_keyMenu[i].id = createTextImg(font2, 0, 1, t_keyMenu[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_keyMenu[i].id)
			end
		end
		if maxKeyMenu > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_keyMenu > maxItems and maxKeyMenu < #t_keyMenu then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; TEMP GAMEPAD WARNING
--;===========================================================
t_tempWarning = {
	{text = "Some of the connected Gamepads cannot be configured"},
	{text = "To make it work, will need to configure it manually"},
	{text = "in save/config.ssz file or use third-party software"},
	{text = ""},
}
for i=1, #t_tempWarning do
	t_tempWarning[i]['id'] = createTextImg(font2, 0, 1, t_tempWarning[i].text, 25, 65+i*15)
end

function f_tempWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			sndPlay(sndSys, 100, 1)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_Warning)
		animSetScale(infoBG, 300, 111)
		animSetWindow(infoBG, 0,70, 297,#t_tempWarning*15)
		animDraw(infoBG)
		for i=1, #t_tempWarning do
			textImgDraw(t_tempWarning[i].id)
		end
		animDraw(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; GAMEPAD MENU
--;===========================================================
txt_joyMenu = createTextImg(jgFnt, 0, 0, "GAMEPAD SETTINGS", 159, 13)

t_joyMenu = {
	{text = "Battle Controls"},
	{text = "Menu Controls"},
	{text = "          BACK"},
}
for i=1, #t_joyMenu do
	t_joyMenu[i]['id'] = ''
end

function f_joyMenu()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local joyMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			joyMenu = joyMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			joyMenu = joyMenu + 1
		end
		if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			if joyMenu == 1 or joyMenu == 2 then
				sndPlay(sndSys, 100, 1)
				controllerSet = 2 --Gamepad is the control to setup
				commandBufReset(p1Cmd)
				commandBufReset(p2Cmd)
			end
		--[GAMEPAD] BATTLE CONTROLS
			if joyMenu == 1 then
				if data.engineMode == "FG" then
					f_inputBattleRead(2, data.p1Gamepad)
					f_inputBattleRead(3, data.p2Gamepad)
					f_keyBattleCfg(2, data.p1Gamepad)
					--f_keyBattleCfg(3, data.p2Gamepad)
				else
					sndPlay(sndIkemen, 200, 0)
				end
		--[GAMEPAD] MENU CONTROLS
			elseif joyMenu == 2 then
				f_inputMenuRead(2, data.p1Gamepad)
				f_inputMenuRead(3, data.p2Gamepad)
				f_keyMenuCfg(2, data.p1Gamepad)
				--f_keyMenuCfg(3, data.p2Gamepad)
		--BACK
			else
				sndPlay(sndSys, 100, 2)
				break
			end
		end
		if joyMenu < 1 then
			joyMenu = #t_joyMenu
			if #t_joyMenu > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_joyMenu
			end
		elseif joyMenu > #t_joyMenu then
			joyMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (joyMenu - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (joyMenu - 1) * 15
		end	
		if #t_joyMenu <= maxItems then
			maxJoyMenu = #t_joyMenu
		elseif joyMenu - cursorPosY > 0 then
			maxJoyMenu = joyMenu + maxItems - cursorPosY
		else
			maxJoyMenu = maxItems
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxJoyMenu*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_joyMenu)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxJoyMenu do
			if i > joyMenu - cursorPosY then
				t_joyMenu[i].id = createTextImg(font2, 0, 1, t_joyMenu[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_joyMenu[i].id)
			end
		end
		if maxJoyMenu > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_joyMenu > maxItems and maxJoyMenu < #t_joyMenu then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
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
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; KEYBOARD/GAMEPAD BUTTONS
--;===========================================================
txt_battleCfg = createTextImg(jgFnt, 0, 0, "BUTTON MAPPING [BATTLE]", 159, 13)
txt_menuKeyCfg = createTextImg(jgFnt, 0, 0, "BUTTON MAPPING [MENUS]", 159, 13)

txt_p1inputInfo = createTextImg(font2, 0, 0, "PLAYER 1", 81.5, 30)
txt_p2inputInfo = createTextImg(font2, 0, 0, "PLAYER 2", 240, 30)
txt_inputHint = createTextImg(jgFnt, 0, 0, "", 0, 0, 0.7, 0.7)
txt_newKey = "PRESS KEY TO ASSIGN ENTRY..."
txt_sameKey = "THIS KEY HAS BEEN ALREADY ASSIGNED"
txt_cancelKey = "PRESS ESC KEY TO CANCEL"

--Player 1 Controls Spr
function drawP1CfgInputs(mode)
	local mode = mode or nil
	local inputHintXPos = 50
	if mode == "battle" then
		drawBattleInputHintsP1("u",inputHintXPos..",30")
	else
		drawMenuInputHintsP1("u",inputHintXPos..",30")
	end
end

--Player 2 Controls Spr
function drawP2CfgInputs(mode)
	local mode = mode or nil
	local inputHintXPos = 290
	if mode == "battle" then
		drawBattleInputHintsP2("u",inputHintXPos..",30")
	else
		drawMenuInputHintsP2("u",inputHintXPos..",30")
	end
end

--General Input Hints Panel
function drawBtnCfgInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","80,"..inputHintYPos,"r","100,"..inputHintYPos,"s","160,"..inputHintYPos,"e","225,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Unbind", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 181, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Save and Back", 246, hintFontYPos)
end

function f_drawBattleKeyAssets()
	animDraw(f_animVelocity(optionsBG0, -1, -1)) --BG
	textImgDraw(txt_battleCfg) --Title Text
--Player 1 Controls Window BG
	animSetScale(optionsBG2, 220, 15+maxKeyCfg*15)
	animSetWindow(optionsBG2, 2,20, 155,165)
	animDraw(optionsBG2)
	textImgDraw(txt_p1inputInfo) --Player Title Text
--Player 1 Controls Cursor
	if not p2waitingKey then
		animSetWindow(cursorBox, 2,20+inputCursorPosY*15, 155,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end
--Draw Player 1 Controls Text
	for i=1, maxKeyCfg do
		if i > keyCfg - inputCursorPosY then
			if t_keyBattleCfg[i].varID ~= nil then
				local varText = ""
				if controllerSet == 1 then --Show Keyboard Inputs
					varText = t_keyBattleCfg[i].keyboard
				elseif controllerSet == 2 then --Show Gamepad Inputs
					varText = t_keyBattleCfg[i].gamepad
				end
				textImgDraw(f_updateTextImg(t_keyBattleCfg[i].varID, font2, 0, 1, t_keyBattleCfg[i].text, 7, 30+i*15-inputMoveTxt))
				textImgDraw(f_updateTextImg(t_keyBattleCfg[i].varID, font2, 0, -1, varText, 152, 30+i*15-inputMoveTxt))
			end
		end
	end
--Draw Player 1 Arrows
	if maxKeyCfg > 10 then
		animDraw(optionsUpArrowP1)
		animUpdate(optionsUpArrowP1)
	end
	if #t_keyBattleCfg > 10 and maxKeyCfg < #t_keyBattleCfg then
		animDraw(optionsDownArrowP1)
		animUpdate(optionsDownArrowP1)
	end
--Player 2 Controls Window BG
	animSetScale(optionsBG2, 318, 15+maxKeyCfg2*15)
	animSetWindow(optionsBG2, 163,20, 155,165)
	animDraw(optionsBG2)
	textImgDraw(txt_p2inputInfo)
--Player 2 Controls Cursor
	if not p1waitingKey then
		animSetWindow(cursorBox, 163,20+inputCursorPosY2*15, 155,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end
--Draw Player 2 Controls Text
	for i=1, maxKeyCfg2 do
		if i > keyCfg2 - inputCursorPosY2 then
			if t_keyBattleCfg2[i].varID ~= nil then
				local varText = ""
				if controllerSet == 1 then --Show Keyboard Inputs
					varText = t_keyBattleCfg2[i].keyboard
				elseif controllerSet == 2 then --Show Gamepad Inputs
					varText = t_keyBattleCfg2[i].gamepad
				end
				textImgDraw(f_updateTextImg(t_keyBattleCfg2[i].varID, font2, 0, 1, t_keyBattleCfg2[i].text, 167, 30+i*15-inputMoveTxt2))
				textImgDraw(f_updateTextImg(t_keyBattleCfg2[i].varID, font2, 0, -1, varText, 314, 30+i*15-inputMoveTxt2))
			end
		end
	end
--Draw Player 2 Arrows
	if maxKeyCfg2 > 10 then
		animDraw(optionsUpArrowP2)
		animUpdate(optionsUpArrowP2)
	end
	if #t_keyBattleCfg2 > 10 and maxKeyCfg2 < #t_keyBattleCfg2 then
		animDraw(optionsDownArrowP2)
		animUpdate(optionsDownArrowP2)
	end
	drawBtnCfgInputHints()
	drawP1CfgInputs("battle")
	drawP2CfgInputs("battle")
	if data.debugMode then
		f_drawQuickText(txt_testDpad, font6, 0, 0, getInputID(data.p1Gamepad), 120, 30) --Gamepad Repose Test
		f_drawQuickText(txt_testDpad, font6, 0, 0, getInputID(data.p2Gamepad), 295, 30)
	end
end

controllerNum = -1

function f_keyBattleCfg(playerNo, controller)
	cmdInput()
	local bufu = 0
	local bufu2 = 0
	local bufd = 0
	local bufd2 = 0
	local bufr = 0
	local bufr2 = 0
	local bufl = 0
	local bufl2 = 0
	local configEnd = false
	local defaultP1 = false
	local defaultP2 = false
	local cursorLimit = 10
	inputCursorPosY = 1
	inputCursorPosY2 = 1
	inputMoveTxt = 0
	inputMoveTxt2 = 0
	keyCfg = 1
	keyCfg2 = 1
	controllerNum = controller
	p1waitingKey = false
	p2waitingKey = false
	while true do
	--Common Actions
		if esc() or configEnd then
			sndPlay(sndSys, 100, 2)
			f_keyBattleSave(playerNo, controller) --Save Player 1 Controls
			f_keyBattleSave(playerNo+1, controller) --Save Player 2 Controls
			f_exportDebugInputs()
			break
		elseif f1Key() or defaultP1 then --Quick Default Player 1 Inputs Shorcut
			sndPlay(sndSys, 100, 2)
			if controllerSet == 1 then f_p1keyboardBattleDefault()
			elseif controllerSet == 2 then f_p1gamepadBattleDefault()
			end
			defaultP1 = false
		elseif f2Key() or defaultP2 then --Quick Default Player 2 Inputs Shorcut
			sndPlay(sndSys, 100, 2)
			if controllerSet == 1 then f_p2keyboardBattleDefault()
			elseif controllerSet == 2 then f_p2gamepadBattleDefault()
			end
			defaultP2 = false
		end
	--[[Backup Reset
		if controllerSet == 1 and playerNo == 0 then f_p1keyboardBattleDefault()
		elseif controllerSet == 1 and playerNo == 1 then f_p2keyboardBattleDefault()
		elseif controllerSet == 2 and playerNo == 2 then f_p1gamepadBattleDefault()
		elseif controllerSet == 2 and playerNo == 3 then f_p2gamepadBattleDefault()
	]]
	--Player 1 Actions
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg = keyCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg = keyCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
	--Confirm Button
		elseif btnPalNo(p1Cmd, true) > 0 then
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		--Modify Battle Controls
			if keyCfg < #t_keyBattleCfg-1 then
				sndPlay(sndSys, 100, 1)
				p1waitingKey = true
				if controller == -1 then
					controllerNum = 0
				else
					controllerNum = 10
				end
			--SetUp Keyboard Inputs
				if controllerSet == 1 then
					t_keyBattleCfg[keyCfg].keyboard = f_readBattleInput(t_keyBattleCfg[keyCfg].keyboard) --Get New Controls
					setInputConfig(playerNo, controller, t_keyBattleCfg[1].keyboard, t_keyBattleCfg[2].keyboard, t_keyBattleCfg[3].keyboard, t_keyBattleCfg[4].keyboard, t_keyBattleCfg[5].keyboard, t_keyBattleCfg[6].keyboard, t_keyBattleCfg[7].keyboard, t_keyBattleCfg[8].keyboard, t_keyBattleCfg[9].keyboard, t_keyBattleCfg[10].keyboard, t_keyBattleCfg[11].keyboard, t_keyBattleCfg[12].keyboard, t_keyBattleCfg[13].keyboard, t_keyBattleCfg[14].keyboard) --Apply and Load New Controls
			--SetUp Gamepad Inputs
				elseif controllerSet == 2 then
					t_keyBattleCfg[keyCfg].gamepad = f_readBattleInput(t_keyBattleCfg[keyCfg].gamepad)
					setInputConfig(playerNo, controller, t_keyBattleCfg[1].gamepad, t_keyBattleCfg[2].gamepad, t_keyBattleCfg[3].gamepad, t_keyBattleCfg[4].gamepad, t_keyBattleCfg[5].gamepad, t_keyBattleCfg[6].gamepad, t_keyBattleCfg[7].gamepad, t_keyBattleCfg[8].gamepad, t_keyBattleCfg[9].gamepad, t_keyBattleCfg[10].gamepad, t_keyBattleCfg[11].gamepad, t_keyBattleCfg[12].gamepad, t_keyBattleCfg[13].gamepad, t_keyBattleCfg[14].gamepad)
				end
		--Default Config
			elseif keyCfg == 15 then
				defaultP1 = true
		--End Config
			else
				configEnd = true
			end
			modified = 1
	--Back Button
		elseif commandGetState(p1Cmd, 'e') then
			configEnd = true
			modified = 1
		end
	--Player 1 Scroll Logic
		if keyCfg < 1 then
			keyCfg = #t_keyBattleCfg
			if #t_keyBattleCfg > cursorLimit then
				inputCursorPosY = cursorLimit
			else
				inputCursorPosY = #t_keyBattleCfg
			end
		elseif keyCfg > #t_keyBattleCfg then
			keyCfg = 1
			inputCursorPosY = 1
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and inputCursorPosY > 1 then
			inputCursorPosY = inputCursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and inputCursorPosY < cursorLimit then
			inputCursorPosY = inputCursorPosY + 1
		end
		if inputCursorPosY == cursorLimit then
			inputMoveTxt = (keyCfg - cursorLimit) * 15
		elseif inputCursorPosY == 1 then
			inputMoveTxt = (keyCfg - 1) * 15
		end
		if #t_keyBattleCfg <= cursorLimit then
			maxKeyCfg = #t_keyBattleCfg
		elseif keyCfg - inputCursorPosY > 0 then
			maxKeyCfg = keyCfg + cursorLimit - inputCursorPosY
		else
			maxKeyCfg = cursorLimit
		end
	--Player 2 Actions
		if commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufu2 >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg2 = keyCfg2 - 1
			if bufl2 then bufl2 = 0 end
			if bufr2 then bufr2 = 0 end
		elseif commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufd2 >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg2 = keyCfg2 + 1
			if bufl2 then bufl2 = 0 end
			if bufr2 then bufr2 = 0 end
	--Confirm Button
		elseif btnPalNo(p2Cmd, true) > 0 then
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		--Modify Battle Controls
			if keyCfg2 < #t_keyBattleCfg2-1 then
				sndPlay(sndSys, 100, 1)
				p2waitingKey = true
				if controller == -1 then
					controllerNum = 0
				else
					controllerNum = 10
				end
			--SetUp Keyboard Inputs
				if controllerSet == 1 then
					t_keyBattleCfg2[keyCfg2].keyboard = f_readBattleInput(t_keyBattleCfg2[keyCfg2].keyboard)
					setInputConfig(playerNo+1, controller, t_keyBattleCfg2[1].keyboard, t_keyBattleCfg2[2].keyboard, t_keyBattleCfg2[3].keyboard, t_keyBattleCfg2[4].keyboard, t_keyBattleCfg2[5].keyboard, t_keyBattleCfg2[6].keyboard, t_keyBattleCfg2[7].keyboard, t_keyBattleCfg2[8].keyboard, t_keyBattleCfg2[9].keyboard, t_keyBattleCfg2[10].keyboard, t_keyBattleCfg2[11].keyboard, t_keyBattleCfg2[12].keyboard, t_keyBattleCfg2[13].keyboard, t_keyBattleCfg2[14].keyboard)
			--SetUp Gamepad Inputs
				elseif controllerSet == 2 then
					t_keyBattleCfg2[keyCfg2].gamepad = f_readBattleInput(t_keyBattleCfg2[keyCfg2].gamepad)
					setInputConfig(playerNo+1, controller, t_keyBattleCfg2[1].gamepad, t_keyBattleCfg2[2].gamepad, t_keyBattleCfg2[3].gamepad, t_keyBattleCfg2[4].gamepad, t_keyBattleCfg2[5].gamepad, t_keyBattleCfg2[6].gamepad, t_keyBattleCfg2[7].gamepad, t_keyBattleCfg2[8].gamepad, t_keyBattleCfg2[9].gamepad, t_keyBattleCfg2[10].gamepad, t_keyBattleCfg2[11].gamepad, t_keyBattleCfg2[12].gamepad, t_keyBattleCfg2[13].gamepad, t_keyBattleCfg2[14].gamepad)
				end
		--Default Config
			elseif keyCfg2 == 15 then
				defaultP2 = true
		--End Config
			else
				configEnd = true
			end
			modified = 1
	--Back Button
		elseif commandGetState(p2Cmd, 'e') then
			configEnd = true
			modified = 1
		end
	--Player 2 Scroll Logic
		if keyCfg2 < 1 then
			keyCfg2 = #t_keyBattleCfg2
			if #t_keyBattleCfg2 > cursorLimit then
				inputCursorPosY2 = cursorLimit
			else
				inputCursorPosY2 = #t_keyBattleCfg2
			end
		elseif keyCfg2 > #t_keyBattleCfg2 then
			keyCfg2 = 1
			inputCursorPosY2 = 1
		elseif (commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufu2 >= 30)) and inputCursorPosY2 > 1 then
			inputCursorPosY2 = inputCursorPosY2 - 1
		elseif (commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufd2 >= 30)) and inputCursorPosY2 < cursorLimit then
			inputCursorPosY2 = inputCursorPosY2 + 1
		end
		if inputCursorPosY2 == cursorLimit then
			inputMoveTxt2 = (keyCfg2 - cursorLimit) * 15
		elseif inputCursorPosY2 == 1 then
			inputMoveTxt2 = (keyCfg2 - 1) * 15
		end
		if #t_keyBattleCfg2 <= cursorLimit then
			maxKeyCfg2 = #t_keyBattleCfg2
		elseif keyCfg2 - inputCursorPosY2 > 0 then
			maxKeyCfg2 = keyCfg2 + cursorLimit - inputCursorPosY2
		else
			maxKeyCfg2 = cursorLimit
		end
	--Draw Common Assets
		f_drawBattleKeyAssets()
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		elseif commandGetState(p2Cmd, 'holdu') then
			bufd2 = 0
			bufu2 = bufu2 + 1
		elseif commandGetState(p2Cmd, 'holdd') then
			bufu2 = 0
			bufd2 = bufd2 + 1
		else
			bufu = 0
			bufd = 0
			bufu2 = 0
			bufd2 = 0
		end
		cmdInput()
		refresh()
	end
end

function f_drawMenuKeyAssets()
	animDraw(f_animVelocity(optionsBG0, -1, -1)) --BG
	textImgDraw(txt_menuKeyCfg) --Title Text
--Player 1 Controls Window BG
	animSetScale(optionsBG2, 220, 15+maxKeyCfg*15)
	animSetWindow(optionsBG2, 2,20, 155,165)
	animDraw(optionsBG2)
	textImgDraw(txt_p1inputInfo) --Player Title Text
--Player 1 Controls Cursor
	if not p2waitingKey then
		animSetWindow(cursorBox, 2,20+inputCursorPosY*15, 155,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end
--Draw Player 1 Controls Text
	for i=1, maxKeyCfg do
		if i > keyCfg - inputCursorPosY then
			if t_keyMenuCfg[i].varID ~= nil then
				local varText = ""
				if controllerSet == 1 then --Show Keyboard Inputs
					varText = t_keyMenuCfg[i].keyboard
				elseif controllerSet == 2 then --Show Gamepad Inputs
					varText = t_keyMenuCfg[i].gamepad
				end
				textImgDraw(f_updateTextImg(t_keyMenuCfg[i].varID, font2, 0, 1, t_keyMenuCfg[i].text, 7, 30+i*15-inputMoveTxt))
				textImgDraw(f_updateTextImg(t_keyMenuCfg[i].varID, font2, 0, -1, varText, 152, 30+i*15-inputMoveTxt))
			end
		end
	end
--Draw Player 1 Arrows
	if maxKeyCfg > 10 then
		animDraw(optionsUpArrowP1)
		animUpdate(optionsUpArrowP1)
	end
	if #t_keyMenuCfg > 10 and maxKeyCfg < #t_keyMenuCfg then
		animDraw(optionsDownArrowP1)
		animUpdate(optionsDownArrowP1)
	end
--Player 2 Controls Window BG
	animSetScale(optionsBG2, 318, 15+maxKeyCfg2*15)
	animSetWindow(optionsBG2, 163,20, 155,165)
	animDraw(optionsBG2)
	textImgDraw(txt_p2inputInfo)
--Player 2 Controls Cursor
	if not p1waitingKey then
		animSetWindow(cursorBox, 163,20+inputCursorPosY2*15, 155,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end
--Draw Player 2 Controls Text
	for i=1, maxKeyCfg2 do
		if i > keyCfg2 - inputCursorPosY2 then
			if t_keyMenuCfg2[i].varID ~= nil then
				local varText = ""
				if controllerSet == 1 then --Show Keyboard Inputs
					varText = t_keyMenuCfg2[i].keyboard
				elseif controllerSet == 2 then --Show Gamepad Inputs
					varText = t_keyMenuCfg2[i].gamepad
				end
				textImgDraw(f_updateTextImg(t_keyMenuCfg2[i].varID, font2, 0, 1, t_keyMenuCfg2[i].text, 167, 30+i*15-inputMoveTxt2))
				textImgDraw(f_updateTextImg(t_keyMenuCfg2[i].varID, font2, 0, -1, varText, 314, 30+i*15-inputMoveTxt2))
			end
		end
	end
--Draw Player 2 Arrows
	if maxKeyCfg2 > 10 then
		animDraw(optionsUpArrowP2)
		animUpdate(optionsUpArrowP2)
	end
	if #t_keyMenuCfg2 > 10 and maxKeyCfg2 < #t_keyMenuCfg2 then
		animDraw(optionsDownArrowP2)
		animUpdate(optionsDownArrowP2)
	end
	drawBtnCfgInputHints()
	drawP1CfgInputs("menu")
	drawP2CfgInputs("menu")
	if data.debugMode then
		f_drawQuickText(txt_testDpad, font6, 0, 0, getInputID(data.p1Gamepad), 120, 30) --Gamepad Repose Test
		f_drawQuickText(txt_testDpad, font6, 0, 0, getInputID(data.p2Gamepad), 295, 30)
	end
end

function f_keyMenuCfg(playerNo, controller)
	cmdInput()
	local bufu = 0
	local bufu2 = 0
	local bufd = 0
	local bufd2 = 0
	local bufr = 0
	local bufr2 = 0
	local bufl = 0
	local bufl2 = 0
	local configEnd = false
	local defaultP1 = false
	local defaultP2 = false
	local cursorLimit = 10
	inputCursorPosY = 1
	inputCursorPosY2 = 1
	inputMoveTxt = 0
	inputMoveTxt2 = 0
	keyCfg = 1
	keyCfg2 = 1
	controllerNum = controller
	p1waitingKey = false
	p2waitingKey = false
	while true do
	--Common Actions
		if esc() or configEnd then
			sndPlay(sndSys, 100, 2)
			f_keyMenuSave(playerNo, controller == -1 and controller or data.p1Gamepad) --Save Player 1 Controls
			f_keyMenuSave(playerNo+1, controller == -1 and controller or data.p2Gamepad) --Save Player 2 Controls
			f_exportDebugInputs()
			break
		elseif f1Key() or defaultP1 then --Quick Default Player 1 Inputs Shorcut
			sndPlay(sndSys, 100, 2)
			if controllerSet == 1 then f_p1keyboardMenuDefault()
			elseif controllerSet == 2 then f_p1gamepadMenuDefault()
			end
			defaultP1 = false
		elseif f2Key() or defaultP2 then --Quick Default Player 2 Inputs Shorcut
			sndPlay(sndSys, 100, 2)
			if controllerSet == 1 then f_p2keyboardMenuDefault()
			elseif controllerSet == 2 then f_p2gamepadMenuDefault()
			end
			defaultP2 = false
		end
	--Player 1 Actions
		if commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg = keyCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg = keyCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
	--Confirm Button
		elseif btnPalNo(p1Cmd, true) > 0 then
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		--Modify Menu Controls
			if keyCfg < #t_keyMenuCfg-1 then
				sndPlay(sndSys, 100, 1)
				p1waitingKey = true
				if controller == -1 then
					controllerNum = 0
				else
					controllerNum = 10
				end
			--SetUp Keyboard Inputs
				if controllerSet == 1 then
					t_keyMenuCfg[keyCfg].keyboard = f_readMenuInput(t_keyMenuCfg[keyCfg].keyboard)
					setInputConfig(playerNo+10, controller, t_keyMenuCfg[1].keyboard, t_keyMenuCfg[2].keyboard, t_keyMenuCfg[3].keyboard, t_keyMenuCfg[4].keyboard, t_keyMenuCfg[5].keyboard, t_keyMenuCfg[6].keyboard, t_keyMenuCfg[7].keyboard, t_keyMenuCfg[8].keyboard, t_keyMenuCfg[9].keyboard, t_keyMenuCfg[10].keyboard, t_keyMenuCfg[11].keyboard, t_keyMenuCfg[12].keyboard, t_keyMenuCfg[13].keyboard, t_keyMenuCfg[14].keyboard)
			--SetUp Gamepad Inputs
				elseif controllerSet == 2 then
					t_keyMenuCfg[keyCfg].gamepad = f_readMenuInput(t_keyMenuCfg[keyCfg].gamepad)
					setInputConfig(playerNo+10, controller, t_keyMenuCfg[1].gamepad, t_keyMenuCfg[2].gamepad, t_keyMenuCfg[3].gamepad, t_keyMenuCfg[4].gamepad, t_keyMenuCfg[5].gamepad, t_keyMenuCfg[6].gamepad, t_keyMenuCfg[7].gamepad, t_keyMenuCfg[8].gamepad, t_keyMenuCfg[9].gamepad, t_keyMenuCfg[10].gamepad, t_keyMenuCfg[11].gamepad, t_keyMenuCfg[12].gamepad, t_keyMenuCfg[13].gamepad, t_keyMenuCfg[14].gamepad)
				end
		--Default Config
			elseif keyCfg == 15 then
				defaultP1 = true
		--End Config
			else
				configEnd = true
			end
			modified = 1
	--Back Button
		elseif commandGetState(p1Cmd, 'e') then
			configEnd = true
			modified = 1
		end
	--Player 1 Scroll Logic
		if keyCfg < 1 then
			keyCfg = #t_keyMenuCfg
			if #t_keyMenuCfg > cursorLimit then
				inputCursorPosY = cursorLimit
			else
				inputCursorPosY = #t_keyMenuCfg
			end
		elseif keyCfg > #t_keyMenuCfg then
			keyCfg = 1
			inputCursorPosY = 1
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and inputCursorPosY > 1 then
			inputCursorPosY = inputCursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and inputCursorPosY < cursorLimit then
			inputCursorPosY = inputCursorPosY + 1
		end
		if inputCursorPosY == cursorLimit then
			inputMoveTxt = (keyCfg - cursorLimit) * 15
		elseif inputCursorPosY == 1 then
			inputMoveTxt = (keyCfg - 1) * 15
		end
		if #t_keyMenuCfg <= cursorLimit then
			maxKeyCfg = #t_keyMenuCfg
		elseif keyCfg - inputCursorPosY > 0 then
			maxKeyCfg = keyCfg + cursorLimit - inputCursorPosY
		else
			maxKeyCfg = cursorLimit
		end
	--Player 2 Actions
		if commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufu2 >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg2 = keyCfg2 - 1
			if bufl2 then bufl2 = 0 end
			if bufr2 then bufr2 = 0 end
		elseif commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufd2 >= 30) then
			sndPlay(sndSys, 100, 0)
			keyCfg2 = keyCfg2 + 1
			if bufl2 then bufl2 = 0 end
			if bufr2 then bufr2 = 0 end
	--Confirm Button
		elseif btnPalNo(p2Cmd, true) > 0 then
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		--Modify Menu Controls
			if keyCfg2 < #t_keyMenuCfg2-1 then
				sndPlay(sndSys, 100, 1)
				p2waitingKey = true
				if controller == -1 then
					controllerNum = 0
				else
					controllerNum = 10
				end
			--SetUp Keyboard Inputs
				if controllerSet == 1 then
					t_keyMenuCfg2[keyCfg2].keyboard = f_readMenuInput(t_keyMenuCfg2[keyCfg2].keyboard)
					setInputConfig(playerNo+11, controller, t_keyMenuCfg2[1].keyboard, t_keyMenuCfg2[2].keyboard, t_keyMenuCfg2[3].keyboard, t_keyMenuCfg2[4].keyboard, t_keyMenuCfg2[5].keyboard, t_keyMenuCfg2[6].keyboard, t_keyMenuCfg2[7].keyboard, t_keyMenuCfg2[8].keyboard, t_keyMenuCfg2[9].keyboard, t_keyMenuCfg2[10].keyboard, t_keyMenuCfg2[11].keyboard, t_keyMenuCfg2[12].keyboard, t_keyMenuCfg2[13].keyboard, t_keyMenuCfg2[14].keyboard)
			--SetUp Gamepad Inputs
				elseif controllerSet == 2 then
					t_keyMenuCfg2[keyCfg2].gamepad = f_readMenuInput(t_keyMenuCfg2[keyCfg2].gamepad)
					setInputConfig(playerNo+11, controller, t_keyMenuCfg2[1].gamepad, t_keyMenuCfg2[2].gamepad, t_keyMenuCfg2[3].gamepad, t_keyMenuCfg2[4].gamepad, t_keyMenuCfg2[5].gamepad, t_keyMenuCfg2[6].gamepad, t_keyMenuCfg2[7].gamepad, t_keyMenuCfg2[8].gamepad, t_keyMenuCfg2[9].gamepad, t_keyMenuCfg2[10].gamepad, t_keyMenuCfg2[11].gamepad, t_keyMenuCfg2[12].gamepad, t_keyMenuCfg2[13].gamepad, t_keyMenuCfg2[14].gamepad)
				end
		--Default Config
			elseif keyCfg2 == 15 then
				defaultP2 = true
		--End Config
			else
				configEnd = true
			end
			modified = 1
	--Back Button
		elseif commandGetState(p2Cmd, 'e') then
			configEnd = true
			modified = 1
		end
	--Player 2 Scroll Logic
		if keyCfg2 < 1 then
			keyCfg2 = #t_keyMenuCfg2
			if #t_keyMenuCfg2 > cursorLimit then
				inputCursorPosY2 = cursorLimit
			else
				inputCursorPosY2 = #t_keyMenuCfg2
			end
		elseif keyCfg2 > #t_keyMenuCfg2 then
			keyCfg2 = 1
			inputCursorPosY2 = 1
		elseif (commandGetState(p2Cmd, 'u') or (commandGetState(p2Cmd, 'holdu') and bufu2 >= 30)) and inputCursorPosY2 > 1 then
			inputCursorPosY2 = inputCursorPosY2 - 1
		elseif (commandGetState(p2Cmd, 'd') or (commandGetState(p2Cmd, 'holdd') and bufd2 >= 30)) and inputCursorPosY2 < cursorLimit then
			inputCursorPosY2 = inputCursorPosY2 + 1
		end
		if inputCursorPosY2 == cursorLimit then
			inputMoveTxt2 = (keyCfg2 - cursorLimit) * 15
		elseif inputCursorPosY2 == 1 then
			inputMoveTxt2 = (keyCfg2 - 1) * 15
		end
		if #t_keyMenuCfg2 <= cursorLimit then
			maxKeyCfg2 = #t_keyMenuCfg2
		elseif keyCfg2 - inputCursorPosY2 > 0 then
			maxKeyCfg2 = keyCfg2 + cursorLimit - inputCursorPosY2
		else
			maxKeyCfg2 = cursorLimit
		end
	--Draw Common Assets
		f_drawMenuKeyAssets()
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		elseif commandGetState(p2Cmd, 'holdu') then
			bufd2 = 0
			bufu2 = bufu2 + 1
		elseif commandGetState(p2Cmd, 'holdd') then
			bufu2 = 0
			bufd2 = bufd2 + 1
		else
			bufu = 0
			bufd = 0
			bufu2 = 0
			bufd2 = 0
		end
		cmdInput()
		refresh()
	end
end

function f_inputBattleRead(playerNo, controller)
	local tmp = nil
	tmp = s_configSSZ:match('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);')
--Keyboard Read
	if tmp ~= nil and tmp ~= '' then
		tmp = tmp:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
		tmp = tmp:gsub('%(int%)k_t::([^,%s]*)%s*(,)\n*%s*', '%1%2')
		tmp = tmp:gsub('%(int%)k_t::([^%)%s]*)%s*%);', '%1')
--Gamepad Read
	else
		tmp = s_configSSZ:match('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);')
		tmp = tmp:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
		tmp = tmp:gsub('([^,%s]*)%s*(,)\n*%s*', '%1%2')
		tmp = tmp:gsub('([^%)%s]*)%s*%);', '%1')
	end
	for i, c
		in ipairs(strsplit(',', tmp)) --split string using "," delimiter
	do
		if controller == -1 then --Load Keyboard Controls
			if playerNo == 0 then
				t_keyBattleCfg[i].keyboard = c
			else
				t_keyBattleCfg2[i].keyboard = c
			end
		else --Load Gamepad Controls
			if playerNo == 2 then
				t_keyBattleCfg[i].gamepad = c
			else
				t_keyBattleCfg2[i].gamepad = c
			end
		end
	end
end

function f_inputMenuRead(playerNo, controller)
	local tmp = nil
	tmp = s_configSSZ:match('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);')
--Keyboard Read
	if tmp ~= nil and tmp ~= '' then
		tmp = tmp:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
		tmp = tmp:gsub('%(int%)k_t::([^,%s]*)%s*(,)\n*%s*', '%1%2')
		tmp = tmp:gsub('%(int%)k_t::([^%)%s]*)%s*%);', '%1')
--Gamepad Read
	else
		tmp = s_configSSZ:match('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);')
		tmp = tmp:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
		tmp = tmp:gsub('([^,%s]*)%s*(,)\n*%s*', '%1%2')
		tmp = tmp:gsub('([^%)%s]*)%s*%);', '%1')
	end
	for i, c
		in ipairs(strsplit(',', tmp))
	do
		if controller == -1 then --Load Keyboard Controls
			if playerNo == 0 then
				t_keyMenuCfg[i].keyboard = c
			else
				t_keyMenuCfg2[i].keyboard = c
			end
		else --Load Gamepad Controls
			if playerNo == 2 then
				t_keyMenuCfg[i].gamepad = c
			else
				t_keyMenuCfg2[i].gamepad = c
			end
		end
	end
end

function f_validKey()
	commandBufReset(p1Cmd)
	commandBufReset(p2Cmd)
	sndPlay(sndSys, 100, 1)
	--inputReset(controllerNum == -1 and controllerNum or gamepadData)
	p1waitingKey = false
	p2waitingKey = false
	sameKey = false
end

function f_invalidKey()
	sndPlay(sndIkemen, 200, 0)
	getKeyboard = ''
	sameKey = true
end

function f_readBattleInput(oldkey)
	local readInput = 1
	local t = 0
	local sameKeyTime = 0
	readTime = 0
	inputReady = false
	sameKey = false
	getKeyboard = ''
	gamepadData = nil
	if p1waitingKey then gamepadData = data.p1Gamepad
	elseif p2waitingKey then gamepadData = data.p2Gamepad
	end
	while true do
		f_drawBattleKeyAssets()
		readTime = readTime + 1
		if getKeyboard == '' then
		--Time to show Hints
			if t < 120 then
				if not sameKey then
					textImgSetBank(txt_inputHint, 2)
					textImgSetText(txt_inputHint, txt_newKey)
				end
			else
				if t < 240 then
					if not sameKey then
						textImgSetBank(txt_inputHint, 2)
						textImgSetText(txt_inputHint, txt_cancelKey)
					end
				else
					t = 0
				end
			end
		--Time to show Same Key Message
			if sameKey then
				if sameKeyTime < 100 then
					textImgSetBank(txt_inputHint, 1)
					textImgSetText(txt_inputHint, txt_sameKey)
				else
					sameKey = false
					sameKeyTime = 0
				end
				sameKeyTime = sameKeyTime + 1
			end
			if p1waitingKey then
				textImgSetAlign(txt_inputHint, 1)
				textImgPosDraw(txt_inputHint, 5, 208) --Draw Hints for Left Side
			elseif p2waitingKey then
				textImgSetAlign(txt_inputHint, -1)
				textImgPosDraw(txt_inputHint, 315, 208) --Draw Hints for Right Side
			end
			t = t + 1
		end
	--Waiting Key Press
		if readTime > 10 then
			if esc() then getKeyboard = oldkey --No Replace
		--KEYBOARD
			elseif controllerSet == 1 and getInputKeyboard() ~= 0 then --Exluding 0 which is the Keyboard iddle state
				getKeyboard = tostring(getInputKeyboard()) --Get Keyboard Key ID
				getKeyboard = f_inputConvert(getKeyboard, "text") --Convert ID to Display Text
		--GAMEPAD
			elseif controllerSet == 2 and getInputID(gamepadData) ~= 101 then --Exluding 101 which is the Gamepad iddle state
				getKeyboard = getInputID(gamepadData) --Get Gamepad Button ID
			end
		--When you press a key to assign
			if getKeyboard ~= '' then
			--Prevent assign same keys between player 1 and player 2 battle controls (with this logic both players can have same keys in his own controls)
				if p1waitingKey then
					local t_sameKeys = {}
					for i=1, #t_keyBattleCfg2 do
					--Send keys that are equal to a new table
						if controllerSet == 1 then
							if getKeyboard == t_keyBattleCfg2[i].keyboard then
								table.insert(t_sameKeys, 1, {keyboard = t_keyBattleCfg2[i].keyboard, tablepos=i})
							end
						elseif controllerSet == 2 then
							if getKeyboard == t_keyBattleCfg2[i].gamepad then
								table.insert(t_sameKeys, 1, {gamepad = t_keyBattleCfg2[i].gamepad, tablepos=i})
							end
						end
					end
					if data.debugMode then f_printTable(t_sameKeys, "save/debug/t_sameKeys.log") end
				--Assign Key
					if #t_sameKeys == 0 or controllerSet == 2 then --Allow same P2 key FOR GAMEPAD control, because it will not affect the control
						f_validKey()
						break
						cmdInput()
				--Key has been already assigned in Player 2 Controls
					else
						--TODO: Swap same Key with New One
						f_invalidKey()
					end
				elseif p2waitingKey then
					local t_sameKeys = {}
					for i=1, #t_keyBattleCfg do
					--Send keys that are equal to a new table
						if controllerSet == 1 then
							if getKeyboard == t_keyBattleCfg[i].keyboard then
								table.insert(t_sameKeys, 1, {keyboard = t_keyBattleCfg[i].keyboard, tablepos=i})
							end
						elseif controllerSet == 2 then
							if getKeyboard == t_keyBattleCfg[i].gamepad then
								table.insert(t_sameKeys, 1, {gamepad = t_keyBattleCfg[i].gamepad, tablepos=i})
							end
						end
					end
					if data.debugMode then f_printTable(t_sameKeys, "save/debug/t_sameKeys.log") end
				--Assign Key
					if #t_sameKeys == 0 or controllerSet == 2 then --Allow same P1 key FOR GAMEPAD control because it will not affect the control
						f_validKey()
						break
						cmdInput()
				--Key has been already assigned in Player 1 Controls
					else
						--TODO: Swap same Key with New One
						f_invalidKey()
					end
				end
			end
		end
		refresh()
	end
	local key = getKeyboard
	return key
end

function f_readMenuInput(oldkey)
	local readInput = 1
	local t = 0
	local sameKeyTime = 0
	readTime = 0
	inputReady = false
	sameKey = false
	getKeyboard = ''
	gamepadData = nil
	if p1waitingKey then gamepadData = data.p1Gamepad
	elseif p2waitingKey then gamepadData = data.p2Gamepad
	end
	while true do
		f_drawMenuKeyAssets()
		readTime = readTime + 1
		if getKeyboard == '' then
		--Time to show Hints
			if t < 120 then
				if not sameKey then
					textImgSetBank(txt_inputHint, 2)
					textImgSetText(txt_inputHint, txt_newKey)
				end
			else
				if t < 240 then
					if not sameKey then
						textImgSetBank(txt_inputHint, 2)
						textImgSetText(txt_inputHint, txt_cancelKey)
					end
				else
					t = 0
				end
			end
		--Time to show Same Key Message
			if sameKey then
				if sameKeyTime < 100 then
					textImgSetBank(txt_inputHint, 1)
					textImgSetText(txt_inputHint, txt_sameKey)
				else
					sameKey = false
					sameKeyTime = 0
				end
				sameKeyTime = sameKeyTime + 1
			end
			if p1waitingKey then
				textImgSetAlign(txt_inputHint, 1)
				textImgPosDraw(txt_inputHint, 5, 208) --Draw Hints for Left Side
			elseif p2waitingKey then
				textImgSetAlign(txt_inputHint, -1)
				textImgPosDraw(txt_inputHint, 315, 208) --Draw Hints for Right Side
			end
			t = t + 1
		end
	--Waiting Key Press
		if readTime > 10 then
			if esc() then getKeyboard = oldkey --No Replace
		--KEYBOARD
			elseif controllerSet == 1 and getInputKeyboard() ~= 0 then --Exluding 0 which is the Keyboard iddle state
				getKeyboard = tostring(getInputKeyboard()) --Get Keyboard Key ID
				getKeyboard = f_inputConvert(getKeyboard, "text") --Convert ID to Display Text
		--GAMEPAD
			elseif controllerSet == 2 and getInputID(gamepadData) ~= 101 then --Exluding 101 which is the Gamepad iddle state
				getKeyboard = getInputID(gamepadData) --Get Gamepad Button ID
			end
		--When you press a key to assign
			if getKeyboard ~= '' then
			--Prevent assign same keys between player 1 and player 2 menu controls (with this logic all keys assigned for both players need to be diferents)
				if p1waitingKey then
				--Check Current Player Buttons (Because all menu buttons need to be different)
					local t_sameKeysP1 = {}
					for i=1, #t_keyMenuCfg do
						if keyCfg ~= i then --ignore key where cursor is
						--Send keys that are equal to a new table
							if controllerSet == 1 then
								if getKeyboard == t_keyMenuCfg[i].keyboard then
									table.insert(t_sameKeysP1, 1, {keyboard = t_keyMenuCfg[i].keyboard, tablepos=i})
								end
							elseif controllerSet == 2 then
								if getKeyboard == t_keyMenuCfg[i].gamepad then
									table.insert(t_sameKeysP1, 1, {gamepad = t_keyMenuCfg[i].gamepad, tablepos=i})
								end
							end
						end
					end
					if data.debugMode then f_printTable(t_sameKeysP1, "save/debug/t_sameKeysP1.log") end
				--Check Player 2 Buttons
					local t_sameKeysP2 = {}
					for i=1, #t_keyMenuCfg2 do
					--Send keys that are equal to a new table
						if controllerSet == 1 then
							if getKeyboard == t_keyMenuCfg2[i].keyboard then
								table.insert(t_sameKeysP2, 1, {keyboard = t_keyMenuCfg2[i].keyboard, tablepos=i})
							end
						elseif controllerSet == 2 then
							if getKeyboard == t_keyMenuCfg2[i].gamepad then
								table.insert(t_sameKeysP2, 1, {gamepad = t_keyMenuCfg2[i].gamepad, tablepos=i})
							end
						end
					end
					if data.debugMode then f_printTable(t_sameKeysP2, "save/debug/t_sameKeysP2.log") end
				--Assign Key
					if (#t_sameKeysP1 == 0 and #t_sameKeysP2 == 0) or (controllerSet == 2 and #t_sameKeysP1 == 0) then
						f_validKey()
						break
						cmdInput()
				--Key has been already assigned
					else
						--TODO: Swap same Key with New One
						f_invalidKey()
					end
				elseif p2waitingKey then
				--Check Current Player Buttons (Because all menu buttons need to be different)
					local t_sameKeysP2 = {}
					for i=1, #t_keyMenuCfg2 do
						if keyCfg2 ~= i then --ignore key where cursor is
						--Send keys that are equal to a new table
							if controllerSet == 1 then
								if getKeyboard == t_keyMenuCfg2[i].keyboard then
									table.insert(t_sameKeysP2, 1, {keyboard = t_keyMenuCfg2[i].keyboard, tablepos=i})
								end
							elseif controllerSet == 2 then
								if getKeyboard == t_keyMenuCfg2[i].gamepad then
									table.insert(t_sameKeysP2, 1, {gamepad = t_keyMenuCfg2[i].gamepad, tablepos=i})
								end
							end
						end
					end
					if data.debugMode then f_printTable(t_sameKeysP2, "save/debug/t_sameKeysP2.log") end
				--Check Player 1 Buttons
					local t_sameKeysP1 = {}
					for i=1, #t_keyMenuCfg do
					--Send keys that are equal to a new table
						if controllerSet == 1 then
							if getKeyboard == t_keyMenuCfg[i].keyboard then
								table.insert(t_sameKeysP1, 1, {keyboard = t_keyMenuCfg[i].keyboard, tablepos=i})
							end
						elseif controllerSet == 2 then
							if getKeyboard == t_keyMenuCfg[i].gamepad then
								table.insert(t_sameKeysP1, 1, {gamepad = t_keyMenuCfg[i].gamepad, tablepos=i})
							end
						end
					end
					if data.debugMode then f_printTable(t_sameKeysP1, "save/debug/t_sameKeysP1.log") end
				--Assign Key
					if (#t_sameKeysP1 == 0 and #t_sameKeysP2 == 0) or (controllerSet == 2 and #t_sameKeysP2 == 0) then
						f_validKey()
						break
						cmdInput()
				--Key has been already assigned
					else
						--TODO: Swap same Key with New One
						f_invalidKey()
					end
				end
			end
		end
		refresh()
	end
	local key = getKeyboard
	return key
end

function f_keyBattleSave(playerNo, controller)
	if playerNo == 0 or playerNo == 2 then --Save Player 1 Battle Controls
	--Keyboard
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyBattleCfg[1].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[2].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[3].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[4].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[5].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[6].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[7].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[8].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[9].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[10].keyboard .. ',\n  (int)k_t::'.. t_keyBattleCfg[11].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[12].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[13].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg[14].keyboard .. ');')
	--Gamepad
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ', ' .. t_keyBattleCfg[1].gamepad .. ', ' .. t_keyBattleCfg[2].gamepad .. ', ' .. t_keyBattleCfg[3].gamepad .. ', ' .. t_keyBattleCfg[4].gamepad .. ', ' .. t_keyBattleCfg[5].gamepad .. ', ' .. t_keyBattleCfg[6].gamepad .. ', ' .. t_keyBattleCfg[7].gamepad .. ', ' .. t_keyBattleCfg[8].gamepad .. ', ' .. t_keyBattleCfg[9].gamepad .. ', ' .. t_keyBattleCfg[10].gamepad .. ', ' .. t_keyBattleCfg[11].gamepad .. ', ' .. t_keyBattleCfg[12].gamepad .. ', ' .. t_keyBattleCfg[13].gamepad .. ', ' .. t_keyBattleCfg[14].gamepad .. ');')
	else --Save Player 2 Battle Controls
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyBattleCfg2[1].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[2].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[3].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[4].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[5].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[6].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[7].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[8].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[9].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[10].keyboard .. ',\n  (int)k_t::'.. t_keyBattleCfg2[11].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[12].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[13].keyboard .. ',\n  (int)k_t::' .. t_keyBattleCfg2[14].keyboard .. ');')
		
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ', ' .. t_keyBattleCfg2[1].gamepad .. ', ' .. t_keyBattleCfg2[2].gamepad .. ', ' .. t_keyBattleCfg2[3].gamepad .. ', ' .. t_keyBattleCfg2[4].gamepad .. ', ' .. t_keyBattleCfg2[5].gamepad .. ', ' .. t_keyBattleCfg2[6].gamepad .. ', ' .. t_keyBattleCfg2[7].gamepad .. ', ' .. t_keyBattleCfg2[8].gamepad .. ', ' .. t_keyBattleCfg2[9].gamepad .. ', ' .. t_keyBattleCfg2[10].gamepad .. ', ' .. t_keyBattleCfg2[11].gamepad .. ', ' .. t_keyBattleCfg2[12].gamepad .. ', ' .. t_keyBattleCfg2[13].gamepad .. ', ' .. t_keyBattleCfg2[14].gamepad .. ');')
	end
end

function f_keyMenuSave(playerNo, controller)
	if playerNo == 0 or playerNo == 2 then --Save Player 1 Menu Controls
	--Keyboard
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyMenuCfg[1].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[2].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[3].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[4].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[5].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[6].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[7].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[8].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[9].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[10].keyboard .. ',\n  (int)k_t::'.. t_keyMenuCfg[11].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[12].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[13].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg[14].keyboard .. ');')
	--Gamepad
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ', ' .. t_keyMenuCfg[1].gamepad .. ', ' .. t_keyMenuCfg[2].gamepad .. ', ' .. t_keyMenuCfg[3].gamepad .. ', ' .. t_keyMenuCfg[4].gamepad .. ', ' .. t_keyMenuCfg[5].gamepad .. ', ' .. t_keyMenuCfg[6].gamepad .. ', ' .. t_keyMenuCfg[7].gamepad .. ', ' .. t_keyMenuCfg[8].gamepad .. ', ' .. t_keyMenuCfg[9].gamepad .. ', ' .. t_keyMenuCfg[10].gamepad .. ', ' .. t_keyMenuCfg[11].gamepad .. ', ' .. t_keyMenuCfg[12].gamepad .. ', ' .. t_keyMenuCfg[13].gamepad .. ', ' .. t_keyMenuCfg[14].gamepad .. ');')
	else --Save Player 2 Menu Controls
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyMenuCfg2[1].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[2].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[3].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[4].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[5].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[6].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[7].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[8].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[9].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[10].keyboard .. ',\n  (int)k_t::'.. t_keyMenuCfg2[11].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[12].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[13].keyboard .. ',\n  (int)k_t::' .. t_keyMenuCfg2[14].keyboard .. ');')
		
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ', ' .. t_keyMenuCfg2[1].gamepad .. ', ' .. t_keyMenuCfg2[2].gamepad .. ', ' .. t_keyMenuCfg2[3].gamepad .. ', ' .. t_keyMenuCfg2[4].gamepad .. ', ' .. t_keyMenuCfg2[5].gamepad .. ', ' .. t_keyMenuCfg2[6].gamepad .. ', ' .. t_keyMenuCfg2[7].gamepad .. ', ' .. t_keyMenuCfg2[8].gamepad .. ', ' .. t_keyMenuCfg2[9].gamepad .. ', ' .. t_keyMenuCfg2[10].gamepad .. ', ' .. t_keyMenuCfg2[11].gamepad .. ', ' .. t_keyMenuCfg2[12].gamepad .. ', ' .. t_keyMenuCfg2[13].gamepad .. ', ' .. t_keyMenuCfg2[14].gamepad .. ');')
	end
end

--;===========================================================
--; VISUAL NOVEL SETTINGS
--;===========================================================
txt_gameVNcfg = createTextImg(jgFnt, 0, 0, "GAME SETTINGS", 159, 13)

t_gameVNcfg = {
	{text = "Language", 		        varText = data.language},
	{text = "Clock Format",             varText = ""},
	{text = "Date Format",              varText = ""},
	{text = "Text Speed", 			 	varText = ""},
	{text = "Text BG Transparency", 	varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"},
	{text = "Auto Skip Text", 		 	varText = ""},
	--{text = "Auto Save",				varText = ""},
	--{text = "Default Settings",  	  	varText = ""},
	{text = "          BACK",  		   	varText = ""},
}
for i=1, #t_gameVNcfg do
	t_gameVNcfg[i]['varID'] = textImgNew()
end

function f_gameVNcfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local gameVNcfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				lockSetting = false
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				lockSetting = false
				sndPlay(sndSys, 100, 0)
				gameVNcfg = gameVNcfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				lockSetting = false
				sndPlay(sndSys, 100, 0)
				gameVNcfg = gameVNcfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
		--Language Settings
			elseif gameVNcfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			--[[
				if commandGetState(p1Cmd, 'r') and data.language == "ENGLISH" then
					sndPlay(sndSys, 100, 0)
					data.language = "SPANISH"
					modified = 1
					needReload = 1
				elseif commandGetState(p1Cmd, 'r') and data.language == "SPANISH" then
					sndPlay(sndSys, 100, 0)
					data.language = "JAPANESE"
					modified = 1
					needReload = 1
				elseif commandGetState(p1Cmd, 'l') and data.language == "SPANISH" then
					sndPlay(sndSys, 100, 0)
					data.language = "ENGLISH"
					modified = 1
					needReload = 1
				elseif commandGetState(p1Cmd, 'l') and data.language == "JAPANESE" then
					sndPlay(sndSys, 100, 0)
					data.language = "SPANISH"
					modified = 1
					needReload = 1
				end
			]]
		--Clock Format Display
			elseif gameVNcfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.clock < #t_clockFormats then sndPlay(sndSys, 100, 0) end
					if data.clock < #t_clockFormats then
						data.clock = data.clock + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.clock > 1 then sndPlay(sndSys, 100, 0) end
					if data.clock > 1 then
						data.clock = data.clock - 1
					end
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
		--Date Format Display
			elseif gameVNcfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if commandGetState(p1Cmd, 'r') and data.dateFormat < #t_dateFormats then sndPlay(sndSys, 100, 0) end
					if data.dateFormat < #t_dateFormats then
						data.dateFormat = data.dateFormat + 1
					end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if commandGetState(p1Cmd, 'l') and data.dateFormat > 1 then sndPlay(sndSys, 100, 0) end
					if data.dateFormat > 1 then
						data.dateFormat = data.dateFormat - 1
					end
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
		--Text Speed
			elseif gameVNcfg == 4 then
				if commandGetState(p1Cmd, 'r') then
					if data.VNdelay > 0 then
						sndPlay(sndSys, 100, 0)
						data.VNdelay = data.VNdelay - 1
					end
				elseif commandGetState(p1Cmd, 'l') then
					if data.VNdelay < 3 then
						sndPlay(sndSys, 100, 0)
						data.VNdelay = data.VNdelay + 1
					end
				end
		--Text BG Transparency
			elseif gameVNcfg == 5 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if data.VNtxtBGTransD < 255 then
						data.VNtxtBGTransD = data.VNtxtBGTransD + 1
						data.VNtxtBGTransS = data.VNtxtBGTransS - 1
					else
						data.VNtxtBGTransD = 0
						data.VNtxtBGTransS = 255
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						hasChangedVN = true
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if data.VNtxtBGTransD > 0 then
						data.VNtxtBGTransD = data.VNtxtBGTransD - 1
						data.VNtxtBGTransS = data.VNtxtBGTransS + 1
					else
						data.VNtxtBGTransD = 255
						data.VNtxtBGTransS = 0
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
				end
		--Auto Skip Text
			elseif gameVNcfg == 6 and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sndSys, 100, 1)
				if data.VNautoSkip then data.VNautoSkip = false else data.VNautoSkip = true end
		--Auto Save (TODO)
				
		--[[Default Values
			elseif gameVNcfg == #t_gameVNcfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultVN = true
				defaultScreen = true
		]]
		--BACK
			elseif gameVNcfg == #t_gameVNcfg and (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
				sndPlay(sndSys, 100, 2)
				break
			end
			if gameVNcfg < 1 then
				gameVNcfg = #t_gameVNcfg
				if #t_gameVNcfg > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_gameVNcfg
				end
			elseif gameVNcfg > #t_gameVNcfg then
				gameVNcfg = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (gameVNcfg - maxItems) * 15
			elseif cursorPosY == 1 then
				moveTxt = (gameVNcfg - 1) * 15
			end	
			if #t_gameVNcfg <= maxItems then
				maxgameVNcfg = #t_gameVNcfg
			elseif gameVNcfg - cursorPosY > 0 then
				maxgameVNcfg = gameVNcfg + maxItems - cursorPosY
			else
				maxgameVNcfg = maxItems
			end
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxgameVNcfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_gameVNcfg)
		if not defaultScreen then
			animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if lockSetting then
			for i=1, #t_locked do
				textImgDraw(t_locked[i].id)
			end
		end	
		t_gameVNcfg[1].varText = data.language
		t_gameVNcfg[2].varText = os.date(t_clockFormats[data.clock].locale)
		t_gameVNcfg[3].varText = os.date(t_dateFormats[data.dateFormat])
		if data.VNdelay == 3 then t_gameVNcfg[4].varText = "Slow"
		elseif data.VNdelay == 2 then t_gameVNcfg[4].varText = "Normal"
		elseif data.VNdelay == 1 then t_gameVNcfg[4].varText = "Fast"
		elseif data.VNdelay == 0 then t_gameVNcfg[4].varText = "Instant"
		end
		t_gameVNcfg[5].varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"
		if data.VNautoSkip then t_gameVNcfg[6].varText = "Yes" else t_gameVNcfg[6].varText = "No" end
		for i=1, maxgameVNcfg do
			if i > gameVNcfg - cursorPosY then
				if t_gameVNcfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_gameVNcfg[i].varID, font2, 0, 1, t_gameVNcfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_gameVNcfg[i].varID, font2, 0, -1, t_gameVNcfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxgameVNcfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_gameVNcfg > maxItems and maxgameVNcfg < #t_gameVNcfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		if defaultScreen then
			f_defaultMenu()
		else
			drawCfgInputHints()
		end
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
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
		end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ERASE/RESET STATISTICS DATA WARNING
--;===========================================================
t_unlocksWarning = {
	{text = "   All unlocked data or progress will be delete."},
}
for i=1, #t_unlocksWarning do
	t_unlocksWarning[i]['id'] = createTextImg(font2, 0, 1, t_unlocksWarning[i].text, 25, 65+i*15)
end

function f_unlocksWarning()
	cmdInput()
	f_defaultReset()
	resetStats = true
	defaultScreen = true
	while true do
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(infoBG, 300, 94)
		animSetWindow(infoBG, 0,70, 297,#t_unlocksWarning*15)
		animDraw(infoBG)
		textImgDraw(txt_Warning)
		for i=1, #t_unlocksWarning do
			textImgDraw(t_unlocksWarning[i].id)
		end
		if defaultScreen then f_defaultMenu() end
		if not defaultScreen and not resetStats then break end
		cmdInput()
		refresh()
	end
end

--Set Default Stats
function f_defaultStats()
--Visual Novel Data
	data.VNarc = ""
	data.VNchapter = 0
	data.VNdialogue = 0
--;----------------------------------------------
	data.erase = true
	modified = 1
	needReload = 1
end

--Read Inputs for Inputs Hints Data
f_inputMenuRead(0, -1) --0=P1, -1=Keyboard
f_inputMenuRead(1, -1) --1=P2
f_inputMenuRead(2, data.p1Gamepad) --2=P3
f_inputMenuRead(3, data.p2Gamepad) --3=P4

f_inputBattleRead(0, -1)
f_inputBattleRead(1, -1)
f_inputBattleRead(2, data.p1Gamepad)
f_inputBattleRead(3, data.p2Gamepad)

function f_exportDebugInputs()
	if data.debugLog then
		f_printTable(t_keyBattleCfg, "save/debug/battleInputsP1.log")
		f_printTable(t_keyBattleCfg2, "save/debug/battleInputsP2.log")
		
		f_printTable(t_keyMenuCfg, "save/debug/menuInputsP1.log")
		f_printTable(t_keyMenuCfg2, "save/debug/menuInputsP2.log")
	end
end
f_exportDebugInputs()