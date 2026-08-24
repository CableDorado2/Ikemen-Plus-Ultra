data.p2In = 1
data.p1TeamMenu = {mode = 0, chars = 1}
data.p2TeamMenu = {mode = 0, chars = 1}
data.p1Char = {"Events/mmvol1/player/player.def"}
data.p2Char = {"Events/mmvol1/cpu/cpu.def"}
--data.stage = "Events/mmvol1/stage.def"
setRoundTime(-1)
setRoundsToWin(1)
setPauseVar("nogiveup") --Set special pause variable config to remove give up option
f_selectSimple()