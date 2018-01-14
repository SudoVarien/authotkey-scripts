; Runs only whilst window DOS II (divinity original sin 2) is active.
; Purpose : Follow player 1, by tracking and keeping the mouse in the center of the screen while clicking every second.
; Created by Varien

; configuration
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#MaxThreadsPerHotkey 2 ; Limits threads per toggle
;#IfWinActive DOS II ; Script only runs if active in DOS II
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode Pixel ; Used to find coords for Ear Cancel

; variables
global screenX := (A_ScreenWidth // 2)
global screenY := (A_ScreenHeight // 2)
global cookies = 0
global FoundX
global FoundY

$f11::Pause

; hotkey
$f10::
;MsgBox % "Half of screen width is "x ". and half of screen height is " y
if WinActive("DOS II"){
cookies:=!cookies
send o
trackTailion()
sleep, 100
multiClick()
}
return

; functions
; presses F1 twice
trackTailion()
	{
	Loop 2 {
	send {F1}
	}
}

; every second, moves and clicks at the center of the screen
multiClick()
	{
	while(cookies=1){
	MouseMove screenX, screenY
	send {LButton}
	sleep, 1000
	ImageSearch, FoundX, FoundY, 1504, 696, 1570, 760, %A_ScriptDir%/ear.png
	;global earLocx := FoundX
	;global earLocy := FoundY

	if ErrorLevel = 0
		{
		findEar()
		}
	}
}

findEar()
	{
	;FoundX =: multiClick(FoundX)
	;FoundY =: multiClick(FoundY)
	MouseMove FoundX, FoundY
	sleep, 100
	send {LButton}
	sleep, 1000
	send {Home}
	trackTailion()
	sleep, 1200
	MouseMove ScreenX, ScreenY-100
	send {LButton}
	sleep, 5000

	; Below is old and shit, still working on it
	;ImageSearch, FoundX, FoundY, 1504, 696, 1570, 760, %A_ScriptDir%/ear.png
	;sleep, 1000
	;if ErrorLevel = 2
    ;MsgBox Could not conduct the search.
	;else if ErrorLevel = 1
    ;MsgBox Icon could not be found on the screen.
	;else
    ;MsgBox The icon was found at %FoundX%x%FoundY%.
	;if ErrorLevel = 0
	;	{
	;	; for debugging uncomment below
	;	;MsgBox, The icon was found at %FoundX%x%FoundY%.
	;	sleep, 250
	;	MouseMove FoundX, FoundY
	;	sleep, 100
	;	send {LButton}
	;	sleep, 1000
	;	findEar()
	;	}
	;else if ErrorLevel = 1
	;	{
	;	send {Home}
	;	trackTailion()
	;	sleep, 250
	;	MouseMove ScreenX, ScreenY-100
	;	sleep, 100
	;	}
	;
}