t_vnBoxText = {} --Here to avoid issues if you don´t declare [TowerMode] section in select.def
local section = 0
local file = io.open("script/visualnovel/dialogue.def","r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
--;===========================================================
--; LOAD VISUAL NOVEL DATA
--;===========================================================
for line in content:gmatch('[^\r\n]+') do
	line = line:lower()
	if line:match('^%s*%[%s*dialogue%s*%]') then
		section = 1
	elseif section == 1 then --[Dialogue]
		if line:match('^%s*character%s*=') then
			row = #t_vnBoxText+1
			t_vnBoxText[row] = {}
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[row]['character'] = data:gsub('^%s*character%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				--t_vnBoxText[row]['text'] = data:gsub('^%s*text%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_vnBoxText[row]['ID'] = ""
			end
		end
		if line:match('^%s*text%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[row]['text'] = data:gsub('^%s*text%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	end
	--textImgDraw(txt_loading)
	--refresh()
end

if data.debugLog then f_printTable(t_vnBoxText, "save/debug/t_vnBoxText.txt") end

--;===========================================================
--; LOAD VISUAL NOVEL SRIPTS
--;===========================================================
require("script.visualnovel.story1")


--;===========================================================
--; LOAD VISUAL NOVEL ASSETS
--;===========================================================
txt_nameCfg = createTextImg(font1, 0, 1, "", 2, 175) --Name Text Config
txt_boxCfg = createTextImg(font1, 0, 1, "", 0, 0) --Narrative Text Box Config
--txt_vnName = "" --Name Text
--txt_vn = "" --Narrative Text Box

--Background 1
vnBG0 = animNew(vnSff, [[
0,0, 0,0, -1
]])
animAddPos(vnBG0, 0, 0)
animUpdate(vnBG0)

--Text background
vnTxtBG = animNew(vnSff, [[
100,0, 0,0, -1
]])
animAddPos(vnTxtBG, -8, 177.5)
animSetScale(vnTxtBG, 2.21, 1)
animUpdate(vnTxtBG)

--Next Text Arrow
vnNext = animNew(vnSff, [[
101,0, 0,0, 10
101,1, 0,0, 10
101,2, 0,0, 10
101,3, 0,0, 10
101,3, 0,0, 10
101,2, 0,0, 10
101,1, 0,0, 10
101,0, 0,0, 10
]])
animAddPos(vnNext, 308, 222)
animSetScale(vnNext, 0.5, 0.5)
animUpdate(vnNext)

--Skip Button
vnSkip = animNew(vnSff, [[
100,1, 0,0, -1
]])
animAddPos(vnSkip, 300, 220)
animUpdate(vnSkip)

--Kung Fu Man 1
vnKfm1 = animNew(vnSff, [[
1,0, 0,0, -1
]])
animAddPos(vnKfm1, 0, 0)
animSetScale(vnKfm1, 0.25, 0.25)
animUpdate(vnKfm1)