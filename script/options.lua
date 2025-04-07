module(..., package.seeall)
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
animUpdate(optionsUpArrow)
animSetScale(optionsUpArrow, 0.5, 0.5)

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
animUpdate(optionsDownArrow)
animSetScale(optionsDownArrow, 0.5, 0.5)

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
animUpdate(optionsUpArrowP1)
animSetScale(optionsUpArrowP1, 0.5, 0.5)

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
animAddPos(optionsDownArrowP1, 5, 218)
animUpdate(optionsDownArrowP1)
animSetScale(optionsDownArrowP1, 0.5, 0.5)

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
animUpdate(optionsUpArrowP2)
animSetScale(optionsUpArrowP2, 0.5, 0.5)

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
animAddPos(optionsDownArrowP2, 303, 218)
animUpdate(optionsDownArrowP2)
animSetScale(optionsDownArrowP2, 0.5, 0.5)

txt_creditsCfg = createTextImg(font1, 0, -1, "", 181.5, 219)
function f_attractcfgCredits()
	textImgSetText(txt_creditsCfg, "Credits: "..stats.attractCoins.."")
	textImgDraw(txt_creditsCfg)
end

--Input Hints Panel
function drawCfgInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

function drawCfgInputHints2()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("u","0,"..inputHintYPos,"d","20,"..inputHintYPos,"l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"w","120,"..inputHintYPos,"e","185,"..inputHintYPos,"q","245,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 141, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 206, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 266, hintFontYPos)
end

--;===========================================================
--; ON EXIT
--;===========================================================
modified = 0
needReload = 0

function f_loadCfg()
--;===========================================================
--; DATA_SAV.LUA
--;===========================================================
--Data loading from data_sav.lua
	local file = io.open(saveCfgPath,"r")
	s_dataLUA = file:read("*all")
	file:close()
--Apply settings from data_sav.lua
	disableGamepad(data.disablePadP1,data.disablePadP2)
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
	b_fullscreenMode = s_configSSZ:match('const bool FullScreenReal%s*=%s*([^;%s]+)')
	b_screenMode = s_configSSZ:match('const bool FullScreen%s*=%s*([^;%s]+)')
	b_aspectMode = s_configSSZ:match('const bool AspectRatio%s*=%s*([^;%s]+)')
	b_borderMode = s_configSSZ:match('const bool WindowBordered%s*=%s*([^;%s]+)')
	b_resizableMode = s_configSSZ:match('const bool WindowResizable%s*=%s*([^;%s]+)')
	b_openGL = s_configSSZ:match('const bool OpenGL%s*=%s*([^;%s]+)')
	brightnessAdjust = tonumber(s_configSSZ:match('const int Brightness%s*=%s*(%d+)'))
	--Audio Settings
	gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
	se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
	bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
	pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))
	--Perfomance Settings
	HelperMaxEngine = tonumber(s_configSSZ:match('const int HelperMax%s*=%s*(%d+)'))
	PlayerProjectileMaxEngine = tonumber(s_configSSZ:match('const int PlayerProjectileMax%s*=%s*(%d+)'))
	ExplodMaxEngine = tonumber(s_configSSZ:match('const int ExplodMax%s*=%s*(%d+)'))
	AfterImageMaxEngine = tonumber(s_configSSZ:match('const int AfterImageMax%s*=%s*(%d+)'))
	b_saveMemory = s_configSSZ:match('const bool SaveMemory%s*=%s*([^;%s]+)')
	--Game Settings
	gameSpeed = tonumber(s_configSSZ:match('const int GameSpeed%s*=%s*(%d+)'))
	--Input Settings
	data.p1Gamepad = tonumber(s_configSSZ:match('in%.new%[2%]%.set%(\n%s*(%-*%d+)'))
	data.p2Gamepad = tonumber(s_configSSZ:match('in%.new%[3%]%.set%(\n%s*(%-*%d+)'))
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

function f_loadEXCfg()
--Data loading from sound.ssz
	local file = io.open("lib/sound.ssz","r")
	s_soundSSZ = file:read("*all")
	file:close()
--Apply settings from sound.ssz
	freq = tonumber(s_soundSSZ:match('const int Freq%s*=%s*(%d+)'))
	channels = tonumber(s_soundSSZ:match('const int Channels%s*=%s*(%d+)'))
	buffer = tonumber(s_soundSSZ:match('const int BufferSamples%s*=%s*(%d+)'))
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

	if b_saveMemory == "true" then
		b_saveMemory = true
		s_saveMemory = "Yes"
	elseif b_saveMemory == "false" then
		b_saveMemory = false
		s_saveMemory = "No"
	end

	if b_openGL == "true" then
		b_openGL = true
		s_openGL = "Yes"
	elseif b_openGL == "false" then
		b_openGL = false
		s_openGL = "No"
	end
	
	if data.fullscreenType == "Exclusive" then
		b_fullscreenMode = true
	elseif data.fullscreenType == "Borderless" then
		b_fullscreenMode = false
	end
	
	if b_screenMode == "true" then
		b_screenMode = true
		s_screenMode = "Fullscreen"
	elseif b_screenMode == "false" then
		b_screenMode = false
		s_screenMode = "Window"
	end
	
	if b_aspectMode == "true" then
		b_aspectMode = true
		s_aspectMode = "Yes"
	elseif b_aspectMode == "false" then
		b_aspectMode = false
		s_aspectMode = "No"
	end
	
	if data.windowType == "Original" then
		b_borderMode = true
		b_resizableMode = false
	elseif data.windowType == "No Border" then
		b_borderMode = false
		b_resizableMode = false
	elseif data.windowType == "Resizable" then
		b_borderMode = true
		b_resizableMode = true
	end
	
	if data.teamLifeShare then
		s_teamLifeShare = "Yes"
	else
		s_teamLifeShare = "No"
	end
	
	if data.teamPowerShare then
		s_teamPowerShare = "Yes"
	else
		s_teamPowerShare = "No"
	end

	if data.zoomActive then
		s_zoomActive = "Yes"
	else
		s_zoomActive = "No"
	end
	
	s_disablePadP1 = data.disablePadP1 and "Disabled" or "Enabled"
	s_disablePadP2 = data.disablePadP2 and "Disabled" or "Enabled"

	if data.quickCont then
		s_quickCont = "Yes"
	else
		s_quickCont = "No"
	end

	if data.aiRamping then
		s_aiRamping = "Yes"
	else
		s_aiRamping = "No"
	end

	if data.autoguard then
		s_autoguard = "Yes"
	else
		s_autoguard = "No"
	end

	if data.vsDisplayWin then
		s_vsDisplayWin = "Yes"
	else
		s_vsDisplayWin = "No"
	end

	if data.debugMode then
		s_debugMode = "Enabled"
	else
		s_debugMode = "Disabled"
	end
	
	if data.debugLog then
		s_debugLog = "Enabled"
	else
		s_debugLog = "Disabled"
	end
	
	if data.attractMode then
		s_attractMode = "Enabled"
	else
		s_attractMode = "Disabled"
	end
end

--Load Data Functions
if onlinegame then
	f_loadNETCfg()
	f_loadEXCfg()
else
	f_loadCfg()
	f_loadEXCfg()
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
	--System Data
		['data.language'] = data.language,
		['data.clock'] = data.clock,
		['data.date'] = data.date,
		['data.attractMode'] = data.attractMode,
		['data.vsDisplayWin'] = data.vsDisplayWin,
		['data.winscreen'] = data.winscreen,
		['data.charPresentation'] = data.charPresentation,
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
		['data.autoguard'] = data.autoguard,
		['data.quickCont'] = data.quickCont,
	--Team Data
		['data.team1VS2Life'] = data.team1VS2Life,
		['data.turnsRecoveryRate'] = data.turnsRecoveryRate,
		['data.teamLifeShare'] = data.teamLifeShare,
		['data.teamPowerShare'] = data.teamPowerShare,
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
	--Video Data
		['data.windowType'] = data.windowType,
		['data.fullscreenType'] = data.fullscreenType,
		['data.sdl'] = data.sdl,
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
		s_configSSZ = s_configSSZ:gsub('const bool FullScreenReal%s*=%s*[^;%s]+', 'const bool FullScreenReal = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool FullScreenReal%s*=%s*[^;%s]+', 'const bool FullScreenReal = false')
	end
	if b_borderMode then
		s_configSSZ = s_configSSZ:gsub('const bool WindowBordered%s*=%s*[^;%s]+', 'const bool WindowBordered = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool WindowBordered%s*=%s*[^;%s]+', 'const bool WindowBordered = false')
	end
	if b_resizableMode then
		s_configSSZ = s_configSSZ:gsub('const bool WindowResizable%s*=%s*[^;%s]+', 'const bool WindowResizable = true')
	else
		s_configSSZ = s_configSSZ:gsub('const bool WindowResizable%s*=%s*[^;%s]+', 'const bool WindowResizable = false')
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
	s_configSSZ = s_configSSZ:gsub('const int Brightness%s*=%s*%d+', 'const int Brightness = ' .. brightnessAdjust)
--Audio Settings
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
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
		--os.execute ("TASKKILL /IM Ikemen.exe /F")
		f_playTime()
		if data.sdl == "Original" then
			os.rename("lib/alpha/dll/sdlplugin.dll", "lib/alpha/dll/sdlpluginV.dll")
			os.rename("lib/alpha/sdlplugin.ssz", "lib/alpha/sdlpluginV.ssz")
			os.rename("lib/alpha/dll/sdlpluginS.dll", "lib/alpha/dll/sdlplugin.dll")
			os.rename("lib/alpha/sdlpluginS.ssz", "lib/alpha/sdlplugin.ssz")
		elseif data.sdl == "New" then
			os.rename("lib/alpha/dll/sdlplugin.dll", "lib/alpha/dll/sdlpluginS.dll")
			os.rename("lib/alpha/sdlplugin.ssz", "lib/alpha/sdlpluginS.ssz")
			os.rename("lib/alpha/dll/sdlpluginV.dll", "lib/alpha/dll/sdlplugin.dll")
			os.rename("lib/alpha/sdlpluginV.ssz", "lib/alpha/sdlplugin.ssz")
		end
		sszReload() --Native Reboot, added via ikemen.ssz
		os.exit()
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
		['data.autoguard'] = data.autoguard,
		['data.lifebar'] = data.lifebar,
		['data.selectType'] = data.selectType,
		['data.palType'] = data.palType,
		['data.stageType'] = data.stageType,
		['data.winscreen'] = data.winscreen,
		['data.ftcontrol'] = data.ftcontrol,
		['data.charPresentation'] = data.charPresentation,
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
	data.connectMode = "Direct"
	data.userName = "PLAYER" --setUserName('PLAYER')
	setListenPort(7500)
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
	s_aiRamping = "Yes"
	data.kumite = 100
	data.autoguard = false
	s_autoguard = "No"
	gameSpeed = 60
	s_gameSpeed = "Normal"
	data.quickCont = true
	s_quickCont = "Yes"
end

--Default Team Values
function f_teamDefault()
	data.team1VS2Life = 120
	data.turnsRecoveryRate = 300
	data.teamLifeShare = false
	s_teamLifeShare = "No"
	data.teamPowerShare = true
	s_teamPowerShare = "Yes"
	data.numTurns = 4
	data.numSimul = 4
	data.simulType = "Assist"
	data.coopenemy = "Simul"
end

--Default Zoom Values
function f_zoomDefault()
	data.zoomActive = true
	s_zoomActive = "Yes"
	data.zoomMin = 0.75
	data.zoomMax = 1.1
	data.zoomSpeed = 1.0
end

--Default System Values
function f_systemDefault()
	if not onlinegame then
		data.language = "ENGLISH"
		data.clock = "Standard"
		data.date = "Type A"
	end
	data.attractMode = false
	s_attractMode = "Disabled"
	data.vsDisplayWin = true
	s_vsDisplayWin = "Yes"
	data.winscreen = "Classic"
	data.charPresentation = "Portrait"
	data.sffConversion = true
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
end

--Default Video Values
function f_videoDefault()
	--b_saveMemory = false
	--s_saveMemory = 2No"
	b_openGL = false
	s_openGL = "No"
	b_screenMode = false
	s_screenMode = "Window"
	setScreenMode(b_screenMode)
	data.fullscreenType = "Borderless"
	b_fullscreenMode = false
	setFullScreenMode(b_fullscreenMode)
	b_aspectMode = false
	s_aspectMode = "No"
	setAspectRatio(b_aspectMode)
	data.windowType = "Original"
	b_resizableMode = false
	b_borderMode = true
	setResizableMode(b_resizableMode)
	setBorderMode(b_borderMode)
	resolutionWidth = 853
	resolutionHeight = 480
	--setGameRes(resolutionWidth,resolutionHeight)
	brightnessAdjust = 256
	setBrightness(brightnessAdjust)
	data.sdl = "New"
end

--Default Audio Values
function f_audioDefault()
	gl_vol = 80
	se_vol = 80
	bgm_vol = 50
	setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
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
	s_debugMode = "Disabled"
	data.debugLog = false
	s_debugLog = "Disabled"
	--data.engineMode = "FG"
	HelperMaxEngine = 56
	PlayerProjectileMaxEngine = 50
	ExplodMaxEngine = 256
	AfterImageMaxEngine = 8
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
	t_keyBattleCfg[1].varText = 'UP'
	t_keyBattleCfg[2].varText = 'DOWN'
	t_keyBattleCfg[3].varText = 'LEFT'
	t_keyBattleCfg[4].varText = 'RIGHT'
	t_keyBattleCfg[5].varText = 'a'
	t_keyBattleCfg[6].varText = 's'
	t_keyBattleCfg[7].varText = 'd'
	t_keyBattleCfg[8].varText = 'z'
	t_keyBattleCfg[9].varText = 'x'
	t_keyBattleCfg[10].varText = 'c'
	t_keyBattleCfg[11].varText = 'q'
	t_keyBattleCfg[12].varText = 'e'
	t_keyBattleCfg[13].varText = 'v'
	t_keyBattleCfg[14].varText = 'f'
	setInputConfig(0, -1, t_keyBattleCfg[1].varText, t_keyBattleCfg[2].varText, t_keyBattleCfg[3].varText, t_keyBattleCfg[4].varText, t_keyBattleCfg[5].varText, t_keyBattleCfg[6].varText, t_keyBattleCfg[7].varText, t_keyBattleCfg[8].varText, t_keyBattleCfg[9].varText, t_keyBattleCfg[10].varText, t_keyBattleCfg[11].varText, t_keyBattleCfg[12].varText, t_keyBattleCfg[13].varText, t_keyBattleCfg[14].varText) --Apply and Load New Controls
	f_keyBattleSave(0,-1)
end

--Default P2 KEYBOARD BATTLE
function f_p2keyboardBattleDefault()
	t_keyBattleCfg2[1].varText = 'KP_5'
	t_keyBattleCfg2[2].varText = 'KP_2'
	t_keyBattleCfg2[3].varText = 'KP_1'
	t_keyBattleCfg2[4].varText = 'KP_3'
	t_keyBattleCfg2[5].varText = 'u'
	t_keyBattleCfg2[6].varText = 'i'
	t_keyBattleCfg2[7].varText = 'o'
	t_keyBattleCfg2[8].varText = 'j'
	t_keyBattleCfg2[9].varText = 'k'
	t_keyBattleCfg2[10].varText = 'l'
	t_keyBattleCfg2[11].varText = 'KP_4'
	t_keyBattleCfg2[12].varText = 'KP_6'
	t_keyBattleCfg2[13].varText = 'KP_PERIOD'
	t_keyBattleCfg2[14].varText = 'KP_0'
	setInputConfig(1, -1, t_keyBattleCfg2[1].varText, t_keyBattleCfg2[2].varText, t_keyBattleCfg2[3].varText, t_keyBattleCfg2[4].varText, t_keyBattleCfg2[5].varText, t_keyBattleCfg2[6].varText, t_keyBattleCfg2[7].varText, t_keyBattleCfg2[8].varText, t_keyBattleCfg2[9].varText, t_keyBattleCfg2[10].varText, t_keyBattleCfg2[11].varText, t_keyBattleCfg2[12].varText, t_keyBattleCfg2[13].varText, t_keyBattleCfg2[14].varText) --Apply and Load New Controls
	f_keyBattleSave(1,-1)
end

--Default P1 GAMEPAD BATTLE
function f_p1gamepadBattleDefault() --PS3 Gamepad Layout
	t_keyBattleCfg[1].varText = '-3'
	t_keyBattleCfg[2].varText = '-4'
	t_keyBattleCfg[3].varText = '-1'
	t_keyBattleCfg[4].varText = '-2'
	t_keyBattleCfg[5].varText = '0'
	t_keyBattleCfg[6].varText = '1'
	t_keyBattleCfg[7].varText = '4'
	t_keyBattleCfg[8].varText = '2'
	t_keyBattleCfg[9].varText = '3'
	t_keyBattleCfg[10].varText = '5'
	t_keyBattleCfg[11].varText = '8'
	t_keyBattleCfg[12].varText = '9'
	t_keyBattleCfg[13].varText = '-10'
	t_keyBattleCfg[14].varText = '6'
	setInputConfig(2, 0, t_keyBattleCfg[1].varText, t_keyBattleCfg[2].varText, t_keyBattleCfg[3].varText, t_keyBattleCfg[4].varText, t_keyBattleCfg[5].varText, t_keyBattleCfg[6].varText, t_keyBattleCfg[7].varText, t_keyBattleCfg[8].varText, t_keyBattleCfg[9].varText, t_keyBattleCfg[10].varText, t_keyBattleCfg[11].varText, t_keyBattleCfg[12].varText, t_keyBattleCfg[13].varText, t_keyBattleCfg[14].varText) --Apply and Load New Controls
	f_keyBattleSave(2,0)
end

--Default P2 GAMEPAD BATTLE
function f_p2gamepadBattleDefault()
	t_keyBattleCfg2[1].varText = '-3'
	t_keyBattleCfg2[2].varText = '-4'
	t_keyBattleCfg2[3].varText = '-1'
	t_keyBattleCfg2[4].varText = '-2'
	t_keyBattleCfg2[5].varText = '0'
	t_keyBattleCfg2[6].varText = '1'
	t_keyBattleCfg2[7].varText = '4'
	t_keyBattleCfg2[8].varText = '2'
	t_keyBattleCfg2[9].varText = '3'
	t_keyBattleCfg2[10].varText = '5'
	t_keyBattleCfg2[11].varText = '8'
	t_keyBattleCfg2[12].varText = '9'
	t_keyBattleCfg2[13].varText = '-10'
	t_keyBattleCfg2[14].varText = '6'
	setInputConfig(3, 1, t_keyBattleCfg2[1].varText, t_keyBattleCfg2[2].varText, t_keyBattleCfg2[3].varText, t_keyBattleCfg2[4].varText, t_keyBattleCfg2[5].varText, t_keyBattleCfg2[6].varText, t_keyBattleCfg2[7].varText, t_keyBattleCfg2[8].varText, t_keyBattleCfg2[9].varText, t_keyBattleCfg2[10].varText, t_keyBattleCfg2[11].varText, t_keyBattleCfg2[12].varText, t_keyBattleCfg2[13].varText, t_keyBattleCfg2[14].varText) --Apply and Load New Controls
	f_keyBattleSave(3,1)
end

--Default P1 KEYBOARD MENU
function f_p1keyboardMenuDefault()
	t_keyMenuCfg[1].varText = 'UP'
	t_keyMenuCfg[2].varText = 'DOWN'
	t_keyMenuCfg[3].varText = 'LEFT'
	t_keyMenuCfg[4].varText = 'RIGHT'
	t_keyMenuCfg[5].varText = 'a'
	t_keyMenuCfg[6].varText = 's'
	t_keyMenuCfg[7].varText = 'd'
	t_keyMenuCfg[8].varText = 'z'
	t_keyMenuCfg[9].varText = 'x'
	t_keyMenuCfg[10].varText = 'c'
	t_keyMenuCfg[11].varText = 'TAB'
	t_keyMenuCfg[12].varText = 'RETURN'
	t_keyMenuCfg[13].varText = 'BACKSPACE'
	t_keyMenuCfg[14].varText = 'SPACE'
	setInputConfig(10, -1, t_keyMenuCfg[1].varText, t_keyMenuCfg[2].varText, t_keyMenuCfg[3].varText, t_keyMenuCfg[4].varText, t_keyMenuCfg[5].varText, t_keyMenuCfg[6].varText, t_keyMenuCfg[7].varText, t_keyMenuCfg[8].varText, t_keyMenuCfg[9].varText, t_keyMenuCfg[10].varText, t_keyMenuCfg[11].varText, t_keyMenuCfg[12].varText, t_keyMenuCfg[13].varText, t_keyMenuCfg[14].varText) --Apply and Load New Controls
	f_keyMenuSave(10,-1)
end

--Default P2 KEYBOARD MENU
function f_p2keyboardMenuDefault()
	t_keyMenuCfg2[1].varText = 'KP_5'
	t_keyMenuCfg2[2].varText = 'KP_2'
	t_keyMenuCfg2[3].varText = 'KP_1'
	t_keyMenuCfg2[4].varText = 'KP_3'
	t_keyMenuCfg2[5].varText = 'u'
	t_keyMenuCfg2[6].varText = 'i'
	t_keyMenuCfg2[7].varText = 'o'
	t_keyMenuCfg2[8].varText = 'j'
	t_keyMenuCfg2[9].varText = 'k'
	t_keyMenuCfg2[10].varText = 'l'
	t_keyMenuCfg2[11].varText = 'KP_DIVIDE'
	t_keyMenuCfg2[12].varText = 'KP_PLUS'
	t_keyMenuCfg2[13].varText = 'KP_MINUS'
	t_keyMenuCfg2[14].varText = 'KP_ENTER'
	setInputConfig(11, -1, t_keyMenuCfg2[1].varText, t_keyMenuCfg2[2].varText, t_keyMenuCfg2[3].varText, t_keyMenuCfg2[4].varText, t_keyMenuCfg2[5].varText, t_keyMenuCfg2[6].varText, t_keyMenuCfg2[7].varText, t_keyMenuCfg2[8].varText, t_keyMenuCfg2[9].varText, t_keyMenuCfg2[10].varText, t_keyMenuCfg2[11].varText, t_keyMenuCfg2[12].varText, t_keyMenuCfg2[13].varText, t_keyMenuCfg2[14].varText) --Apply and Load New Controls
	f_keyMenuSave(11,-1)
end

--Default P1 GAMEPAD MENU
function f_p1gamepadMenuDefault() --PS3 Gamepad Layout
	t_keyMenuCfg[1].varText = '-7'
	t_keyMenuCfg[2].varText = '-8'
	t_keyMenuCfg[3].varText = '-5'
	t_keyMenuCfg[4].varText = '-6'
	t_keyMenuCfg[5].varText = '2'
	t_keyMenuCfg[6].varText = '3'
	t_keyMenuCfg[7].varText = '4'
	t_keyMenuCfg[8].varText = '5'
	t_keyMenuCfg[9].varText = '8'
	t_keyMenuCfg[10].varText = '9'
	t_keyMenuCfg[11].varText = '6'
	t_keyMenuCfg[12].varText = '0'
	t_keyMenuCfg[13].varText = '1'
	t_keyMenuCfg[14].varText = '7'
	setInputConfig(12, 0, t_keyMenuCfg[1].varText, t_keyMenuCfg[2].varText, t_keyMenuCfg[3].varText, t_keyMenuCfg[4].varText, t_keyMenuCfg[5].varText, t_keyMenuCfg[6].varText, t_keyMenuCfg[7].varText, t_keyMenuCfg[8].varText, t_keyMenuCfg[9].varText, t_keyMenuCfg[10].varText, t_keyMenuCfg[11].varText, t_keyMenuCfg[12].varText, t_keyMenuCfg[13].varText, t_keyMenuCfg[14].varText) --Apply and Load New Controls
	f_keyMenuSave(12,0)
end

--Default P2 GAMEPAD MENU
function f_p2gamepadMenuDefault()
	t_keyMenuCfg2[1].varText = '-7'
	t_keyMenuCfg2[2].varText = '-8'
	t_keyMenuCfg2[3].varText = '-5'
	t_keyMenuCfg2[4].varText = '-6'
	t_keyMenuCfg2[5].varText = '2'
	t_keyMenuCfg2[6].varText = '3'
	t_keyMenuCfg2[7].varText = '4'
	t_keyMenuCfg2[8].varText = '5'
	t_keyMenuCfg2[9].varText = '8'
	t_keyMenuCfg2[10].varText = '9'
	t_keyMenuCfg2[11].varText = '6'
	t_keyMenuCfg2[12].varText = '0'
	t_keyMenuCfg2[13].varText = '1'
	t_keyMenuCfg2[14].varText = '7'
	setInputConfig(13, 1, t_keyMenuCfg2[1].varText, t_keyMenuCfg2[2].varText, t_keyMenuCfg2[3].varText, t_keyMenuCfg2[4].varText, t_keyMenuCfg2[5].varText, t_keyMenuCfg2[6].varText, t_keyMenuCfg2[7].varText, t_keyMenuCfg2[8].varText, t_keyMenuCfg2[9].varText, t_keyMenuCfg2[10].varText, t_keyMenuCfg2[11].varText, t_keyMenuCfg2[12].varText, t_keyMenuCfg2[13].varText, t_keyMenuCfg2[14].varText) --Apply and Load New Controls
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
animUpdate(infoOptionsWindowBG)
animSetScale(infoOptionsWindowBG, 1, 0.3)

function drawInfoCfgInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("w","70,"..inputHintYPos,"q","190,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 91, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 211, hintFontYPos)
end

--;===========================================================
--; REBOOT INFORMATION
--;===========================================================
t_exitInfo = {
	{id = '', text = ""},
	{id = '', text = "Some selected options require restart Ikemen. Press"},
	{id = '', text = "start key to reboot Ikemen and load your new settings."},
	{id = '', text = ""},
}
for i=1, #t_exitInfo do
	t_exitInfo[i].id = createTextImg(font2, 0, 1, t_exitInfo[i].text, 25, 65+i*15)
end

function f_exitInfo()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
		animUpdate(infoOptionsWindowBG)
		--Draw OK Below Info Text
		textImgDraw(txt_okOptions)
		--Draw Below Cursor
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if data.attractMode then f_attractcfgCredits() end
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; ASPECT RATIO WARNING
--;===========================================================
t_resWarning = {
	{id = '', text = ""},
	{id = '', text = "Non 4:3 resolutions requires stages coded for different"},
	{id = '', text = "aspect ratio. Change it back to 4:3 if stages look off."},
	{id = '', text = ""},
}
for i=1, #t_resWarning do
	t_resWarning[i].id = createTextImg(font2, 0, 1, t_resWarning[i].text, 25, 65+i*15)
end

function f_resWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
		animUpdate(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if data.attractMode then f_attractcfgCredits() end
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SDL VIDEO WARNING
--;===========================================================
--SDL Beta Info 1
sdlImg1 = animNew(sprIkemen, [[
3000,0, 0,0,
]])
animSetPos(sdlImg1, 76, 190)
animUpdate(sdlImg1)
animSetScale(sdlImg1, 0.35, 0.35)

--SDL Beta Info 1
sdlImg2 = animNew(sprIkemen, [[
3000,1, 0,0,
]])
animSetPos(sdlImg2, 243, 190)
animUpdate(sdlImg2)
animSetScale(sdlImg2, 0.35, 0.35)

t_sdlWarning = {
	{id = '', text = "The New version of the Sdlplugin allows loading video"},
	{id = '', text = "files in WMV format. However, still in development and"},
	{id = '', text = "ONLY SFF sprites Version 1.0.1.0 or Version 2.0.0.0"},
	{id = '', text = "are supported."},
}
for i=1, #t_sdlWarning do
	t_sdlWarning[i].id = createTextImg(font2, 0, 1, t_sdlWarning[i].text, 25, 65+i*15)
end

function f_sdlWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			sndPlay(sndSys, 100, 1)
			break
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		textImgDraw(txt_Warning)
		animSetScale(infoBG, 300, 111)
		animSetWindow(infoBG, 0,70, 296,#t_sdlWarning*15)
		animDraw(infoBG)
		for i=1, #t_sdlWarning do
			textImgDraw(t_sdlWarning[i].id)
		end
		animDraw(infoOptionsWindowBG)
		animUpdate(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw SDL Beta Reference
		animDraw(sdlImg1)
		animUpdate(sdlImg1)
		animDraw(sdlImg2)
		animUpdate(sdlImg2)
		if data.attractMode then f_attractcfgCredits() end
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; OPENGL 2.0 WARNING
--;===========================================================
t_glWarning = {
	{id = '', text = ""},
	{id = '', text = "If your system doesn't support OpenGL 2.0 or later"},
	{id = '', text = "edit in save/config.ssz: const bool OpenGL = false"},
	{id = '', text = ""},
}
for i=1, #t_glWarning do
	t_glWarning[i].id = createTextImg(font2, 0, 1, t_glWarning[i].text, 25, 65+i*15)
end

function f_glWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
		animUpdate(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if data.attractMode then f_attractcfgCredits() end
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; SAVE MEMORY WARNING
--;===========================================================
t_memWarning = {
	{id = '', text = ""},
	{id = '', text = "Enabling 'Save memory' option negatively affects FPS."},
	{id = '', text = "It's not yet known if disabling it has any drawbacks."},
	{id = '', text = ""},
}
for i=1, #t_memWarning do
	t_memWarning[i].id = createTextImg(font2, 0, 1, t_memWarning[i].text, 25, 65+i*15)
end

function f_memWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
		animUpdate(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if data.attractMode then f_attractcfgCredits() end
		drawInfoCfgInputHints()
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; WORK IN PROGRESS INFORMATION
--;===========================================================
t_wip = {
	{id = '', text = "This option is still Under Development."},
}
for i=1, #t_wip do
	t_wip[i].id = createTextImg(font2, 0, 0, t_wip[i].text, 164, 222.5+i*15)
end

t_sdlBeta = {
	{id = '', text = "This option requires Sdlplugin New Version."},
}
for i=1, #t_sdlBeta do
	t_sdlBeta[i].id = createTextImg(font2, 0, 0, t_sdlBeta[i].text, 164, 222.5+i*15)
end

--;===========================================================
--; ONLINE INFORMATION
--;===========================================================
t_locked = {
	{id = '', text = "This option is Unavailable in Online Mode."},
}
for i=1, #t_locked do
	t_locked[i].id = createTextImg(font2, 0, 0, t_locked[i].text, 163, 222.5+i*15)
end

--;===========================================================
--; SAVE CONFIGURATION INFORMATION
--;===========================================================
t_restart = {
	{id = '', text = "The changes that you have made"},
	{id = '', text = "require Save and Back."},
}
for i=1, #t_restart do
	t_restart[i].id = createTextImg(font2, 0, 0, t_restart[i].text, 168, 200+i*15)
end

--;===========================================================
--; DEFAULT VALUES MESSAGE
--;===========================================================
txt_defaultquestion = createTextImg(jgFnt, 1, 0, "", 160, 110)

t_defaultMenu = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

--Default Window BG
defaultWindowBG = animNew(sprIkemen, [[
230,1, 0,0,
]])
animSetPos(defaultWindowBG, 83.5, 97)
animUpdate(defaultWindowBG)
animSetScale(defaultWindowBG, 1, 1)

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
	animUpdate(defaultWindowBG)
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
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--YES
		if defaultMenu == 1 then
			sndPlay(sndSys, 100, 1)
			if defaultAll == true then
				f_onlineDefault() --Set Default Options for Online/Offline Game
				f_offlineDefault() --Set ONLY Default Options for Offline Game
				modified = 1
				needReload = 1
			elseif defaultGame == true then
				f_gameDefault()
				modified = 1
			elseif defaultTeam == true then
				f_teamDefault()
				modified = 1
			elseif defaultZoom == true then
				f_zoomDefault()
				modified = 1
			elseif defaultSystem == true then
				f_systemDefault()
				modified = 1
			elseif defaultSelect == true then
				f_selectGlobalDefault()
				modified = 1
			elseif defaultRoster == true then
				f_selectDefault()
				modified = 1
			elseif defaultStage == true then
				f_stageDefault()
				modified = 1
			elseif defaultTime == true then
				f_timeDefault()
				modified = 1
			elseif defaultAudio == true then
				f_audioDefault()
				modified = 1
				needReload = 1
			elseif defaultSong == true then
				f_songDefault()
				modified = 1
			elseif defaultVideo == true then
				f_videoDefault()
				modified = 1
				needReload = 1
			elseif defaultInput == true then
				f_inputDefault()
			elseif defaultEngine == true then
				f_engineDefault()
				modified = 1
				needReload = 1
			elseif defaultVN == true then
				f_vnDefault()
				modified = 1
			elseif resetStats == true then
				f_defaultStats()
			end
		--NO
		else
			sndPlay(sndSys, 100, 2)
		end
		f_defaultReset()
	end
	cmdInput()
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
	defaultEngine = false
	defaultVN = false
	resetStats = false
end

--;===========================================================
--; SETTINGS MENU
--;===========================================================
txt_mainCfg = createTextImg(jgFnt, 0, 0, "OPTIONS", 159, 13)
txt_bar = createTextImg(opFnt, 0, 0, "|", 235, 17.5+5*15, .5, .5)

t_mainCfg = {
	{varID = textImgNew(), text = "Game Settings",	  				varText = ""},
	{varID = textImgNew(), text = "System Settings",  				varText = ""},
	{varID = textImgNew(), text = "Video Settings",  				varText = ""},
	{varID = textImgNew(), text = "Audio Settings",  				varText = ""},
	{varID = textImgNew(), text = "Input Settings",  				varText = ""},
	{varID = textImgNew(), text = "Engine Settings",  				varText = ""},
	{varID = textImgNew(), text = "Nickname",        				varText = data.userName},
	{varID = textImgNew(), text = "Netplay Port",        			varText = getListenPort()},
	{varID = textImgNew(), text = "Netplay Connection",				varText = data.connectMode},
	{varID = textImgNew(), text = "All Default Values",				varText = ""},
	{varID = textImgNew(), text = "              Save and Back",  	varText = ""},
	{varID = textImgNew(), text = "          Back Without Saving",	varText = ""},
	{varID = textImgNew(), text = "              Online Settings",	varText = ""}, --Only for Dev Purposes (Delete when test are finished)
}

function f_mainCfg()
	cmdInput()
	local onlinePort = ""
	local portEdit = false
	local playerName = ""
	local nameEdit = false
	local editDone = true
	local cursorPosY = 1
	local moveTxt = 0
	local mainCfg = 1
	local t = 0
	local bufl = 0
	local bufr = 0
	local bufu = 0
	local bufd = 0
	local exitSave = false
	local maxItems = 12
	f_defaultReset()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if defaultScreen == false and editDone == true then --Stay in Options screen (For Pop-Ups messages or Username and Online Port fields)
			--Save and Back
			if esc() or exitSave or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
				if data.erase == true then --reset stats files
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
				return
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				mainCfg = mainCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				mainCfg = mainCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			--Common Actions
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				if (mainCfg < 9 or mainCfg == 10) then sndPlay(sndSys, 100, 1) end
				--Game Settings
				if mainCfg == 1 then
					if data.engineMode == "FG" then f_gameCfg()
					elseif data.engineMode == "VN" then f_gameVNcfg()
					end
				--System Settings
				elseif mainCfg == 2 then
					if data.engineMode == "FG" then
						f_UICfg()
					else
						sndPlay(sndSys, 100, 5)
					end
				--Video Settings
				elseif mainCfg == 3 then
					f_videoCfg()
				--Audio Settings
				elseif mainCfg == 4 then
					f_audioCfg()
				--Input Settings
				elseif mainCfg == 5 then
					--commandBufReset(p1Cmd)
					--commandBufReset(p2Cmd)
					f_inputCfg()
				--Engine Settings
				elseif mainCfg == 6 then
					f_engineCfg()
				--Edit Player Name
				elseif mainCfg == 7 then
					playerName = ""
					nameEdit = true
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
				--Edit Online Port
				elseif mainCfg == 8 then
					onlinePort = ""
					portEdit = true
					editDone = false
					i = 0
					commandBufReset(p1Cmd)
					commandBufReset(p2Cmd)
				--Default Values
				elseif mainCfg == 10 then
					defaultAll = true
					defaultScreen = true
				--Save and Back
				elseif mainCfg == 11 then
					exitSave = true
				--Back Without Save
				elseif mainCfg == 12 then
					assert(loadfile(saveCfgPath))() --Load old data no saved
					if data.engineMode == "VN" then assert(loadfile(saveVNPath))() end
					f_loadCfg()
					f_loadEXCfg()
					setFullScreenMode(b_fullscreenMode)
					setScreenMode(b_screenMode)
					setAspectRatio(b_aspectMode)
					setResizableMode(b_resizableMode)
					setBorderMode(b_borderMode)
					--setGameRes(resolutionWidth,resolutionHeight)
					setBrightness(brightnessAdjust)
					setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
					setPanStr(pan_str / 100)
					needReload = 0
					data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
					sndPlay(sndSys, 100, 2)
					break
				--Online Settings from Offline Mode	
				elseif mainCfg == 13 then --Only for Dev Purposes (Delete when test are finished)
					f_onlineCfg()
				end
			end
		--Netplay Connection Type
			if mainCfg == 9 then
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
		--Draw Menu Info
		if needReload == 1 then
			for i=1, #t_restart do
				if t%60 < 40 then
					textImgDraw(t_restart[i].id)
				end
				t = t >= 60 and 0 or t + 1
			end
		end
		t_mainCfg[9].varText = data.connectMode
		--Player Name Change
		if not editDone and nameEdit == true then
			if esc() then
				clearInputText()
				sndPlay(sndSys, 100, 2)
				t_mainCfg[7].varText = data.userName--getUserName()
				nameEdit = false
				editDone = true
			end
			playerName = inputText('',true) --For not numbers use inputText('text',true)
			if clipboardPaste() then
				if string.match(getClipboardText(), '^([^"]*)$') then
					setInputText(getClipboardText())
				else
					sndPlay(sndSys, 100, 5)
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
			if commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
				if playerName ~= '' and playerName ~= nil then
					clearInputText()
					sndPlay(sndSys, 100, 1)
					data.userName = (tostring(playerName))
					modified = 1
					nameEdit = false
					editDone = true
				else 
					sndPlay(sndSys, 100, 5)
				end
			end
			if not editDone and nameEdit == true then
				t_mainCfg[7].varText = playerName
			end
		end
		--Online Port Change
		if not editDone and portEdit == true then
			if esc() then
				clearInputText()
				sndPlay(sndSys, 100, 2)
				t_mainCfg[8].varText = getListenPort()
				portEdit = false
				editDone = true
			end
			onlinePort = inputText('num',true)
			if clipboardPaste() then
				if string.match(getClipboardText(),'^%d+$') then 
					setInputText(getClipboardText())
				else
					sndPlay(sndSys, 100, 5)
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
			if commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
				if onlinePort ~= '' and onlinePort ~= nil and tonumber(onlinePort) ~= nil then --Port is a valid Number
					clearInputText()
					sndPlay(sndSys, 100, 1)
					setListenPort(tonumber(onlinePort))
					modified = 1
					portEdit = false
					editDone = true
				else 
					sndPlay(sndSys, 100, 5)
				end
			end
			if not editDone and portEdit == true then
				t_mainCfg[8].varText = onlinePort
			end
		end
		--Draw Text for Table
		for i=1, maxMainCfg do	
			if i > mainCfg - cursorPosY then
				if t_mainCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_mainCfg[i].varID, font2, 0, 1, t_mainCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_mainCfg[i].varID, font2, 0, -1, t_mainCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		--Draw Blinking Cursor for Username and Online Port Fields
		if not editDone then
			if i%60 < 30 then
				textImgPosDraw(txt_bar,235+1.5,17.5+cursorPosY*15)
			end
			i = i >= 60 and 0 or i + 1
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
		if defaultScreen == true then
			f_defaultMenu() --Show Default Screen Message
		else
			drawCfgInputHints()
		end
		if data.attractMode then f_attractcfgCredits() end
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
--; ONLINE SETTINGS
--;===========================================================
txt_onlineCfg = createTextImg(jgFnt, 0, 0, "ONLINE SETTINGS", 159, 13)

t_onlineCfg = {
	{varID = textImgNew(), text = "Game Settings",				varText = ""},
	{varID = textImgNew(), text = "Engine Settings",			varText = ""},
	{varID = textImgNew(), text = "Lobby Settings",				varText = ""},
	{varID = textImgNew(), text = "      SAVE AND PLAY",		varText = ""},
}

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
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			sndPlay(sndSys, 100, 1)
			--Game Settings
			if onlineCfg == 1 then
				f_gameCfg()
			--Engine Settings
			elseif onlineCfg == 2 then
				f_engineCfg()
			--Lobby Settings
			elseif onlineCfg == 3 then
				f_netplayCfg()
			--Save and Play
			elseif onlineCfg == 4 then
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
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
		if data.attractMode then f_attractcfgCredits() end
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
--; NETPLAY SETTINGS (WIP)
--;===========================================================
txt_netplayCfg = createTextImg(jgFnt, 0, 0, "NETPLAY ROOM SETTINGS", 159, 13)

t_netplayCfg = {
	{varID = textImgNew(), text = "VS Match",			varText = data.ftcontrol},
	{varID = textImgNew(), text = "Room Name",			varText = ""},
	{varID = textImgNew(), text = "Pause Menu",			varText = "No"},
	{varID = textImgNew(), text = "Looby Size",			varText = "2"},
	{varID = textImgNew(), text = "Spectate",			varText = "No"},
	{varID = textImgNew(), text = "Private Game",		varText = "Yes"},
	{varID = textImgNew(), text = "Show Names",			varText = "No"},
	{varID = textImgNew(), text = "Show Input Delay",	varText = "No"},
	{varID = textImgNew(), text = "          BACK",  	varText = ""},
}

function f_netplayCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local netplayCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			lockSetting = false
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			lockSetting = false
			netplayCfg = netplayCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			lockSetting = false
			netplayCfg = netplayCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		--Ranked Matchs
		elseif netplayCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
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
		elseif (netplayCfg == 2 or netplayCfg == 3 or netplayCfg == 4 or netplayCfg == 5 or netplayCfg == 6 or netplayCfg == 7 or netplayCfg == 8) and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
			lockSetting = true
		--BACK
		elseif netplayCfg == 9 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
			maxNetplayCfg = #t_netplayCfg
		elseif netplayCfg - cursorPosY > 0 then
			maxNetplayCfg = netplayCfg + maxItems - cursorPosY
		else
			maxNetplayCfg = maxItems
		end
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		animSetScale(optionsBG1, 220, maxNetplayCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_netplayCfg)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if lockSetting == true then
			for i=1, #t_wip do
				textImgDraw(t_wip[i].id)
			end
		end	
		if data.ftcontrol == -1 then
			t_netplayCfg[1].varText = "Unranked/FFA"
		else
			t_netplayCfg[1].varText = "Ranked/FT"..data.ftcontrol
		end		
		for i=1, maxNetplayCfg do	
			if i > netplayCfg - cursorPosY then
				if t_netplayCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_netplayCfg[i].varID, font2, 0, 1, t_netplayCfg[i].text, 85, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_netplayCfg[i].varID, font2, 0, -1, t_netplayCfg[i].varText, 235, 15+i*15-moveTxt))
				end
			end
		end
		if maxNetplayCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_netplayCfg > maxItems and maxNetplayCfg < #t_netplayCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawCfgInputHints()
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Difficulty Level",       varText = data.difficulty},
	{varID = textImgNew(), text = "Time Limit",         	varText = data.roundTime},
	{varID = textImgNew(), text = "Rounds to Win",      	varText = data.roundsNum},
	{varID = textImgNew(), text = "Max Draw Games",      	varText = drawNum},
	{varID = textImgNew(), text = "Life",               	varText = data.lifeMul.."%"},
	{varID = textImgNew(), text = "Auto-Guard",             varText = s_autoguard},
	{varID = textImgNew(), text = "Game Speed",  	        varText = s_gameSpeed},
	{varID = textImgNew(), text = "Quick Arcade Continue",	varText = s_quickCont},
	{varID = textImgNew(), text = "AI Palette",  	    	varText = data.aipal},
	{varID = textImgNew(), text = "AI Ramping",             varText = s_aiRamping},
	{varID = textImgNew(), text = "VS Kumite Amount",  	    varText = data.kumite},
	{varID = textImgNew(), text = "Team Settings",  		varText = ""},
	{varID = textImgNew(), text = "Zoom Settings",  		varText = ""},
	{varID = textImgNew(), text = "Default Values",		    varText = ""},
	{varID = textImgNew(), text = "          BACK",  		varText = ""},
}

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
			--Auto-Guard
			elseif gameCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.autoguard then
					data.autoguard = false
					s_autoguard = "No"
					modified = 1
				else
					data.autoguard = true
					s_autoguard = "Yes"
					modified = 1
				end
			--Game Speed
			elseif gameCfg == 7 then
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
			elseif gameCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.quickCont then
					data.quickCont = false
					s_quickCont = "No"
					modified = 1
				else
					data.quickCont = true
					s_quickCont = "Yes"
					modified = 1
				end
			--AI Palette
			elseif gameCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.aipal == "Default" then data.aipal = "Random"
				elseif data.aipal == "Random" then data.aipal = "Default"
				end
			--AI Ramping
			elseif gameCfg == 10 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.aiRamping then
					data.aiRamping = false
					s_aiRamping = "No"
					modified = 1
				else
					data.aiRamping = true
					s_aiRamping = "Yes"
					modified = 1
				end
			--VS Kumite Amount
			elseif gameCfg == 11 then
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
			elseif gameCfg == 12 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				f_teamCfg()
			--Zoom Settings
			elseif gameCfg == 13 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then	
				sndPlay(sndSys, 100, 1)
				f_zoomCfg()
			--Default Values
			elseif gameCfg == #t_gameCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultGame = true
				defaultScreen = true
			--BACK
			elseif gameCfg == #t_gameCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_gameCfg[6].varText = s_autoguard
		t_gameCfg[7].varText = s_gameSpeed
		t_gameCfg[8].varText = s_quickCont
		t_gameCfg[9].varText = data.aipal
		t_gameCfg[10].varText = s_aiRamping
		t_gameCfg[11].varText = data.kumite
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Single Vs Team Life",     	varText = data.team1VS2Life.."%"},
	{varID = textImgNew(), text = "Turns HP Recovery",       	varText = data.turnsRecoveryRate.."%"},
	{varID = textImgNew(), text = "Life Share", 				varText = s_teamLifeShare},
	{varID = textImgNew(), text = "Power Share", 				varText = s_teamPowerShare},
	{varID = textImgNew(), text = "Turns Players Limit",     	varText = data.numTurns},
	{varID = textImgNew(), text = "Simul Players Limit",     	varText = data.numSimul},
	{varID = textImgNew(), text = "Simul Type",              	varText = data.simulType},
	{varID = textImgNew(), text = "Co-Op CPU Team",          	varText = data.coopenemy},
	{varID = textImgNew(), text = "Default Values",  	  		varText = ""},
	{varID = textImgNew(), text = "          BACK",  			varText = ""},
}

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
			elseif teamCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.teamLifeShare then
					data.teamLifeShare = false
					s_teamLifeShare = "No"
					modified = 1
				else
					data.teamLifeShare = true
					s_teamLifeShare = "Yes"
					modified = 1
				end
		--Team Power Share
			elseif teamCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.teamPowerShare then
					data.teamPowerShare = false
					s_teamPowerShare = "No"
					modified = 1
				else
					data.teamPowerShare = true
					s_teamPowerShare = "Yes"
					modified = 1
				end
		--Turns Limit (by default also requires editing 'if(!.m.inRange!int?(1, 4, nt)){' in ssz/system-script.ssz)
			elseif teamCfg == 5 then
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
			elseif teamCfg == 6 then
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
			elseif teamCfg == 7 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				sndPlay(sndSys, 100, 0)
				if data.simulType == "Tag" then
					data.simulType = "Assist"
					modified = 1
				else
					data.simulType = "Tag"
					modified = 1
				end
		--Co-Op CPU Team Mode
			elseif teamCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
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
			elseif teamCfg == #t_teamCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultTeam = true
				defaultScreen = true
		--BACK
			elseif teamCfg == #t_teamCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_teamCfg[3].varText = s_teamLifeShare
		t_teamCfg[4].varText = s_teamPowerShare
		t_teamCfg[5].varText = data.numTurns
		t_teamCfg[6].varText = data.numSimul
		t_teamCfg[7].varText = data.simulType
		t_teamCfg[8].varText = data.coopenemy
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Zoom Active",    			varText = s_zoomActive},
	{varID = textImgNew(), text = "Max Zoom Out",   			varText = data.zoomMin},
	{varID = textImgNew(), text = "Max Zoom In",    			varText = data.zoomMax},
	{varID = textImgNew(), text = "Zoom Speed",     			varText = data.zoomSpeed},
	{varID = textImgNew(), text = "Default Values",  	 		varText = ""},
	{varID = textImgNew(), text = "          BACK", 			varText = ""},
}

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
			elseif zoomCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
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
			elseif zoomCfg == #t_zoomCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultZoom = true
				defaultScreen = true
			--BACK
			elseif zoomCfg == #t_zoomCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_zoomCfg[1].varText = s_zoomActive
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Language", 		           varText = data.language},
	{varID = textImgNew(), text = "Clock Format",              varText = data.clock},
	{varID = textImgNew(), text = "Date Format",               varText = data.date},
	{varID = textImgNew(), text = "Attract Mode",  	      	   varText = s_attractMode},
	{varID = textImgNew(), text = "Character Presentation",    varText = data.charPresentation},
	{varID = textImgNew(), text = "Versus Win Counter",  	   varText = s_vsDisplayWin},
	{varID = textImgNew(), text = "Win Screen",	    		   varText = data.winscreen},
	{varID = textImgNew(), text = "Character Select Settings", varText = ""},
	{varID = textImgNew(), text = "Stage Select Settings",     varText = ""},
	{varID = textImgNew(), text = "Timers Settings",  	  	   varText = ""},
	{varID = textImgNew(), text = "Songs Settings",	 		   varText = ""},
	{varID = textImgNew(), text = "Default Settings",  	  	   varText = ""},
	{varID = textImgNew(), text = "          BACK",  		   varText = ""},
}

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
			--Clock Display
			elseif UICfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if onlinegame then
					lockSetting = true
				else
					if commandGetState(p1Cmd, 'r') and data.clock == "Standard" then
						sndPlay(sndSys, 100, 0)
						data.clock = "Full Standard"
						modified = 1
					elseif commandGetState(p1Cmd, 'r') and data.clock == "Full Standard" then
						sndPlay(sndSys, 100, 0)
						data.clock = "Military"
						modified = 1
					elseif commandGetState(p1Cmd, 'r') and data.clock == "Military" then
						sndPlay(sndSys, 100, 0)
						data.clock = "Full Military"
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and data.clock == "Full Standard" then
						sndPlay(sndSys, 100, 0)
						data.clock = "Standard"
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and data.clock == "Military" then
						sndPlay(sndSys, 100, 0)
						data.clock = "Full Standard"
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and data.clock == "Full Military" then
						sndPlay(sndSys, 100, 0)
						data.clock = "Military"
						modified = 1
					end
				end
			--Date Display
			elseif UICfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if onlinegame then
					lockSetting = true
				else
					if commandGetState(p1Cmd, 'r') and data.date == "Type A" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type B"
						modified = 1
					elseif commandGetState(p1Cmd, 'r') and data.date == "Type B" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type C"
						modified = 1
					elseif commandGetState(p1Cmd, 'r') and data.date == "Type C" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type D"
						modified = 1
					elseif commandGetState(p1Cmd, 'r') and data.date == "Type D" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type E"
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and data.date == "Type B" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type A"
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and data.date == "Type C" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type B"
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and data.date == "Type D" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type C"
						modified = 1
					elseif commandGetState(p1Cmd, 'l') and data.date == "Type E" then
						sndPlay(sndSys, 100, 0)
						data.date = "Type D"
						modified = 1
					end
				end
			--Attract Mode
			elseif UICfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.attractMode then
						data.attractMode = false
						s_attractMode = "Disabled"
						modified = 1
						needReload = 1
					else
						data.attractMode = true
						s_attractMode = "Enabled"
						modified = 1
						needReload = 1
					end
				end
			--Character Presentation Display Type
			elseif UICfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.charPresentation == "Portrait" then
					sndPlay(sndSys, 100, 0)
					data.charPresentation = "Sprite"
					data.sffConversion = true
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.charPresentation == "Sprite" then
					sndPlay(sndSys, 100, 0)
					data.charPresentation = "Mixed"
					data.sffConversion = true
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.charPresentation == "Sprite" then
					sndPlay(sndSys, 100, 0)
					data.charPresentation = "Portrait"
					data.sffConversion = false
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.charPresentation == "Mixed" then
					sndPlay(sndSys, 100, 0)
					data.charPresentation = "Sprite"
					data.sffConversion = true
					modified = 1	
				end
			--Display Versus Win Counter
			elseif UICfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.vsDisplayWin then
						data.vsDisplayWin = false
						s_vsDisplayWin = "No"
						modified = 1
					else
						data.vsDisplayWin = true
						s_vsDisplayWin = "Yes"
						modified = 1
					end
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
			--Character Select Settings
			elseif UICfg == 8 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				f_selectCfg()
			--Stage Select Settings
			elseif UICfg == 9 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				f_stageCfg()
			--Timers Settings
			elseif UICfg == 10 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				f_timeCfg()
			--System Songs Settings
			elseif UICfg == 11 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 1)
					f_songCfg()
				end
			--Default Values
			elseif UICfg == #t_UICfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultSystem = true
				defaultScreen = true
			--BACK
			elseif UICfg == #t_UICfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_UICfg[2].varText = data.clock
		t_UICfg[3].varText = data.date
		t_UICfg[4].varText = s_attractMode
		t_UICfg[5].varText = data.charPresentation
		t_UICfg[6].varText = s_vsDisplayWin
		t_UICfg[7].varText = data.winscreen
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Edit Roster",	   	     	varText = ""},
	{varID = textImgNew(), text = "Roster Type",	   	     	varText = data.selectType},
	{varID = textImgNew(), text = "Palette Select",	    		varText = data.palType},
	{varID = textImgNew(), text = "Information",    			varText = data.charInfo},
	{varID = textImgNew(), text = "Random Portrait",	     	varText = data.randomPortrait},
	{varID = textImgNew(), text = "Random Select Rematch",		varText = data.randomCharRematch},
	{varID = textImgNew(), text = "Default Values",  	 		varText = ""},
	{varID = textImgNew(), text = "          BACK", 			varText = ""},
}

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
			elseif selectCfg == 1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				f_rosterCfg()
			--Character Select Display Type
			elseif selectCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
			elseif selectCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
			elseif selectCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.randomCharRematch == "Variable" then data.randomCharRematch = "Fixed"
				elseif data.randomCharRematch == "Fixed" then data.randomCharRematch = "Variable"
				end
				modified = 1
			--Default Values
			elseif selectCfg == #t_selectCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultSelect = true
				defaultScreen = true
			--BACK
			elseif selectCfg == #t_selectCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Rows",	   			     	varText = data.selectRows},
	{varID = textImgNew(), text = "Columns",		   	     	varText = data.selectColumns},
	{varID = textImgNew(), text = "Wrapping X",		   	     	varText = data.wrappingX},
	{varID = textImgNew(), text = "Wrapping Y",		   	     	varText = data.wrappingY},
	{varID = textImgNew(), text = "Cells Pos X",	    		varText = data.p1FaceX},
	{varID = textImgNew(), text = "Cells Pos Y",    			varText = data.p1FaceY},
	{varID = textImgNew(), text = "Cells Size X",	    		varText = data.cellSizeX},
	{varID = textImgNew(), text = "Cells Size Y",    			varText = data.cellSizeY},
	{varID = textImgNew(), text = "Cells Spacing X",     		varText = data.cellSpacingX},
	{varID = textImgNew(), text = "Cells Spacing Y",     		varText = data.cellSpacingY},
	{varID = textImgNew(), text = "Cells Scale X",     			varText = data.cellScaleX},
	{varID = textImgNew(), text = "Cells Scale Y",     			varText = data.cellScaleY},
	{varID = textImgNew(), text = "P1 Cursor Start Cell X",    	varText = data.p1SelX},
	{varID = textImgNew(), text = "P1 Cursor Start Cell Y",    	varText = data.p1SelY},
	{varID = textImgNew(), text = "P2 Cursor Start Cell X",    	varText = data.p2SelX},
	{varID = textImgNew(), text = "P2 Cursor Start Cell Y",    	varText = data.p2SelY},
	{varID = textImgNew(), text = "Default Values",  	 		varText = ""},
	--{varID = textImgNew(), text = "Reload Select.def", 	 		varText = ""},
	{varID = textImgNew(), text = "          BACK", 			varText = ""},
}

--Advanced Roster (BlazBlue Cross Tag Battle Roster Type)
t_rosterCfg2 = {
	{varID = textImgNew(), text = "Rows",	   			     	varText = data.selectRows},
	{varID = textImgNew(), text = "Columns",		   	     	varText = data.selectColumns},
	{varID = textImgNew(), text = "Hidden Rows",	    	 	varText = data.offsetRows},
	{varID = textImgNew(), text = "Hidden Columns",	   	     	varText = data.offsetColumns},
	{varID = textImgNew(), text = "Wrapping X",		   	     	varText = data.wrappingX},
	{varID = textImgNew(), text = "Wrapping Y",		   	     	varText = data.wrappingY},
	{varID = textImgNew(), text = "P1 Cells Pos X",	    		varText = data.p1FaceX},
	{varID = textImgNew(), text = "P1 Cells Pos Y",	   			varText = data.p1FaceY},
	{varID = textImgNew(), text = "P2 Cells Pos X",	    		varText = data.p2FaceX},
	{varID = textImgNew(), text = "P2 Cells Pos Y",	   			varText = data.p2FaceY},
	{varID = textImgNew(), text = "Cells Size X",	    		varText = data.cellSizeX},
	{varID = textImgNew(), text = "Cells Size Y",    			varText = data.cellSizeY},
	{varID = textImgNew(), text = "Cells Spacing X",     		varText = data.cellSpacingX},
	{varID = textImgNew(), text = "Cells Spacing Y",     		varText = data.cellSpacingY},
	{varID = textImgNew(), text = "Cells Scale X",     			varText = data.cellScaleX},
	{varID = textImgNew(), text = "Cells Scale Y",     			varText = data.cellScaleY},
	{varID = textImgNew(), text = "P1 Cursor Start Cell X",    	varText = data.p1SelX},
	{varID = textImgNew(), text = "P1 Cursor Start Cell Y",    	varText = data.p1SelY},
	{varID = textImgNew(), text = "P2 Cursor Start Cell X",    	varText = data.p2SelX},
	{varID = textImgNew(), text = "P2 Cursor Start Cell Y",    	varText = data.p2SelY},
	{varID = textImgNew(), text = "Default Values",  	 		varText = ""},
	--{varID = textImgNew(), text = "Reload Select.def", 	 		varText = ""},
	{varID = textImgNew(), text = "          BACK", 			varText = ""},
}

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
animUpdate(rosterCfgUpArrow)
animSetScale(rosterCfgUpArrow, 0.5, 0.5)

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
animUpdate(rosterCfgDownArrow)
animSetScale(rosterCfgDownArrow, 0.5, 0.5)

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
				elseif rosterCfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
					sndPlay(sndSys, 100, 0)
					if data.wrappingX then data.wrappingX = false
					else data.wrappingX = true
					end
					modified = 1
				--Character Select Cells Wrapping (Y Axis)
				elseif rosterCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
					elseif btnPalNo(p1Cmd) > 0 then
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
					elseif btnPalNo(p1Cmd) > 0 then
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
				elseif rosterCfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
					sndPlay(sndSys, 100, 0)
					if data.wrappingX then data.wrappingX = false
					else data.wrappingX = true
					end
					modified = 1
				--Character Select Cells Wrapping (Y Axis)
				elseif rosterCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
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
					elseif btnPalNo(p1Cmd) > 0 then
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
					elseif btnPalNo(p1Cmd) > 0 then
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
					elseif btnPalNo(p1Cmd) > 0 then
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
					elseif btnPalNo(p1Cmd) > 0 then
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
				elseif btnPalNo(p1Cmd) > 0 then
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
				elseif btnPalNo(p1Cmd) > 0 then
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
				elseif btnPalNo(p1Cmd) > 0 then
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
				elseif btnPalNo(p1Cmd) > 0 then
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
				elseif btnPalNo(p1Cmd) > 0 then
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
				elseif btnPalNo(p1Cmd) > 0 then
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
			elseif rosterCfg == #t_rosterCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultRoster = true
				defaultScreen = true
			--Reload Select.def
			--elseif rosterCfg == #t_rosterCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				--sndPlay(sndSys, 100, 1)
				--assert(loadfile("script/loader.lua"))()
			--BACK
			elseif rosterCfg == #t_rosterCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
					sndPlay(sndSys, 100, 5)
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
			if commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
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
					sndPlay(sndSys, 100, 5)
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Presentation",	        varText = data.stageType},
	{varID = textImgNew(), text = "Random Portrait",   		varText = data.randomStagePortrait},
	{varID = textImgNew(), text = "Information",      		varText = data.stageInfo},
	{varID = textImgNew(), text = "Random Select Rematch",	varText = data.randomStageRematch},
	{varID = textImgNew(), text = "Default Values",  	 	varText = ""},
	{varID = textImgNew(), text = "          BACK", 		varText = ""},
}

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
			elseif stageCfg == 4 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if data.randomStageRematch == "Variable" then data.randomStageRematch = "Fixed"
				elseif data.randomStageRematch == "Fixed" then data.randomStageRematch = "Variable"
				end
				modified = 1
			--Default Values
			elseif stageCfg == #t_stageCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultStage = true
				defaultScreen = true
			--BACK
			elseif stageCfg == #t_stageCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Character Select",   varText = data.selectTime .." Seconds"},
	{varID = textImgNew(), text = "Stage Select",   	varText = data.stageTime .." Seconds"},
	{varID = textImgNew(), text = "Order Select",     	varText = data.orderTime .." Seconds"},
	{varID = textImgNew(), text = "Rematch Option",	   	varText = data.rematchTime .." Seconds"},
	{varID = textImgNew(), text = "Service Screen", 	varText = data.serviceTime .." Seconds"},
	{varID = textImgNew(), text = "Attract Title", 		varText = data.attractTime .." Seconds"},
	{varID = textImgNew(), text = "Tower Select", 		varText = data.destinyTime .." Seconds"},
	{varID = textImgNew(), text = "Default Values",  	varText = ""},
	{varID = textImgNew(), text = "          BACK", 	varText = ""},
}

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
			elseif timeCfg == #t_timeCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultTime = true
				defaultScreen = true
			--BACK
			elseif timeCfg == #t_timeCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Main Menu", 						varText = ""},
	{varID = textImgNew(), text = "Character Select",				varText = ""},
	{varID = textImgNew(), text = "Challenger",		 				varText = ""},
	{varID = textImgNew(), text = "Default Values",  	 			varText = ""},
	{varID = textImgNew(), text = "                       BACK", 	varText = ""},
}

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
	songCfg = 1 --To read Above
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	while true do
		if not defaultScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
				sndPlay(sndSys, 100, 2)
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
			if songCfg == 1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				songsSettings = true --For identify purposes
				f_songMenu() --Go to Sound Test
			--Set Character Select Song
			elseif songCfg == 2 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				songsSettings = true
				f_songMenu()
			--Set Challenger Select Song
			elseif songCfg == 3 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				songsSettings = true
				f_songMenu()
			--Default Values
			elseif songCfg == #t_songCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultSong = true
				defaultScreen = true
			--BACK
			elseif songCfg == #t_songCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 2)
				if data.attractMode == true then playBGM(bgmTitle) else	f_menuMusic() end
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Master Volume",		varText = gl_vol.."%"},
	{varID = textImgNew(), text = "SFX Volume",			varText = se_vol.."%"},
	{varID = textImgNew(), text = "BGM Volume",			varText = bgm_vol.."%"},
	{varID = textImgNew(), text = "Audio Panning",   	varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{varID = textImgNew(), text = "Sample Rate",     	varText = freq},
	{varID = textImgNew(), text = "Channels",        	varText = s_channels},
	{varID = textImgNew(), text = "Buffer Samples",  	varText = buffer},
	{varID = textImgNew(), text = "Default Values",		varText = ""},
	{varID = textImgNew(), text = "          BACK",  	varText = ""},
}

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
			--SFX Volume
			elseif audioCfg == 2 then
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
			--BGM Volume
			elseif audioCfg == 3 then
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
			--Audio Panning
			elseif audioCfg == 4 then
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
			elseif audioCfg == 5 then
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
			elseif audioCfg == 6 then
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
			elseif audioCfg == 7 then
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
			elseif audioCfg == #t_audioCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultAudio = true
				defaultScreen = true
			--BACK
			elseif audioCfg == #t_audioCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_audioCfg[2].varText = se_vol.."%"
		t_audioCfg[3].varText = bgm_vol.."%"
		t_audioCfg[4].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
		t_audioCfg[5].varText = freq
		t_audioCfg[6].varText = s_channels
		t_audioCfg[7].varText = buffer
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Debug Mode",  	      		varText = s_debugMode},
	{varID = textImgNew(), text = "Save Debug Logs",        	varText = s_debugLog},
	{varID = textImgNew(), text = "Generate Characters List", 	varText = ""},
	{varID = textImgNew(), text = "Generate Stages List", 		varText = ""},
	{varID = textImgNew(), text = "Engine Mode",        		varText = data.engineMode},
	{varID = textImgNew(), text = "HelperMax",              	varText = HelperMaxEngine},
	{varID = textImgNew(), text = "PlayerProjectileMax",		varText = PlayerProjectileMaxEngine},
	{varID = textImgNew(), text = "ExplodMax",              	varText = ExplodMaxEngine},
	{varID = textImgNew(), text = "AfterImageMax",          	varText = AfterImageMaxEngine},
	{varID = textImgNew(), text = "Erase/Reset Statistics", 	varText = ""},
	{varID = textImgNew(), text = "Default Settings",  	  		varText = ""},
	{varID = textImgNew(), text = "          BACK",  	  		varText = ""},
}

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
			elseif engineCfg == 1 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.debugMode then
						data.debugMode = false
						s_debugMode = "Disabled"
						modified = 1
					else
						data.debugMode = true
						s_debugMode = "Enabled"
						modified = 1
					end
				end
			--Print Debug Logs
			elseif engineCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.debugLog then
						data.debugLog = false
						s_debugLog = "Disabled"
						modified = 1
					else
						data.debugLog = true
						s_debugLog = "Enabled"
						modified = 1
					end
				end
			--Generate Characters List
			elseif engineCfg == 3 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				generateCharsList("chars")
				sszOpen("save", "00_CharactersList.txt")
			--Generate Stages List
			elseif engineCfg == 4 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				generateStageList("stages")
				sszOpen("save", "00_ExtraStagesList.txt")
			--Engine Mode
			elseif engineCfg == 5 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.engineMode == "VN" then
						data.engineMode = "FG"
						modified = 1
						needReload = 1
					elseif data.engineMode == "FG" then
						data.engineMode = "VN"
						modified = 1
						needReload = 1
					end
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
			elseif engineCfg == 10 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then	
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 1)
					f_unlocksWarning()
				end
			--Default Values
			elseif engineCfg == #t_engineCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultEngine = true
				defaultScreen = true
			--BACK
			elseif engineCfg == #t_engineCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_engineCfg[1].varText = s_debugMode
		t_engineCfg[2].varText = s_debugLog
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
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Resolution",  		varText = ""},
	{varID = textImgNew(), text = "Screen Mode",  		varText = ""},
	{varID = textImgNew(), text = "Window Type", 		varText = ""},
	{varID = textImgNew(), text = "Fullscreen Type",	varText = ""},
	{varID = textImgNew(), text = "Aspect Ratio 16:9", 		varText = ""},
	{varID = textImgNew(), text = "Sdlplugin Version",	varText = ""},
	{varID = textImgNew(), text = "Brightness",			varText = ""},
	--{varID = textImgNew(), text = "OpenGL 2.0", 		varText = ""},
	--{varID = textImgNew(), text = "Save Memory", 		varText = ""},
	{varID = textImgNew(), text = "Default Graphics",	varText = ""},
	{varID = textImgNew(), text = "          BACK",  	varText = ""},
}

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
	while true do
		if b_fullscreenMode ~= getFullScreenMode() then
			if getFullScreenMode() then
				b_fullscreenMode = true
			else
				b_fullscreenMode = false
			end
			modified = 1
		end
		if b_screenMode ~= getScreenMode() then
			if getScreenMode() then
				b_screenMode = true
				s_screenMode = "Fullscreen"
			else
				b_screenMode = false
				s_screenMode = "Window"
			end
			t_videoCfg[2].varText = s_screenMode
			modified = 1
		end
		if b_aspectMode ~= getAspectRatio() then
			if getAspectRatio() then
				b_aspectMode = true
				s_aspectMode = "Yes"
			else
				b_aspectMode = false
				s_aspectMode = "No"
			end
			t_videoCfg[5].varText = s_aspectMode
			modified = 1
		end
		if b_borderMode ~= getBorderMode() then
			if getBorderMode() then
				b_borderMode = true
			else
				b_borderMode = false
			end
			modified = 1
		end
		if b_resizableMode ~= getResizableMode() then
			if getResizableMode() then
				b_resizableMode = true
			else
				b_resizableMode = false
			end
			modified = 1
		end
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
			--Resolution
			elseif videoCfg == 1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				if f_resCfg() then
					modified = 1
				end
			--Fullscreen
			elseif videoCfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if not b_screenMode then
					b_screenMode = true
					s_screenMode = "Fullscreen"
				else
					b_screenMode = false
					s_screenMode = "Window"
				end
				modified = 1
				setScreenMode(b_screenMode) --added via system-script.ssz
			--Window Type
			elseif videoCfg == 3 then
				if data.sdl == "Original" then
					lockSetting = true
				elseif data.sdl == "New" then
					if (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
						if commandGetState(p1Cmd, 'r') and data.windowType == "Original" then
							sndPlay(sndSys, 100, 0)
							data.windowType = "No Border"
							b_resizableMode = false
							b_borderMode = false
						elseif commandGetState(p1Cmd, 'r') and data.windowType == "No Border" then
							sndPlay(sndSys, 100, 0)
							data.windowType = "Resizable"
							b_resizableMode = true
							b_borderMode = true
						elseif commandGetState(p1Cmd, 'l') and data.windowType == "Resizable" then
							sndPlay(sndSys, 100, 0)
							data.windowType = "No Border"
							b_borderMode = false
							b_resizableMode = false
						elseif commandGetState(p1Cmd, 'l') and data.windowType == "No Border" then
							sndPlay(sndSys, 100, 0)
							data.windowType = "Original"
							b_resizableMode = false
							b_borderMode = true
						end
						modified = 1
						setResizableMode(b_resizableMode)
						setBorderMode(b_borderMode)
					end
				end
			--Fullscreen Type
			elseif videoCfg == 4 then
				if data.sdl == "Original" then
					lockSetting = true
				elseif data.sdl == "New" then
					if (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
						sndPlay(sndSys, 100, 0)
						if data.fullscreenType == "Exclusive" then
							data.fullscreenType = "Borderless"
							--b_aspectMode = false
							b_fullscreenMode = false
						elseif data.fullscreenType == "Borderless" then
							data.fullscreenType = "Exclusive"
							--b_aspectMode = false
							b_fullscreenMode = true
						end
						modified = 1
						--setAspectRatio(b_aspectMode)
						setFullScreenMode(b_fullscreenMode)
					end
				end
			--Keep Aspect Ratio
			elseif videoCfg == 5 then
				if data.sdl == "Original" then
					lockSetting = true
				elseif data.sdl == "New" and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
					if not b_aspectMode then
						b_aspectMode = true
						s_aspectMode = "Yes"
					else
						b_aspectMode = false
						s_aspectMode = "No"
					end
					modified = 1
					needReload = 1
					setAspectRatio(b_aspectMode)
				end
			--Sdlplugin
			elseif videoCfg == 6 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				if onlinegame then
					lockSetting = true
				else
					sndPlay(sndSys, 100, 0)
					if data.sdl == "Original" then
						data.sdl = "New"
						f_sdlWarning()
					elseif data.sdl == "New" then
						data.sdl = "Original"
					end
					modified = 1
					needReload = 1
				end
			--Brightness Adjust
			elseif videoCfg == 7 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
					if brightnessAdjust < 256 then
						brightnessAdjust = brightnessAdjust + 1
					--else
						--brightnessAdjust = 50
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
					modified = 1
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
					if brightnessAdjust > 50 then
						brightnessAdjust = brightnessAdjust - 1
					--else
						--brightnessAdjust = 256
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
			--[[OpenGL 2.0
			elseif videoCfg == 8 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if not b_openGL then
					b_openGL = true
					s_openGL = "Yes"
					f_glWarning()
					modified = 1
					needReload = 1				
				else
					b_openGL = false
					s_openGL = "No"
					modified = 1
					needReload = 0
				end
			]]
			--[[Save Memory
			elseif videoCfg == 9 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l') or btnPalNo(p1Cmd) > 0) then
				sndPlay(sndSys, 100, 0)
				if not b_saveMemory then
					b_saveMemory = true
					s_saveMemory = "Yes"
					f_memWarning()
					modified = 1
					needReload = 1
				else
					b_saveMemory = false
					s_saveMemory = "No"
					f_memWarning()
					modified = 1
					needReload = 1
				end
			]]
			--Default Values
			elseif videoCfg == #t_videoCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultVideo = true
				defaultScreen = true
			--BACK
			elseif videoCfg == #t_videoCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_videoCfg[1].varText = resolutionWidth.."x"..resolutionHeight
		t_videoCfg[2].varText = s_screenMode
		t_videoCfg[3].varText = data.windowType
		t_videoCfg[4].varText = data.fullscreenType
		t_videoCfg[5].varText = s_aspectMode
		t_videoCfg[6].varText = data.sdl
		t_videoCfg[7].varText = brightnessAdjust
		setBrightness(brightnessAdjust)
		--t_videoCfg[8].varText = s_openGL
		--t_videoCfg[9].varText = s_saveMemory
		if lockSetting == true then
			for i=1, #t_sdlBeta do
				textImgDraw(t_sdlBeta[i].id)
			end
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
		if data.attractMode then f_attractcfgCredits() end
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
--; ASPECT RATIO SETTINGS
--;===========================================================
txt_resCfg = createTextImg(jgFnt, 0, 0, "ASPECT RATIO SETTINGS", 159, 13)

t_resCfg = {
	{id = '', text = "4:3 Resolutions"},
	{id = '', text = "16:9 Resolutions"},
	{id = '', text = "16:10 Resolutions"},
	{id = '', text = "Extra Resolutions"},
	{id = '', text = "          BACK"},
}

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
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			--4:3 Resolutions
			if resCfg == 1 then
				sndPlay(sndSys, 100, 1)
				f_resCfg4_3()
			--16:9 Resolutions
			elseif resCfg == 2 then
				sndPlay(sndSys, 100, 1)
				f_resCfg16_9()
			--16:10 Resolutions
			elseif resCfg == 3 then
				sndPlay(sndSys, 100, 1)
				f_resCfg16_10()
			--Extra Resolutions
			elseif resCfg == 4 then
				sndPlay(sndSys, 100, 1)
				f_EXresCfg()
			--BACK
			else
				sndPlay(sndSys, 100, 2)
				break
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
		if data.attractMode then f_attractcfgCredits() end
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
--; 4:3 RESOLUTIONS
--;===========================================================
txt_resCfg4_3 = createTextImg(jgFnt, 0, 0, "RESOLUTION SELECT (4:3)", 159, 13)

t_resCfg4_3 = {
	{id = '', x = 320,  y = 240,  text = "320x240             (QVGA)"},
	{id = '', x = 512,  y = 384,  text = "512x384        (MACINTOSH)"},
	{id = '', x = 640,  y = 480,  text = "640x480              (VGA)"},
	{id = '', x = 800,  y = 600,  text = "800x600             (SVGA)"},
	{id = '', x = 960,  y = 720,  text = "960x720               (HD)"},
	{id = '', x = 1024, y = 768,  text = "1024x768             (XGA)"},
	{id = '', x = 1152, y = 864,  text = "1152x864            (XGA+)"},
	{id = '', x = 1200, y = 900,  text = "1200x900             (HD+)"},
	{id = '', x = 1280, y = 960,  text = "1280x960        (Quad-VGA)"},
	{id = '', x = 1440, y = 1080, text = "1440x1080            (FHD)"},
	{id = '', x = 1600, y = 1200, text = "1600x1200            (XGA)"},
	{id = '', x = 1920, y = 1440, text = "1920x1440          (UXGA+)"},
	{id = '', x = 2048, y = 1536, text = "2048x1536           (QXGA)"},
	{id = '', x = 3200, y = 2400, text = "3200x2400          (QUXGA)"},
	{id = '', x = 6400, y = 4800, text = "6400x4800          (HUXGA)"},
	{id = '', text = "          BACK "},
}

function f_resCfg4_3()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg4_3 = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	for i=1, #t_resCfg4_3 do
		if t_resCfg4_3[i].text == resolutionWidth.."x"..resolutionHeight then
			resCfg4_3 = i
			break
		end
	end
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg4_3 = resCfg4_3 - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg4_3 = resCfg4_3 + 1
		end
		if resCfg4_3 < 1 then
			resCfg4_3 = #t_resCfg4_3
			if #t_resCfg4_3 > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_resCfg4_3
			end
		elseif resCfg4_3 > #t_resCfg4_3 then
			resCfg4_3 = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (resCfg4_3 - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg4_3 - 1) * 15
		end
		if #t_resCfg4_3 <= maxItems then
			maxResCfg4_3 = #t_resCfg4_3
		elseif resCfg4_3 - cursorPosY > 0 then
			maxResCfg4_3 = resCfg4_3 + maxItems - cursorPosY
		else
			maxResCfg4_3 = maxItems
		end
		--Options
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			--BACK
			if resCfg4_3 == #t_resCfg4_3 then
				sndPlay(sndSys, 100, 2)
				return false
			--CHOOSE RESOLUTION
			else
				sndPlay(sndSys, 100, 1)
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
		animSetScale(optionsBG1, 220, maxResCfg4_3*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_resCfg4_3)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxResCfg4_3 do
			if i > resCfg4_3 - cursorPosY then
				t_resCfg4_3[i].id = createTextImg(font2, 0, 1, t_resCfg4_3[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_resCfg4_3[i].id)
			end
		end
		if maxResCfg4_3 > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_resCfg4_3 > maxItems and maxResCfg4_3 < #t_resCfg4_3 then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
		if data.attractMode then f_attractcfgCredits() end
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
--; 16:9 RESOLUTIONS
--;===========================================================
txt_resCfg16_9 = createTextImg(jgFnt, 0, 0, "RESOLUTION SELECT (16:9)", 159, 13)

t_resCfg16_9 = {
	{id = '', x = 427,  y = 240,  text = "427x240        (ULTRA LOW)"},
	{id = '', x = 640,  y = 360,  text = "640x360              (LOW)"},
	{id = '', x = 853,  y = 480,  text = "853x480               (SD)"},
	{id = '', x = 1280, y = 720,  text = "1280x720              (HD)"},
	{id = '', x = 1600, y = 900,  text = "1600x900             (HD+)"},
	{id = '', x = 1920, y = 1080, text = "1920x1080        (FULL HD)"},
	{id = '', x = 2048, y = 1152, text = "2048x1152          (QWXGA)"},
	{id = '', x = 2560, y = 1440, text = "2560x1440            (QHD)"},
	{id = '', x = 3840, y = 2160, text = "3840x2160        (4K UHDV)"},
	{id = '', text = "          BACK"},
}

function f_resCfg16_9()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg16_9 = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	for i=1, #t_resCfg16_9 do
		if t_resCfg16_9[i].text == resolutionWidth.."x"..resolutionHeight then
			resCfg16_9 = i
			break
		end
	end
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg16_9 = resCfg16_9 - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg16_9 = resCfg16_9 + 1
		end
		if resCfg16_9 < 1 then
			resCfg16_9 = #t_resCfg16_9
			if #t_resCfg16_9 > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_resCfg16_9
			end
		elseif resCfg16_9 > #t_resCfg16_9 then
			resCfg16_9 = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (resCfg16_9 - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg16_9 - 1) * 15
		end
		if #t_resCfg16_9 <= maxItems then
			maxResCfg16_9 = #t_resCfg16_9
		elseif resCfg16_9 - cursorPosY > 0 then
			maxResCfg16_9 = resCfg16_9 + maxItems - cursorPosY
		else
			maxResCfg16_9 = maxItems
		end
		--Options
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			--BACK
			if resCfg16_9 == #t_resCfg16_9 then
				sndPlay(sndSys, 100, 2)
				return false
			--CHOOSE RESOLUTION
			else
				sndPlay(sndSys, 100, 1)
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
		animSetScale(optionsBG1, 220, maxResCfg16_9*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_resCfg16_9)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxResCfg16_9 do
			if i > resCfg16_9 - cursorPosY then
				t_resCfg16_9[i].id = createTextImg(font2, 0, 1, t_resCfg16_9[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_resCfg16_9[i].id)
			end
		end
		if maxResCfg16_9 > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_resCfg16_9 > maxItems and maxResCfg16_9 < #t_resCfg16_9 then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
		if data.attractMode then f_attractcfgCredits() end
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
--; 16:10 RESOLUTIONS
--;===========================================================
txt_resCfg16_10 = createTextImg(jgFnt, 0, 0, "RESOLUTION SELECT (16:10)", 159, 13)

t_resCfg16_10 = {
	{id = '', x = 320,  y = 200,  text = "320x200              (CGA)"},
	{id = '', x = 1280, y = 800,  text = "1280x800            (WXGA)"},
	{id = '', x = 1440, y = 900,  text = "1440x900           (WXGA+)"},
	{id = '', x = 1680, y = 1050, text = "1680x1050         (WSXGA+)"},
	{id = '', x = 1920, y = 1200, text = "1920x1200          (WUXGA)"},
	{id = '', x = 2560, y = 1600, text = "2560x1600          (WQXGA)"},
	{id = '', x = 2880, y = 1800, text = "2880x1800  (RETINA DISPLAY)"},
	{id = '', x = 3840, y = 2400, text = "3840x2400         (WQUXGA)"},
	{id = '', x = 7680, y = 4800, text = "7680x4800         (WHUXGA)"},
	{id = '', text = "          BACK"},
}

function f_resCfg16_10()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local resCfg16_10 = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	for i=1, #t_resCfg16_10 do
		if t_resCfg16_10[i].text == resolutionWidth.."x"..resolutionHeight then
			resCfg16_10 = i
			break
		end
	end
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg16_10 = resCfg16_10 - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			resCfg16_10 = resCfg16_10 + 1
		end
		if resCfg16_10 < 1 then
			resCfg16_10 = #t_resCfg16_10
			if #t_resCfg16_10 > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_resCfg16_10
			end
		elseif resCfg16_10 > #t_resCfg16_10 then
			resCfg16_10 = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (resCfg16_10 - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (resCfg16_10 - 1) * 15
		end
		if #t_resCfg16_10 <= maxItems then
			maxResCfg16_10 = #t_resCfg16_10
		elseif resCfg16_10 - cursorPosY > 0 then
			maxResCfg16_10 = resCfg16_10 + maxItems - cursorPosY
		else
			maxResCfg16_10 = maxItems
		end
		--Options
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			--BACK
			if resCfg16_10 == #t_resCfg16_10 then
				sndPlay(sndSys, 100, 2)
				return false
			--CHOOSE RESOLUTION
			else
				sndPlay(sndSys, 100, 1)
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
		animSetScale(optionsBG1, 220, maxResCfg16_10*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_resCfg16_10)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxResCfg16_10 do
			if i > resCfg16_10 - cursorPosY then
				t_resCfg16_10[i].id = createTextImg(font2, 0, 1, t_resCfg16_10[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_resCfg16_10[i].id)
			end
		end
		if maxResCfg16_10 > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_resCfg16_10 > maxItems and maxResCfg16_10 < #t_resCfg16_10 then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
		if data.attractMode then f_attractcfgCredits() end
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
--; EXTRA RESOLUTIONS
--;===========================================================
txt_EXresCfg = createTextImg(jgFnt, 0, 0, "RESOLUTION SELECT", 159, 13)

t_EXresCfg = {
	{id = '', x = 400,  y = 254,  text = "400x254           (ARCADE)"},
	{id = '', x = 400,  y = 508,  text = "400x508        (ARCADE x2)"},
	{id = '', x = 640,  y = 350,  text = "640x350         (EGA 11:6)"},
	{id = '', x = 720,  y = 348,  text = "720x348         (HGC 60:9)"},
	{id = '', x = 720,  y = 350,  text = "720x350        (MDA 72:35)"},
	{id = '', x = 720,  y = 360,  text = "720x360    (APPLE LISA 2:1)"},
	{id = '', x = 1024, y = 600,  text = "1024x600 (CANAIMA MG101A3)"},
	{id = '', x = 1360, y = 768,  text = "1360x768      (WXGA 85:48)"},
	{id = '', x = 1366, y = 728,  text = "1366x728 (CANAIMA EF10M12)"},
	{id = '', x = 1200, y = 762,  text = "1200x762       (ARCADE x3)"},
	{id = '', x = 1280, y = 1024, text = "1280x1024       (SXGA 5:4)"},
	{id = '', x = 1600, y = 1016, text = "1600x1016      (ARCADE x4)"},
	{id = '', x = 2048, y = 1080, text = "2048x1080        (2K 17:9)"},
	{id = '', x = 2560, y = 2048, text = "2560x2048       (QSXA 5:4)"},
	{id = '', x = 3200, y = 2048, text = "3200x2048    (WQSXA 25:16)"},
	{id = '', x = 4096, y = 2160, text = "4096x2160  (4K CINEMA 17:9)"},
	{id = '', x = 5120, y = 4096, text = "5120x4096      (HSXGA 5:4)"},
	{id = '', x = 6400, y = 4096, text = "6400x4096   (WHSXGA 25:16)"},
	{id = '', x = 7680, y = 4320, text = "7680x4320         (8K UHD)"},
	--{id = '', x = 30720, y = 17208, text = "30720x17208 (24K SUPER DEATH BATMETAL)"},
	{id = '', text = "          BACK"},
}

function f_EXresCfg()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local EXresCfg = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	for i=1, #t_EXresCfg do
		if t_EXresCfg[i].text == resolutionWidth.."x"..resolutionHeight then
			EXresCfg = i
			break
		end
	end
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			return false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			EXresCfg = EXresCfg - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			EXresCfg = EXresCfg + 1
		end
		if EXresCfg < 1 then
			EXresCfg = #t_EXresCfg
			if #t_EXresCfg > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_EXresCfg
			end
		elseif EXresCfg > #t_EXresCfg then
			EXresCfg = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (EXresCfg - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (EXresCfg - 1) * 15
		end
		if #t_EXresCfg <= maxItems then
			maxEXresCfg = #t_EXresCfg
		elseif EXresCfg - cursorPosY > 0 then
			maxEXresCfg = EXresCfg + maxItems - cursorPosY
		else
			maxEXresCfg = maxItems
		end
		--Options
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			--BACK
			if EXresCfg == #t_EXresCfg then
				sndPlay(sndSys, 100, 2)
				return false
			--CHOOSE RESOLUTION
			else
				sndPlay(sndSys, 100, 1)
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
		animSetScale(optionsBG1, 220, maxEXresCfg*15)
		animSetWindow(optionsBG1, 80,20, 160,180)
		animDraw(optionsBG1)
		textImgDraw(txt_EXresCfg)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxEXresCfg do
			if i > EXresCfg - cursorPosY then
				t_EXresCfg[i].id = createTextImg(font2, 0, 1, t_EXresCfg[i].text, 85, 15+i*15-moveTxt)
				textImgDraw(t_EXresCfg[i].id)
			end
		end
		if maxEXresCfg > maxItems then
			animDraw(optionsUpArrow)
			animUpdate(optionsUpArrow)
		end
		if #t_EXresCfg > maxItems and maxEXresCfg < #t_EXresCfg then
			animDraw(optionsDownArrow)
			animUpdate(optionsDownArrow)
		end
		drawListInputHints()
		if data.attractMode then f_attractcfgCredits() end
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
	{varID = textImgNew(), text = "Keyboard Config",  		 varText = ""},
	{varID = textImgNew(), text = "Gamepad Config",	  		 varText = ""},
	--{varID = textImgNew(), text = "Player 1 Gamepad Status", varText = s_disablePadP1},
	--{varID = textImgNew(), text = "Player 2 Gamepad Status", varText = s_disablePadP2},
	{varID = textImgNew(), text = "Swap Gamepads", 			 varText = ""},
	{varID = textImgNew(), text = "Test Controls",  		 varText = ""},
	{varID = textImgNew(), text = "Default Controls",  		 varText = ""},
	{varID = textImgNew(), text = "             BACK",  	 varText = ""},
}

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
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
						sndPlay(sndSys, 100, 5)
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
		if data.attractMode then f_attractcfgCredits() end
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

function f_testMenu()
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
	local posYP2 = 122
	cmdInput()
	setSysCtrl(0) --Load Battle Controls from config.ssz
	f_cmdCodeReset()
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
		if data.attractMode then f_attractcfgCredits() end
		if cmdCode then f_cmdCode() end
		f_drawQuickText(txt_keyHint, font1, 0, 0, 'Press [SELECT] or [ESC] button to back', 162, 30)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; KEYBOARD MENU
--;===========================================================
txt_keyMenu = createTextImg(jgFnt, 0, 0, "KEYBOARD SETTINGS", 159, 13)

t_keyMenu = {
	{id = '', text = "Battle Controls"},
	{id = '', text = "Menu Controls"},
	{id = '', text = "          BACK"},
}

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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
					sndPlay(sndSys, 100, 5)
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
		if data.attractMode then f_attractcfgCredits() end
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
	{id = '', text = "Some of the connected Gamepads cannot be configured"},
	{id = '', text = "To make it work, will need to configure it manually"},
	{id = '', text = "in save/config.ssz file or use third-party software"},
	{id = '', text = ""},
}
for i=1, #t_tempWarning do
	t_tempWarning[i].id = createTextImg(font2, 0, 1, t_tempWarning[i].text, 25, 65+i*15)
end

function f_tempWarning()
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
		animUpdate(infoOptionsWindowBG)
		textImgDraw(txt_okOptions)
		animSetWindow(cursorBox, 87,133, 144,13)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if data.attractMode then f_attractcfgCredits() end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; GAMEPAD MENU
--;===========================================================
txt_joyMenu = createTextImg(jgFnt, 0, 0, "GAMEPAD SETTINGS", 159, 13)

t_joyMenu = {
	{id = '', text = "Battle Controls"},
	{id = '', text = "Menu Controls"},
	{id = '', text = "          BACK"},
}

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
		if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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
					sndPlay(sndSys, 100, 5)
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
		if data.attractMode then f_attractcfgCredits() end
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
txt_quickSaveKey = "PRESS ESC IN YOUR KEYBOARD TO QUICK SAVE AND BACK"

function f_drawBattleKeyAssets()
	animDraw(f_animVelocity(optionsBG0, -1, -1)) --BG
	textImgDraw(txt_battleCfg) --Title Text
--Player 1 Controls Window BG
	animSetScale(optionsBG2, 220, 15+maxKeyCfg*15)
	animSetWindow(optionsBG2, 2,20, 155,195)
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
				textImgDraw(f_updateTextImg(t_keyBattleCfg[i].varID, font2, 0, 1, t_keyBattleCfg[i].text, 7, 30+i*15-inputMoveTxt))
				textImgDraw(f_updateTextImg(t_keyBattleCfg[i].varID, font2, 0, -1, t_keyBattleCfg[i].varText, 152, 30+i*15-inputMoveTxt))
			end
		end
	end
--Draw Player 1 Arrows
	if maxKeyCfg > 12 then
		animDraw(optionsUpArrowP1)
		animUpdate(optionsUpArrowP1)
	end
	if #t_keyBattleCfg > 12 and maxKeyCfg < #t_keyBattleCfg then
		animDraw(optionsDownArrowP1)
		animUpdate(optionsDownArrowP1)
	end
--Player 2 Controls Window BG
	animSetScale(optionsBG2, 318, 15+maxKeyCfg2*15)
	animSetWindow(optionsBG2, 163,20, 155,195)
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
				textImgDraw(f_updateTextImg(t_keyBattleCfg2[i].varID, font2, 0, 1, t_keyBattleCfg2[i].text, 167, 30+i*15-inputMoveTxt2))
				textImgDraw(f_updateTextImg(t_keyBattleCfg2[i].varID, font2, 0, -1, t_keyBattleCfg2[i].varText, 314, 30+i*15-inputMoveTxt2))
			end
		end
	end
--Draw Player 2 Arrows
	if maxKeyCfg2 > 12 then
		animDraw(optionsUpArrowP2)
		animUpdate(optionsUpArrowP2)
	end
	if #t_keyBattleCfg2 > 12 and maxKeyCfg2 < #t_keyBattleCfg2 then
		animDraw(optionsDownArrowP2)
		animUpdate(optionsDownArrowP2)
	end
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
	local cursorLimit = 12
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
		end
		if btnPalNo(p1Cmd) > 0 then
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
				t_keyBattleCfg[keyCfg].varText = f_readBattleInput(t_keyBattleCfg[keyCfg].varText) --Get New Controls
				setInputConfig(playerNo, controller, t_keyBattleCfg[1].varText, t_keyBattleCfg[2].varText, t_keyBattleCfg[3].varText, t_keyBattleCfg[4].varText, t_keyBattleCfg[5].varText, t_keyBattleCfg[6].varText, t_keyBattleCfg[7].varText, t_keyBattleCfg[8].varText, t_keyBattleCfg[9].varText, t_keyBattleCfg[10].varText, t_keyBattleCfg[11].varText, t_keyBattleCfg[12].varText, t_keyBattleCfg[13].varText, t_keyBattleCfg[14].varText) --Apply and Load New Controls
			--Default Config
			elseif keyCfg == 15 then
				defaultP1 = true
			--End Config
			else
				configEnd = true
			end
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
		end
		if btnPalNo(p2Cmd) > 0 then
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
				t_keyBattleCfg2[keyCfg2].varText = f_readBattleInput(t_keyBattleCfg2[keyCfg2].varText)
				setInputConfig(playerNo+1, controller, t_keyBattleCfg2[1].varText, t_keyBattleCfg2[2].varText, t_keyBattleCfg2[3].varText, t_keyBattleCfg2[4].varText, t_keyBattleCfg2[5].varText, t_keyBattleCfg2[6].varText, t_keyBattleCfg2[7].varText, t_keyBattleCfg2[8].varText, t_keyBattleCfg2[9].varText, t_keyBattleCfg2[10].varText, t_keyBattleCfg2[11].varText, t_keyBattleCfg2[12].varText, t_keyBattleCfg2[13].varText, t_keyBattleCfg2[14].varText)
			--Default Config
			elseif keyCfg2 == 15 then
				defaultP2 = true
			--End Config
			else
				configEnd = true
			end
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
		textImgSetBank(txt_inputHint, 5)
		textImgSetText(txt_inputHint, txt_quickSaveKey)
		textImgSetAlign(txt_inputHint, 0)
		textImgPosDraw(txt_inputHint, 163, 238)
		if data.attractMode then f_attractcfgCredits() end
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
	animSetWindow(optionsBG2, 2,20, 155,195)
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
				textImgDraw(f_updateTextImg(t_keyMenuCfg[i].varID, font2, 0, 1, t_keyMenuCfg[i].text, 7, 30+i*15-inputMoveTxt))
				textImgDraw(f_updateTextImg(t_keyMenuCfg[i].varID, font2, 0, -1, t_keyMenuCfg[i].varText, 152, 30+i*15-inputMoveTxt))
			end
		end
	end
--Draw Player 1 Arrows
	if maxKeyCfg > 12 then
		animDraw(optionsUpArrowP1)
		animUpdate(optionsUpArrowP1)
	end
	if #t_keyMenuCfg > 12 and maxKeyCfg < #t_keyMenuCfg then
		animDraw(optionsDownArrowP1)
		animUpdate(optionsDownArrowP1)
	end
--Player 2 Controls Window BG
	animSetScale(optionsBG2, 318, 15+maxKeyCfg2*15)
	animSetWindow(optionsBG2, 163,20, 155,195)
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
				textImgDraw(f_updateTextImg(t_keyMenuCfg2[i].varID, font2, 0, 1, t_keyMenuCfg2[i].text, 167, 30+i*15-inputMoveTxt2))
				textImgDraw(f_updateTextImg(t_keyMenuCfg2[i].varID, font2, 0, -1, t_keyMenuCfg2[i].varText, 314, 30+i*15-inputMoveTxt2))
			end
		end
	end
--Draw Player 2 Arrows
	if maxKeyCfg2 > 12 then
		animDraw(optionsUpArrowP2)
		animUpdate(optionsUpArrowP2)
	end
	if #t_keyMenuCfg2 > 12 and maxKeyCfg2 < #t_keyMenuCfg2 then
		animDraw(optionsDownArrowP2)
		animUpdate(optionsDownArrowP2)
	end
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
	local cursorLimit = 12
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
		end
		if btnPalNo(p1Cmd) > 0 then
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
				t_keyMenuCfg[keyCfg].varText = f_readMenuInput(t_keyMenuCfg[keyCfg].varText)
				setInputConfig(playerNo+10, controller, t_keyMenuCfg[1].varText, t_keyMenuCfg[2].varText, t_keyMenuCfg[3].varText, t_keyMenuCfg[4].varText, t_keyMenuCfg[5].varText, t_keyMenuCfg[6].varText, t_keyMenuCfg[7].varText, t_keyMenuCfg[8].varText, t_keyMenuCfg[9].varText, t_keyMenuCfg[10].varText, t_keyMenuCfg[11].varText, t_keyMenuCfg[12].varText, t_keyMenuCfg[13].varText, t_keyMenuCfg[14].varText)
			--Default Config
			elseif keyCfg == 15 then
				defaultP1 = true
			--End Config
			else
				configEnd = true
			end
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
		end
		if btnPalNo(p2Cmd) > 0 then
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
				t_keyMenuCfg2[keyCfg2].varText = f_readMenuInput(t_keyMenuCfg2[keyCfg2].varText)
				setInputConfig(playerNo+11, controller, t_keyMenuCfg2[1].varText, t_keyMenuCfg2[2].varText, t_keyMenuCfg2[3].varText, t_keyMenuCfg2[4].varText, t_keyMenuCfg2[5].varText, t_keyMenuCfg2[6].varText, t_keyMenuCfg2[7].varText, t_keyMenuCfg2[8].varText, t_keyMenuCfg2[9].varText, t_keyMenuCfg2[10].varText, t_keyMenuCfg2[11].varText, t_keyMenuCfg2[12].varText, t_keyMenuCfg2[13].varText, t_keyMenuCfg2[14].varText)
			--Default Config
			elseif keyCfg2 == 15 then
				defaultP2 = true
			--End Config
			else
				configEnd = true
			end
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
		textImgSetBank(txt_inputHint, 5)
		textImgSetText(txt_inputHint, txt_quickSaveKey)
		textImgSetAlign(txt_inputHint, 0)
		textImgPosDraw(txt_inputHint, 163, 238)
		if data.attractMode then f_attractcfgCredits() end
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
				t_keyBattleCfg[i].varText = c
			else
				t_keyBattleCfg2[i].varText = c
			end
		else --Load Gamepad Controls
			if playerNo == 2 then
				t_keyBattleCfg[i].varText = c
			else
				t_keyBattleCfg2[i].varText = c
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
				t_keyMenuCfg[i].varText = c
			else
				t_keyMenuCfg2[i].varText = c
			end
		else --Load Gamepad Controls
			if playerNo == 2 then
				t_keyMenuCfg[i].varText = c
			else
				t_keyMenuCfg2[i].varText = c
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
	sndPlay(sndSys, 100, 5)
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
				textImgPosDraw(txt_inputHint, 5, 238) --Draw Hints for Left Side
			elseif p2waitingKey then
				textImgSetAlign(txt_inputHint, -1)
				textImgPosDraw(txt_inputHint, 315, 238) --Draw Hints for Right Side
			end
			t = t + 1
		end
	--Waiting Key Press
		if readTime > 10 then
			if esc() then getKeyboard = oldkey --No Replace
			--MAIN
			elseif returnKey() and controllerSet == 1 then getKeyboard = 'RETURN'
			elseif backspaceKey() and controllerSet == 1 then getKeyboard = 'BACKSPACE'
			elseif spaceKey() and controllerSet == 1 then getKeyboard = 'SPACE'			
			elseif aKey() and controllerSet == 1 then getKeyboard = 'a'
			elseif bKey() and controllerSet == 1 then getKeyboard = 'b'
			elseif cKey() and controllerSet == 1 then getKeyboard = 'c'
			elseif dKey() and controllerSet == 1 then getKeyboard = 'd'
			elseif eKey() and controllerSet == 1 then getKeyboard = 'e'
			elseif fKey() and controllerSet == 1 then getKeyboard = 'f'
			elseif gKey() and controllerSet == 1 then getKeyboard = 'g'
			elseif hKey() and controllerSet == 1 then getKeyboard = 'h'
			elseif iKey() and controllerSet == 1 then getKeyboard = 'i'
			elseif jKey() and controllerSet == 1 then getKeyboard = 'j'
			elseif kKey() and controllerSet == 1 then getKeyboard = 'k'
			elseif lKey() and controllerSet == 1 then getKeyboard = 'l'
			elseif mKey() and controllerSet == 1 then getKeyboard = 'm'
			elseif nKey() and controllerSet == 1 then getKeyboard = 'n'
			elseif oKey() and controllerSet == 1 then getKeyboard = 'o'
			elseif pKey() and controllerSet == 1 then getKeyboard = 'p'
			elseif qKey() and controllerSet == 1 then getKeyboard = 'q'
			elseif rKey() and controllerSet == 1 then getKeyboard = 'r'
			elseif sKey() and controllerSet == 1 then getKeyboard = 's'
			elseif tKey() and controllerSet == 1 then getKeyboard = 't'
			elseif uKey() and controllerSet == 1 then getKeyboard = 'u'
			elseif vKey() and controllerSet == 1 then getKeyboard = 'v'
			elseif wKey() and controllerSet == 1 then getKeyboard = 'w'
			elseif xKey() and controllerSet == 1 then getKeyboard = 'x'
			elseif yKey() and controllerSet == 1 then getKeyboard = 'y'
			elseif zKey() and controllerSet == 1 then getKeyboard = 'z'
			elseif zeroKey() and controllerSet == 1 then getKeyboard = '_0'
			elseif oneKey() and controllerSet == 1 then getKeyboard = '_1'
			elseif twoKey() and controllerSet == 1 then getKeyboard = '_2'
			elseif threeKey() and controllerSet == 1 then getKeyboard = '_3'
			elseif fourKey() and controllerSet == 1 then getKeyboard = '_4'
			elseif fiveKey() and controllerSet == 1 then getKeyboard = '_5'
			elseif sixKey() and controllerSet == 1 then getKeyboard = '_6'
			elseif sevenKey() and controllerSet == 1 then getKeyboard = '_7'
			elseif eightKey() and controllerSet == 1 then getKeyboard = '_8'
			elseif nineKey() and controllerSet == 1 then getKeyboard = '_9'
			elseif lshiftKey() and controllerSet == 1 then getKeyboard = 'LSHIFT'
			elseif rshiftKey() and controllerSet == 1 then getKeyboard = 'RSHIFT'
			elseif tabKey() and controllerSet == 1 then getKeyboard = 'TAB'
			elseif minusKey() and controllerSet == 1 then getKeyboard = 'MINUS'
			elseif equalsKey() and controllerSet == 1 then getKeyboard = 'EQUALS'
			elseif leftbracketKey() and controllerSet == 1 then getKeyboard = 'LEFTBRACKET'
			elseif rightbracketKey() and controllerSet == 1 then getKeyboard = 'RIGHTBRACKET'
			elseif backslashKey() and controllerSet == 1 then getKeyboard = 'BACKSLASH'
			elseif semicolonKey() and controllerSet == 1 then getKeyboard = 'SEMICOLON'
			elseif commaKey() and controllerSet == 1 then getKeyboard = 'COMMA'
			elseif periodKey() and controllerSet == 1 then getKeyboard = 'PERIOD'
			elseif slashKey() and controllerSet == 1 then getKeyboard = 'SLASH'
			--elseif nonushashKey() and controllerSet == 1 then getKeyboard = 'NONUSHASH'
			--elseif apostropheKey() and controllerSet == 1 then getKeyboard = 'APOSTROPHE'
			--elseif graveKey() and controllerSet == 1 then getKeyboard = 'GRAVE'
			--CONTROL
			elseif insertKey() and controllerSet == 1 then getKeyboard = 'INSERT'
			elseif homeKey() and controllerSet == 1 then getKeyboard = 'HOME'
			elseif pageupKey() and controllerSet == 1 then getKeyboard = 'PAGEUP'
			elseif deleteKey() and controllerSet == 1 then getKeyboard = 'DELETE'
			elseif endKey() and controllerSet == 1 then getKeyboard = 'END'
			elseif pagedownKey() and controllerSet == 1 then getKeyboard = 'PAGEDOWN'
			elseif upKey() and controllerSet == 1 then getKeyboard = 'UP'
			elseif downKey() and controllerSet == 1 then getKeyboard = 'DOWN'
			elseif leftKey() and controllerSet == 1 then getKeyboard = 'LEFT'
			elseif rightKey() and controllerSet == 1 then getKeyboard = 'RIGHT'
			--NUMPAD
			elseif kdivideKey() and controllerSet == 1 then getKeyboard = 'KP_DIVIDE'
			elseif kmultiplyKey() and controllerSet == 1 then getKeyboard = 'KP_MULTIPLY'
			elseif kminusKey() and controllerSet == 1 then getKeyboard = 'KP_MINUS'
			elseif kplusKey() and controllerSet == 1 then getKeyboard = 'KP_PLUS'
			elseif kenterKey() and controllerSet == 1 then getKeyboard = 'KP_ENTER'
			elseif kperiodKey() and controllerSet == 1 then getKeyboard = 'KP_PERIOD'
			elseif kzeroKey() and controllerSet == 1 then getKeyboard = 'KP_0'
			elseif koneKey() and controllerSet == 1 then getKeyboard = 'KP_1'
			elseif ktwoKey() and controllerSet == 1 then getKeyboard = 'KP_2'
			elseif kthreeKey() and controllerSet == 1 then getKeyboard = 'KP_3'
			elseif kfourKey() and controllerSet == 1 then getKeyboard = 'KP_4'
			elseif kfiveKey() and controllerSet == 1 then getKeyboard = 'KP_5'
			elseif ksixKey() and controllerSet == 1 then getKeyboard = 'KP_6'
			elseif ksevenKey() and controllerSet == 1 then getKeyboard = 'KP_7'
			elseif keightKey() and controllerSet == 1 then getKeyboard = 'KP_8'
			elseif knineKey() and controllerSet == 1 then getKeyboard = 'KP_9'
			--GAMEPAD
			elseif getInputID(gamepadData) ~= 101 and controllerSet == 2 then getKeyboard = getInputID(gamepadData)
			end
			--When you press a key to assing
			if getKeyboard ~= '' then
			--Prevent assing same keys between player 1 and player 2 battle controls (with this logic both players can have same keys in his own controls)
				if p1waitingKey then
					--JUMP [PLAYER 1] (t_keyBattleCfg[1].varText)
					if keyCfg == 1 and getKeyboard ~= t_keyBattleCfg2[1].varText and getKeyboard ~= t_keyBattleCfg2[2].varText and
					getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--CROUCH [PLAYER 1] (t_keyBattleCfg[2].varText)
					elseif keyCfg == 2 and getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--BACK [PLAYER 1] (t_keyBattleCfg[3].varText)
					elseif keyCfg == 3 and getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--FORWARD [PLAYER 1] (t_keyBattleCfg[4].varText)
					elseif keyCfg == 4 and getKeyboard ~= t_keyBattleCfg2[4].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[3].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--A [PLAYER 1] (t_keyBattleCfg[5].varText)
					elseif keyCfg == 5 and getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--B [PLAYER 1] (t_keyBattleCfg[6].varText)
					elseif keyCfg == 6 and getKeyboard ~= t_keyBattleCfg2[6].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[3].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--C [PLAYER 1] (t_keyBattleCfg[7].varText)
					elseif keyCfg == 7 and getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--X [PLAYER 1] (t_keyBattleCfg[8].varText)
					elseif keyCfg == 8 and getKeyboard ~= t_keyBattleCfg2[8].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[3].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--Y [PLAYER 1] (t_keyBattleCfg[9].varText)
					elseif keyCfg == 9 and getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--Z [PLAYER 1] (t_keyBattleCfg[10].varText)
					elseif keyCfg == 10 and getKeyboard ~= t_keyBattleCfg2[10].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[3].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--L [PLAYER 1] (t_keyBattleCfg[11].varText)
					elseif keyCfg == 11 and getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--R [PLAYER 1] (t_keyBattleCfg[12].varText)
					elseif keyCfg == 12 and getKeyboard ~= t_keyBattleCfg2[12].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[3].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--SELECT [PLAYER 1] (t_keyBattleCfg[13].varText)
					elseif keyCfg == 13 and getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[3].varText and getKeyboard ~= t_keyBattleCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--START [PLAYER 1] (t_keyBattleCfg[14].varText)
					elseif keyCfg == 14 and getKeyboard ~= t_keyBattleCfg2[14].varText and getKeyboard ~= t_keyBattleCfg2[1].varText and
					getKeyboard ~= t_keyBattleCfg2[2].varText and getKeyboard ~= t_keyBattleCfg2[4].varText and
					getKeyboard ~= t_keyBattleCfg2[5].varText and getKeyboard ~= t_keyBattleCfg2[6].varText and
					getKeyboard ~= t_keyBattleCfg2[7].varText and getKeyboard ~= t_keyBattleCfg2[8].varText and
					getKeyboard ~= t_keyBattleCfg2[9].varText and getKeyboard ~= t_keyBattleCfg2[10].varText and
					getKeyboard ~= t_keyBattleCfg2[11].varText and getKeyboard ~= t_keyBattleCfg2[12].varText and
					getKeyboard ~= t_keyBattleCfg2[13].varText and getKeyboard ~= t_keyBattleCfg2[3].varText then
						f_validKey()
						break
						cmdInput()
					--show a message that it key has been already added in player 2 controls
					else
						if controllerSet == 2 then --Allow same key as player 2 FOR GAMEPAD control because it will not affect the control
							f_validKey()
							break
							cmdInput()
						else
							f_invalidKey()
						end
					end
				elseif p2waitingKey then
					--JUMP [PLAYER 2] (t_keyBattleCfg2[1].varText)
					if keyCfg2 == 1 and getKeyboard ~= t_keyBattleCfg[1].varText and getKeyboard ~= t_keyBattleCfg[2].varText and
					getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--CROUCH [PLAYER 2] (t_keyBattleCfg2[2].varText)
					elseif keyCfg2 == 2 and getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--BACK [PLAYER 2] (t_keyBattleCfg2[3].varText)
					elseif keyCfg2 == 3 and getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--FORWARD [PLAYER 2] (t_keyBattleCfg2[4].varText)
					elseif keyCfg2 == 4 and getKeyboard ~= t_keyBattleCfg[4].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[3].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--A [PLAYER 2] (t_keyBattleCfg2[5].varText)
					elseif keyCfg2 == 5 and getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--B [PLAYER 2] (t_keyBattleCfg2[6].varText)
					elseif keyCfg2 == 6 and getKeyboard ~= t_keyBattleCfg[6].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[3].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--C [PLAYER 2] (t_keyBattleCfg2[7].varText)
					elseif keyCfg2 == 7 and getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--X [PLAYER 2] (t_keyBattleCfg2[8].varText)
					elseif keyCfg2 == 8 and getKeyboard ~= t_keyBattleCfg[8].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[3].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--Y [PLAYER 2] (t_keyBattleCfg2[9].varText)
					elseif keyCfg2 == 9 and getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--Z [PLAYER 2] (t_keyBattleCfg2[10].varText)
					elseif keyCfg2 == 10 and getKeyboard ~= t_keyBattleCfg[10].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[3].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--L [PLAYER 2] (t_keyBattleCfg2[11].varText)
					elseif keyCfg2 == 11 and getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--R [PLAYER 2] (t_keyBattleCfg2[12].varText)
					elseif keyCfg2 == 12 and getKeyboard ~= t_keyBattleCfg[12].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[3].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--SELECT [PLAYER 2] (t_keyBattleCfg2[13].varText)
					elseif keyCfg2 == 13 and getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[3].varText and getKeyboard ~= t_keyBattleCfg[14].varText then
						f_validKey()
						break
						cmdInput()
					--START [PLAYER 2] (t_keyBattleCfg2[14].varText)
					elseif keyCfg2 == 14 and getKeyboard ~= t_keyBattleCfg[14].varText and getKeyboard ~= t_keyBattleCfg[1].varText and
					getKeyboard ~= t_keyBattleCfg[2].varText and getKeyboard ~= t_keyBattleCfg[4].varText and
					getKeyboard ~= t_keyBattleCfg[5].varText and getKeyboard ~= t_keyBattleCfg[6].varText and
					getKeyboard ~= t_keyBattleCfg[7].varText and getKeyboard ~= t_keyBattleCfg[8].varText and
					getKeyboard ~= t_keyBattleCfg[9].varText and getKeyboard ~= t_keyBattleCfg[10].varText and
					getKeyboard ~= t_keyBattleCfg[11].varText and getKeyboard ~= t_keyBattleCfg[12].varText and
					getKeyboard ~= t_keyBattleCfg[13].varText and getKeyboard ~= t_keyBattleCfg[3].varText then
						f_validKey()
						break
						cmdInput()
					--show a message that it key has been already added in player 1 controls
					else
						if controllerSet == 2 then --Allow same key as player 1 FOR GAMEPAD control because it will not affect the control
							f_validKey()
							break
							cmdInput()
						else
							f_invalidKey()
						end
					end
				end
			end
		end
        if data.attractMode then f_attractcfgCredits() end			
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
				textImgPosDraw(txt_inputHint, 5, 238) --Draw Hints for Left Side
			elseif p2waitingKey then
				textImgSetAlign(txt_inputHint, -1)
				textImgPosDraw(txt_inputHint, 315, 238) --Draw Hints for Right Side
			end
			t = t + 1
		end
	--Waiting Key Press
		if readTime > 10 then
			if esc() then getKeyboard = oldkey --No Replace
			--MAIN
			elseif returnKey() and controllerSet == 1 then getKeyboard = 'RETURN'
			elseif backspaceKey() and controllerSet == 1 then getKeyboard = 'BACKSPACE'
			elseif spaceKey() and controllerSet == 1 then getKeyboard = 'SPACE'			
			elseif aKey() and controllerSet == 1 then getKeyboard = 'a'
			elseif bKey() and controllerSet == 1 then getKeyboard = 'b'
			elseif cKey() and controllerSet == 1 then getKeyboard = 'c'
			elseif dKey() and controllerSet == 1 then getKeyboard = 'd'
			elseif eKey() and controllerSet == 1 then getKeyboard = 'e'
			elseif fKey() and controllerSet == 1 then getKeyboard = 'f'
			elseif gKey() and controllerSet == 1 then getKeyboard = 'g'
			elseif hKey() and controllerSet == 1 then getKeyboard = 'h'
			elseif iKey() and controllerSet == 1 then getKeyboard = 'i'
			elseif jKey() and controllerSet == 1 then getKeyboard = 'j'
			elseif kKey() and controllerSet == 1 then getKeyboard = 'k'
			elseif lKey() and controllerSet == 1 then getKeyboard = 'l'
			elseif mKey() and controllerSet == 1 then getKeyboard = 'm'
			elseif nKey() and controllerSet == 1 then getKeyboard = 'n'
			elseif oKey() and controllerSet == 1 then getKeyboard = 'o'
			elseif pKey() and controllerSet == 1 then getKeyboard = 'p'
			elseif qKey() and controllerSet == 1 then getKeyboard = 'q'
			elseif rKey() and controllerSet == 1 then getKeyboard = 'r'
			elseif sKey() and controllerSet == 1 then getKeyboard = 's'
			elseif tKey() and controllerSet == 1 then getKeyboard = 't'
			elseif uKey() and controllerSet == 1 then getKeyboard = 'u'
			elseif vKey() and controllerSet == 1 then getKeyboard = 'v'
			elseif wKey() and controllerSet == 1 then getKeyboard = 'w'
			elseif xKey() and controllerSet == 1 then getKeyboard = 'x'
			elseif yKey() and controllerSet == 1 then getKeyboard = 'y'
			elseif zKey() and controllerSet == 1 then getKeyboard = 'z'
			elseif zeroKey() and controllerSet == 1 then getKeyboard = '_0'
			elseif oneKey() and controllerSet == 1 then getKeyboard = '_1'
			elseif twoKey() and controllerSet == 1 then getKeyboard = '_2'
			elseif threeKey() and controllerSet == 1 then getKeyboard = '_3'
			elseif fourKey() and controllerSet == 1 then getKeyboard = '_4'
			elseif fiveKey() and controllerSet == 1 then getKeyboard = '_5'
			elseif sixKey() and controllerSet == 1 then getKeyboard = '_6'
			elseif sevenKey() and controllerSet == 1 then getKeyboard = '_7'
			elseif eightKey() and controllerSet == 1 then getKeyboard = '_8'
			elseif nineKey() and controllerSet == 1 then getKeyboard = '_9'
			elseif lshiftKey() and controllerSet == 1 then getKeyboard = 'LSHIFT'
			elseif rshiftKey() and controllerSet == 1 then getKeyboard = 'RSHIFT'
			elseif tabKey() and controllerSet == 1 then getKeyboard = 'TAB'
			elseif minusKey() and controllerSet == 1 then getKeyboard = 'MINUS'
			elseif equalsKey() and controllerSet == 1 then getKeyboard = 'EQUALS'
			elseif leftbracketKey() and controllerSet == 1 then getKeyboard = 'LEFTBRACKET'
			elseif rightbracketKey() and controllerSet == 1 then getKeyboard = 'RIGHTBRACKET'
			elseif backslashKey() and controllerSet == 1 then getKeyboard = 'BACKSLASH'
			elseif semicolonKey() and controllerSet == 1 then getKeyboard = 'SEMICOLON'
			elseif commaKey() and controllerSet == 1 then getKeyboard = 'COMMA'
			elseif periodKey() and controllerSet == 1 then getKeyboard = 'PERIOD'
			elseif slashKey() and controllerSet == 1 then getKeyboard = 'SLASH'
			--elseif nonushashKey() and controllerSet == 1 then getKeyboard = 'NONUSHASH'
			--elseif apostropheKey() and controllerSet == 1 then getKeyboard = 'APOSTROPHE'
			--elseif graveKey() and controllerSet == 1 then getKeyboard = 'GRAVE'
			--CONTROL
			elseif insertKey() and controllerSet == 1 then getKeyboard = 'INSERT'
			elseif homeKey() and controllerSet == 1 then getKeyboard = 'HOME'
			elseif pageupKey() and controllerSet == 1 then getKeyboard = 'PAGEUP'
			elseif deleteKey() and controllerSet == 1 then getKeyboard = 'DELETE'
			elseif endKey() and controllerSet == 1 then getKeyboard = 'END'
			elseif pagedownKey() and controllerSet == 1 then getKeyboard = 'PAGEDOWN'
			elseif upKey() and controllerSet == 1 then getKeyboard = 'UP'
			elseif downKey() and controllerSet == 1 then getKeyboard = 'DOWN'
			elseif leftKey() and controllerSet == 1 then getKeyboard = 'LEFT'
			elseif rightKey() and controllerSet == 1 then getKeyboard = 'RIGHT'
			--NUMPAD
			elseif kdivideKey() and controllerSet == 1 then getKeyboard = 'KP_DIVIDE'
			elseif kmultiplyKey() and controllerSet == 1 then getKeyboard = 'KP_MULTIPLY'
			elseif kminusKey() and controllerSet == 1 then getKeyboard = 'KP_MINUS'
			elseif kplusKey() and controllerSet == 1 then getKeyboard = 'KP_PLUS'
			elseif kenterKey() and controllerSet == 1 then getKeyboard = 'KP_ENTER'
			elseif kperiodKey() and controllerSet == 1 then getKeyboard = 'KP_PERIOD'
			elseif kzeroKey() and controllerSet == 1 then getKeyboard = 'KP_0'
			elseif koneKey() and controllerSet == 1 then getKeyboard = 'KP_1'
			elseif ktwoKey() and controllerSet == 1 then getKeyboard = 'KP_2'
			elseif kthreeKey() and controllerSet == 1 then getKeyboard = 'KP_3'
			elseif kfourKey() and controllerSet == 1 then getKeyboard = 'KP_4'
			elseif kfiveKey() and controllerSet == 1 then getKeyboard = 'KP_5'
			elseif ksixKey() and controllerSet == 1 then getKeyboard = 'KP_6'
			elseif ksevenKey() and controllerSet == 1 then getKeyboard = 'KP_7'
			elseif keightKey() and controllerSet == 1 then getKeyboard = 'KP_8'
			elseif knineKey() and controllerSet == 1 then getKeyboard = 'KP_9'
			--GAMEPAD
			elseif getInputID(gamepadData) ~= 101 and controllerSet == 2 then getKeyboard = getInputID(gamepadData)
			end
			--When you press a key to assing
			if getKeyboard ~= '' then
			--Prevent assing same keys between player 1 and player 2 menu controls (with this logic all keys assigned for both players need to be diferents)
				if p1waitingKey then
					--UP [PLAYER 1] (t_keyMenuCfg[1].varText)
					if keyCfg == 1 and getKeyboard ~= t_keyMenuCfg[2].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[2].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--DOWN [PLAYER 1] (t_keyMenuCfg[2].varText)
					elseif keyCfg == 2 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[2].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--LEFT [PLAYER 1] (t_keyMenuCfg[3].varText)
					elseif keyCfg == 3 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--RIGHT [PLAYER 1] (t_keyMenuCfg[4].varText)
					elseif keyCfg == 4 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--A [PLAYER 1] (t_keyMenuCfg[5].varText)
					elseif keyCfg == 5 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[5].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--B [PLAYER 1] (t_keyMenuCfg[6].varText)
					elseif keyCfg == 6 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--C [PLAYER 1] (t_keyMenuCfg[7].varText)
					elseif keyCfg == 7 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[7].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--X [PLAYER 1] (t_keyMenuCfg[8].varText)
					elseif keyCfg == 8 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--Y [PLAYER 1] (t_keyMenuCfg[9].varText)
					elseif keyCfg == 9 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[9].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--Z [PLAYER 1] (t_keyMenuCfg[10].varText)
					elseif keyCfg == 10 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--SCREENSHOT [PLAYER 1] (t_keyMenuCfg[11].varText)
					elseif keyCfg == 11 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[11].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--CONFIRM [PLAYER 1] (t_keyMenuCfg[12].varText)
					elseif keyCfg == 12 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--RETURN [PLAYER 1] (t_keyMenuCfg[13].varText)
					elseif keyCfg == 13 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[13].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--MENU/PAUSE [PLAYER 1] (t_keyMenuCfg[14].varText)
					elseif keyCfg == 14 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg2[14].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[3].varText then
						f_validKey()
						break
						cmdInput()
					--show a message that it key has been already added
					else
						if controllerSet == 2 then --Allow same key as player 2 FOR GAMEPAD control because it will not affect the control but is missing that those of the same player are not repeated
							f_validKey()
							break
							cmdInput()
						else
							f_invalidKey()
						end
					end
				elseif p2waitingKey then
					--UP [PLAYER 2] (t_keyMenuCfg2[1].varText)
					if keyCfg2 == 1 and getKeyboard ~= t_keyMenuCfg[2].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg[1].varText and getKeyboard ~= t_keyMenuCfg2[2].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--DOWN [PLAYER 2] (t_keyMenuCfg2[2].varText)
					elseif keyCfg2 == 2 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[2].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--LEFT [PLAYER 2] (t_keyMenuCfg2[3].varText)
					elseif keyCfg2 == 3 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--RIGHT [PLAYER 2] (t_keyMenuCfg2[4].varText)
					elseif keyCfg2 == 4 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--A [PLAYER 2] (t_keyMenuCfg2[5].varText)
					elseif keyCfg2 == 5 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[5].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--B [PLAYER 2] (t_keyMenuCfg2[6].varText)
					elseif keyCfg2 == 6 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--C [PLAYER 2] (t_keyMenuCfg2[7].varText)
					elseif keyCfg2 == 7 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[7].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--X [PLAYER 2] (t_keyMenuCfg2[8].varText)
					elseif keyCfg2 == 8 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--Y [PLAYER 2] (t_keyMenuCfg2[9].varText)
					elseif keyCfg2 == 9 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[9].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--Z [PLAYER 2] (t_keyMenuCfg2[10].varText)
					elseif keyCfg2 == 10 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--SCREENSHOT [PLAYER 2] (t_keyMenuCfg2[11].varText)
					elseif keyCfg2 == 11 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[11].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--CONFIRM [PLAYER 2] (t_keyMenuCfg2[12].varText)
					elseif keyCfg2 == 12 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[3].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--RETURN [PLAYER 2] (t_keyMenuCfg2[13].varText)
					elseif keyCfg2 == 13 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[3].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[13].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[3].varText and getKeyboard ~= t_keyMenuCfg2[14].varText then
						f_validKey()
						break
						cmdInput()
					--MENU/PAUSE [PLAYER 2] (t_keyMenuCfg2[14].varText)
					elseif keyCfg2 == 14 and getKeyboard ~= t_keyMenuCfg[1].varText and
					getKeyboard ~= t_keyMenuCfg[2].varText and getKeyboard ~= t_keyMenuCfg[4].varText and
					getKeyboard ~= t_keyMenuCfg[5].varText and getKeyboard ~= t_keyMenuCfg[6].varText and
					getKeyboard ~= t_keyMenuCfg[7].varText and getKeyboard ~= t_keyMenuCfg[8].varText and
					getKeyboard ~= t_keyMenuCfg[9].varText and getKeyboard ~= t_keyMenuCfg[10].varText and
					getKeyboard ~= t_keyMenuCfg[11].varText and getKeyboard ~= t_keyMenuCfg[12].varText and
					getKeyboard ~= t_keyMenuCfg[13].varText and getKeyboard ~= t_keyMenuCfg[3].varText and
					--
					getKeyboard ~= t_keyMenuCfg2[1].varText and getKeyboard ~= t_keyMenuCfg[14].varText and
					getKeyboard ~= t_keyMenuCfg2[2].varText and getKeyboard ~= t_keyMenuCfg2[4].varText and
					getKeyboard ~= t_keyMenuCfg2[5].varText and getKeyboard ~= t_keyMenuCfg2[6].varText and
					getKeyboard ~= t_keyMenuCfg2[7].varText and getKeyboard ~= t_keyMenuCfg2[8].varText and
					getKeyboard ~= t_keyMenuCfg2[9].varText and getKeyboard ~= t_keyMenuCfg2[10].varText and
					getKeyboard ~= t_keyMenuCfg2[11].varText and getKeyboard ~= t_keyMenuCfg2[12].varText and
					getKeyboard ~= t_keyMenuCfg2[13].varText and getKeyboard ~= t_keyMenuCfg2[3].varText then
						f_validKey()
						break
						cmdInput()
					--show a message that it key has been already added
					else
						if controllerSet == 2 then --Allow same key as player 1 FOR GAMEPAD control because it will not affect the control but is missing that those of the same player are not repeated
							f_validKey()
							break
							cmdInput()
						else
							f_invalidKey()
						end
					end
				end
			end
		end
        if data.attractMode then f_attractcfgCredits() end			
		refresh()
	end
	local key = getKeyboard
	return key
end

function f_keyBattleSave(playerNo, controller)
	if playerNo == 0 or playerNo == 2 then --Save Player 1 Battle Controls
		--Keyboard
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyBattleCfg[1].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[2].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[3].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[4].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[5].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[6].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[7].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[8].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[9].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[10].varText .. ',\n  (int)k_t::'.. t_keyBattleCfg[11].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[12].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[13].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg[14].varText .. ');')
		--Gamepad
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ', ' .. t_keyBattleCfg[1].varText .. ', ' .. t_keyBattleCfg[2].varText .. ', ' .. t_keyBattleCfg[3].varText .. ', ' .. t_keyBattleCfg[4].varText .. ', ' .. t_keyBattleCfg[5].varText .. ', ' .. t_keyBattleCfg[6].varText .. ', ' .. t_keyBattleCfg[7].varText .. ', ' .. t_keyBattleCfg[8].varText .. ', ' .. t_keyBattleCfg[9].varText .. ', ' .. t_keyBattleCfg[10].varText .. ', ' .. t_keyBattleCfg[11].varText .. ', ' .. t_keyBattleCfg[12].varText .. ', ' .. t_keyBattleCfg[13].varText .. ', ' .. t_keyBattleCfg[14].varText .. ');')
	else --Save Player 2 Battle Controls
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyBattleCfg2[1].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[2].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[3].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[4].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[5].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[6].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[7].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[8].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[9].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[10].varText .. ',\n  (int)k_t::'.. t_keyBattleCfg2[11].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[12].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[13].varText .. ',\n  (int)k_t::' .. t_keyBattleCfg2[14].varText .. ');')
		
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo .. '].set(\n  ' .. controller .. ', ' .. t_keyBattleCfg2[1].varText .. ', ' .. t_keyBattleCfg2[2].varText .. ', ' .. t_keyBattleCfg2[3].varText .. ', ' .. t_keyBattleCfg2[4].varText .. ', ' .. t_keyBattleCfg2[5].varText .. ', ' .. t_keyBattleCfg2[6].varText .. ', ' .. t_keyBattleCfg2[7].varText .. ', ' .. t_keyBattleCfg2[8].varText .. ', ' .. t_keyBattleCfg2[9].varText .. ', ' .. t_keyBattleCfg2[10].varText .. ', ' .. t_keyBattleCfg2[11].varText .. ', ' .. t_keyBattleCfg2[12].varText .. ', ' .. t_keyBattleCfg2[13].varText .. ', ' .. t_keyBattleCfg2[14].varText .. ');')
	end
end

function f_keyMenuSave(playerNo, controller)
	if playerNo == 0 or playerNo == 2 then --Save Player 1 Menu Controls
		--Keyboard
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyMenuCfg[1].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[2].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[3].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[4].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[5].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[6].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[7].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[8].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[9].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[10].varText .. ',\n  (int)k_t::'.. t_keyMenuCfg[11].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[12].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[13].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg[14].varText .. ');')
		--Gamepad
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ', ' .. t_keyMenuCfg[1].varText .. ', ' .. t_keyMenuCfg[2].varText .. ', ' .. t_keyMenuCfg[3].varText .. ', ' .. t_keyMenuCfg[4].varText .. ', ' .. t_keyMenuCfg[5].varText .. ', ' .. t_keyMenuCfg[6].varText .. ', ' .. t_keyMenuCfg[7].varText .. ', ' .. t_keyMenuCfg[8].varText .. ', ' .. t_keyMenuCfg[9].varText .. ', ' .. t_keyMenuCfg[10].varText .. ', ' .. t_keyMenuCfg[11].varText .. ', ' .. t_keyMenuCfg[12].varText .. ', ' .. t_keyMenuCfg[13].varText .. ', ' .. t_keyMenuCfg[14].varText .. ');')
	else --Save Player 2 Menu Controls
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ',\n  (int)k_t::' .. t_keyMenuCfg2[1].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[2].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[3].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[4].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[5].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[6].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[7].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[8].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[9].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[10].varText .. ',\n  (int)k_t::'.. t_keyMenuCfg2[11].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[12].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[13].varText .. ',\n  (int)k_t::' .. t_keyMenuCfg2[14].varText .. ');')
		
		s_configSSZ = s_configSSZ:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);',
		'in.new[' .. playerNo+10 .. '].set(\n  ' .. controller .. ', ' .. t_keyMenuCfg2[1].varText .. ', ' .. t_keyMenuCfg2[2].varText .. ', ' .. t_keyMenuCfg2[3].varText .. ', ' .. t_keyMenuCfg2[4].varText .. ', ' .. t_keyMenuCfg2[5].varText .. ', ' .. t_keyMenuCfg2[6].varText .. ', ' .. t_keyMenuCfg2[7].varText .. ', ' .. t_keyMenuCfg2[8].varText .. ', ' .. t_keyMenuCfg2[9].varText .. ', ' .. t_keyMenuCfg2[10].varText .. ', ' .. t_keyMenuCfg2[11].varText .. ', ' .. t_keyMenuCfg2[12].varText .. ', ' .. t_keyMenuCfg2[13].varText .. ', ' .. t_keyMenuCfg2[14].varText .. ');')
	end
end

--;===========================================================
--; VISUAL NOVEL SETTINGS
--;===========================================================
txt_gameVNcfg = createTextImg(jgFnt, 0, 0, "GAME SETTINGS", 159, 13)

t_gameVNcfg = {
	{varID = textImgNew(), text = "Language", 		           	varText = data.language},
	{varID = textImgNew(), text = "Clock Format",              	varText = data.clock},
	{varID = textImgNew(), text = "Date Format",               	varText = data.date},
	{varID = textImgNew(), text = "Text Speed", 			 	varText = ""},
	{varID = textImgNew(), text = "Text BG Transparency", 	 	varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"},
	{varID = textImgNew(), text = "Auto Skip Text", 		 	varText = ""},
	--{varID = textImgNew(), text = "Auto Save",				 	varText = ""},
	--{varID = textImgNew(), text = "Default Settings",  	  	   	varText = ""},
	{varID = textImgNew(), text = "          BACK",  		   	varText = ""},
}

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
			--Clock Display
			elseif gameVNcfg == 2 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.clock == "Standard" then
					sndPlay(sndSys, 100, 0)
					data.clock = "Full Standard"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.clock == "Full Standard" then
					sndPlay(sndSys, 100, 0)
					data.clock = "Military"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.clock == "Military" then
					sndPlay(sndSys, 100, 0)
					data.clock = "Full Military"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.clock == "Full Standard" then
					sndPlay(sndSys, 100, 0)
					data.clock = "Standard"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.clock == "Military" then
					sndPlay(sndSys, 100, 0)
					data.clock = "Full Standard"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.clock == "Full Military" then
					sndPlay(sndSys, 100, 0)
					data.clock = "Military"
					modified = 1
				end
			--Date Display
			elseif gameVNcfg == 3 and (commandGetState(p1Cmd, 'r') or commandGetState(p1Cmd, 'l')) then
				if commandGetState(p1Cmd, 'r') and data.date == "Type A" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type B"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.date == "Type B" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type C"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.date == "Type C" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type D"
					modified = 1
				elseif commandGetState(p1Cmd, 'r') and data.date == "Type D" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type E"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.date == "Type B" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type A"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.date == "Type C" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type B"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.date == "Type D" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type C"
					modified = 1
				elseif commandGetState(p1Cmd, 'l') and data.date == "Type E" then
					sndPlay(sndSys, 100, 0)
					data.date = "Type D"
					modified = 1
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
			elseif gameVNcfg == 6 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sndSys, 100, 1)
				if data.VNautoSkip then data.VNautoSkip = false else data.VNautoSkip = true end
			--Auto Save (TODO)
				
			--Default Values
			--[[
			elseif gameVNcfg == #t_gameVNcfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
				sndPlay(sndSys, 100, 1)
				defaultVN = true
				defaultScreen = true
			]]
			--BACK
			elseif gameVNcfg == #t_gameVNcfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
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
		t_gameVNcfg[2].varText = data.clock
		t_gameVNcfg[3].varText = data.date
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
		if data.attractMode then f_attractcfgCredits() end
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
	{id = '', text = "   All unlocked data or progress will be delete."},
}
for i=1, #t_unlocksWarning do
	t_unlocksWarning[i].id = createTextImg(font2, 0, 1, t_unlocksWarning[i].text, 25, 65+i*15)
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
		if data.attractMode then f_attractcfgCredits() end
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

--Load Inputs for Inputs Hints Data
f_inputMenuRead(0, -1) -- 0=P1, -1=Keyboard
f_inputMenuRead(1, -1) -- 1=P2

f_inputBattleRead(0, -1) -- 0=P1, -1=Keyboard
f_inputBattleRead(1, -1) -- 1=P2

if data.debugLog then
	f_printTable(t_keyBattleCfg, "save/debug/battleInputsP1.txt")
	f_printTable(t_keyBattleCfg2, "save/debug/battleInputsP2.txt")
	
	f_printTable(t_keyMenuCfg, "save/debug/menuInputsP1.txt")
	f_printTable(t_keyMenuCfg2, "save/debug/menuInputsP2.txt")
end