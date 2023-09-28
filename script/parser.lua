--;===========================================================
--; GLOBAL VARIABLES DEFINITION
--;===========================================================
onlinegame = false
replaygame = false
coinSystem = true
data.tagmode = 1
data.includestage = 0

--;===========================================================
--; INITIAL ACTIONS
--;===========================================================
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
		local sffPath = ''
		local sndPath = ''
		local airPath = ''
		local cnsPath = ''
		local stPath = ''
		local introPath = ''
		local endingPath = ''
		local row = ''
		local section = ''
		local readLines = 8
		for line in io.lines(def) do
			line = line:lower()
			if line:match('^%s*%[%s*info%s*%]') then
				section = 1
			elseif line:match('^%s*%[%s*files%s*%]') then
				section = 2
			elseif line:match('^%s*%[%s*palette%s*keymap%s*%]') then
				section = 3
			elseif line:match('^%s*%[%s*arcade%s*%]') then
				section = 4
			elseif line:match('^%s*%[') then --in case character shares DEF file with other files
				break
			elseif section == 1 then --[Info]
				if line:match('^%s*name%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['name'] = line:gsub('^%s*name%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
					readLines = readLines - 1
				end
				if line:match('^%s*author%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						t['author'] = line:gsub('^%s*author%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
					readLines = readLines - 1
				end
			elseif section == 2 then --[Files]
				if line:match('^%s*sprite%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						sffPath = dir .. line:gsub('^%s*sprite%s*=%s*(.-)%s*$', '%1')
						t['sff'] = sffPath
					end
					readLines = readLines - 1
				elseif line:match('^%s*sound%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						sndPath = dir .. line:gsub('^%s*sound%s*=%s*(.-)%s*$', '%1')
						t['snd'] = sndPath
					end
					readLines = readLines - 1
				elseif line:match('^%s*anim%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						airPath = dir .. line:gsub('^%s*anim%s*=%s*(.-)%s*$', '%1')
						t['air'] = airPath
					end
					readLines = readLines - 1
				elseif line:match('^%s*cns%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						cnsPath = dir .. line:gsub('^%s*cns%s*=%s*(.-)%s*$', '%1')
						t['cns'] = cnsPath
					end
					readLines = readLines - 1
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
			elseif section == 3 then --[Palette Keymap]
				--nothing until palletes swap function is implemented
			elseif section == 4 then --[Arcade]
				if line:match('^%s*intro%.storyboard%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						introPath = dir .. line:gsub('^%s*intro%.storyboard%s*=%s*(.-)%s*$', '%1')
						t['intro'] = introPath
					end
					readLines = readLines - 1
				elseif line:match('^%s*ending%.storyboard%s*=') then
					line = line:gsub('%s*;.*$', '')
					if not line:match('=%s*$') then
						line = line:gsub('\\', '/')
						endingPath = dir .. line:gsub('^%s*ending%.storyboard%s*=%s*(.-)%s*$', '%1')
						t['ending'] = endingPath
					end
					readLines = readLines - 1
				end
			end
			if stPath ~= '' and section ~= 2 and section ~= 3 then
				readLines = readLines - 1
			end
			if readLines == 0 then
				break
			end
		end
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

--add characters and stages using select.def instead of select.lua
--start_time = os.time()
t_orderChars = {}
t_stageDef = {}
t_charAdd = {}
local section = 0
local file = io.open("data/select.def","r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
--f_printVar(content)
for line in content:gmatch('[^\r\n]+') do
--for line in io.lines("data/select.def") do
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
	elseif section == 1 then --[Characters]
		row = #t_selChars+1
		t_selChars[row] = {}
		for i, c in ipairs(strsplit(',', line)) do
			c = c:gsub('^%s*(.-)%s*$', '%1')
			if i == 1 then
				c = c:gsub('\\', '/')
				c = tostring(c)
				t_selChars[row]['char'] = c
				addChar(c)
				t_charAdd[c] = row - 1
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
			elseif c:match('[0-9]+%s*=%s*[^%s]') then
				local var1, var2 = c:match('([0-9]+)%s*=%s*(.+)%s*$')
				t_selChars[row][tonumber(var1)] = var2:lower()
			elseif c:match('%.[Dd][Ee][Ff]') then
				c = c:gsub('\\', '/')
				if t_selChars[row]['stage'] == nil then
					t_selChars[row]['stage'] = {}
				end
				t_selChars[row].stage[#t_selChars[row].stage+1] = c
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
			if t_selChars[row].order == nil then
				t_selChars[row]['order'] = 1
			end
			if t_orderChars[t_selChars[row].order] == nil then
				t_orderChars[t_selChars[row].order] = {}
			end
			t_orderChars[t_selChars[row].order][#t_orderChars[t_selChars[row].order]+1] = row-1
		end
	elseif section == 2 then --[ExtraStages]
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
				addStage(c)
				data.includestage = data.includestage + 1
				t_selStages[row]['name'] = getStageName(#t_selStages):gsub('^["%s]*(.-)["%s]*$', '%1')
				t_selStages[row]['stage'] = c
				t_stageDef[c] = row
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
			else
				local param, value = c:match('^(.-)%s*=%s*(.-)$')
				t_selStages[row][param] = tonumber(value)
			end
		end
	elseif section == 3 then --[Options]
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

local sff2png = [[
[Output]
 ;Filename of the SFF file to create (required).
;filename = 

[Option]
input.dir =
sprite.compress.5 = lz5 ;none/lz5/rle5
sprite.compress.8 = png8 ;none/rle8/png8
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
local batch = 'mkdir data\\charAnim\nmkdir debug'
local t_gen = {}
t_bossChars = {}
t_bonusChars = {}
t_randomChars = {}
--for each character loaded
for i=1, #t_selChars do
	if t_selChars[i].stage ~= nil then
		for j=1, #t_selChars[i].stage do
			if t_stageDef[t_selChars[i].stage[j]] == nil then
				local file = io.open(t_selChars[i].stage[j],'r')
				if file == nil then
					break
				end
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
				t_selStages[#t_selStages]['name'] = getStageName(#t_selStages):gsub('^["%s]*(.-)["%s]*$', '%1')
				t_selStages[#t_selStages]['stage'] = t_selChars[i].stage[j]
				t_selChars[i].stage[j] = #t_selStages
				--t_stageDef[t_selChars[i].stage[j]] = row
			else
				t_selChars[i].stage[j] = t_stageDef[t_selChars[i].stage[j]]
			end
		end
	end
	--if character's name has been stored
	if t_selChars[i].displayname ~= nil then
		--generate table for boss rush mode
		if t_selChars[i].boss ~= nil and t_selChars[i].boss == 1 then
			t_bossChars[#t_bossChars+1] = i - 1
		end
		--generate table for bonus games mode
		if t_selChars[i].bonus ~= nil and t_selChars[i].bonus == 1 then
			t_bonusChars[#t_bonusChars+1] = i - 1
		end
		--generate table with characters allowed to be random selected
		if t_selChars[i].exclude == nil or t_selChars[i].exclude == 0 then
			t_randomChars[#t_randomChars+1] = i - 1
		end
		--create variable with character's name, whitespace replaced with underscore
		displayname = t_selChars[i].displayname:gsub('%s+', '_')
		--if data/charAnim/displayname.def doesn't exist
		if io.open('data/charAnim/' .. displayname .. '.def','r') == nil then
			--create a batch variable used to create 'data/charTrash/charName' folder and to extract all character's sprites there
			batch = batch .. '\n' .. 'mkdir "data\\charTrash\\' .. displayname .. '"' .. '\n' .. 'tools\\sff2png.exe "' .. t_selChars[i].sff:gsub('/+', '\\') .. '" "data\\charTrash\\' .. displayname .. '\\s"'
			--store character's reference that needs conversion into table to save time later on
			t_gen[#t_gen+1] = i
			--enable sprite generation later on
			generate = true
		--otherwise load SFF file
		else
			t_selChars[i]['sffData'] = sffNew('data/charAnim/' .. displayname .. '.sff')
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
			textImgDraw(txt_loading)
			refresh()
		end
	end
end

--Generate Table with Music List
t_selMusic = {
	{bgmfile = '', bgmname = 'AUTO', bgmchar = 0},
	{bgmfile = '', bgmname = 'RANDOM', bgmchar = 0},
	{bgmfile = '', bgmname = 'MUTE', bgmchar = 0}
}

--Populate table with STAGE SONG
--for i=1, #t_selStages+3 do
	--t_selMusic[i+3] = {}
	--if i <= #t_selStages then
		--t_selMusic[i+3]['bgmfile'] = t_selStages[i].music[1].bgmusic
	--else
		--t_selMusic[i+3]['bgmfile'] = ''
	--end
	--t_selMusic[i+3]['bgmname'] = 'Song Name'
	--t_selMusic[i+3]['bgmchar'] = 0
--end

--Populate table with SOUND FOLDER
for file in lfs.dir[[.\\sound\\]] do --Read Dir
	if file:match('^.*(%.)mp3$') then --Filter Files .mp3
		row = #t_selMusic+1
		t_selMusic[row] = {}
		t_selMusic[row]['bgmfile'] = ''
		t_selMusic[row]['bgmname'] = file:gsub('^(.*)[%.]mp3$', '%1')
		t_selMusic[row]['bgmchar'] = 0
	elseif file:match('^.*(%.)MP3$') then --Filter Files .MP3
		row = #t_selMusic+1
		t_selMusic[row] = {}
		t_selMusic[row]['bgmfile'] = ''
		t_selMusic[row]['bgmname'] = file:gsub('^(.*)[%.]MP3$', '%1')
		t_selMusic[row]['bgmchar'] = 0
	elseif file:match('^.*(%.)ogg$') then --Filter Files .ogg
		row = #t_selMusic+1
		t_selMusic[row] = {}
		t_selMusic[row]['bgmfile'] = ''
		t_selMusic[row]['bgmname'] = file:gsub('^(.*)[%.]ogg$', '%1')
		t_selMusic[row]['bgmchar'] = 0
	elseif file:match('^.*(%.)OGG$') then --Filter Files .OGG
		row = #t_selMusic+1
		t_selMusic[row] = {}
		t_selMusic[row]['bgmfile'] = ''
		t_selMusic[row]['bgmname'] = file:gsub('^(.*)[%.]OGG$', '%1')
		t_selMusic[row]['bgmchar'] = 0
	end
end

--Extra music
--t_selMusic[4].bgmfile = 'sound/Quick Versus Songs/Random 1.mp3'
--t_selMusic[4].bgmname = 'Extra Song Name'
--t_selMusic[4].bgmchar = 999

--Stage music names and associated character
--t_selMusic[5].bgmname = 'Character 1 Name'
--t_selMusic[5].bgmchar = 1
--t_selMusic[6].bgmname = 'Character 2 Name'
--t_selMusic[6].bgmchar = 2

--if sprite generation is needed and conversion has not been permanently disabled
if generate and data.sffConversion then
	txt_parserWarning = createTextImg(jgFnt, 0, 0, 'WARNING', 159, 13)
	t_parserText = {
		{id = '', text = #t_gen .. " new character(s) detected."},
		{id = '', text = "In order to improve loading times and memory usage"},
		{id = '', text = "some sprites needs to be extracted and repacked with"},
		{id = '', text = "external Elecbyte tools (sff2png.exe and sprmake2.exe)"},
		{id = '', text = ""},
		{id = '', text = "This can be done automatically but will take some time."},
		{id = '', text = "More information is available in the readme file."},
		{id = '', text = ""},
		{id = '', text = "Would you like to start the conversion?"},
	}
	for i=1, #t_parserText do
		t_parserText[i].id = createTextImg(font2, 0, 1, t_parserText[i].text, 25, 15+i*15)
	end
	t_parserOptions = {
		{id = '', text = "Yes, do it now."},
		{id = '', text = "No, skip it this time."},
		--{id = '', text = "No, disable SFF building permanently."},
	}
	for i=1, #t_parserOptions do
		t_parserOptions[i].id = createTextImg(font2, 0, 1, t_parserOptions[i].text, 25, 165+i*15)
	end
	cmdInput()
	local parserCfg = 1
	while true do
		if esc() then
			f_playTime()
			os.exit()
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			parserCfg = parserCfg - 1
			if parserCfg < 1 then parserCfg = #t_parserOptions end
		elseif commandGetState(p1Cmd, 'd') then
			sndPlay(sysSnd, 100, 0)
			parserCfg = parserCfg + 1
			if parserCfg > #t_parserOptions then parserCfg = 1 end
		elseif btnPalNo(p1Cmd) > 0 or commandGetState(p1Cmd, 'holds') then
			--sndPlay(sysSnd, 100, 0)
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
		local file = io.open("saved/data_sav.lua","r")
		local str = file:read("*all")
		file:close()
		str = str:gsub('data.sffConversion%s*=%s*[^\n]+', 'data.sffConversion = false')
		file = io.open("saved/data_sav.lua","w+")
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
			displayname = t_selChars[t_gen[i]].displayname:gsub('%s+', '_')
			for line in io.lines('data/charTrash/' .. displayname .. '/s-sff.def') do
				--append to variable if line matches sprite group and sprite number stored in AIR animation data via f_charAnim function
				append = append .. f_charAnim(t_selChars[t_gen[i]].stand, line) .. f_charAnim(t_selChars[t_gen[i]].win, line) .. f_charAnim(t_selChars[t_gen[i]].lieDown, line) .. f_charAnim(t_selChars[t_gen[i]].dizzy, line) .. f_charAnim(t_selChars[t_gen[i]].cheese, line)
			end
			--remove duplicated sprites from string via f_uniq function
			append = f_uniq(append .. '\n', '[^\n]+\n', '^%s*[0-9-]-%s*,%s*[0-9-]-%s*,')
			--print variable for both debugging and sprite generation purpose
			f_printVar(sff2png .. append, 'data/charAnim/' .. displayname .. '.def')
			--create a batch variable used to generate sff files all at once
			batch = batch .. '\n' .. 'tools\\sprmake2.exe' .. ' -o "data\\charAnim\\' .. displayname .. '.sff" "data\\charAnim\\' .. displayname .. '.def" >> saved\\debug\\sprmake2.log'
		end
		batch = batch .. '\n' .. 'del batch.bat'
		f_printVar(batch, 'batch.bat')
		--batOpen("", "batch.bat")
		os.execute('batch.bat')
		for i=1, #t_gen do
			displayname = t_selChars[t_gen[i]].displayname:gsub('%s+', '_')
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
			batOpen("tools", "trash.bat") --added via script.ssz
			--lfs.rmdir ("./data/charTrash") --Directory needs to be empty to work
			refresh()
		end
	end
end

f_printTable(t_selChars, "saved/debug/t_selChars.txt")
f_printTable(t_selStages, "saved/debug/t_selStages.txt")
f_printTable(t_selOptions, "saved/debug/t_selOptions.txt")
f_printTable(t_orderChars, "saved/debug/t_orderChars.txt")
f_printTable(t_randomChars, "saved/debug/t_randomChars.txt")
f_printTable(t_bossChars, "saved/debug/t_bossChars.txt")
f_printTable(t_bonusChars, "saved/debug/t_bonusChars.txt")
f_printTable(t_stageDef, "saved/debug/t_stageDef.txt")
f_printTable(t_charAdd, "saved/debug/t_charAdd.txt")

function f_rushTables()
	t_bossSingle = {} --This is the table of the boss chars to fight against them individually, it must be loaded after this parser script or it will give an error
	local endFor = #t_bossChars+1
	for i=1, endFor do
	t_bossSingle[#t_bossSingle+1] = {}
	t_bossSingle[i]['id'] = textImgNew()
	if i < endFor then
		t_bossSingle[i]['text'] = t_selChars[t_bossChars[i]+1].displayname:upper()
	else
		t_bossSingle[i]['text'] = 'BACK'
		end
	end	

	t_bonusExtras = {} --This is the bonus chars table, it must be loaded after this parser script or it will give an error
	local endFor = #t_bonusChars+1
	for i=1, endFor do
		t_bonusExtras[#t_bonusExtras+1] = {}
		t_bonusExtras[i]['id'] = textImgNew()
		if i < endFor then
			t_bonusExtras[i]['text'] = t_selChars[t_bonusChars[i]+1].displayname:upper()
		else
			t_bonusExtras[i]['text'] = 'BACK'
		end
	end
end

f_rushTables() --This function prevents that the table getting messed up when playing single boss or single bonus mode, since the table that loads the chars after playing boss rush or bonus rush, randomizes the items.
