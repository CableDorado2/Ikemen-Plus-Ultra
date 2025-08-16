--;===========================================================
--; LOAD CHARACTERS DATA
--;===========================================================
local function f_getCharPath(baseDir, targetPathLower)
	for file in lfs.dir(baseDir) do
		if file ~= "." and file ~= ".." then
			local fullPath = baseDir .. "/" .. file
			local attr = lfs.attributes(fullPath)
			if attr ~= nil then
				if attr.mode == "directory" then
				--Recursively search in subdirectories
					local found = f_getCharPath(fullPath, targetPathLower)
					if found then
						return found
					end
				else
				--Compare without uppercase
					if string.lower(fullPath) == targetPathLower then
						return fullPath:gsub('[^/]+%.def$', '') --remove .def from file
					end
				end
			end
		end
	end
	return nil
end
--parse character data
function f_parseChar(t, cel)
	local line = ''
	local displayname = getCharName(cel):gsub('^["%s]*(.-)["%s]*$', '%1')
	local def = getCharFileName(cel)
	if displayname ~= '' and def ~= 'randomselect' then
		local dir = def:gsub('[^/]+%.def$', '')
		t['displayname'] = displayname
		t['def'] = def
		t['dir'] = dir
		t['ikanim'] = f_getCharPath("chars", def) --Because getCharFileName() return in lowercase
		local sffPath = ''
		local sndPath = ''
		local airPath = ''
		local cnsPath = ''
		local stPath = ''
		local introPath = ''
		local endingPath = ''
		local row = ''
		local section = ''
		for line in io.lines(def) do
			line = line:lower()
			if line:match('^%s*%[%s*info%s*%]') then
				section = 1
			elseif line:match('^%s*%[%s*ja.info%s*%]') then --This will avoid error when reading the sff path of a character with his section declared
				section = 2
			elseif line:match('^%s*%[%s*files%s*%]') then
				section = 3
			elseif line:match('^%s*%[%s*ja.files%s*%]') then
				section = 4
			elseif line:match('^%s*%[%s*palette%s*keymap%s*%]') then
				section = 5
			elseif line:match('^%s*%[%s*arcade%s*%]') then
				section = 6
			elseif line:match('^%s*%[%s*unlock%s*%]') then
				section = 7
			elseif line:match('^%s*%[%s*portraits%s*%]') then
				section = 8
			elseif line:match('^%s*%[') then --in case character shares DEF file with other files
				section = 9
				--break
		--[Info]
			elseif section == 1 then
				if line:match('^%s*name%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['name'] = line:gsub('^%s*name%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
				if line:match('^%s*author%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['author'] = line:gsub('^%s*author%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
				if line:match('^%s*glossaryname%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['glossaryname'] = line:gsub('^%s*glossaryname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
		--[Ja.Info]
			elseif section == 2 then
				if line:match('^%s*name%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['namejp'] = line:gsub('^%s*name%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
				if line:match('^%s*displayname%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['displaynamejp'] = line:gsub('^%s*displayname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
				if line:match('^%s*author%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['authorjp'] = line:gsub('^%s*author%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
		--[Files]
			elseif section == 3 then
				if line:match('^%s*sprite%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						sffPath = dir .. line:gsub('^%s*sprite%s*=%s*(.-)%s*$', '%1')
						t['sff'] = sffPath
					end
				elseif line:match('^%s*sound%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						sndPath = dir .. line:gsub('^%s*sound%s*=%s*(.-)%s*$', '%1')
						t['snd'] = sndPath
					end
				elseif line:match('^%s*anim%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						airPath = dir .. line:gsub('^%s*anim%s*=%s*(.-)%s*$', '%1')
						t['air'] = airPath
					end
				elseif line:match('^%s*cns%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						cnsPath = dir .. line:gsub('^%s*cns%s*=%s*(.-)%s*$', '%1')
						t['cns'] = cnsPath
					end
				elseif line:match('^%s*st[0-9]*%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						if t['st'] == nil then
							t['st'] = {}
						end
						stPath = dir .. line:gsub('^%s*st[0-9]*%s*=%s*(.-)%s*$', '%1')
						t.st[#t.st+1] = stPath
					end
				end
		--[ja.Files]
			elseif section == 4 then
				if line:match('^%s*sprite%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						sffPath = dir .. line:gsub('^%s*sprite%s*=%s*(.-)%s*$', '%1')
						t['sffjp'] = sffPath
					end
				elseif line:match('^%s*sound%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						sndPath = dir .. line:gsub('^%s*sound%s*=%s*(.-)%s*$', '%1')
						t['sndjp'] = sndPath
					end
				elseif line:match('^%s*anim%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						airPath = dir .. line:gsub('^%s*anim%s*=%s*(.-)%s*$', '%1')
						t['airjp'] = airPath
					end
				elseif line:match('^%s*cns%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						cnsPath = dir .. line:gsub('^%s*cns%s*=%s*(.-)%s*$', '%1')
						t['cnsjp'] = cnsPath
					end
				elseif line:match('^%s*st[0-9]*%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						if t['stjp'] == nil then
							t['stjp'] = {}
						end
						stPath = dir .. line:gsub('^%s*st[0-9]*%s*=%s*(.-)%s*$', '%1')
						t.stjp[#t.stjp+1] = stPath
					end
				end
		--[Palette Keymap]
			elseif section == 5 then
				--nothing until palletes swap function is implemented
		--[Arcade]
			elseif section == 6 then
			--Load Storyboard Files
				if line:match('^%s*intro%.storyboard%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						introPath = dir .. line:gsub('^%s*intro%.storyboard%s*=%s*(.-)%s*$', '%1')
						t['intro'] = introPath
					end
				elseif line:match('^%s*ending%.storyboard%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						endingPath = dir .. line:gsub('^%s*ending%.storyboard%s*=%s*(.-)%s*$', '%1')
						t['ending'] = endingPath
					end
			--Load Video Files
				elseif line:match('^%s*intro%.video%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						introPath = dir .. line:gsub('^%s*intro%.video%s*=%s*(.-)%s*$', '%1')
						t['intro2'] = introPath
					end
				elseif line:match('^%s*ending%.video%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						endingPath = dir .. line:gsub('^%s*ending%.video%s*=%s*(.-)%s*$', '%1')
						t['ending2'] = endingPath
					end
				end
		--[Unlock]
			elseif section == 7 then
				if line:match('^%s*condition%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['UnlockCondition'] = line:gsub('^%s*condition%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Storyboard Files for Unlock Screen
				if line:match('^%s*storyboard%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						unlockPath = dir .. line:gsub('^%s*storyboard%s*=%s*(.-)%s*$', '%1')
						t['UnlockStoryboard'] = unlockPath
					end
			--Load Video Files for Unlock Screen
				elseif line:match('^%s*video%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						unlockPath = dir .. line:gsub('^%s*video%s*=%s*(.-)%s*$', '%1')
						t['UnlockVideo'] = unlockPath
					end
				end
		--[Portraits]
			elseif section == 8 then
			--Load Select Face Icon Portrait Data
				if line:match('^%s*face.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['faceSpr'] = {line:gsub('^%s*face.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*face.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['faceSprScale'] = line:gsub('^%s*face.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Select Big Portrait Data
				if line:match('^%s*select.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['selectSpr'] = {line:gsub('^%s*select.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*select.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['selectSprScale'] = line:gsub('^%s*select.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Order Select Portrait Data
				if line:match('^%s*order.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['orderSpr'] = {line:gsub('^%s*order.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*order.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['orderSprScale'] = line:gsub('^%s*order.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Versus Portrait Data
				if line:match('^%s*vs.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['vsSpr'] = {line:gsub('^%s*vs.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*vs.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['vsSprScale'] = line:gsub('^%s*vs.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Winner Portrait Data
				if line:match('^%s*win.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['winSpr'] = {line:gsub('^%s*win.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*win.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['winSprScale'] = line:gsub('^%s*win.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Loser Portrait Data
				if line:match('^%s*lose.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['loseSpr'] = {line:gsub('^%s*lose.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*lose.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['loseSprScale'] = line:gsub('^%s*lose.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Results Portrait Data
				if line:match('^%s*result.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['resultSpr'] = {line:gsub('^%s*result.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*result.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['resultSprScale'] = line:gsub('^%s*result.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--Load Intermission Portrait Data
				if line:match('^%s*intermission.portrait.spr%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['intermissionSpr'] = {line:gsub('^%s*intermission.portrait.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') .. ", 0,0, -1"}
					end
				end
				if line:match('^%s*intermission.portrait.scale%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['intermissionSprScale'] = line:gsub('^%s*intermission.portrait.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
		--[???]
			elseif section == 9 then
				--This will avoid error when loading a character with an unknown section declared
			end
			if stPath ~= '' and section ~= 3 and section ~= 4 and section ~= 5 and section ~= 6 and section ~= 7 and section ~= 8 and section ~= 9 then
				break
			end
		end
	--Extract Character Victory Quotes
		local quotes = false
		if io.open(cnsPath or '','r') ~= nil then
			for line in io.lines(cnsPath) do
				--line = line:lower()
				line = line:gsub('%s*;.*$', '')
				if line:match('^%s*[Xx][Ss][Cc][Aa][Ll][Ee]%s*=') then
					line = line:gsub('%s*;.*$', '')
					t['xscale'] = line:gsub('^%s*[Xx][Ss][Cc][Aa][Ll][Ee]%s*=%s*(.-)%s*$', '%1')
				elseif line:match('^%s*[Yy][Ss][Cc][Aa][Ll][Ee]%s*=') then
					line = line:gsub('%s*;.*$', '')
					t['yscale'] = line:gsub('^%s*[Yy][Ss][Cc][Aa][Ll][Ee]%s*=%s*(.-)%s*$', '%1')
				elseif line:match('^%s*%[%s*[Qq][Uu][Oo][Tt][Ee][Ss]%s*%]') then
					t['quotes'] = {}
					t['trigger'] = {}
					quotes = true
				elseif quotes then
					if line:match('^%s*[Vv][Ii][Cc][Tt][Oo][Rr][Yy][0-9]+%s*=') then
						local tmp, tmp2 = line:match('^%s*[Vv][Ii][Cc][Tt][Oo][Rr][Yy]([0-9]+)%s*=%s*"%s*(.-)%s*"%s*$')
						if tmp ~= nil and tmp2 ~= nil then
							t.quotes[tmp] = tmp2
						end
					elseif line:match('^%s*%[') then
						break
					end
				end
			end
		end
		if quotes and stPath ~= '' then
			local trigger = false
			local tPos = ''
			for i=1, #t.st do
				if io.open(t.st[i] or '','r') ~= nil then
					for line in io.lines(t.st[i]) do
						line = line:lower()
						line = line:gsub('%s*;.*$', '')
						if line:match('^%s*type%s*=%s*victoryquote') then
							trigger = true
							t.trigger[#t.trigger+1] = {}
							tPos = t.trigger[#t.trigger]
							tPos['value'] = 0
							oldTrigger = ''
						elseif trigger then
							line = line:gsub('^%s*(.-)%s*$', '%1')
							if line:match('^type%s*=') then
								break
							elseif line:match('^trigger') then
								local newTrigger = line:match('^(trigger[0-9]*a?l?l?)')
								if oldTrigger == newTrigger then
									if line:match('^triggerall') then
										tPos['all'] = '(' .. tPos['all'] .. ') && (' .. line:gsub('triggerall%s*=%s*', '') .. ')'
									else
										tPos[#tPos] = '(' .. tPos[#tPos] .. ') && (' .. line:gsub('trigger[0-9]*%s*=%s*', '') .. ')'
									end
								elseif line:match('^triggerall') then
									oldTrigger = newTrigger
									tPos['all'] = line:gsub('triggerall%s*=%s*', '')
								else
									oldTrigger = newTrigger
									tPos[#tPos+1] = line:gsub('trigger[0-9]*%s*=%s*', '')
								end
							elseif line:match('^value%s*=') then
								tPos['value'] = line:match('=%s*(.-)%s*$')
							end
						end
					end
				end
				if trigger then
					break
				end
			end
		end
	--Extract Character Anims
		if io.open(airPath or '','r') ~= nil then
			for line in io.lines(airPath) do
				line = line:lower()
				line = line:gsub('%s*;.*$', '')
			--Standing Animation [Begin Action 0]
				if line:match('^%s*%[%s*begin%s*action%s*0%s*%]') then
					row = 'stand'
					t[row] = {}
					cnt = 1
			--Win [Begin Action 181]
				elseif line:match('^%s*%[%s*begin%s*action%s*181%s*%]') then
					row = 'win'
					t[row] = {}
					cnt = 1
			--LieDown Hit (stay down) [Begin Action 5080]
				elseif line:match('^%s*%[%s*begin%s*action%s*5080%s*%]') then
					row = 'lieDown'
					t[row] = {}
					cnt = 1
			--Dizzy [Begin Action 5300]
				elseif line:match('^%s*%[%s*begin%s*action%s*5300%s*%]') then
					row = 'dizzy'
					t[row] = {}
					cnt = 1
			--Cheese kill [Begin Action 5950]
				elseif line:match('^%s*%[%s*begin%s*action%s*5950%s*%]') then
					row = 'cheese'
					t[row] = {}
					cnt = 1
				elseif line:match('^%s*%[') then
					row = ''
				elseif row ~= '' then
					if line:match('^%s*[0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+') then
						t[row][cnt] = line:gsub('^%s*([0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[%-0-9]+).*$', '%1')
						cnt = cnt + 1
					elseif line:match('^%s*loopstart') then
						t[row][cnt] = line:gsub('^%s*(loopstart).*$', '%1')
						cnt = cnt + 1
					end
				end
			end
		end
		return
	end
end
--;===========================================================
--; LOADING SCREEN 1 (LOAD SELECT.DEF DATA)
--;===========================================================
--add characters and stages using select.def instead of select.lua
--start_time = os.time()
data.includestage = 0
t_orderChars = {}
t_charDef = {}
t_stageDef = {} --t_stageDef = {['randomstage'] = 0}
local section = 0
local file = io.open(selectDef,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
--f_printVar(content)
for line in content:gmatch('[^\r\n]+') do
--for line in io.lines(selectDef) do
	line = line:lower()
	if line:match('^%s*%[%s*characters%s*%]') then
		t_selChars = {}
		section = 1
	elseif line:match('^%s*%[%s*extrastages%s*%]') then
		t_selStages = {}
		section = 2
	elseif line:match('^%s*%[%s*options%s*%]') then
		t_selOptions = {}
		section = 3
--[Characters]
	elseif section == 1 then
		textImgSetText(txt_loading, "LOADING CHARACTERS...")
		row = #t_selChars+1
		t_selChars[row] = {}
		for i, c in ipairs(strsplit(',', line)) do
			c = c:gsub('^%s*(.-)%s*$', '%1')
		--charname = path
			if i == 1 then
				c = c:gsub('\\', '/')
				c = tostring(c)
				t_selChars[row]['char'] = c
				t_selChars[row]['unlock'] = "true" --character unlocked by default
				--t_selChars[row]['intermissionSpr'] = {"9000,9, 0,0, -1"}
				addChar(c)
				t_charDef[c] = row - 1
		--unlock = lua condition
			elseif c:match('unlock%s*=%s*') then
				local unlockData = c:match('^unlock%s*=%s*(.-)%s*$')
				t_selChars[row]['unlock'] = unlockData
		--music = path
			elseif c:match('music%s*=%s*') then
				c = c:gsub('\\', '/')
				local bgmvolume = c:match('%s([0-9]+)$')
				if bgmvolume == nil then
					bgmvolume = 100
				else
					bgmvolume = tonumber(bgmvolume)
					c = c:gsub('%s*[0-9]+$','')
				end
				local bgmusic = c:match('^music%s*=%s*(.-)%s*$')
				if t_selChars[row]['music'] == nil then
					t_selChars[row]['music'] = {}
				end
				t_selChars[row].music[#t_selChars[row].music+1] = {}
				t_selChars[row].music[#t_selChars[row].music]['bgmusic'] = bgmusic
				t_selChars[row].music[#t_selChars[row].music]['bgmvolume'] = bgmvolume
		--1, 2, (...)/Arcade Route = charname
			elseif c:match('[0-9]+%s*=%s*[^%s]') then
				local var1, var2 = c:match('([0-9]+)%s*=%s*(.+)%s*$')
				t_selChars[row][tonumber(var1)] = var2:lower()
		--stages/mybg.def
			elseif c:match('%.[Dd][Ee][Ff]') then
				c = c:gsub('\\', '/')
				if t_selChars[row]['stage'] == nil then
					t_selChars[row]['stage'] = {}
				end
				t_selChars[row].stage[#t_selChars[row].stage+1] = c
		--Extra Paramvalues
			else
				local param, value = c:match('^(.-)%s*=%s*(.-)$')
				t_selChars[row][param] = tonumber(value)
			end
		end
	--parse char data
		f_parseChar(t_selChars[row], row-1)
	--force order entry
		local tmp = getCharName(row-1)
		if tmp ~= '' and tmp ~= '"Training"' and getCharFileName(row-1) ~= 'randomselect' then
		--Arcade Order
			if t_selChars[row].order == nil then
				t_selChars[row]['order'] = 1 --Add order 1 is order paramvalue is not detected
			end
			if t_orderChars[t_selChars[row].order] == nil then
				t_orderChars[t_selChars[row].order] = {}
			end
			t_orderChars[t_selChars[row].order][#t_orderChars[t_selChars[row].order]+1] = row-1
		end
--[ExtraStages]
	elseif section == 2 then
		textImgSetText(txt_loading, "LOADING STAGES...")
		row = #t_selStages+1
		for i, c in ipairs(strsplit(',', line)) do
			c = c:gsub('^%s*(.-)%s*$', '%1')
			local exists = false
			if i == 1 then
				c = c:gsub('\\', '/')
				local file = io.open(c,'r')
				if file == nil then
					break
				end
		--Inside Stage.def file
				t_selStages[row] = {}
				local tmp = file:read("*all")
				file:close()
			--zoomout = number
				local zoomout = tmp:match('\n%s*zoomout%s*=%s*([0-9%.]+)')
				if zoomout ~= nil then
					t_selStages[row]['zoommin'] = tonumber(zoomout)
				end
			--zoommin = number
				local zoomin = tmp:match('\n%s*zoomin%s*=%s*([0-9%.]+)')
				if zoomin ~= nil then
					t_selStages[row]['zoommax'] = tonumber(zoomin)
				end
			--bgmusic = path
				local bgmusic = tmp:match('\n%s*bgmusic%s*=%s*([^;\n]+)%s*;?.*\n')
				if bgmusic ~= nil then
					bgmusic = bgmusic:gsub('^%s*(.-)%s*$', '%1')
					bgmusic = bgmusic:gsub('\\', '/')
					if bgmusic ~= '' then
						t_selStages[row]['music'] = {}
						t_selStages[row].music[1] = {}
						t_selStages[row].music[1]['bgmusic'] = bgmusic
						local bgmvolume = tmp:match('\n%s*bgmvolume%s*=%s*([0-9]+)')
						if bgmvolume ~= nil and bgmvolume ~= '' then
							t_selStages[row].music[1]['bgmvolume'] = tonumber(bgmvolume)
						else
							t_selStages[row].music[1]['bgmvolume'] = 100
						end
					end
				end
			--author = string
				local author = tmp:match('\n%s*author%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Author%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*AUTHOR%s*=%s*([^;\n]+)%s*;?.*\n')
				if author ~= nil then
					author = author:gsub('^["%s]*(.-)["%s]*$', '%1')
					if author ~= '' then
						t_selStages[row]['author'] = author
					end
				--else --Writte Blank author to avoid issues
					--author = ''
					--t_selStages[row]['author'] = author
				end
			--location = string
				local location = tmp:match('\n%s*location%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Location%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*LOCATION%s*=%s*([^;\n]+)%s*;?.*\n')
				if location ~= nil then
					location = location:gsub('^["%s]*(.-)["%s]*$', '%1')
					if location ~= '' then
						t_selStages[row]['location'] = location
					end
				--else --Writte Blank location to avoid issues
					--location = ''
					--t_selStages[row]['location'] = location
				end
			--daytime = string
				local daytime = tmp:match('\n%s*daytime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Daytime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*dayTime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*DayTime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*DAYTIME%s*=%s*([^;\n]+)%s*;?.*\n')
				if daytime ~= nil then
					daytime = daytime:gsub('^["%s]*(.-)["%s]*$', '%1')
					if daytime ~= '' then
						t_selStages[row]['daytime'] = daytime
					end
				--else --Writte Blank daytime to avoid issues
					--daytime = ''
					--t_selStages[row]['daytime'] = daytime
				end
			--unlock.info = string
				local unlockcondition = tmp:match('\n%s*unlockcondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Unlockcondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*unlockCondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*UnlockCondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*UNLOCKCONDITION%s*=%s*([^;\n]+)%s*;?.*\n')
				if unlockcondition ~= nil then
					unlockcondition = unlockcondition:gsub('^["%s]*(.-)["%s]*$', '%1')
					if unlockcondition ~= '' then
						t_selStages[row]['unlockcondition'] = unlockcondition
					end
				--else --Writte Blank unlockcondition to avoid issues
					--unlockcondition = ''
					--t_selStages[row]['unlockcondition'] = unlockcondition
				end
				addStage(c)
				data.includestage = data.includestage + 1
			--[[
				local name = tmp:match('\n%s*displayname%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Displayname%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*DISPLAYNAME%s*=%s*([^;\n]+)%s*;?.*\n')
				if name ~= nil then
					name = name:gsub('^["%s]*(.-)["%s]*$', '%1')
					if name ~= '' then
						t_selStages[row]['name'] = name
					end
				else --Writte Blank name to avoid issues
					name = ''
					t_selStages[row]['name'] = name
				end
			]]
	--In select.def [ExtraStages] section
				t_selStages[row]['name'] = getStageName(#t_selStages):gsub('^["%s]*(.-)["%s]*$', '%1')
				t_selStages[row]['stage'] = c
				t_selStages[row]['unlock'] = "true" --stage unlocked by default
				t_stageDef[c] = row
		--unlock = lua condition
			elseif c:match('unlock%s*=%s*') then
				local unlockData = c:match('^unlock%s*=%s*(.-)%s*$')
				t_selStages[row]['unlock'] = unlockData
		--music = path
			elseif c:match('music%s*=%s*') then
				c = c:gsub('\\', '/')
				local bgmvolume = c:match('%s([0-9]+)$')
				if bgmvolume == nil then
					bgmvolume = 100
				else
					bgmvolume = tonumber(bgmvolume)
					c = c:gsub('%s*[0-9]+$','')
				end
				local bgmusic = c:match('^music%s*=%s*(.-)%s*$')
				if t_selStages[row]['music'] == nil then
					t_selStages[row]['music'] = {}
				end
				t_selStages[row].music[#t_selStages[row].music+1] = {}
				t_selStages[row].music[#t_selStages[row].music]['bgmusic'] = bgmusic
				t_selStages[row].music[#t_selStages[row].music]['bgmvolume'] = bgmvolume
		--Extra Paramvalues
			else
				local param, value = c:match('^(.-)%s*=%s*(.-)$')
				t_selStages[row][param] = tonumber(value)
			end
		end
--[Options]
	elseif section == 3 then
		textImgSetText(txt_loading, "LOADING ARCADE SETTINGS...")
		if line:match('^%s*.-%.maxmatches%s*=%s*') then
			local rowName, line = line:match('^%s*(.-)%.maxmatches%s*=%s*(.+)')
			t_selOptions[rowName .. 'maxmatches'] = {}
			for i, c in ipairs(strsplit(',', line:gsub('%s*(.-)%s*', '%1'))) do
				t_selOptions[rowName .. 'maxmatches'][i] = tonumber(c)
			end
		elseif line:match('^%s*.-%.airamp%..-%s*=%s*') then
			local rowName, rowName2, wins, offset = line:match('^%s*(.-)%.airamp%.(.-)%s*=%s*([0-9]+)%s*,%s*([0-9-]+)')
			t_selOptions[rowName .. rowName2] = {}
			t_selOptions[rowName .. rowName2]['wins'] = tonumber(wins)
			t_selOptions[rowName .. rowName2]['offset'] = tonumber(offset)
		end
	end
	textImgDraw(txt_loading)
	refresh()
end
--end_time = os.time()
--elapsed_time = os.difftime(end_time - start_time)
--f_printVar(elapsed_time)

function f_charAnim(t, compare, add)
	local ret = ''
	if t ~= nil then
		for i=1, #t do
			if t[i]:match('^%s*[0-9]+%s*,%s*[0-9]+%s*,.+$') then
				if compare:match('^%s*' .. t[i]:gsub('^%s*([0-9]+)%s*,.+$', '%1') .. '%s*,%s*' .. t[i]:gsub('^%s*[0-9]+%s*,%s*([0-9]+)%s*,.+$', '%1') .. '%s*,%s*') then
					ret = ret .. '\n' .. compare
				end
			end
		end
	end
	return ret
end
--;====================================================================================
--; LOADING SCREEN 2 (STORE CHARACTER DATA BASED ON PREVIOUS LOADED FROM SELECT.DEF)
--;====================================================================================
local sff2png = [[
[Output]
 ;Filename of the SFF file to create (required).
;filename = 

[Option]
input.dir =
sprite.compress.5 = lz5 ;none/lz5/rle5
sprite.compress.8 = rle8 ;none/rle8/png8
sprite.compress.24 = png24 ;none/png24
sprite.compress.32 = png32 ;none/png32
sprite.decompressonload = 0 ;0/1
sprite.detectduplicates = 0 ;0/1
sprite.autocrop = 1 ;0/1
pal.detectduplicates = 1 ;0/1
pal.discardduplicates = 1 ;0/1

[Pal]
;Enter pals here (png or act files)
;0,0, filename.png, 0,255 ;grp,idx, fname, startcol,endcol

[Option]
sprite.usepal = -1 ;Set this to the right pal

[Sprite]
]]
local generate = false
local name = ''
local batch = ''
local t_gen = {}
t_trainingChar = {}
t_tutorialChar = {}
t_bossChars = {}
t_bonusChars = {}
t_randomChars = {}
t_randomTourneyChars = {}
t_intermissionChars = {}
if t_selChars ~= nil then
--for each character loaded
	for i=1, #t_selChars do
		if t_selChars[i].stage ~= nil then
			for j=1, #t_selChars[i].stage do
				if t_stageDef[t_selChars[i].stage[j]] == nil and t_selStages ~= nil then
					local file = io.open(t_selChars[i].stage[j],'r')
					if file == nil then
						break
					end
				--Data loaded from select.def character section
					row = #t_selStages+1
					t_selStages[row] = {}
					local tmp = file:read("*all")
					file:close()
					local zoomout = tmp:match('\n%s*zoomout%s*=%s*([0-9%.]+)')
					if zoomout ~= nil then
						t_selStages[row]['zoommin'] = tonumber(zoomout)
					end
					local zoomin = tmp:match('\n%s*zoomin%s*=%s*([0-9%.]+)')
					if zoomin ~= nil then
						t_selStages[row]['zoommax'] = tonumber(zoomin)
					end
					local bgmusic = tmp:match('\n%s*bgmusic%s*=%s*([^;\n]+)%s*;?.*\n')
					if bgmusic ~= nil then
						bgmusic = bgmusic:gsub('^%s*(.-)%s*$', '%1')
						bgmusic = bgmusic:gsub('\\', '/')
						if bgmusic ~= '' then
							t_selStages[row]['music'] = {}
							t_selStages[row].music[1] = {}
							t_selStages[row].music[1]['bgmusic'] = bgmusic
							local bgmvolume = tmp:match('\n%s*bgmvolume%s*=%s*([0-9]+)')
							if bgmvolume ~= nil and bgmvolume ~= '' then
								t_selStages[row].music[1]['bgmvolume'] = tonumber(bgmvolume)
							else
								t_selStages[row].music[1]['bgmvolume'] = 100
							end
						end
					end
					addStage(t_selChars[i].stage[j])
					if t_selChars[i].includestage == nil or t_selChars[i].includestage == 1 then
						data.includestage = data.includestage + 1
					end
					local author = tmp:match('\n%s*author%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Author%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*AUTHOR%s*=%s*([^;\n]+)%s*;?.*\n')
					if author ~= nil then
						author = author:gsub('^["%s]*(.-)["%s]*$', '%1')
						if author ~= '' then
							t_selStages[row]['author'] = author
						end
					--else --Writte Blank author to avoid issues
						--author = ''
						--t_selStages[row]['author'] = author
					end
					local location = tmp:match('\n%s*location%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Location%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*LOCATION%s*=%s*([^;\n]+)%s*;?.*\n')
					if location ~= nil then
						location = location:gsub('^["%s]*(.-)["%s]*$', '%1')
						if location ~= '' then
							t_selStages[row]['location'] = location
						end
					--else --Writte Blank location to avoid issues
						--location = ''
						--t_selStages[row]['location'] = location
					end
					local daytime = tmp:match('\n%s*daytime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Daytime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*dayTime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*DayTime%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*DAYTIME%s*=%s*([^;\n]+)%s*;?.*\n')
					if daytime ~= nil then
						daytime = daytime:gsub('^["%s]*(.-)["%s]*$', '%1')
						if daytime ~= '' then
							t_selStages[row]['daytime'] = daytime
						end
					--else --Writte Blank daytime to avoid issues
						--daytime = ''
						--t_selStages[row]['daytime'] = daytime
					end
					local unlockcondition = tmp:match('\n%s*unlockcondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Unlockcondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*unlockCondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*UnlockCondition%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*UNLOCKCONDITION%s*=%s*([^;\n]+)%s*;?.*\n')
					if unlockcondition ~= nil then
						unlockcondition = unlockcondition:gsub('^["%s]*(.-)["%s]*$', '%1')
						if unlockcondition ~= '' then
							t_selStages[row]['unlockcondition'] = unlockcondition
						end
					--else --Writte Blank unlockcondition to avoid issues
						--unlockcondition = ''
						--t_selStages[row]['unlockcondition'] = unlockcondition
					end
				--[[
					local name = tmp:match('\n%s*displayname%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*Displayname%s*=%s*([^;\n]+)%s*;?.*\n') or tmp:match('\n%s*DISPLAYNAME%s*=%s*([^;\n]+)%s*;?.*\n')
					if name ~= nil then
						name = name:gsub('^["%s]*(.-)["%s]*$', '%1')
						if name ~= '' then
							t_selStages[row]['name'] = name
						end
					else --Writte Blank name to avoid issues
						name = ''
						t_selStages[row]['name'] = name
					end
				]]
					t_selStages[#t_selStages]['name'] = getStageName(#t_selStages):gsub('^["%s]*(.-)["%s]*$', '%1')
					t_selStages[#t_selStages]['stage'] = t_selChars[i].stage[j]
					t_stageDef[t_selChars[i].stage[j]] = #t_selStages --add hidden (not includestage) for use in custom fights (story mode for example)
					t_selChars[i].stage[j] = #t_selStages --convert to number a not includestage
				else
					t_selChars[i].stage[j] = t_stageDef[t_selChars[i].stage[j]]
				end
			end
		end
	--if character's name has been stored
		if t_selChars[i].displayname ~= nil then
			local charCel = i - 1
		--generate table for fixed training character
			if t_selChars[i].training ~= nil and t_selChars[i].training == 1 then
				t_trainingChar[#t_trainingChar+1] = charCel
			end
		--generate table for fixed tutorial character
			if t_selChars[i].tutorial ~= nil and t_selChars[i].tutorial == 1 then
				t_tutorialChar[#t_tutorialChar+1] = charCel
			end
		--detects stage viewer character
			if t_selChars[i].name == "stage viewer" then
				data.stageviewer = true
			end
		--generate table for boss rush mode
			if t_selChars[i].boss ~= nil and t_selChars[i].boss == 1 then
				t_bossChars[#t_bossChars+1] = charCel
			end
		--generate table for bonus games mode
			if t_selChars[i].bonus ~= nil and t_selChars[i].bonus == 1 then
				t_bonusChars[#t_bonusChars+1] = charCel
			end
		--generate table with characters allowed to be random selected
			if t_selChars[i].exclude == nil or t_selChars[i].exclude == 0 then
				t_randomChars[#t_randomChars+1] = charCel
			end
		--generate table with characters allowed to be random selected in tournament mode
			if t_selChars[i].excludetourney == nil or t_selChars[i].excludetourney == 0 then
				t_randomTourneyChars[#t_randomTourneyChars+1] = charCel
			end
		--generate table for intermissions
			if t_selChars[i].intermission ~= nil and t_selChars[i].intermission == 1 then
				t_intermissionChars[#t_intermissionChars+1] = {['cel'] = charCel, ['name'] = t_selChars[i].name, ['displayname'] = t_selChars[i].displayname, ['author'] = t_selChars[i].author, ['path'] = t_selChars[i].char}
			end
		--create variable with character's name, whitespace replaced with underscore
			displayname = t_selChars[i].name:gsub('%s+', '_')
		--if data/charAnim/displayname.def doesn't exist
			local charAnimPath = t_selChars[i].ikanim --chars/charName/
			local charAnimPathWin = t_selChars[i].ikanim:gsub('/', '\\') --this convert chars/charName/ to chars\\charName\\
			if io.open('data/charAnim/' .. displayname .. '.def','r') == nil then
			--create a batch variable used to create 'data/charTrash/charName' folder and to extract all character's sprites there
				batch = 'mkdir data\\charAnim\nmkdir debug'
				batch = batch .. '\n' .. 'mkdir "data\\charTrash\\' .. displayname .. '"' .. '\n' .. 'tools\\sff2png.exe "' .. t_selChars[i].sff:gsub('/+', '\\') .. '" "data\\charTrash\\' .. displayname .. '\\s"'
			--store character's reference that needs conversion into table to save time later on
				t_gen[#t_gen+1] = i
			--enable sprite generation later on
				generate = true
		--otherwise load SFF file generated
			else
				t_selChars[i]['sffData'] = sffNew('data/charAnim/' .. displayname .. '.sff')
				--t_selChars[i]['sffData'] = sffNew(t_selChars[i].sff) --Load data from original character.sff (Not recommended because will increase RAM Usage)
				if t_selChars[i].stand ~= nil then
					t_selChars[i]['p1AnimStand'] = f_animFromTable(t_selChars[i].stand, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 0, 1)
					t_selChars[i]['p2AnimStand'] = f_animFromTable(t_selChars[i].stand, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 'H', 1)
				end
				if t_selChars[i].win ~= nil then
					t_selChars[i]['p1AnimWin'] = f_animFromTable(t_selChars[i].win, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 0, 1)
					t_selChars[i]['p2AnimWin'] = f_animFromTable(t_selChars[i].win, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 'H', 1)
				end
				if t_selChars[i].cheese ~= nil then
					t_selChars[i]['p1AnimCheese'] = f_animFromTable(t_selChars[i].cheese, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 0, 1)
					t_selChars[i]['p2AnimCheese'] = f_animFromTable(t_selChars[i].cheese, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 'H', 1)
				end
				if t_selChars[i].lieDown ~= nil then
					t_selChars[i]['p1AnimLieDown'] = f_animFromTable(t_selChars[i].lieDown, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 0, 1)
					t_selChars[i]['p2AnimLieDown'] = f_animFromTable(t_selChars[i].lieDown, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 'H', 1)
				end
				if t_selChars[i].dizzy ~= nil then
					t_selChars[i]['p1AnimDizzy'] = f_animFromTable(t_selChars[i].dizzy, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 0, 1)
					t_selChars[i]['p2AnimDizzy'] = f_animFromTable(t_selChars[i].dizzy, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 'H', 1)
				end
				if t_selChars[i].intermissionSpr ~= nil then
					t_selChars[i]['p1IntermissionPortrait'] = f_animFromTable(t_selChars[i].intermissionSpr, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 0, 1)
					t_selChars[i]['p2IntermissionPortrait'] = f_animFromTable(t_selChars[i].intermissionSpr, t_selChars[i].sffData, 30, 150, t_selChars[i].xscale, t_selChars[i].yscale, 'H', 1)
				end
				textImgSetText(txt_loading, "GENERATING CHARS TABLES...")
				textImgDraw(txt_loading)
				refresh()
			end
		end
	end
end

for k, v in ipairs(t_selChars) do --Send Characters Unlock Condition to t_unlockLua table
	t_unlockLua.chars[v.char] = v.unlock
end

for k, v in ipairs(t_selStages) do --Send Stages Unlock Condition to t_unlockLua table
	t_unlockLua.stages[v.stage] = v.unlock
end
--;===========================================================
--; LOAD SELECT.DEF TOWER DATA
--;===========================================================
function f_loadTowers(bool)
--The loading of the towers should be after generate t_randomChars table to more comfortably add randomselect combats using that table..
t_selTower = {} --Here to avoid issues if you don´t declare [TowerMode] section in select.def
local loadingScreen = bool or false --To manage loading screen
local section = 0
local file = io.open(selectDef,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
	for line in content:gmatch('[^\r\n]+') do
		line = line:lower()
		if line:match('^%s*%[%s*towermode%s*%]') then
			section = 1
	--[TowerMode]
		elseif section == 1 then
			if line:match('^%s*snd%s*=') then
				t_selTower['data'] = {}t_selTower['data'] = {}
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					t_selTower['data']['snd'] = data:gsub('^%s*snd%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				end
			end
			if line:match('^%s*sfx.announcer%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					t_selTower['data']['sfxannouncer'] = data:gsub('^%s*sfx.announcer%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				end
			end
			if line:match('^%s*%[%s*[Tt][Oo][Ww][Ee][Rr]%s+[0-9]+$*%]') then
				row = #t_selTower+1
				t_selTower[row] = {}
				--t_selTower[row]['ID'] = textImgNew()
				--t_selTower[row]['displayname'] = ""
				t_selTower[row]['kombats'] = {}
			end
			if line:match('^%s*displayname%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					t_selTower[row]['ID'] = textImgNew()
					t_selTower[row]['displayname'] = data:gsub('^%s*displayname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				end
			end
			if line:match('^%s*sfx%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					t_selTower[row]['sfxplay'] = data:gsub('^%s*sfx%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				end
			end
			if line:match('[0-9]+%s*=%s*[^%s]') then
				local var1, var2 = line:match('([0-9]+)%s*=%s*(.+)%s*$')
				--t_selTower[row]['kombats'][tonumber(var1)] = var2:lower() --store chars name
				if var2:lower() == "randomselect" then --if there is a random char detected on a tower floor
					t_selTower[row]['kombats'][tonumber(var1)] = var2:lower() --store "randomselect" name 
				else
					t_selTower[row]['kombats'][tonumber(var1)] = t_charDef[var2] --instead of store chars name, save from t_selChars "cel" value that will be used to make roster and battle plan stuff
				end
			end
		end
	end
--Set random chars
	for k,v in ipairs(t_selTower) do --For each item stored in t_selTower
		for i, val in ipairs(v.kombats) do --For each subtable [kombats]
			if val == "randomselect" then --If the char stored is randomselect
				local randomChar = t_randomChars[math.random(#t_randomChars)] --t_randomChars table will be used to replace randomselect slot. (In online mode this random logic will cause desync if is not loaded in real time)
				while f_tableContains(v.kombats, randomChar) do --if random char selected matches one stored
					if #v.kombats > #t_randomChars then --if tower size loaded exceed number of characters stored in t_randomChars then break to avoid infinite loop.
						--table.remove(v.kombats, i)
						break
					end
					randomChar = t_randomChars[math.random(#t_randomChars)] --randomizes again
				end
				v.kombats[i] = randomChar --store/replace randomselect with random char cel
			end
		end
		v.kombats = f_delRepeated(v.kombats) --get final towers without characters repeated
	end
	if data.debugLog then f_printTable(t_selTower, "save/debug/t_selTower.log") end
	if loadingScreen then
		textImgSetText(txt_loading, "LOADING TOWERS...")
		textImgDraw(txt_loading)
		refresh()
	end
end
f_loadTowers(true)
--;===========================================================
--; LOADING SCREEN 3 (LOAD VNSELECT.DEF DATA)
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
	textImgDraw(txt_loading)
	refresh()
end
for k, v in ipairs(t_selVN) do --Send Visual Novel Story Unlock Condition to t_unlockLua table
	t_unlockLua.modes[v.id] = v.unlock
end

for k, v in ipairs(t_abyssShop) do --Send Abyss Unlock Items Condition to t_unlockLua table
	t_unlockLua.abyss[v.text] = v.unlock
end

function f_loadLicenses()
local file = f_fileRead("License.txt")
f_fileWrite(licensesPath.."/I.K.E.M.E.N..txt", file)
t_licenseList = {}
	for file in lfs.dir(licensesPath) do
		if file:match('^.*(%.)[Tt][Xx][Tt]$') then
			row = #t_licenseList+1
			t_licenseList[row] = {}
			t_licenseList[row]['id'] = ''
			t_licenseList[row]['name'] = file:gsub('^(.*)[%.][Tt][Xx][Tt]$', '%1')
			t_licenseList[row]['path'] = licensesPath.."/"..file
			t_licenseList[row]['content'] = f_txtLoad(licensesPath.."/"..file)
		end
	end
	if data.debugLog then f_printTable(t_licenseList, "save/debug/t_licenseList.log") end
end
f_loadLicenses()
--;===========================================================
--; SPRITE CONVERSION SCREEN
--;===========================================================
txt_parserWarning = createTextImg(jgFnt, 0, 0, "WARNING", 159, 13)
t_parserText = {
	{text = #t_gen .. " new character(s) detected."},
	{text = "In order to improve loading times and memory usage"},
	{text = "some sprites needs to be extracted and repacked with"},
	{text = "external Elecbyte tools (sff2png.exe and sprmake2.exe)"},
	{text = ""},
	{text = "This can be done automatically but will take some time."},
	{text = "More information is available in the readme file."},
	{text = ""},
	{text = "Would you like to start the conversion?"},
}
for i=1, #t_parserText do
	t_parserText[i]['id'] = createTextImg(font2, 0, 1, t_parserText[i].text, 25, 15+i*15)
end
t_parserOptions = {
	{text = "Yes, do it now."},
	{text = "No, skip it this time."},
	--{text = "No, disable SFF building permanently."},
}
for i=1, #t_parserOptions do
	t_parserOptions[i]['id'] = createTextImg(font2, 0, 1, t_parserOptions[i].text, 25, 165+i*15)
end

--if sprite generation is needed and conversion has not been permanently disabled
if generate and data.sffConversion then
	cmdInput()
	local parserCfg = 1
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			f_playTime()
			os.exit()
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
			sndPlay(sndSys, 100, 0)
			parserCfg = parserCfg - 1
			if parserCfg < 1 then parserCfg = #t_parserOptions end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
			sndPlay(sndSys, 100, 0)
			parserCfg = parserCfg + 1
			if parserCfg > #t_parserOptions then parserCfg = 1 end
		elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			--sndPlay(sndSys, 100, 0)
			break
		end
		textImgDraw(txt_parserWarning)
		for i=1, #t_parserText do
			textImgDraw(t_parserText[i].id)
		end
		for i=1, #t_parserOptions do
			if parserCfg == i then
				textImgSetBank(t_parserOptions[i].id, 3)
			else
				textImgSetBank(t_parserOptions[i].id, 0)
			end
			textImgDraw(t_parserOptions[i].id)
		end
		cmdInput()
		refresh()
	end
	if parserCfg == 3 then
		data.sffConversion = false
		local file = io.open(saveCfgPath,"r")
		local str = file:read("*all")
		file:close()
		str = str:gsub('data.sffConversion%s*=%s*[^\n]+', 'data.sffConversion = false')
		file = io.open(saveCfgPath,"w+")
		file:write(str)
		file:close()
	elseif parserCfg == 1 then
		f_printVar(batch, 'batch.bat')
		batch = ''
		--batOpen("", "batch.bat")
		os.execute('batch.bat')
	--open each line in data/charTrash/charName/s-sff.def to compare
		for i=1, #t_gen do
			local append = ''
			local charAnimPath = t_selChars[t_gen[i]].ikanim
			local charAnimPathWin = t_selChars[t_gen[i]].ikanim:gsub('/', '\\')
			displayname = t_selChars[t_gen[i]].name:gsub('%s+', '_')
			for line in io.lines('data/charTrash/' .. displayname .. '/s-sff.def') do
			--append to variable if line matches sprite group and sprite number stored in AIR animation data via f_charAnim function
				append = append .. f_charAnim(t_selChars[t_gen[i]].stand, line) .. f_charAnim(t_selChars[t_gen[i]].win, line) .. f_charAnim(t_selChars[t_gen[i]].lieDown, line) .. f_charAnim(t_selChars[t_gen[i]].dizzy, line) .. f_charAnim(t_selChars[t_gen[i]].cheese, line)  .. f_charAnim(t_selChars[t_gen[i]].intermissionSpr, line)
			end
		--remove duplicated sprites from string via f_uniq function
			append = f_uniq(append .. '\n', '[^\n]+\n', '^%s*[0-9-]-%s*,%s*[0-9-]-%s*,')
		--print variable for both debugging and sprite generation purpose
			f_printVar(sff2png .. append, 'data/charAnim/' .. displayname .. '.def')
		--create a batch variable used to generate sff files all at once
			batch = batch .. '\n' .. 'tools\\sprmake2.exe' .. ' -o "data\\charAnim\\' .. displayname .. '.sff" "data\\charAnim\\' .. displayname .. '.def" >> save\\debug\\sprmake2.log'
		end
		batch = batch .. '\n' .. 'del batch.bat'
		f_printVar(batch, 'batch.bat')
		--batOpen("", "batch.bat")
		os.execute('batch.bat')
		for i=1, #t_gen do
			local charAnimPath = t_selChars[t_gen[i]].ikanim
			displayname = t_selChars[t_gen[i]].name:gsub('%s+', '_')
			t_selChars[t_gen[i]]['sffData'] = sffNew('data/charAnim/' .. displayname .. '.sff')
			if t_selChars[t_gen[i]].stand ~= nil then
				t_selChars[t_gen[i]]['p1AnimStand'] = f_animFromTable(t_selChars[t_gen[i]].stand, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 0, 1)
				t_selChars[t_gen[i]]['p2AnimStand'] = f_animFromTable(t_selChars[t_gen[i]].stand, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 'H', 1)
			end
			if t_selChars[t_gen[i]].win ~= nil then
				t_selChars[t_gen[i]]['p1AnimWin'] = f_animFromTable(t_selChars[t_gen[i]].win, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 0, 1)
				t_selChars[t_gen[i]]['p2AnimWin'] = f_animFromTable(t_selChars[t_gen[i]].win, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 'H', 1)
			end
			if t_selChars[t_gen[i]].cheese ~= nil then
				t_selChars[t_gen[i]]['p1AnimCheese'] = f_animFromTable(t_selChars[t_gen[i]].cheese, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 0, 1)
				t_selChars[t_gen[i]]['p2AnimCheese'] = f_animFromTable(t_selChars[t_gen[i]].cheese, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 'H', 1)
			end
			if t_selChars[t_gen[i]].lieDown ~= nil then
				t_selChars[t_gen[i]]['p1AnimLieDown'] = f_animFromTable(t_selChars[t_gen[i]].lieDown, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 0, 1)
				t_selChars[t_gen[i]]['p2AnimLieDown'] = f_animFromTable(t_selChars[t_gen[i]].lieDown, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 'H', 1)
			end
			if t_selChars[t_gen[i]].dizzy ~= nil then
				t_selChars[t_gen[i]]['p1AnimDizzy'] = f_animFromTable(t_selChars[t_gen[i]].dizzy, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 0, 1)
				t_selChars[t_gen[i]]['p2AnimDizzy'] = f_animFromTable(t_selChars[t_gen[i]].dizzy, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 'H', 1)
			end
			if t_selChars[t_gen[i]].intermissionSpr ~= nil then
				t_selChars[t_gen[i]]['p1IntermissionPortrait'] = f_animFromTable(t_selChars[t_gen[i]].intermissionSpr, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 0, 1)
				t_selChars[t_gen[i]]['p2IntermissionPortrait'] = f_animFromTable(t_selChars[t_gen[i]].intermissionSpr, t_selChars[t_gen[i]].sffData, 30, 150, t_selChars[t_gen[i]].xscale, t_selChars[t_gen[i]].yscale, 'H', 1)
			end
			refresh()
		end
		deldir('data/charTrash')
	end
end

--Generate Table with Music List
t_selMusic = {
	{bgmfile = "", bgmname = "AUTO", bgmchar = 0},
	{bgmfile = "", bgmname = "AUTO [RIGHT SIDE]", bgmchar = 0},
	{bgmfile = "", bgmname = "RANDOM", bgmchar = 0}
}

--Populate t_selMusic table with SOUND FOLDER data
selMusicPath = musicPath --loaded from screnpack.lua
for file in lfs.dir(selMusicPath) do
	if file:match('^.*(%.)[Mm][Pp][3]$') then
		row = #t_selMusic+1
		t_selMusic[row] = {}
		t_selMusic[row]['bgmfile'] = selMusicPath.."/"..file
		t_selMusic[row]['bgmname'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
		t_selMusic[row]['bgmchar'] = 0
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
		row = #t_selMusic+1
		t_selMusic[row] = {}
		t_selMusic[row]['bgmfile'] = selMusicPath.."/"..file
		t_selMusic[row]['bgmname'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_selMusic[row]['bgmchar'] = 0
	end
end

--Add extra items to Song Select table
t_selMusic[#t_selMusic+1] = {bgmfile = "", bgmname = "MUTE", bgmchar = 0}
t_selMusic[#t_selMusic+1] = {bgmfile = "", bgmname = "AUTO [LEFT SIDE]", bgmchar = 0}

t_extraStages = {}
function generateStageList(path)
	for item in lfs.dir(path) do --For each item readed in path
		if item ~= "." and item ~= ".." and item ~= ".keep" then --exclude items
			local details = path.."/"..item --Get path and file name
			local attribute = lfs.attributes(details) --Get atributes from items readed
			if attribute ~= nil then
				assert(type(attribute) == "table")
				generateStageList(details)
				if attribute.mode == "file" then
					if item:match('^.*(%.)[Dd][Ee][Ff]$') then --Get only .def files
						t_extraStages[#t_extraStages+1] = details
					end
					--f_printTable(t_extraStages, 'save/debug/StageListCreator.log')
				end
			end
		end
	end
	local str = "[ExtraStages]"
	for i=1, #t_extraStages do --For all values/paths stored in table
		str = str..'\n'..t_extraStages[i]
	end
	dscr = io.open("save/00_ExtraStagesList.txt", 'w')
	dscr:write(str) --Write all table values in txt file
	io.close(dscr)
end

t_characters = {}
function generateCharsList(path)
	for item in lfs.dir(path) do
		if item ~= "." and item ~= ".." and item ~= ".keep" then
			local details = path.."/"..item
			local attribute = lfs.attributes(details)
			if attribute ~= nil then
				assert(type(attribute) == "table") --To avoid isues here all files inside char folder need to be in not japan or special symbols names
				generateCharsList(details)
				if attribute.mode == "file" then
					if item:match('^.*(%.)[Dd][Ee][Ff]$') then
						local rPath = details
						local startIndex = string.find(rPath, "chars/") --Finds "chars/" string
						if startIndex then
							local details = string.sub(rPath, startIndex+6) --Extracts the substring starting from the position after "chars/"
							t_characters[#t_characters+1] = details
						else --"String does not contain 'chars/'
							
						end
					end
					--f_printTable(t_characters, 'save/debug/CharsListCreator.log')
				end
			end
		end
	end
	local str = "[Characters]"
	for i=1, #t_characters do
		str = str..'\n'..t_characters[i]
	end
	dscr = io.open("save/00_CharactersList.txt", 'w')
	dscr:write(str)
	io.close(dscr)
end

--print tables
if data.debugLog then
	f_printTable(t_selChars, "save/debug/t_selChars.log")
	f_printTable(t_selStages, "save/debug/t_selStages.log")
	f_printTable(t_selMusic, "save/debug/t_selMusic.log")
	f_printTable(t_selOptions, "save/debug/t_selOptions.log")
	f_printTable(t_selVN, "save/debug/t_selVN.log")
	f_printTable(t_charDef, "save/debug/t_charDef.log")
	f_printTable(t_stageDef, "save/debug/t_stageDef.log")
	f_printTable(t_orderChars, "save/debug/t_orderChars.log")
	f_printTable(t_randomChars, "save/debug/t_randomChars.log")
	f_printTable(t_randomTourneyChars, "save/debug/t_randomTourneyChars.log")
	f_printTable(t_bossChars, "save/debug/t_bossChars.log")
	f_printTable(t_bonusChars, "save/debug/t_bonusChars.log")
	f_printTable(t_trainingChar, "save/debug/t_trainingChar.log")
	f_printTable(t_tutorialChar, "save/debug/t_tutorialChar.log")
	f_printTable(t_intermissionChars, "save/debug/t_intermissionChars.log")
	f_printTable(t_unlockLua, "save/debug/t_unlockLua.log")
end

function f_updateUnlocks() --To refresh unlocks data
if data.debugLog then f_printTable(t_unlockLua, "save/debug/t_unlockLua.log") end
end

function f_rushTables()
	t_bossSingle = {} --This is the table of the boss chars menu to fight against them individually, it must be loaded after this parser script or it will give an error
	local endFor = #t_bossChars+1
	for i=1, endFor do
		if i < endFor then
			t_bossSingle[#t_bossSingle+1] = {}
			t_bossSingle[i]['id'] = textImgNew()
			t_bossSingle[i]['text'] = t_selChars[t_bossChars[i]+1].displayname:upper()
		end
	end

	t_bonusExtras = {} --This is the bonus chars menu table, it must be loaded after this parser script or it will give an error
	local endFor = #t_bonusChars+1
	for i=1, endFor do
		if i < endFor then
			t_bonusExtras[#t_bonusExtras+1] = {}
			t_bonusExtras[i]['id'] = textImgNew()
			t_bonusExtras[i]['text'] = t_selChars[t_bonusChars[i]+1].displayname:upper()
		end
	end
end
f_rushTables() --This function prevents that the table getting messed up when playing single boss or single bonus mode, since the table that loads the chars after playing boss rush or bonus rush, randomizes the items.