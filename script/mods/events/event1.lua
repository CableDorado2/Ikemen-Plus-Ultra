--;=====================================================================
--; 				EVENT 1 [THE CALL OF ZOMBIES]
--; 			Survive 40 Rounds in The Call of Zombies!
--;=====================================================================
data.p2In = 1
data.p2TeamMenu = {mode = 0, chars = 1}
data.p2Char = {"Event 1"}
textImgSetText(txt_mainSelect, 'CHARACTER SELECT')
setRoundTime(-1)
setRoundsToWin(1)
f_selectSimple()