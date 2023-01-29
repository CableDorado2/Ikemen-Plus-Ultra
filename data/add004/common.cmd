
[Command]

name = "d"

command = d

time = 1



[Command]

name = "w"

command = w

time = 1



;---
; tagin/tagout
; 交代ボタン:一人目 / 前のパートナー
; tag:1st partner / shift_fwd
[command]
	name="shift_fwd"
	command=/F,d
	time=1
[command]
	name="shift_fwd"
	command=/B,d
	time=1

; 交代ボタン:二人目 / 後のパートナー
; tag:2nd partner / shift_back
[command]
	name="shift_back"
	command=/F,w
	time=1
[command]
	name="shift_back"
	command=/B,w
	time=1

;--- call assist
; 支援ボタン:一人目 / 前のパートナー
; assist:1st partner / shift_fwd
[command]
	name="assist_fwd"
	command=d
	time=1

; 支援ボタン:二人目 / 後のパートナー
; assist:2nd partner / shift_back
[command]
	name="assist_back"
	command=w
	time=1
;---
;---
; スタートボタン
[command]
	name="start"
	command=s
	time=1



