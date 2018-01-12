#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#MaxThreadsPerHotkey 2 ; Limits threads per toggle
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Screen variables (for center)
global screenX := (A_ScreenWidth // 2)
global screenY := (A_ScreenHeight // 2)
global cookies=0

$f10::
;MsgBox % "Half of screen width is "x ". and half of screen height is " y
cookies:=!cookies
trackTailion()
sleep, 100
multiClick()
return

; functions
trackTailion(){
	Loop 2 {
	send {F1}
	}
	send o
	;Loop 20 {
	;send {WheelDown}
	;}
}

multiClick(){
	while(cookies=1){
	MouseMove screenX, screenY
	send {LButton}
	sleep, 100
	}
}


