--;=====================================================================
--; 					MISSION 3 [SCORE CHALLENGE]
--;		Fight a selected opponent and try to beat previous Best Score.
--;	Based on Super Street Fighter II: The New Challengers (Sega Mega Drive).
--;=====================================================================
data.p1TeamMenu = {mode = 0, chars = 1}
data.p2TeamMenu = {mode = 0, chars = 1}
data.p2Faces = true
data.p2In = 1
setRoundTime(50)
setRoundsToWin(1)
setScoreDisplay(true)
f_selectSimple()