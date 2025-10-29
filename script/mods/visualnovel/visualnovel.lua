local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
sprVN = sffNew("script/mods/visualnovel/visualnovel.sff") --Load Visual Novel Sprites
assert(loadfile("script/mods/visualnovel/assets.lua"))() --Load Visual Novel Assets Definition
vnDef = "script/mods/visualnovel/vnselect.def" --Load Visual Novels
bgmVNIntro = "sound/system/Ranking.mp3"
table.insert(t_chroniclesMenu,2,{text = "VISUAL NOVEL", gotomenu = "f_vnMenu()", id = textImgNew()}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
--;===========================================================
--; DATA DEFINITION
--;===========================================================
vn = require("save.vn") --Create global space variable (accessing variables between visual novel modules)
saveVNPath = "save/vn_sav.lua"
assert(loadfile(saveVNPath))() --visual novel data

--Data loading from vn_sav.lua
local vnFile = io.open(saveVNPath,"r")
s_vndataLUA = vnFile:read("*all")
vnFile:close()

--Data saving to vn_sav.lua
function f_saveVN()
	local t_vn = {
	--Dialogue Settings
		['data.VNdelay'] = data.VNdelay,
		['data.VNtxtBGTransS'] = data.VNtxtBGTransS,
		['data.VNtxtBGTransD'] = data.VNtxtBGTransD,
		['data.VNdisplayName'] = data.VNdisplayName,
		['data.VNautoSkip'] = data.VNautoSkip,
	--Progress Data
		['data.VNarc'] = data.VNarc,
		['data.VNchapter'] = data.VNchapter,
		['data.VNdialogue'] = data.VNdialogue
	}
	s_vndataLUA = f_strSub(s_vndataLUA, t_vn)
	local vnFile = io.open(saveVNPath,"w+")
	vnFile:write(s_vndataLUA)
	vnFile:close()
end

--Data saving to config.ssz
function f_saveSettingsVN()
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const int VideoVol%s*=%s*%d+', 'const int VideoVol = ' .. vid_vol)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	local file = io.open(saveCoreCfgPath,"w+")
	file:write(s_configSSZ)
	file:close()
	modifiedVN = false
end
--;===========================================================
--; LOAD VNSELECT.DEF DATA
--;===========================================================
t_selVN = {}
local t_vnList = {}
local section = 0
local file = io.open(vnDef,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
for line in content:gmatch('[^\r\n]+') do
	line = line:lower()
	if line:match('^%s*%[%s*visualnovel%s*%]') then
		section = 1
--[VisualNovel]
	elseif section == 1 then
		textImgSetText(txt_loading, "LOADING VISUAL NOVEL...")
		local param, value = line:match('^%s*(.-)%s*=%s*(.-)%s*$')
		if param ~= nil and value ~= nil and param ~= '' and value ~= '' then
			if param:match('^id$') then
				table.insert(t_selVN, {id = value, displayname = '', path = '', unlock = 'true'})
				t_vnList[value] = true
			elseif t_selVN[#t_selVN][param] ~= nil then
				t_selVN[#t_selVN][param] = value
			end
		end
	end
--Send Visual Novel Story Unlock Condition to t_unlockLua table
	for k, v in ipairs(t_selVN) do
		t_unlockLua.modes[v.id] = v.unlock
	end
	if data.debugLog then f_printTable(t_selVN, "save/debug/t_selVN.log") end
	textImgDraw(txt_loading)
	refresh()
end
--;===========================================================
--; VISUAL NOVEL MENU SCREENPACK DEFINITION
--;===========================================================
txt_vnSelect = createTextImg(jgFnt, 0, 0, "VISUAL NOVEL SELECT", 159, 13)

--Input Hints Panel
function drawVNInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end
--;===========================================================
--; VISUAL NOVEL INTRO SCREENPACK DEFINITION
--;===========================================================
txt_VNarc = createTextImg(font20, 1, 0, "", 159, 20) --font6
txt_VNchapter = createTextImg(font20, 2, 0, "", 159, 110)
txt_VNchapterName = createTextImg(font20, 2, 0, "", 159, 130)
txt_VNchapterInfo = createTextImg(font7, 0, 0, "", 159, 150)
txt_VNchapterAuthor = createTextImg(font7, 0, 0, "", 159, 220)
txt_VNchapterDate = createTextImg(font9, 0, 0, "", 159, 231, 0.50, 0.50)

--;===========================================================
--; VISUAL NOVEL IN-GAME HUD SCREENPACK DEFINITION
--;===========================================================
txt_nameCfg = createTextImg(font13, 0, 1, "", 2, 175, 0.7, 0.7) --Name Text Config
txt_boxCfg = createTextImg(font5, 0, 1, "", 0, 0) --Narrative Text Box Config

--Text background
vnTxtBG = animNew(sprVN, [[
100,0, 0,0, -1
]])
animAddPos(vnTxtBG, -8, 177.5)
animSetScale(vnTxtBG, 2.21, 1)
animUpdate(vnTxtBG)

--Next Text Arrow (Right)
vnNextR = animNew(sprVN, [[
101,0, 0,0, 10
101,1, 0,0, 10
101,2, 0,0, 10
101,3, 0,0, 10
101,3, 0,0, 10
101,2, 0,0, 10
101,1, 0,0, 10
101,0, 0,0, 10
]])
animAddPos(vnNextR, 308, 222)
animSetScale(vnNextR, 0.5, 0.5)
animUpdate(vnNextR)

--Next Text Arrow (Down)
vnNext = animNew(sprVN, [[
102,0, 0,0, 10
102,1, 0,0, 10
102,2, 0,0, 10
102,3, 0,0, 10
102,3, 0,0, 10
102,2, 0,0, 10
102,1, 0,0, 10
102,0, 0,0, 10
]])
animAddPos(vnNext, 306, 224)
animSetScale(vnNext, 0.5, 0.5)
animUpdate(vnNext)

--;===========================================================
--; VISUAL NOVEL ENDING SCREENPACK DEFINITION
--;===========================================================
--Ending 1
vnEnd1 = animNew(sprVN, [[
200,1, 0,0, -1
]])
animAddPos(vnEnd1, -54, 0)
animSetScale(vnEnd1, 0.34, 0.34)
animUpdate(vnEnd1)

--Ending 2
vnEnd2 = animNew(sprVN, [[
200,2, 0,0, -1
]])
animAddPos(vnEnd2, -54, 0)
animSetScale(vnEnd2, 0.34, 0.34)
animUpdate(vnEnd2)

--Ending 3
vnEnd3 = animNew(sprVN, [[
200,3, 0,0, -1
]])
animAddPos(vnEnd3, -54, 0)
animSetScale(vnEnd3, 0.34, 0.34)
animUpdate(vnEnd3)

--;===========================================================
--; VISUAL NOVEL PAUSE MENU SCREENPACK DEFINITION
--;===========================================================
txt_vnPTitle = createTextImg(jgFnt, 0, 0, "STORY OPTIONS", 160, 13)
txt_vnPSaved = createTextImg(jgFnt, 5, 0, "PROGRESS SAVED!", 159, 235)

t_vnPauseMenu = {
	{text = "Text Speed", 			  varText = ""},
	{text = "Text BG Transparency",   varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"},
	{text = "Auto Skip Text", 		  varText = ""},
	{text = "Text Skip",	  		  varText = ""}, --All Text/Previously Read Text
	{text = "Display Character Name", varText = ""},
	{text = "Sound Settings", 		  varText = ""},
	--{text = "Control Guide", 		  varText = ""},
	{text = "Restore Settings", 	  varText = ""},
	{text = "Save Progress",		  varText = ""},
	{text = "Back to Main Menu",	  varText = ""},
	{text = "           Continue", 	  varText = ""},
}
for i=1, #t_vnPauseMenu do
	t_vnPauseMenu[i]['varID'] = textImgNew()
end

--Logic to Display Text instead Int/Boolean Values
function f_vnCfgdisplayTxt()
if data.VNdelay == 3 then t_vnPauseMenu[1].varText = "Slow"
elseif data.VNdelay == 2 then t_vnPauseMenu[1].varText = "Normal"
elseif data.VNdelay == 1 then t_vnPauseMenu[1].varText = "Fast"
elseif data.VNdelay == 0 then t_vnPauseMenu[1].varText = "Instant"
end

if data.VNautoSkip then t_vnPauseMenu[3].varText = "Yes" else t_vnPauseMenu[3].varText = "No" end
if data.VNdisplayName then t_vnPauseMenu[4].varText = "Yes" else t_vnPauseMenu[4].varText = "No" end
end
f_vnCfgdisplayTxt() --Load Display Text

--Pause background
vnPauseBG = animNew(sprVN, [[100,1, 0,0, -1]])

--Input Hints Panel
function drawVNInputHints2() --For Pause Menu
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","30,"..inputHintYPos,"d","50,"..inputHintYPos,"l","70,"..inputHintYPos,"r","90,"..inputHintYPos,"s","150,"..inputHintYPos,"e","215,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 111, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 171, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 236, hintFontYPos)
end

function drawVNInputHints3() --For Default Settings Message
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end
--;===========================================================
--; VISUAL NOVEL AUDIO SETTINGS SCREENPACK DEFINITION
--;===========================================================
txt_vnAudioCfg = createTextImg(jgFnt, 0, 0, "AUDIO SETTINGS", 159, 13)

t_vnAudioCfg = {
	{text = "Master Volume",	varText = gl_vol.."%"},
	{text = "BGM Volume",		varText = bgm_vol.."%"},
	{text = "SFX Volume",		varText = se_vol.."%"},
	{text = "Movie Volume",		varText = vid_vol.."%"},
	{text = "Panning Range",   	varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{text = "Default Values",	varText = ""},
	{text = "          BACK",  	varText = ""},
}
for i=1, #t_vnAudioCfg do
	t_vnAudioCfg[i]['varID'] = textImgNew()
end

--;===============================================================
--; VISUAL NOVEL EXIT/DEFAULT VALUES MESSAGE SCREENPACK DEFINITION
--;===============================================================
txt_questionVN = createTextImg(jgFnt, 1, 0, "", 160, 110,0.8,0.8)

t_questionMenuVN = {
	{id = textImgNew(), text = ""},
	{id = textImgNew(), text = ""},
}

--Default Window BG
questionWindowBGVN = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(questionWindowBGVN, 61, 97)
animSetScale(questionWindowBGVN, 1.3, 1)
animUpdate(questionWindowBGVN)

--;===========================================================
--; LOAD VISUAL NOVEL DATA
--;===========================================================
function f_vnLoad(path)
t_vnBoxText = {}
local t = {}
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
--storyname = string
	if line:match('^%s*storyname%s*=') then
		section = 1
		local data = line:gsub('%s*;.*$', '')
		if not data:match('=%s*$') then
			t_vnBoxText['storyname'] = data:gsub('^%s*storyname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
		end
	elseif line:match('^%s*%[%s*[Cc][Hh][Aa][Pp][Tt][Ee][Rr]%s+[0-9]+$*%]') then
		section = 2
		chapt = #t_vnBoxText+1 --Add chapter to the table
		t_vnBoxText[chapt] = {} --Create sub-table to store content from this chapter
		t_vnBoxText[chapt]["data"] = {}
	elseif section == 2 then --[Chapter No]
	--id = chapterID (string)
		if line:match('^%s*id%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['id'] = data:gsub('^%s*id%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--name = chaptername (string)
		if line:match('^%s*name%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['name'] = data:gsub('^%s*name%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--author = chapterauthor (string)
		if line:match('^%s*author%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['author'] = data:gsub('^%s*author%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--date = chapterdate (string)
		if line:match('^%s*date%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['date'] = data:gsub('^%s*date%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--info = chapterdescription (string)
		if line:match('^%s*info%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['description'] = data:gsub('^%s*info%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--snd = filename (string)
		if line:match('^%s*snd%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['snd'] = data:gsub('^%s*snd%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--draw lua path = filename (string)
		if line:match('^%s*drawpath%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['drawPath'] = data:gsub('^%s*drawpath%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--character = string
		if line:match('^%s*character%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {} --Add content filtered to the end of the "chapter" sub-table
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['character'] = data:gsub('^%s*character%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
	--video = filename (string)
		elseif line:match('^%s*video%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {}
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['video'] = data:gsub('^%s*video%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
	--cut = number
		elseif line:match('^%s*cut%s*=') then
			--local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {}
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['cut'] = tonumber(num) --data:gsub('^%s*cut%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		--end = number
		elseif line:match('^%s*end%s*=') then
			--local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {}
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['ending'] = tonumber(num) --data:gsub('^%s*end%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
	--side = number
		if line:match('^%s*side%s*=') then
			local num = line:match('%s([0-9]+)$')
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['side'] = tonumber(num) --data:gsub('^%s*side%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	--sfx.clean = number
		if line:match('^%s*sfx.clean%s*=') then
			local num = line:match('%s([0-9]+)$')
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['sfxclean'] = tonumber(num)
			end
		end
	--sfx = group_no, index_no (int, int)
		if line:match('^%s*sfx%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['sfxplay'] = data:gsub('^%s*sfx%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	--bgm = filename (string)
		if line:match('^%s*bgm%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['bgm'] = data:gsub('^%s*bgm%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	--fadein = number
		if line:match('^%s*fadein%s*=') then
			local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['fadein'] = tonumber(num) --data:gsub('^%s*fadein%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	--fadeout = number
		if line:match('^%s*fadeout%s*=') then
			local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['fadeout'] = tonumber(num) --data:gsub('^%s*fadeout%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	--text: string
		if line:match('text:$') then
			t_vnBoxText[chapt][#t_vnBoxText[chapt]]['text'] = ""
		end
		if t_vnBoxText[chapt][1] then --This just avoid read [data] in the table to avoid issues with below logic
			if type(t_vnBoxText[chapt][#t_vnBoxText[chapt]].text) == 'string' then
				if t_vnBoxText[chapt][#t_vnBoxText[chapt]].text == '' then
					t_vnBoxText[chapt][#t_vnBoxText[chapt]].text = " " --line  --line get "text:" and we don't need that
				else
					t_vnBoxText[chapt][#t_vnBoxText[chapt]].text = t_vnBoxText[chapt][#t_vnBoxText[chapt]].text .. '\n' .. line
				end
			end
		end
	end
	--textImgDraw(txt_loading)
	--refresh()
end
if data.debugLog then f_printTable(t_vnBoxText, "save/debug/t_vnBoxText.log") end
end

--;===========================================================
--; VISUAL NOVEL DEFINITION
--;===========================================================
--Common Textbox Settings
function f_resetFullVN()
	VNautoSkipTime = 5 --Set Time to auto skip text (in seconds)
	VNautoTxt = 0
	VNtxtActive = 1
	VNscroll = 0
	VNnodelay = 0
	VNdelay = data.VNdelay
	VNskip = false
	VNhide = false
	VNendActive = false
	VNtxtReady = false
	VNtxtEnd = false
--Multimedia Control
	VNbgmActive = false
	VNbgmNew = false
	--VNbgm = ""
	VNvideoNew = false
	VNvideoActive = false
--Fade Control
	vnFadeInTime = 40
	vnFadeOutTime = 40
	vnFadeIn = false
	vnFadeOut = false
	vnFadeInC = 0
	vnFadeOutC = 0
--Narrative Text Config
	VNtxtSpacing = 9 --spacing between lines (rendering Y position increasement for each line)
	VNtxtPosX = 2
	VNtxtPosY = 184 --194
	VNtxtBank = 0
	VNtxtAlphaS = 255
	VNtxtAlphaD = 0
	f_vnPauseMenuReset()
	f_questionResetVN()
end

function f_resetSimpleVN()
	vnFadeIn = false
	vnFadeOut = false
	vnFadeInC = 0
	vnFadeOutC = 0
	f_vnFadeData()
--Reset Text Box
	VNtxtReady = false
	VNtxtActive = 1
	VNscroll = 0
	VNdelay = data.VNdelay
	VNautoTxt = 0
end

function f_vnFadeData()
data.fadeIn = f_fadeAnim(vnFadeInTime, 'fadein', 'black', sprFade)
data.fadeOut = f_fadeAnim(vnFadeOutTime, 'fadeout', 'black', sprFade)
end

function f_playVNsfx()
local data = t_vnBoxText[vnChapter][VNtxt].sfxplay
local sfxGroup, sfxIndex = data:match('^([^,]-)%s*,%s*(.-)$') --Remove "" from values ​​store in the table
sndPlay(VNsfxData, sfxGroup, sfxIndex) --Play SFX
end

function f_playVNbgm()
playBGM(t_vnBoxText[vnChapter][VNtxt].bgm) --Play BGM
t_currentVNbgm = t_vnBoxText[vnChapter][VNtxt].bgm --Backup the current BGM to decide after if it will change
end

--;===========================================================
--; VISUAL NOVEL INTRO SCREEN
--;===========================================================
function f_drawVNIntro()
	cmdInput()
	local endIntro = false
	local t = 0
	local endTime = 422
	local fadeOutTime = 50
--Display Data
	local vnName = ""
	local chapterID = vnChapter --Use f_vnScene chaptNo
	local chapterName = ""
	local chapterAuthor = ""
	local chapterDate = ""
	local chapterDescription = ""
	if t_vnBoxText.storyname ~= nil then vnName = t_vnBoxText.storyname end
	if t_vnBoxText[vnChapter].data.id ~= nil then chapterID = t_vnBoxText[vnChapter].data.id end --Replace Chapter ID by the one detected in .def file
	if t_vnBoxText[vnChapter].data.name ~= nil then chapterName = t_vnBoxText[vnChapter].data.name end
	if t_vnBoxText[vnChapter].data.author ~= nil then chapterAuthor = t_vnBoxText[vnChapter].data.author end
	if t_vnBoxText[vnChapter].data.date ~= nil then chapterDate = t_vnBoxText[vnChapter].data.date end
	if t_vnBoxText[vnChapter].data.description ~= nil then chapterDescription = t_vnBoxText[vnChapter].data.description end
	playBGM(bgmVNIntro)
	while true do
		if (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) or endIntro then
			f_vnFadeData()
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
			break
		end
		if t == endTime then endIntro = true end
		textImgSetText(txt_VNarc, vnName.." Story")
		textImgSetText(txt_VNchapter, "Chapter "..chapterID)
		textImgSetText(txt_VNchapterName, chapterName)
		textImgSetText(txt_VNchapterAuthor, "Written By "..chapterAuthor)
		textImgSetText(txt_VNchapterDate, chapterDate)
		textImgSetText(txt_VNchapterInfo, chapterDescription)
		textImgDraw(txt_VNarc)
		textImgDraw(txt_VNchapter)
		textImgDraw(txt_VNchapterName)
		textImgDraw(txt_VNchapterAuthor)
		textImgDraw(txt_VNchapterDate)
		textImgDraw(txt_VNchapterInfo)
		animDraw(data.fadeIn)
		animUpdate(data.fadeIn)
		if t > endTime - fadeOutTime then
			animDraw(data.fadeOut)
			animUpdate(data.fadeOut)
		end
		t = t + 1
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VISUAL NOVEL MAIN GAME LOGIC
--;===========================================================
function f_vnMain(vnFile, chapterNo, dialogueNo) --TODO Routes/Decisions System
	f_vnLoad(vnFile) --Load VN file
	local currentChapter = chapterNo or 1 --Set current Chapter
	local dialogueNo = dialogueNo or 1 --Set current Dialogue
	for i=currentChapter, #t_vnBoxText do --For each Chapter loaded in vnFile do
		f_vnScene(vnFile,currentChapter,dialogueNo) --Start Visual Novel Scene
		currentChapter = currentChapter + 1 --prepare next chapter
		dialogueNo = 1 --prepare dialogue number for next scene
		if data.VNbreak then f_VNback() return end --Back to main menu
	end
	if vn.credits then f_playCredits() end
	vn.credits = false
end

function f_VNback()
	data.VNbreak = false --Reset visual novel back to main menu
	--f_saveTemp()
	data.fadeTitle = f_fadeAnim(40, 'fadein', 'black', sprFade)
	f_menuMusic()
end

function f_vnProgress()
data.VNarc = vnArc
data.VNchapter = vnChapter
data.VNdialogue = VNtxt
f_saveVN()
assert(loadfile(saveVNPath))()
end

function f_drawVN() --Assets Draw Logic
	vn.vnChapter = vnChapter --to recognize chapter number in below lua module
	vn.VNtxt = VNtxt --to recognize dialogue number in below lua module
	vn.vnFadeIn = vnFadeIn
	if t_vnBoxText[vnChapter].data.drawPath ~= nil then --Detects if lua file is defined
		assert(loadfile(t_vnBoxText[vnChapter].data.drawPath))()
	end
end

--;===========================================================
--; VISUAL NOVEL IN-GAME SCREEN
--;===========================================================
function f_vnScene(arcPath, chaptNo, dialogueNo)
	f_vnLoad(arcPath) --What Visual Novel File will load?
	cmdInput()
--Actions when visual novel chapters are loaded
	f_resetFullVN()
	f_vnFadeData()
	vnArc = arcPath
	vnChapter = chaptNo --What chapter number does it start in?
	VNtxt = dialogueNo --What dialogue number does it start in?
	if data.songSelect then playBGM("") end --Keep Fight BGM (WIP)
	if dialogueNo == 1 then
		f_drawVNIntro() --Show Chapter Intro
	end
	if t_vnBoxText[vnChapter].data.snd ~= nil then --Detects if snd file is defined
		VNsfxData = sndNew(t_vnBoxText[vnChapter].data.snd) --Load snd file
	end
	while true do
	--Actions when the chapter has started
		if t_vnBoxText[vnChapter][VNtxt].cut ~= nil or VNtxtEnd then
			sndStop()
			break
		end
		if not vnPauseScreen then
			if commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				if not VNendActive then
					vnPauseScreen = true
					sndPlay(sndIkemen, 200, 1)
				end
			elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) or commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
			if commandGetState(p1Cmd, 'holde') or commandGetState(p2Cmd, 'holde') then --Hide HUD
				VNhide = true
			else
				VNhide = false
			end
		--Auto Skip Text
			if data.VNautoSkip and VNtxtActive == 0 and VNautoTxt == VNautoSkipTime*60 then
				VNtxtReady = true
			end
		end
	--Start fade out only if is loaded by dialogue, when that dialogue is drawed and fadeOut count is reseted
		if t_vnBoxText[vnChapter][VNtxt].fadeout ~= nil and VNtxtReady and vnFadeOutC == 0 then
			vnFadeOut = true
		end
		if not vnFadeOut then
		--Load New Txt
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
		end
	--SFX STOP
		if t_vnBoxText[vnChapter][VNtxt].sfxclean ~= nil then
			sndStop()
			t_vnBoxText[vnChapter][VNtxt].sfxclean = nil --Delete paramvalue from table after to stop to avoid cicle
		end
	--SFX PLAY
		if t_vnBoxText[vnChapter].data.snd ~= nil then --If there is a snd file defined for this chapter
			if t_vnBoxText[vnChapter][VNtxt].sfxplay ~= nil then
				f_playVNsfx()
				t_vnBoxText[vnChapter][VNtxt].sfxplay = nil --Delete paramvalue from table after to play to avoid cicle
			end
		end
	--BGM PLAY
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
	--VIDEO PLAY
		if not VNvideoActive then
			if t_vnBoxText[vnChapter][VNtxt].video ~= nil then
				playVideo(t_vnBoxText[vnChapter][VNtxt].video)
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		end
		if t_vnBoxText[vnChapter][VNtxt].video == nil then f_drawVN() end --Draw Sprites only if there is no video playing
		if not VNhide and not vnFadeIn then
			animSetAlpha(vnTxtBG, data.VNtxtBGTransS, data.VNtxtBGTransD) --Set BG Transparency
			animDraw(vnTxtBG) --Draw Text BG
			if VNtxtActive == 0 then
				animDraw(vnNext) --Draw Next Text Arrow
				animUpdate(vnNext)
			end
		--Text to Show
			if t_vnBoxText[vnChapter][VNtxt].side == 2 then
				textImgSetPos(txt_nameCfg, 320, 175) --Show Text in Right Side
				textImgSetAlign(txt_nameCfg, -1)
				textImgSetBank(txt_nameCfg, 1)
			else --Show Text in Left Side
				textImgSetPos(txt_nameCfg, 2, 175)
				textImgSetAlign(txt_nameCfg, 1)
				textImgSetBank(txt_nameCfg, 0)
			end
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
			if data.debugMode then
				f_drawQuickText(txt_activeVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
				f_drawQuickText(txt_autoVar, font3, 0, 0, string.format("%.0f",(VNautoTxt/60)), 163.5, 148) --For Debug Purposes
			end
		end
		if t_vnBoxText[vnChapter][VNtxt].ending ~= nil then
			VNendActive = true
			f_drawVNEnding() --Draw Ending Screen
		end
		if vnPauseScreen then f_vnPauseMenu() end
		if t_vnBoxText[vnChapter][VNtxt].fadein ~= nil then
			vnFadeIn = true
		end
		if vnFadeIn then
			animDraw(data.fadeIn)
			animUpdate(data.fadeIn)
			vnFadeInC = vnFadeInC + 1
			if vnFadeInC > vnFadeInTime then --Time to show dialogues when use fadein
				vnFadeIn = false
			end
		end
		if vnFadeOut then
			animDraw(data.fadeOut)
			animUpdate(data.fadeOut)
			vnFadeOutC = vnFadeOutC + 1
			if vnFadeOutC > vnFadeOutTime then
				vnFadeOut = false
			end
		end
		if not vnFadeIn then
			VNscroll = VNscroll + 1
			if data.VNautoSkip and not vnPauseScreen and VNtxtActive == 0 then VNautoTxt = VNautoTxt + 1 end
		end
		cmdInput()
		refresh()
	end
end
--;===========================================================
--; VISUAL NOVEL ENDING SCREEN
--;===========================================================
function f_drawVNEnding()
	if t_vnBoxText[vnChapter][VNtxt].ending == 1 then animDraw(vnEnd1) --True End
	elseif t_vnBoxText[vnChapter][VNtxt].ending == 2 then animDraw(vnEnd2) --Ending
	elseif t_vnBoxText[vnChapter][VNtxt].ending == 3 then animDraw(vnEnd3) --Try Again
	end
	vn.credits = true
end
--;===========================================================
--; VISUAL NOVEL PAUSE MENU
--;===========================================================
function f_vnPauseMenu()
	if not audioCfgVNActive then
		if not questionScreenVN then
			cmdInput()
		--Cursor Position
			if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufuVNP >= 30) then
				sndPlay(sndSys, 100, 0)
				vnPauseMenu = vnPauseMenu - 1
				if buflVNP then buflVNP = 0 end
				if bufrVNP then bufrVNP = 0 end
				VNsaveData = false
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufdVNP >= 30) then
				sndPlay(sndSys, 100, 0)
				vnPauseMenu = vnPauseMenu + 1
				if buflVNP then buflVNP = 0 end
				if bufrVNP then bufrVNP = 0 end
				VNsaveData = false
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
			if esc() or vnPauseMenuBack or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				f_vnPauseMenuReset()
			elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				if vnPauseMenu > 5 and vnPauseMenu < #t_vnPauseMenu then sndPlay(sndSys, 100, 1) end
			--Sound Settings
				if vnPauseMenu == 6 then
					cursorPosYAVN = 1
					moveTxtAVN = 0
					audioCfgVN = 1
					bufu = 0
					bufd = 0
					bufr = 0
					bufl = 0
					audioCfgVNActive = true
			--Restore Settings
				elseif vnPauseMenu == 7 then
					questionScreenVN = true
					defaultVN = true
			--Save Progress
				elseif vnPauseMenu == 8 then
					if data.engineMode == "VN" then
						f_vnProgress()
						VNsaveData = true
					else
						sndPlay(sndIkemen, 200, 0)
					end
			--Back to Main Menu
				elseif vnPauseMenu == 9 then
					questionScreenVN = true
					exitVN = true
			--Resume
				elseif vnPauseMenu == #t_vnPauseMenu then
					vnPauseMenuBack = true
				end
			end
		--Text Speed
			if vnPauseMenu == 1 then
				if commandGetState(p1Cmd, 'r') then
					if data.VNdelay > 0 then
						sndPlay(sndSys, 100, 0)
						data.VNdelay = data.VNdelay - 1
					end
					hasChangedVN = true
				elseif commandGetState(p1Cmd, 'l') then
					if data.VNdelay < 3 then
						sndPlay(sndSys, 100, 0)
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
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						hasChangedVN = true
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and buflVNP >= 30) then
					if data.VNtxtBGTransD > 0 then
						data.VNtxtBGTransD = data.VNtxtBGTransD - 1
						data.VNtxtBGTransS = data.VNtxtBGTransS + 1
					else
						data.VNtxtBGTransD = 255
						data.VNtxtBGTransS = 0
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					hasChangedVN = true
				end
		--Auto Skip Text
			elseif vnPauseMenu == 3 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sndSys, 100, 1)
				if data.VNautoSkip then data.VNautoSkip = false else data.VNautoSkip = true end
				hasChangedVN = true
		--Display Character Name
			elseif vnPauseMenu == 4 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sndSys, 100, 1)
				if data.VNdisplayName then data.VNdisplayName = false else data.VNdisplayName = true end
				hasChangedVN = true
		--Text Skip Setting
			elseif vnPauseMenu == 5 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sndSys, 100, 1)
				if data.VNautoSkip then data.VNautoSkip = false else data.VNautoSkip = true end
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
		if not questionScreenVN then
			animSetWindow(cursorBox, 64,5+cursorPosYVNP*15, 192,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if questionScreenVN then f_questionMenuVN() else drawVNInputHints2() end
		if VNsaveData then textImgDraw(txt_vnPSaved) end
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
	VNsaveData = false
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

function f_restoreVNcfg()
	data.VNdelay = 3
	data.VNtxtBGTransD = 0
	data.VNtxtBGTransS = 255
	data.VNdisplayName = true
	data.VNautoSkip = false
end

--;===========================================================
--; VISUAL NOVEL AUDIO SETTINGS
--;===========================================================
function f_audioCfgVN()
	if not questionScreenVN then
		cmdInput()
		if modifiedVN then f_saveSettingsVN() end
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			audioCfgVNActive = false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			audioCfgVN = audioCfgVN - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
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
				if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if gl_vol > 0 then
					gl_vol = gl_vol - 1
				else
					gl_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		elseif audioCfgVN == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if bgm_vol < 100 then
					bgm_vol = bgm_vol + 1
				else
					bgm_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if bgm_vol > 0 then
					bgm_vol = bgm_vol - 1
				else
					bgm_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		elseif audioCfgVN == 3 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if se_vol < 100 then
					se_vol = se_vol + 1
				else
					se_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if se_vol > 0 then
					se_vol = se_vol - 1
				else
					se_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
	--Video Cutscene Volume
		elseif audioCfgVN == 4 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if vid_vol < 200 then
					vid_vol = vid_vol + 1
				else
					vid_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if vid_vol > 0 then
					vid_vol = vid_vol - 1
				else
					vid_vol = 200
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
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
		elseif audioCfgVN == 5 then
			if commandGetState(p1Cmd, 'r') and pan_str < 160 then
				sndPlay(sndSys, 100, 0)
				pan_str = pan_str + 40
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') and pan_str > 0 then
				sndPlay(sndSys, 100, 0)
				pan_str = pan_str - 40
				modifiedVN = true
			end
			setPanStr(pan_str / 100)
	--Default Values
		elseif audioCfgVN == #t_vnAudioCfg-1 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
			sndPlay(sndSys, 100, 1)
			questionScreenVN = true
			defaultAudioVN = true
	--BACK
		elseif audioCfgVN == #t_vnAudioCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
			audioCfgVNActive = false
			sndPlay(sndSys, 100, 2)
		end
		if audioCfgVN < 1 then
			audioCfgVN = #t_vnAudioCfg
			if #t_vnAudioCfg > 14 then
				cursorPosYAVN = 14
			else
				cursorPosYAVN = #t_vnAudioCfg
			end
		elseif audioCfgVN > #t_vnAudioCfg then
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
		if #t_vnAudioCfg <= 14 then
			maxAudioCfgVN = #t_vnAudioCfg
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
	textImgDraw(txt_vnAudioCfg)
	if not questionScreenVN then
		animSetWindow(cursorBox, 64,5+cursorPosYAVN*15, 192,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end	
	t_vnAudioCfg[1].varText = gl_vol.."%"
	t_vnAudioCfg[2].varText = bgm_vol.."%"
	t_vnAudioCfg[3].varText = se_vol.."%"
	t_vnAudioCfg[4].varText = vid_vol.."%"
	t_vnAudioCfg[5].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
	setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
	setVideoVolume(vid_vol)
	setPanStr(pan_str / 100)
	for i=1, maxAudioCfgVN do
		if i > audioCfgVN - cursorPosYAVN then
			if t_vnAudioCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_vnAudioCfg[i].varID, font2, 0, 1, t_vnAudioCfg[i].text, 85, 15+i*15-moveTxtAVN))
				textImgDraw(f_updateTextImg(t_vnAudioCfg[i].varID, font2, 0, -1, t_vnAudioCfg[i].varText, 235, 15+i*15-moveTxtAVN))
			end
		end
	end
	if questionScreenVN then f_questionMenuVN() else drawVNInputHints2() end
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

--;===============================================================
--; VISUAL NOVEL EXIT/DEFAULT VALUES MESSAGE
--;===============================================================
function f_questionMenuVN()
	cmdInput()
--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sndSys, 100, 0)
		questionMenuVN = questionMenuVN - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sndSys, 100, 0)
		questionMenuVN = questionMenuVN + 1
	end
	if questionMenuVN < 1 then
		questionMenuVN = #t_questionMenuVN
		if #t_questionMenuVN > 4 then
			cursorPosYQuestionVN = 4
		else
			cursorPosYQuestionVN = #t_questionMenuVN-1
		end
	elseif questionMenuVN > #t_questionMenuVN then
		questionMenuVN = 1
		cursorPosYQuestionVN = 0
	elseif (commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) and cursorPosYQuestionVN > 0 then
		cursorPosYQuestionVN = cursorPosYQuestionVN - 1
	elseif (commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) and cursorPosYQuestionVN < 4 then
		cursorPosYQuestionVN = cursorPosYQuestionVN + 1
	end
	if cursorPosYQuestionVN == 4 then
		moveTxtQuestionVN = (questionMenuVN - 5) * 13
	elseif cursorPosYQuestionVN == 0 then
		moveTxtQuestionVN = (questionMenuVN - 1) * 13
	end
--Draw Fade BG
	animDraw(fadeWindowBG)
--Draw Menu BG
	animDraw(questionWindowBGVN)
--Draw Title
	if exitVN then
		textImgSetText(txt_questionVN, "UNSAVED DATA WILL BE LOST!")
		t_questionMenuVN[1].text = "OK"
		t_questionMenuVN[2].text = "CANCEL"
	else
		textImgSetText(txt_questionVN, "LOAD DEFAULT SETTINGS?")
		t_questionMenuVN[1].text = "YES"
		t_questionMenuVN[2].text = "NO"
	end
	textImgDraw(txt_questionVN)
--Draw Table Text
	for i=1, #t_questionMenuVN do
		if i == questionMenuVN then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_questionMenuVN[i].id, jgFnt, bank, 0, t_questionMenuVN[i].text, 159, 120+i*13-moveTxtQuestionVN))
	end
--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYQuestionVN*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
--Draw Input Hints Panel
	drawVNInputHints3()	
--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sndSys, 100, 2)
		f_questionResetVN()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
	--YES
		if questionMenuVN == 1 then
			sndPlay(sndSys, 100, 1)
		--Reset Visual Novel Settings
			if defaultVN == true then
				f_restoreVNcfg()
				hasChangedVN = true
				--modifiedVN = true
		--Reset Sound Settings
			elseif defaultAudioVN == true then
				f_audioDefault() --From Options Script
				modifiedVN = true
		--Exit from Visual Novel
			elseif exitVN == true then
				sndStop()
				data.VNbreak = true
				f_saveTemp()
				VNtxtEnd = true
			end
	--NO
		else
			sndPlay(sndSys, 100, 2)
		end
		f_questionResetVN()
	end
end

function f_questionResetVN()
	moveTxtQuestionVN = 0
--Cursor pos in NO
	cursorPosYQuestionVN = 1
	questionMenuVN = 2
--Reset
	questionScreenVN = false
	defaultVN = false
	defaultAudioVN = false
	exitVN = false
end

--;===========================================================
--; VISUAL NOVEL SELECT MENU (play through customizable narrative and interactive storytellings)
--;===========================================================
vnNoSel = true
function f_vnNewGame() --start a new customizable narrative and interactive storytelling
--Check Content
	if #t_selVN == 1 and vnNoSel then --1 story detected in select.def so don't show select menu
		f_vnMain(t_selVN[1].path) --Start Unique Visual Novel
	--When End
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
		f_menuMusic()
	else
		vnNoSel = false --More than 1 stories detected in select.def
		f_vnMenu() --Start Visual Novel Select
	end
end

function f_vnLoadGame() --continue the story from where you left off
	assert(loadfile(saveVNPath))()
	if data.VNarc == "" and data.VNchapter == 0 and data.VNdialogue == 0 then
		sndPlay(sndIkemen, 200, 0) --No Data
		vnDataInfo = true
		infoScreen = true
	else --Load Data
		playBGM("")
		f_vnMain(data.VNarc, data.VNchapter, data.VNdialogue)
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
		f_menuMusic()
	end
end

function f_vnMenu()
	if #t_selVN == 0 then
		vnInfo = true
		infoScreen = true
		return
	end
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local vnMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	f_resetListArrowsPos()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
	--Select Menu Actions
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			f_resetMenuArrowsPos()
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			vnMenu = vnMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			vnMenu = vnMenu + 1
	--Start Visual Novel Selected
		elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			f_vnMain(t_selVN[vnMenu].path)
		--When Ends
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
			f_menuMusic()
		end
	--Menu Scroll Logic
		if vnMenu < 1 then
			vnMenu = #t_selVN
			if #t_selVN > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_selVN
			end
		elseif vnMenu > #t_selVN then
			vnMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (vnMenu - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (vnMenu - 1) * 15
		end	
		if #t_selVN <= maxItems then
			maxVN = #t_selVN
		elseif vnMenu - cursorPosY > 0 then
			maxVN = vnMenu + maxItems - cursorPosY
		else
			maxVN = maxItems
		end
	--Draw Menu Assets
		animDraw(f_animVelocity(commonBG0, -1, -1))
		animSetScale(commonTBG, 240, maxVN*15)
		animSetWindow(commonTBG, 80,20, 160,180)
		animDraw(commonTBG)
		textImgDraw(txt_vnSelect)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))		
		for i=1, maxVN do
			if t_selVN[i].displayname:len() > 28 then
				visualnovelSelText = string.sub(t_selVN[i].displayname, 1, 24)
				visualnovelSelText = tostring(visualnovelSelText .. "...")
			else
				visualnovelSelText = t_selVN[i].displayname
			end
			if i > vnMenu - cursorPosY then
				t_selVN[i].id = createTextImg(font2, 0, 1, visualnovelSelText, 85, 15+i*15-moveTxt)
				textImgDraw(t_selVN[i].id)
			end
		end
		if maxVN > maxItems then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_selVN > maxItems and maxVN < #t_selVN then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		drawVNInputHints()
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