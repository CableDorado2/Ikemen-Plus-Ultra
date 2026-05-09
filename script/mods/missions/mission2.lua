--;=====================================================================
--; 					MISSION 2 [TIME CHALLENGE]
--;		Fight a selected opponent and try to beat previous Best Time.
--;	Based on Super Street Fighter II: The New Challengers (Sega Mega Drive).
--;=====================================================================
data.p1TeamMenu = {mode = 0, chars = 1}
data.p2TeamMenu = {mode = 0, chars = 1}
data.p2Faces = true
data.p2In = 1
setRoundTime(-1)
setRoundsToWin(1)
setTimerDisplay(true)
f_selectSimple()