
module(..., package.seeall)

function f_continue()
	data.continue = 0
	local tablePos = ''
	local anim = false
	local animLength = 0
	local i = 0
	tablePos = t_selChars[data.t_p1selected[1].cel+1]
	if tablePos.sffData ~= nil and tablePos.dizzy ~= nil then
		anim = f_animFromTable(tablePos['dizzy'], tablePos.sffData, 70, 180, tablePos.xscale, tablePos.yscale, 0, 1)
	end	
	cmdInput()
	while true do
		i = i + 1
		if data.continue == 0 then --waiting for player's decision
			if anim then
				animDraw(anim)
				animUpdate(anim)
			end
			if commandGetState(p1Cmd, 'holds') then
				if tablePos.sffData ~= nil and tablePos.win ~= nil then
					anim, animLength = f_animFromTable(tablePos['win'], tablePos.sffData, 70, 180, tablePos.xscale, tablePos.yscale, 0, 1)
				else
					animLength = 0
				end
				data.continue = 1
			end
		elseif data.continue == 1 then --Continue = YES
			if animLength+30 > 0 then
				animLength = animLength - 1
				if anim then
					animDraw(anim)
					if animLength > 0 then
						animUpdate(anim)
					end
				end
			else
				data.fadeSelect = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				cmdInput()
				if data.challengerScreen == true then
					script.select.f_selectChallenger()
					f_challengerMusic()
				else	
					playBGM(bgmSelect) --play original char select song instead of challenger song
				end
				break
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)		
		cmdInput()
		refresh()
	end
end