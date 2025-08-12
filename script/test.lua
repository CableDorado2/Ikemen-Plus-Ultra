function f_mainTitle()
	cmdInput()
	while true do
		--[[
		drawBottomMenuSP()
		drawMiddleMenuSP()
		]]
		animDraw(f_animVelocity(commonBG0, -1, -1))
		cmdInput()
		refresh()
	end
end