local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
table.insert(t_extrasMenu, #t_extrasMenu + 1, {text = "RANDOM TEST", gotomenu = "randomTest()", id = textImgNew()}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
--;===========================================================
--; RANDOMTEST MODE (watch CPU play to generate AI rank data)
--;===========================================================
--AutoLevel is a function that ranks characters based on his number of loses vs wins.
--AutoLevel is palette dependent so if a char has a 12th palette OP mode that mode can have more rank than his normal one.
local tuyoiBorder = 0
local juuni = 12
local moudeta = {}
local rank = 0
local saikyou = false
local roster = {}
local debugText = ''
local numChars = 0
local nextChar = 1
local stage = 0
local bgm = ""

local function addMoudeta(rank)
	moudeta[#moudeta + 1] = rank
	local max = math.floor(numChars / (math.min(numChars / (juuni * 10) + 3, juuni) * juuni))
	while #moudeta > max do
		table.remove(moudeta, 1)
	end
end

local function randRank()
	local r = 0
	while true do
		r = math.random(1, tuyoiBorder + juuni - 2);
		local notbroken = true
		for i = 1, #moudeta do
			if math.abs(moudeta[i] - r) <= math.floor(juuni / 3) then
				notbroken = false
				break
			end
		end
		if notbroken then
			break
		end
	end
	return r
end

local function eachAllChars(f)
	for cel = 1, #t_randomChars do
		f(cel - 1)
	end
end

local function rakuBenry()
	local alf = "save/debug/autolevel.log"
	local veljnz = {}
	local winct = {}
	local buf = '\239\187\191'
	local fp = io.open(alf, 'r')
	if fp then
		for line in fp:lines() do
			local tmp = strsplit(',', line)
			if #tmp >= 2 then
				for i = 1, 4 do
					if i == 4 then
						tmp[1] = string.sub(tmp[1], 4)
					else
						if string.byte(tmp[1], i) ~= string.byte(buf, i) then break end
					end
				end
				winct[tmp[1]] = map(tonumber, strsplit(' ', strtrim(tmp[2])))
			end
		end
		io.close(fp)
	end
	numChars = 0
	eachAllChars(function(cel)
		numChars = numChars + 1
	end)
	local tuyoninzu = math.floor(numChars / (juuni * 10))
	if tuyoninzu < juuni - 1 then
		tuyoiBorder =  math.floor(numChars / (tuyoninzu + 1))
		tuyoninzu = juuni - 1
	else
		tuyoiBorder = math.floor(numChars / juuni)
	end
	local total = 0
	local zero ={}
	local tsuyoshi = {}
	local rand = {}
	local kai = {}
	local bimyou = {}
	local tuyocnt = 0
	local ran = randRank()
	eachAllChars(function(cel)
		if #veljnz < cel * 12 then
			for i = #veljnz + 1, cel * 12 do
				veljnz[i] = 0
			end
		end
		local wins = winct[getCharFileName(cel)]
		local tmp = 0
		for j = 1, 12 do
			if wins and j <= #wins then
				total = total + wins[j]
				veljnz[cel * 12 + j] = wins[j]
				tmp = tmp + wins[j]
			else
				veljnz[cel * 12 + j] = 0
			end
		end
		if tmp >= tuyoiBorder then tuyocnt = tuyocnt + 1 end
		if tmp >= tuyoiBorder - juuni then table.insert(tsuyoshi, cel) end
		if tmp >= 1 and tmp <= juuni then table.insert(bimyou, cel) end
		if tmp > ran - juuni and tmp <= ran then table.insert(rand, cel) end
		if tmp == 0 then table.insert(zero, cel) end
		if tmp < 0 then table.insert(kai, cel) end
	end)
	function charAdd(cList, numAdd)
	if numAdd <= 0 then return end
		for i = 1, numAdd do
			if #cList == 0 then break end
			local cidx = math.random(1, #cList)
			table.insert(roster, cList[cidx])
			table.remove(cList, cidx)
		end
	end
	roster = {}
	nextChar = 1
	debugText = ''
	local numZero = #zero
	if numZero > 0 then
		charAdd(zero, numZero)
		charAdd(kai, tuyoninzu - numZero)
		rank = 0
	elseif #bimyou >= math.max(tuyoninzu * 20, math.floor((numChars * 3) / 20)) then
		charAdd(bimyou, #bimyou)
		rank = juuni
	else
		for n = 1, 3 do
			if #rand >= tuyoninzu then break end
			rand = {}
			ran = randRank()
			eachAllChars(function(cel)
				local tmp = 0
				for j = 1, 12 do
					tmp = tmp + veljnz[cel * 12 + j]
				end
				if tmp > ran - juuni and tmp <= ran then table.insert(rand, cel) end
			end)
		end
		debugText = ran .. ' ' .. #rand
		if #rand >= tuyoninzu then
			charAdd(rand, #rand)
			rank = ran
			addMoudeta(rank)
		elseif tuyocnt >= tuyoninzu then
			charAdd(tsuyoshi, #tsuyoshi)
			rank = tuyoiBorder + juuni - 1
		else
			addMoudeta(tuyoiBorder + (juuni - 2) - math.floor(juuni / 3))
			charAdd(kai, #kai)
			rank = -1
		end
	end
	if numZero == 0 then
		while total ~= 0 do
			local i = math.random(1, #veljnz)
			if total > 0 then
				veljnz[i] = veljnz[i] - 1
				total = total - 1
			else
				veljnz[i] = veljnz[i] + 1
				total = total + 1
			end
		end
	end
	eachAllChars(function(cel)
		buf = buf .. getCharFileName(cel) .. ','
		for j = 1, 12 do
			buf = buf .. ' ' .. veljnz[cel * 12 + j]
		end
		buf = buf .. '\r\n'
	end)
	local alv = io.open(alf, 'wb')
	alv:write(buf)
	io.close(alv)
end

local function randSel(pno, winner)
	if winner > 0 and (pno == winner) == not saikyou then return end
	local team
	if rank == 0 or rank == 12 or saikyou then
		team = 0
	elseif rank < 0 then
		team = math.random(0, 2)
	else
		team = math.random(0, 1) * 2
	end
	setTeamMode(pno, team, math.random(1, 4))
	local tmp = 0
	while tmp < 2 do
		tmp = selectChar(pno, roster[nextChar], math.random(1, 12))
		nextChar = nextChar + 1
		if nextChar > #roster then nextChar = 1 end
	end
end

--Writes the ranked AI levels to a save file (This file is not used by AutoLevel)
local function rosterTxt()
	local str = "Rank: " .. rank .. ' ' .. debugText
	for i = 1, #roster do
		str = str .. '\n' .. getCharFileName(roster[i])
	end
	dscr = io.open("save/debug/AI_Rank.log", 'w')
	dscr:write(str)
	io.close(dscr)
end

--Sets AIs to level 8 (MAX level) and ints AutoLevel
local function initRandom()
	for i = 1, 8 do
		setCom(i, 8)
	end
	setAutoLevel(true)
	rakuBenry()
	winner = 0
	wins = 0
	rosterTxt()
	nextChar = 1
	saikyou = rank == tuyoiBorder + juuni - 1
	stage = math.random(1, data.includestage) --Load a New Random Stage
	if t_selStages[stage].music ~= nil then
		bgm = math.random(1, #t_selStages[stage].music)
		bgm = t_selStages[stage].music[bgm].bgmusic
	end
	f_loading(true)
end

function randomTest()
	f_discordUpdate({details = "Random Test"})
	cmdInput()
	f_default() --Load f_default function defined in common.lua
	setGameMode("randomtest")
	initRandom()
	while true do
		randSel(1, winner)
		randSel(2, winner)
		setMatchNo(1)
		setStage(stage)
		selectStage(stage)
		f_setStgBGM(bgm)
		playBGM(bgm)
		loadStart()
		local oldwinner = winner
		winner = game() --Enter in Match
		if winner < 0 then --Exit from randomtest
			f_discordMainMenu()
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			if data.attractMode then playBGM(bgmTitle) else	f_menuMusic() end
			break
		end
		oldwins = wins
		wins = wins + 1
		if winner ~= oldwinner then
			wins = 1
			setHomeTeam(winner == 1 and 2 or 1)
		end
		setMatchNo(wins)
		if winner <= 0 or wins >= 20 or wins == oldwins then
			initRandom()
		end
		cmdInput()
		refresh()
	end
end