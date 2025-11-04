--;=====================================================================
--; 					EVENT 2 [TITAN ATTACK]
--; 		(Challenge a formidable Giant Boss Character)
--;=====================================================================
data.gameMode = "singleboss"
data.versusScreen = false
data.victoryscreen = false
setRoundTime(-1)
setRoundsToWin(1)
--data.stage = "stage/"
--data.bgm = "sound/"
textImgSetText(txt_mainSelect, "TITAN ATTACK")
data.p2In = 1
data.p2TeamMenu = {mode = 0, chars = 1}
data.p2Char = {"Red Dragon"}
--data.p2Pal = 1
f_selectSimple()