--[[
This file handles the addition of new config.ssz, data_sav.lua, and training_sav.lua entires.
It's much nicer when you don't have to keep resetting your entire config.

Might seem overkill that this is for so few options at the moment, but it makes things futureproof.
Find, Value, Append (to)
]]
t_config = {
	{f = 'const float PanStr', v = ' = 0.8', a = '(const float BGMVol%s*=%s*%d%.*%d*;)'},
}

t_training = {
	{f = '--Practice Settings', v = '', p = '(data.trnStateType)'},
	{f = 'data.trnCounterHit', v = ' = 0', a = '(data.trnAutoGuard%s*=%s*%d*)'},
	{f = 'data.trnRecoverDir', v = ' = 0', a = '(data.trnRecover%s*=%s*%d*)'},
	{f = 'data.trnInput', v = ' = 0', a = '(data.trnDisplay%s*=%s*%d*)'},
	{f = '--Playback Settings\ndata.pbkRecSlot = 1\ndata.pbkPlaySlot = 1\ndata.pbkPlayLoop = false\ndata.pbkSlot1 = true\ndata.pbkSlot2 = false\ndata.pbkSlot3 = false\ndata.pbkSlot4 = false\ndata.pbkSlot5', v = ' = false', a = '(data.trnLBRefill%s*=%s*%d*)'},
}

function f_updateCfg()
	local file = io.open('save/config.ssz','r')
	if file == nil then
		return
	else
		local cfg = file:read("*all")
		file:close()
		for i=1, #t_config do
			if not cfg:find(t_config[i].f) then
				if t_data[i].a == nil then
					cfg = cfg:gsub(t_config[i].p, t_config[i].f .. '\n%1' .. t_config[i].v .. ';')
				else
					cfg = cfg:gsub(t_config[i].a, '%1\n' .. t_config[i].f .. t_config[i].v .. ';')
				end
				modified = true
			end
		end
		if not modified then
			return
		else
			local file = io.open('save/config.ssz','w+')
			file:write(cfg)
			file:close()
		end
	end
end

function f_updateDat()
	local file = io.open('save/data_sav.lua','r')
	if file == nil then
		return
	else
		local dat = file:read("*all")
		file:close()
		for i=1, #t_data do
			if not dat:find(t_data[i].f) then
				if t_data[i].a == nil then
					dat = dat:gsub(t_data[i].p, t_data[i].f .. '\n%1' .. t_data[i].v)
				else
					dat = dat:gsub(t_data[i].a, '%1\n' .. t_data[i].f .. t_data[i].v)
				end
				modified = true
			end
		end
		if not modified then
			return
		else
			local file = io.open('save/data_sav.lua','w+')
			file:write(dat)
			file:close()
		end
	end
end

function f_updateTraining()
	local file = io.open('save/training_sav.lua','r')
	if file == nil then
		return
	else
		local trn = file:read("*all")
		file:close()
		for i=1, #t_training do
			if not trn:find(t_training[i].f) then
				if t_training[i].a == nil then
					trn = trn:gsub(t_training[i].p, t_training[i].f .. '\n%1' .. t_training[i].v)
				else
					trn = trn:gsub(t_training[i].a, '%1\n' .. t_training[i].f .. t_training[i].v)
				end
				modified = true
			end
		end
		if not modified then
			return
		else
			local file = io.open('save/training_sav.lua','w+')
			file:write(trn)
			file:close()
		end
	end
end

--f_updateCfg()
--f_updateDat()
f_updateTraining()