
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