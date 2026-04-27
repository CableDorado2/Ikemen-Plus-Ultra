local loadLuaModule = false

function f_mainTitle()
	cmdInput()
	while true do
		animDraw(f_animVelocity(commonBG0, -1, -1))
		--drawBottomMenuSP()
		--drawMiddleMenuSP()
		cmdInput()
		refresh()
	end
end