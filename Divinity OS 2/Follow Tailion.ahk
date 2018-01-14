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
global cookies=0
global GoodCookies = 1

; hotkey
$f10::
;MsgBox % "Half of screen width is "x ". and half of screen height is " y
if WinActive("DOS II"){
cookies:=!cookies
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
	send o
}

; every second, moves and clicks at the center of the screen
multiClick()
	{
	while(cookies=1){
	MouseMove screenX, screenY
	send {LButton}
	sleep, 1000
	findEar()
	}
}

findEar()
	{
	ImageSearch, FoundX, FoundY, 1504,696, 1570, 760, %A_ScriptDir%/ear.png
	ErrorLevel = GoodCookies
	While GoodCookies = 0
		{
		;MsgBox, The icon was found at %FoundX%x%FoundY%.
		MouseMove FoundX, FoundY
		sleep, 100
		send {LButton}
		sleep, 1000
		if ErrorLevel = 1
			{
			GoodCookies = 1
			}
		Else
			{
			findEar()
			}
		}
	}