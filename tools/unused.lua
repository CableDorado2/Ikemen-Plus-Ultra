
t_orderTowerChars = {}
--Tower Order for loader.lua
if t_selChars[row].ordertower ~= nil then --Only add to t_orderTowerChars chars that have an ordertower paramvalue
	if t_orderTowerChars[t_selChars[row].ordertower] == nil then
		t_orderTowerChars[t_selChars[row].ordertower] = {}
	end
	t_orderTowerChars[t_selChars[row].ordertower][#t_orderTowerChars[t_selChars[row].ordertower]+1] = row-1
end

if section == 4 then --[TowerMode]
	if line:match('^%s*difficulty%s*=') then
		row = #t_selTower+1
		t_selTower[row] = {}
		local data = line:gsub('%s*;.*$', '')
		if not data:match('=%s*$') then
			t_selTower[row]['difficulty'] = data:gsub('^%s*difficulty%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			t_selTower[row]['ID'] = textImgNew()
			t_selTower[row]['maxmatches'] = {}
			t_selTower[row]['chars'] = t_orderTowerChars
		end
	end
	if line:match('^%s*maxmatches%s*=') then
		for i, c in ipairs(strsplit(',', line:gsub('%s*(.-)%s*', '%1'))) do
			t_selTower[row].maxmatches[#t_selTower[row].maxmatches+1] = tonumber(c)
			--t_selTower[row].maxmatches[i-1] = tonumber(c) --This also works
		end
	end
end

--f_makeRoster() Tower
if data.gameMode == "tower" then
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
		if p1teamMode == 0 then --Single
			t = t_selTower[destinySelect].maxmatches
		--else --Team
			--t = t_selTower[destinySelect].teammaxmatches
		end
	else
		if p2teamMode == 0 then --Single
			t = t_selTower[destinySelect].maxmatches
		--else --Team
			--t = t_selTower[destinySelect].teammaxmatches
		end
	end
	for i=1, #t do --for each order number
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			cnt = t[i] * p1numChars --set amount of matches to get from the table
		else
			cnt = t[i] * p2numChars --set amount of matches to get from the table
		end
		if cnt > 0 and t_orderTowerChars[i] ~= nil then --if it's more than 0 and there are characters with such order
			while cnt > 0 do --do the following until amount of matches for particular order is reached
				f_shuffleTable(t_orderTowerChars[i]) --randomize characters table
				for j=1, #t_orderTowerChars[i] do --loop through chars associated with that particular order
					t_roster[#t_roster+1] = t_orderTowerChars[i][j] --and add such character into new table
					cnt = cnt - 1
					if cnt == 0 then --but only if amount of matches for particular order has not been reached yet
						break
					end
				end
			end
		end
	end
end

--Almacenar automaticamente todos los parametros definidos dentro del .def
local t_vnTest = {}
local file = io.open("data/visualnovel/arc1.def", "r")
if file then
    local chapterFound = false
    for line in file:lines() do
        if line:match("%[Chapter 1%]") then
            chapterFound = true
        elseif chapterFound then
            --Search "=" in line and store the info in t_vnTest
            local key, value = line:match("(%w+)%s*=%s*(.*)")
            if key and value then
                t_vnTest[key] = value
            end
        end
    end
    file:close()
end
f_printTable(t_vnTest, "save/debug/TEST.txt")

function f_txtLoad(path)
t_txtBoxText = {}
local file = io.open(path,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
for line in content:gmatch('[^\r\n]+') do
	row = #t_txtBoxText+1
	t_txtBoxText[row] = {}
	t_txtBoxText[row]['text'] = line
end
if data.debugLog then f_printTable(t_txtBoxText, "save/debug/t_txtBoxText.txt") end
end

function f_txtLoad2(path)
local file = io.open(path,"r") --Open .txt file refer in path var in reading mode
local t = {} --Create a table to store the file information
for i in file:lines() do --Read file content line by line
	table.insert(t, i) --Save each line as a table element
end
file:close() --Close .txt file
if data.debugLog then f_printTable(t, "save/debug/t_txtBoxText.txt") end
end

--Move to common.lua --> f_soundtrack()
t_file = {}
folder = #t_file+1
t_file[folder] = {} --Add 1st folder
function f_loadDir(path)
	for item in lfs.dir(path) do --For each item readed in path
		if item ~= "." and item ~= ".." and item ~= ".keep" then --exclude items
			local details = path.."/"..item --Get path and file name
			local attribute = lfs.attributes(details) --Get atributes from items readed
			assert(type(attribute) == "table")
			f_loadDir(details)
			if attribute.mode == "directory" then --If the item have "folder/dir" attribute
				folder = #t_file+1
				t_file[folder] = {} --Add new folder
			elseif attribute.mode == "file" then --If the item have "file" attribute
				if item:match('^.*(%.)[Mm][Pp][3]$') then
					t_file[folder][#t_file[folder]+1] = {}
					t_file[folder][#t_file[folder]]['id'] = ""
					t_file[folder][#t_file[folder]]['folder'] = "TODO"
					t_file[folder][#t_file[folder]]['path'] = details --Add item to table
					t_file[folder][#t_file[folder]]['name'] = item:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
				end
				--f_printTable(t_file, 'save/debug/Test.txt')
			end
		end
	end
	f_printTable(t_file, 'save/debug/Test.txt')
end
f_loadDir("sound")

function f_soundtrack()
t_songList = {} --Create Table
--;=================================================================
--;	FOLDER 1
--;=================================================================
folder = #t_songList+1 --Set "Folder 1" row for the table
t_songList[folder] = {} --Add 1st Folder
for file in lfs.dir[[.\\sound\\]] do --Read Dir
	if file:match('^.*(%.)[Mm][Pp][3]$') then --Filter Files .mp3			
		t_songList[folder][#t_songList[folder]+1] = {} --Add songs filtered to the end of the "folder" sub-table
		t_songList[folder][#t_songList[folder]]['id'] = '' --Reserve id to create text
		t_songList[folder][#t_songList[folder]]['folder'] = 'GLOBAL' --Folder name where is located the song
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1') --Get song name without extension
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file --Get song file path
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then --Filter Files .ogg
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'GLOBAL'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file
	end
end
--Add extra items to the end of "Folder" sub-row Created
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'GLOBAL', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'GLOBAL', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 2
--;=================================================================
folder = #t_songList+1 --Set "Folder 2" row for the table
t_songList[folder] = {} --Add 2nd Folder
for file in lfs.dir[[.\\sound\system\\]] do
	if file:match('^.*(%.)[Mm][Pp][3]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SYSTEM', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SYSTEM', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 3
--;=================================================================
folder = #t_songList+1
t_songList[folder] = {}
for file in lfs.dir[[.\\sound\system\menu\\]] do
	if file:match('^.*(%.)[Mm][Pp][3]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'MENU', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'MENU', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 4
--;=================================================================
folder = #t_songList+1
t_songList[folder] = {}
for file in lfs.dir[[.\\sound\system\select\\]] do
	if file:match('^.*(%.)[Mm][Pp][3]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'CHARACTER SELECT', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'CHARACTER SELECT', name = '          BACK', path = ''}
--;=================================================================
--;	SET YOUR FOLDER BELOW
--;=================================================================

--Save Log
if data.debugLog then f_printTable(t_songList, "save/debug/t_songList.txt") end
end