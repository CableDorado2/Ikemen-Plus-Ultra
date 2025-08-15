--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]

--Input Hints Tables uses Input Display Guide assets to display
t_tutoInput1 = {
--Step 1
	{
		btn = "_F", --What button will be displayed
		time = 0, --For how many ticks will be displayed
	},
}

t_tutoInput2 = {
	{
		btn = "_B",
		time = 0,
	},
}

t_tutoInput3 = {
	{
		btn = "_D",
		time = 0,
	},
}

t_tutoInput4 = {
	{
		btn = "_U",
		time = 0,
	},
}

t_tutoInput5 = {
--Step 1
	{
		btn = "_B",
		time = 10,
	},
--Step 2
	{
		btn = "",
		time = 5,
	},
}

t_tutoInput6 = {
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "",
		time = 5,
	},
}

t_tutoInput7 = {
	{
		btn = "^X",
		time = 25,
	},
	{
		btn = "^Y",
		time = 25,
	},
	{
		btn = "^Z",
		time = 25,
	},
}

t_tutoInput8 = {
	{
		btn = "^A",
		time = 25,
	},
	{
		btn = "^B",
		time = 25,
	},
	{
		btn = "^C",
		time = 25,
	},
}

t_tutoInput9 = {
	{
		btn = "_U",
		hold = true,
		time = 0,
	},
	{
		btn = "^A",
		time = 25,
	},
	{
		btn = "^X",
		time = 25,
	},
	{
		btn = "^B",
		time = 25,
	},
	{
		btn = "^Y",
		time = 25,
	},
	{
		btn = "^C",
		time = 25,
	},
	{
		btn = "^Z",
		time = 25,
	},
}

t_tutoInput10 = {
	{
		btn = "_D",
		hold = true,
		time = 0,
	},
	{
		btn = "^A",
		time = 25,
	},
	{
		btn = "^X",
		time = 25,
	},
	{
		btn = "^B",
		time = 25,
	},
	{
		btn = "^Y",
		time = 25,
	},
	{
		btn = "^C",
		time = 25,
	},
	{
		btn = "^Z",
		time = 25,
	},
}

t_tutoInput11 = {
	{
		btn = "^Y",
		hold = true,
		time = 0,
	},
	{
		btn = "^B",
		hold = true,
		time = 0,
	},
	{
		btn = "_F",
		time = 40,
	},
	{
		btn = "_B",
		time = 40,
	},
}

t_tutoInput12 = {
	{
		btn = "^Z",
		hold = true,
		time = 0,
	},
	{
		btn = "^C",
		hold = true,
		time = 0,
	},
	{
		btn = "",
		time = 40,
	},
}

t_tutoInput13 = {
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "^X",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},
}

t_tutoInput14 = {
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_B",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},
}

t_tutoInput15 = {
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_B",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},
}

t_tutoInput16 = {
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "^B",
		time = 10,
	},
	{
		btn = "",
		time = 10,
	},
	{
		btn = "^B",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},	
}

t_tutorialDiag = {
{btntonext = true, txt = "WELCOME TO THE TUTORIAL MODE!                THIS IS A DIALOGUE TEST.                 WHEN THE [DOWN] ARROW APPEARS, PLEASE USE [SELECT] BUTTON TO GO TO THE NEXT TEXT..."},
{btntonext = true, txt = "DURING THIS TUTORIAL, ALL MOVES ARE EXPLAINED CONSIDERING THAT YOUR CHARACTER IS ON LEFT SIDE FACING TO THE OPPONENT ON THE RIGHT SIDE."},
{btntonext = true, txt = "OK, LET'S TRY SOME MOVES."},
{condition = "f_tutoCheck1", inputhint = t_tutoInput1, txt = "GO FORDWARD USING [RIGHT] BUTTON AND COME TO ME."},
{condition = "f_tutoCheck2", inputhint = t_tutoInput2, txt = "NICE. NOW GO BACK USING [LEFT] BUTTON."},
{condition = "f_tutoCheck3", inputhint = t_tutoInput3, txt = "GOOD. YOU CAN CROUCH WITH [DOWN] BUTTON."},
{condition = "f_tutoCheck4", inputhint = t_tutoInput4, txt = "EXCELLENT. JUMP WITH [UP] BUTTON."},
{condition = "f_tutoCheck5", inputhint = t_tutoInput5, txt = "HMM. TAP 2 TIMES [LEFT] BUTTON TO RUN BACKWARD."},
{condition = "f_tutoCheck6", inputhint = t_tutoInput6, txt = "NOW! TAP 2 TIMES [RIGHT] BUTTON TO RUN FORDWARD."},
{condition = "f_tutoCheck7", inputhint = t_tutoInput7, txt = "LET'S TRY THOSE FIST.                      PRESS [X], [Y] AND [Z] BUTTONS TO ATTACK ME."},
{condition = "f_tutoCheck8", inputhint = t_tutoInput8, txt = "LET'S TRY THOSE KICKS.                     PRESS [A], [B] AND [C] BUTTONS TO KICK ME."},
{btntonext = true, txt = "EACH BUTTON HAVE DIFFERENT DAMAGE PROPERTIES."},
{btntonext = true, txt = "LOW ATTACKS LP/LK[X/A] ARE FASTER."},
{btntonext = true, txt = "MEDIUM ATTACKS MP/MK[Y/B] STUN THE OPPONENT FOR A SHORT TIME."},
{btntonext = true, txt = "HEAVY ATTACKS HP/HK[Z/C] ARE SLOWER BUT IN ADDITION TO DOING MORE DAMAGE, IT STUN FOR LONGER TIME THAN MEDIUM ATTACKS."},
{condition = "f_tutoCheck9", inputhint = t_tutoInput9, txt = "COOL. NOW TRY ALL PREVIOUS ATTACKS DURING JUMP (PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS ON AIR)."},
{condition = "f_tutoCheck10", inputhint = t_tutoInput10, txt = "GREAT! LIKE JUMPING, YOU CAN ALSO ATTACK DURING CROUCH.(PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS WHEN CROUCH)."},
{condition = "f_tutoCheck11", inputhint = t_tutoInput11, txt = "MARVELOUS! YOU CAN GRAB AND THROW YOUR OPPONENT BY PRESSING [B] AND [Y] BUTTON AT THE SAME TIME WITH [RIGHT] OR [LEFT] BUTTONS."},
{condition = "f_tutoCheck12", inputhint = t_tutoInput12, txt = "WONDERFUL! YOU CAN STOP AND PUSH YOUR OPPONENT WHILE HE IS ATTACKING OR NOT BY PRESSING [C] AND [Z] BUTTONS AT THE SAME TIME."},
{btntonext = true, txt = "FANTASTIC! NOW... SPECIAL MOVES ARE BUTTON COMBINATIONS THAT ALLOW YOU TO DEAL MORE DAMAGE THAN NORMAL HITS."},
{btntonext = true, txt = "KUNG FU GIRL HAS 3 SPECIAL MOVES."},
{condition = "f_tutoCheck13", inputhint = t_tutoInput13, txt = 'THE FIRST ONE IS A "KUNG FU PALM".       YOU CAN EXECUTE IT BY PRESSING [DOWN]+[RIGHT]+[X/Y/Z]. TRY IT!'},
{condition = "f_tutoCheck14", inputhint = t_tutoInput14, txt = 'THE SECOND ONE IS A "KUNG FU SHUFFLE".    YOU CAN EXECUTE IT BY PRESSING [DOWN]+[LEFT]+[A/B/C]. TRY IT!'},
{condition = "f_tutoCheck15", inputhint = t_tutoInput15, txt = '"KUNG FU SHUFFLE" CAN BE FOLLOWED BY MASHING 2 TIMES ANY KICK BUTTON. TRY IT!'},
{condition = "f_tutoCheck16", inputhint = t_tutoInput16, txt = 'THE LAST ONE IS A "KUNG FU KNEE". TO DO IT,    PRESS [RIGHT]+[DOWN]+[RIGHT]+[B/C + B/C].'},
{btntonext = true, txt = "AWESOME!                                  NOW LET'S TALK ABOUT THE EX MOVES."},
{btntonext = true, txt = "EVERY TIME THAT YOU ATTACK OR CONNECT HITS, YOUR POWER BAR INCREASES."},
{btntonext = true, txt = "THE EX MOVES ARE IMPROVEMENTS FOR SPECIAL MOVES. TO EXECUTE IT, YOU NEED AT LEAST 1 POWER BAR AND PRESS AT THE SAME TIME 2 BUTTONS THAT EXECUTE THE MOVE."},
{condition = "f_tutoCheck17", txt = "DO EX VERSION FOR ALL SPECIAL MOVES!"},
{btntonext = true, txt = "PERFECT! NOW TEST YOUR MIGHT DEFEATING ME. AND.. THIS IS OPTIONAL BUT WITH WHAT YOU HAVE LEARNED:                                           TRY TO MAKE A COMBO OF MORE THAN 10 HITS!"},
{hidediag = true, infight = true},
}
if data.debugLog then f_printTable(t_tutorialDiag, "save/debug/t_tutorialDiag.log") end

--Checks functions uses the CNS triggers and KFG char as base example
function f_tutoCheck1()
	if teamside() == 1 and anim() == 20 and time() > 30 and posX() >= 10 then
		return true
	else
		return false
	end
end

function f_tutoCheck2()
	if teamside() == 1 and anim() == 21 and time() > 30 and posX() <= 90 then
		return true
	end
end

function f_tutoCheck3()
	if teamside() == 1 and anim() == 11 then
		return true
	end
end

function f_tutoCheck4()
	if teamside() == 1 and anim() == 41 and time() >= 30 then
		return true
	end
end

function f_tutoCheck5()
	if teamside() == 1 and anim() == 106 then
		return true
	end
end

function f_tutoCheck6()
	if teamside() == 1 and anim() == 101 then
		return true
	end
end

function f_resetTutoVars()
tutoSuccess = false
tutoCheck1 = false
tutoCheck2 = false
tutoCheck3 = false
tutoCheck4 = false
tutoCheck5 = false
tutoCheck6 = false

tutoColor1 = 0
tutoColor2 = 0
tutoColor3 = 0
tutoColor4 = 0
tutoColor5 = 0
tutoColor6 = 0
end
f_resetTutoVars()

local tutoHintFont = font2
local tutoHintPosX = 2
local tutoHintPosY = 0

local tutoHintPunch = "Punch "
local tutoHintKick = "Kick "

local tutoHintLight = "Light "
local tutoHintMedium = "Medium "
local tutoHintStrong = "Strong "

local tutoHintStand = "Stand "
local tutoHintJump = "Jump "
local tutoHintCrouch = "Crouching "

function f_tutoCheck7()
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintStand..tutoHintLight..tutoHintPunch, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintStand..tutoHintMedium..tutoHintPunch, tutoHintPosX, 130)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintStand..tutoHintStrong..tutoHintPunch, tutoHintPosX, 150)
	if teamside() == 1 then
	--Check LP
		if anim() == 200 and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check MP
		if anim() == 210 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check HP
		if (anim() == 220 or anim() == 221) and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 then
		return true
	end
end

function f_tutoCheck8()
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintStand..tutoHintLight..tutoHintKick, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintStand..tutoHintMedium..tutoHintKick, tutoHintPosX, 130)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintStand..tutoHintStrong..tutoHintKick, tutoHintPosX, 150)
	if teamside() == 1 then
	--Check LK
		if (anim() == 230 or anim() == 231) and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check MK
		if anim() == 240 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check HK
		if (anim() == 250 or anim() == 251) and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 then
		return true
	end
end

function f_tutoCheck9()
	animSetScale(tutorialStepBG, 1, 1.76)
	animPosDraw(tutorialStepBG, -2, 83)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintJump..tutoHintLight..tutoHintPunch, tutoHintPosX, 90)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintJump..tutoHintMedium..tutoHintPunch, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintJump..tutoHintStrong..tutoHintPunch, tutoHintPosX, 130)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor4, 1, tutoHintJump..tutoHintLight..tutoHintKick, tutoHintPosX, 150)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor5, 1, tutoHintJump..tutoHintMedium..tutoHintKick, tutoHintPosX, 170)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor6, 1, tutoHintJump..tutoHintStrong..tutoHintKick, tutoHintPosX, 190)
	if teamside() == 1 then
	--Check AIR LP
		if anim() == 600 and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check AIR MP
		if anim() == 610 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check AIR HP
		if anim() == 620 and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end	
	--Check AIR LK
		if anim() == 630 and hitcount() == 1 and not tutoCheck4 then
			tutoCheck4 = true
			tutoColor4 = 5
		end
	--Check AIR MK
		if anim() == 640 and hitcount() == 1 and not tutoCheck5 then
			tutoCheck5 = true
			tutoColor5 = 5
		end
	--Check AIR HK
		if anim() == 650 and hitcount() == 1 and not tutoCheck6 then
			tutoCheck6 = true
			tutoColor6 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 and tutoCheck4 and tutoCheck5 and tutoCheck6 then
		return true
	end
end

function f_tutoCheck10()
	animPosDraw(tutorialStepBG, -2, 83)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintCrouch..tutoHintLight..tutoHintPunch, tutoHintPosX, 90)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintCrouch..tutoHintMedium..tutoHintPunch, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintCrouch..tutoHintStrong..tutoHintPunch, tutoHintPosX, 130)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor4, 1, tutoHintCrouch..tutoHintLight..tutoHintKick, tutoHintPosX, 150)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor5, 1, tutoHintCrouch..tutoHintMedium..tutoHintKick, tutoHintPosX, 170)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor6, 1, tutoHintCrouch..tutoHintStrong..tutoHintKick, tutoHintPosX, 190)
	if teamside() == 1 then
	--Check DOWN LP
		if anim() == 400 and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check DOWN MP
		if anim() == 410 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check DOWN HP
		if anim() == 420 and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end	
	--Check DOWN LK
		if anim() == 430 and hitcount() == 1 and not tutoCheck4 then
			tutoCheck4 = true
			tutoColor4 = 5
		end
	--Check DOWN MK
		if anim() == 440 and hitcount() == 1 and not tutoCheck5 then
			tutoCheck5 = true
			tutoColor5 = 5
		end
	--Check DOWN HK
		if anim() == 450 and hitcount() == 1 and not tutoCheck6 then
			tutoCheck6 = true
			tutoColor6 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 and tutoCheck4 and tutoCheck5 and tutoCheck6 then
		return true
	end
end

function f_tutoCheck11()
	animSetScale(tutorialStepBG, 1, 1)
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, "Forward Throw", tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, "Back Throw", tutoHintPosX, 130)
	if teamside() == 1 then
	--Check Throw to Right
		if anim() == 810 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check Grab to Left
		if anim() == 850 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 then
		return true
	end
end

function f_tutoCheck12()
	if teamside() == 1 and anim() == 1420 then
		return true
	end
end

function f_tutoCheck13()
	if teamside() == 1 and (anim() == 1000 or anim() == 1010 or anim() == 1020) and time() >= 20 then
		return true
	end
end

function f_tutoCheck14()
	if teamside() == 1 and anim() == 1300 and time() >= 20 then
		return true
	end
end

function f_tutoCheck15()
	if teamside() == 1 and anim() == 1302 and time() >= 20 then
		return true
	end
end

function f_tutoCheck16()
	if teamside() == 1 and anim() == 1105 and time() >= 20 then
		return true
	end
end

function f_tutoCheck17()
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, "EX Kung Fu Palm", tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, "EX Kung Fu Knee", tutoHintPosX, 130)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, "EX Kung Fu Shuffle", tutoHintPosX, 150)
	if teamside() == 1 then
	--Check EX KUNG FU PALM
		if anim() == 1030 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check EX KUNG FU KNEE
		if anim() == 1135 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check EX KUNG FU SHUFFLE
		if anim() == 1332 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 then
		return true
	end
end