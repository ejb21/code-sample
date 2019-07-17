;	various sentinel/global variables

rTrigger = 0
charTrigger = 0
BS := new BrightnessSetter()
SetTitleMatchMode, 2




	
;	Ctrl + Escape reloads this script in case of infinite loops, etc.
;	Ctrl + Space pins the active window to the forefront, so that no other window can be drawn overtop of it


^Esc::
	Reload
	return

^SPACE::
	Winset, Alwaysontop, , A
	return
	



;
;
;
;
;		The following hotkeys relate to my mouse, which has 19 programmable buttons.
;		MButton through ^!NumPad2 (Alt + Shift + NumPad2) are all mapped to one of those buttons
;
;
;
;


;
;	if playing Out of the Park Baseball, click around the menus to automatically save the game
;	else, simply click the middle mouse button
;


MButton::
	if WinActive("Out of the Park Baseball 20")
	{
		MouseGetPos, x, y
		Sleep 50
		MouseMove, 387, 100
		Sleep 50
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Sleep 25
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Sleep 50
		MouseMove, 370, 210
		Sleep 50
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Sleep 25
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Sleep 50
		MouseMove, x, y
		return
	}
	else
	{
		SendInput {MButton down}
		KeyWait, MButton
		SendInput {MButton up}
		Return
	}








;
;	if playing OOTP, jump to Home page
;	if not playing OOTP, send Left Windows Key + 1 to jump to the 1st program in the taskbar
;	if not playing OOTP while holding left mouse button, send Ctrl + Shift + I to open the DevTools in Chrome (and Electron)
;	if not playing OOTP while holding right mouse button, send Ctrl + Shift + C to toggle the element selector within the DevTools in Chrome (and Electron)
;


^!NumPad1::
	if WinActive("Out of the Park Baseball") 			; home
	{
		Send {F2 down}
		Send {F2 down}
		Send {F2 down}
		Send {F2 down}
		Sleep 50
		Send {F2 up}
		Send {F2 up}
		Send {F2 up}
		Send {F2 up}
		return
	}
	else
	{
		GetKeyState, state, LButton
		if state = D
		{
			Send ^+i
			Send {Ctrl Up}
			Send {Shift Up}
			Send {Ctrl Up}
			Send {Shift Up}
			Send {Ctrl Up}
			Send {Shift Up}
			Send {Ctrl Up}
			Send {Shift Up}
			return
		}
		GetKeyState, state, RButton
		if state = D
		{
			Send ^+c
			Send {RButton Up}
			Send {RButton Up}
			Send {RButton Up}
			Send {RButton Up}
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt}
			Sleep 10
			Send {LAlt Up}
			Send {LAlt Up}
			Send {LAlt Up}
			Send {LAlt Up}
			Send {LAlt Up}
			Send {LAlt Up}
			Send {LAlt Up}
			return
		}
		else
		{
			Send {LWin down}
			Sleep 50
			Send 1
			Sleep 50
			Send {LWin up}
			return
		}
	}








;
;	if playing OOTP, jump to Roster page
;	if playing OOTP while holding right mouse key, jump to Minor Leagues page
;	else, send Left Windows Key + 2 to jump to the 2nd program in the taskbar
;


^!NumPad2::
	if WinActive("Out of the Park Baseball")
	{
		GetKeyState, state, RButton
		if state = D
		{
			Send {F5 down}
			Send {F5 down}
			Send {F5 down}
			Send {F5 down}
			Sleep 50
			Send {F5 up}
			Send {F5 up}
			Send {F5 up}
			Send {F5 up}
			return
		}
		else
		{
			Send {F3 down}
			Send {F3 down}
			Send {F3 down}
			Send {F3 down}
			Sleep 50
			Send {F3 up}
			Send {F3 up}
			Send {F3 up}
			Send {F3 up}
			return
		}
	}
	else
	{
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Sleep 50
		Send {2 down}
		Send {2 down}
		Send {2 down}
		Send {2 down}
		Sleep 50
		Send {2 up}
		Send {2 up}
		Send {2 up}
		Send {2 up}
		Sleep 50
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		return
	}








;
;	if playing OOTP, jump to Messages page
;	else, send Left Windows Key + 3 to jump to the 3rd program in the taskbar
;


^!NumPad3::
	if WinActive("Out of the Park Baseball")
	{
		MouseGetPos, x, y
		Sleep 50
		MouseMove, 1898, 325
		Sleep 50
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Sleep 25
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Sleep 50
		MouseMove, 1808, 255
		Sleep 50
		return
	}
	else
	{
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Sleep 50
		Send {3 down}
		Send {3 down}
		Send {3 down}
		Send {3 down}
		Sleep 50
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Sleep 50
		Send {3 up}
		Send {3 up}
		Send {3 up}
		Send {3 up}
		return
	}








;
;	if playing OOTP, jump to Free Agency page
;	else, send Left Windows Key + 4 to jump to the 4th program in the taskbar
;


^!NumPad4::
	if WinActive("Out of the Park Baseball")
	{
		Send {F9 down}
		Send {F9 down}
		Send {F9 down}
		Send {F9 down}
		Sleep 50
		Send {F9 up}
		Send {F9 up}
		Send {F9 up}
		Send {F9 up}
		return
	}
	else
	{
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Sleep 50
		Send {4 down}
		Send {4 down}
		Send {4 down}
		Send {4 down}
		Sleep 50
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Sleep 50
		Send {4 up}
		Send {4 up}
		Send {4 up}
		Send {4 up}
		return
	}








;
;	if playing OOTP, jump to Waivers page
;	else, open a new File Explorer window
;


^!NumPad5:: 
	if WinActive("Out of the Park Baseball")
	{
		Send {F10 down}
		Send {F10 down}
		Send {F10 down}
		Send {F10 down}
		Sleep 50
		Send {F10 up}
		Send {F10 up}
		Send {F10 up}
		Send {F10 up}
		return
	}
	else
	{
		Run, Explorer /n`,/e`,D:\
		return
	}








;
;	if playing OOTP, jump to Injured List page
;	if playing OOTP while holding right mouse button, jump to Waivers & DFA page
;	else, send Left Windows Key + 5 to jump to the 5th program in the taskbar
;


^!NumPad6::
	if WinActive("Out of the Park Baseball")
	{
		GetKeyState, state, RButton
		if state = D
		{
			Send {F8 down}
			Send {F8 down}
			Send {F8 down}
			Send {F8 down}
			Sleep 50
			Send {F8 up}
			Send {F8 up}
			Send {F8 up}
			Send {F8 up}
			return
		}
		else
		{
			Send {F7 down}
			Send {F7 down}
			Send {F7 down}
			Send {F7 down}
			Sleep 50
			Send {F7 up}
			Send {F7 up}
			Send {F7 up}
			Send {F7 up}
			return
		}
	}
	else
	{
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Sleep 50
		Send {5 down}
		Send {5 down}
		Send {5 down}
		Send {5 down}
		Sleep 50
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Sleep 50
		Send {5 up}
		Send {5 up}
		Send {5 up}
		Send {5 up}
		return
	}
	
	
	
	



;	adding window specifications so I can test to see whether the active window is the File Explorer
	
GroupAdd, Explorer, ahk_class CabinetWClass
GroupAdd, Explorer, ahk_class ExploreWClass





;
;	if playing OOTP, simulate the current at bat
;	if playing OOTP while holding the right mouse button, reposition the window on my left-hand monitor
;
;	else, reposition the active window on my left-hand monitor
;		(different applications are resized to different dimensions)
;


^!NumPad7::
	if WinActive("Out of the Park Baseball")
	{
		GetKeyState, state, RButton
		if state = D
		{
			WinMove, A, , -7, -30, 1934, 1088
			return
		}
		else
		{
			Sleep 50
			Send {Space}
			Sleep 50
			return
		}
	}
	if (WinActive("Photoshop") || WinActive("Premiere") || WinActive("Illustrator") || WinActive("Android Studio"))
	{
		WinMove, A, , 0, 0, 1920, 1050
		WinMaximize
		return
	}
	if WinActive("Notepad++") 
	{
		WinMove, A, , 75, 0, 1748, 1057
		return
	}
	if WinActive("Notepad") 
	{
		WinMove, A, , 510, 230, 900, 600
		return
	}
	if WinActive("Discord") 
	{
		WinMove, A, , 50, 60, 1800, 920
		return
	}
	if WinActive("Visual Studio Code")
	{
		WinMove, A, , 0, 0
		WinMaximize
		return
	}
	if WinActive("DevTools") 
	{
		WinMove, A, , 1032, 0, 895, 1066
		return
	}
	IfWinActive ahk_class CabinetWClass
	{
		WinMove, A, , 360, 155, 1200, 750
		return
	}
	if WinActive("Spotify")
	{
		WinMove, A, , 110, 80, 1600, 900
		return
	}
	if WinActive("Citra")
	{
		WinMove, A, , -7, 178, 1934, 700
		return
	}
	if WinActive("PKHaX")
	{
		WinMove, A, , 645, 340, 630, 400
		return
	}
	else
	{
		WinMove, A, , 75, 0, 1748, 1057
		return
	}
	return




;
;	if playing OOTP, rescout all players
;	if playing OOTP while holding the right mouse button, reposition the window on my right-hand monitor
;
;	else, reposition the active window on my right-hand monitor
;		(different applications are resized to different dimensions)
;


^!NumPad9::
	if WinActive("Out of the Park Baseball")
	{
		GetKeyState, state, RButton
		if state = D
		{
			WinMove, A, , 1913, -30, 1934, 1088
			return
		}
		else
		{
			MouseGetPos, x, y
			Sleep 50
			MouseMove, 1897, 598
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 500
			MouseMove, 1866, 1051
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 50
			MouseMove, 1371, 1052
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 50
			MouseMove, x, y
			return
		}
	}
	if (WinActive("Photoshop") || WinActive("Premiere") || WinActive("Illustrator") || WinActive("Android Studio"))
	{
		WinMove, A, , 1920, 0, 1920, 1050
		WinMaximize
		return
	}
	if WinActive("Notepad++") 
	{
		WinMove, A, , 1994, 0, 1748, 1057
		return
	}
	if WinActive("Notepad") 
	{
		WinMove, A, , 2430, 230, 900, 600
		return
	}
	if WinActive("Discord") 
	{
		WinMove, A, , 1970, 60, 1800, 920
		return
	}
	if WinActive("Visual Studio Code")
	{
		WinMove, A, , 1920, 0
		WinMaximize
		return
	}
	if WinActive("DevTools") 
	{
		WinMove, A, , 1913, 0, 895, 1066
		return
	}
	IfWinActive ahk_class CabinetWClass
	{
		WinMove, A, , 2280, 155, 1200, 750
		return
	}
	if WinActive("Spotify") 
	{
		WinMove, A, , 2030, 80, 1600, 900
		return
	}
	if WinActive("Citra") 
	{
		WinMove, A, , 1913, 178, 1934, 700
		return
	}
	if WinActive("PKHaX")
	{
		WinMove, A, , 2565, 340, 630, 400
		return
	}
	else
	{
		WinMove, A, , 1994, 0, 1748, 1057
		return
	}
	return
	
	
	
	
;
;	if playing OOTP, simulate a half-inning of play
;	else, grab on to the active window and move it along with the mouse; release when Button 8 is pressed again
;

	
^!NumPad8::
	if WinActive("Out of the Park Baseball") 			; Sim half-inning
	{
		MouseGetPos, x, y
		Sleep 50
		MouseMove, 1449, 146
		Sleep 50
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Send {LButton down}
		Sleep 25
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Send {LButton up}
		Sleep 50
		MouseMove, x, y
		return
	}
	else
	{
		if (looping = 1)
		{
			looping = 0
			looping = 0
			looping = 0
			return
		}
		else
		{
			looping = 1
			
			CoordMode, Mouse
			MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
			WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
			SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
			return
		}
	}

EWD_WatchMouse:
	while (looping = 1)
	{
		CoordMode, Mouse
		MouseGetPos, EWD_MouseX, EWD_MouseY
		WinGetPos, EWD_WinX, EWD_WinY,,, A
		SetWinDelay, -1   ; Makes the below move faster/smoother.
		WinMove, A,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
		EWD_MouseStartX := EWD_MouseX
		EWD_MouseStartY := EWD_MouseY
	}
	return




;
;	if playing OOTP, shift the infield left
;	if playing OOTP while holding the right mouse button, shift the outfield left
;	if playing OOTP while holding the left mouse button, shift the infield hard left
;	else, send the Windows key to open the Start menu
;



^!NumPad0::
	if WinActive("Out of the Park Baseball")
	{
		GetKeyState, state, RButton
		if state = D
		{
			MouseGetPos, x, y
			Sleep 50
			MouseMove, 1362, 177
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 100
			MouseMove, 1290, 312
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 50
			MouseMove, x, y
			return
		}
		else
		{
			GetKeyState, state, LButton
			if state = D
			{
				MouseGetPos, x, y
				Sleep 50
				MouseMove, 1237, 177
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 100
				MouseMove, 1159, 422
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 50
				MouseMove, x, y
				return
			}
			else
			{
				MouseGetPos, x, y
				Sleep 50
				MouseMove, 1237, 177
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 100
				MouseMove, 1142, 399
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 50
				MouseMove, x, y
				return
			}
		}
	}
	else
	{
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Send {LWin down}
		Sleep 50
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		Send {LWin up}
		return
	}








;
;	if playing OOTP, shift the infield right
;	if playing OOTP while holding the right mouse button, shift the outfield right
;	if playing OOTP while holding the left mouse button, shift the infield hard right
;


!NumPad1::
	if WinActive("Out of the Park Baseball") 		; Shift Right
	{
		GetKeyState, state, RButton
		if state = D
		{
			MouseGetPos, x, y
			Sleep 50
			MouseMove, 1362, 177
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 100
			MouseMove, 1296, 334
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 50
			MouseMove, x, y
			return
		}
		else
		{
			GetKeyState, state, LButton
			if state = D
			{
				MouseGetPos, x, y
				Sleep 50
				MouseMove, 1237, 177
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 100
				MouseMove, 1160, 531
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 50
				MouseMove, x, y
				return
			}
			else
			{
				MouseGetPos, x, y
				Sleep 50
				MouseMove, 1237, 177
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 100
				MouseMove, 1142, 487
				Sleep 50
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Send {LButton down}
				Sleep 25
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Send {LButton up}
				Sleep 50
				MouseMove, x, y
				return
			}
		}
	}


;
;	if not playing OOTP, send Alt + Ctrl + Shift + Enter,
;		which is my predefined hotkey for Instant Eyedropper, my systems tray color-picker utility
;			http://instant-eyedropper.com/
;
;	if not playing OOTP while holding right mouse button, send Alt + Shift + D,
;		which is my predefined hotkey for disabling the browser extension Imagus
;


	else
	{
		GetKeyState, state, RButton
		if state = D
		{
			Send !+d
			rTrigger = 1
			return
		}
		else
		{
			Send ^!+{Enter}
			return
		}
	}






;
;	if playing OOTP, shift the infield to double play depth
;	if playing OOTP and holding right mouse button, shift the infield extremely far right
;	else, send Alt+F4 to close the current window
;


!NumPad2::
if WinActive("Out of the Park Baseball")
	{
		GetKeyState, state, RButton
		if state = D
		{
			MouseGetPos, x, y
			Sleep 50
			MouseMove, 1237, 177
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 100
			MouseMove, 1159, 575
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 50
			MouseMove, x, y
			return
		}
		else
		{
			MouseGetPos, x, y
			Sleep 50
			MouseMove, 1237, 177
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 100
			MouseMove, 1139, 356
			Sleep 50
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Send {LButton down}
			Sleep 25
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Send {LButton up}
			Sleep 50
			MouseMove, x, y
			return
		}
	}
	else
	{
		Send {Alt down}
		Send {Alt down}
		Send {Alt down}
		Send {Alt down}
		Sleep 50
		Send {F4}
		Sleep 50
		Send {Alt up}
		Send {Alt up}
		Send {Alt up}
		Send {Alt up}
	}
	
	
	
	
	
	
	





; SPECIAL CHARACTERS
;		Various special character substitutions by holding Alt + either LShift or RShift + a visually similar character
;		e.g., Alt + LShift + E sends Èè
;		"triggered" by hitting Alt + Space to avoid accidentally firing


Alt & Space::
	charTrigger = 1
	return
	
#if (charTrigger = 1)
!-::
	Send —
	charTrigger = 0
	return

#if (charTrigger = 1)
!^-::
	Send –
	charTrigger = 0
	return

#if (charTrigger = 1)
!^+-::
	Send ★
	charTrigger = 0
	return

#if (charTrigger = 1)
!+.::
	Send …
	charTrigger = 0
	return

#if (charTrigger = 1)
Alt & a::
	if GetKeyState("LShift","p")
		Send Àà
	if GetKeyState("RShift","p")
		Send Áá
	charTrigger = 0
	return

#if (charTrigger = 1)
Alt & c::
	if GetKeyState("LShift","p")
		if GetKeyState("RShift","p")
			Send Çç
		else
			Send ©
	if GetKeyState("RShift","p")
		if GetKeyState("LShift","p")
			return
		else
			Send ¢
	charTrigger = 0
	return

#if (charTrigger = 1)
Alt & e::
	if GetKeyState("LShift","p")
		Send Èè
	if GetKeyState("RShift","p")
		Send Éé
	charTrigger = 0
	return

#if (charTrigger = 1)
Alt & i::
	if GetKeyState("LShift","p")
		Send Ìì
	if GetKeyState("RShift","p")
		Send Íí
	charTrigger = 0
	return

#if (charTrigger = 1)
!+m::
	Send µ
	charTrigger = 0
	return

#if (charTrigger = 1)
!+n::
	Send Ññ
	charTrigger = 0
	return

Alt & o::
	if GetKeyState("LShift","p")
		Send Òò
	if GetKeyState("RShift","p")
		Send Óó
	charTrigger = 0
	return

#if (charTrigger = 1)
!+r::
	Send ®
	charTrigger = 0
	return

#if (charTrigger = 1)
!+t::
	Send ™
	charTrigger = 0
	return

#if (charTrigger = 1)
Alt & u::
	if GetKeyState("LShift","p")
		if GetKeyState("RShift","p")
			Send Üü
		else
			Send Ùù
	if GetKeyState("RShift","p")
		if GetKeyState("LShift","p")
			return
		else
			Send Úú
	charTrigger = 0
	return

#if (charTrigger = 1)
!+x::
	Send ×
	charTrigger = 0
	return
	
#if (charTrigger = 1)
!+2::
	Send ½
	charTrigger = 0
	return
	
#if (charTrigger = 1)
!+3::
	Send ⅓
	charTrigger = 0
	return
	
#if (charTrigger = 1)
!+4::
	Send ¼
	charTrigger = 0
	return

#if (charTrigger = 1)
Alt & 8::
	if GetKeyState("LShift","p")
		Send ·
	if GetKeyState("RShift","p")
		Send •
	charTrigger = 0
	return

#if (charTrigger = 1)
!+\::
	Send ¯\_(ツ)_/¯
	charTrigger = 0
	return

#if (charTrigger = 1)
!+`::
	Send ( ͡° ͜ʖ ͡°)
	charTrigger = 0
	return

#if (charTrigger = 1)
!+_::
	Send ¯
	charTrigger = 0
	return

#if (charTrigger = 1)
!+'::
	Send °
	charTrigger = 0
	return

#if (charTrigger = 1)
!+!::
	Send ¡
	charTrigger = 0
	return

#if (charTrigger = 1)
Alt & /::
	if GetKeyState("LShift","p")
		Send ¿
	if GetKeyState("RShift","p")
		Send ÷
	charTrigger = 0
	return
	
	
	

	
	
	

;
;	turn volume up or down when holding left mouse button and scrolling
;	vkAEsc12E and vkAFsc130 are special key codes that are unique to the volume controls on my keyboard
;

	
#If GetKeyState("LButton", "P")

WheelDown::
	Send {vkAEsc12E}
	lTrigger = 1
	return

WheelUp::
	Send {vkAFsc130}
	lTrigger = 1
	return

MButton::
	Send {Volume_Mute}
	lTrigger = 1
	return
	
	
	
	
;
;	if holding right mouse button, turn off monitor backlights when pressing middle mouse button
;		SendMessage 0x112, 0xF170, 2,,Program Manager is a system interrupt to kill backlights
;
	
	
#If GetKeyState("RButton", "D")
MButton::
	Send {RButton Up}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Sleep 5
	Send {Alt}
	Sleep 5
	Send {Alt}
	Sleep 5
	Send {Alt}
	Sleep 5
	Send {Alt}
	SendMessage 0x112, 0xF170, 2,,Program Manager
	return
	
	
#If (rTrigger = 1)

RButton Up::
	Send {RButton Up}
	Send {Alt}
	Send {Alt}
	Send {Alt}
	Reload
	return





;
;	if holding right mouse button and scrolling, adjust brightness up or down
;		does not work in Chrome, where I already have an extension that incrementally zooms in and out on the page with this same hotkey
;			yes, I should use Firefox
;


#if GetKeyState("RButton", "D") && !WinActive("Google Chrome")
WheelDown::
	BS.SetBrightness(-5)
	rTrigger = 1
	return

#if GetKeyState("RButton", "D") && !WinActive("Google Chrome")
WheelUp::
		BS.SetBrightness(5)
		rTrigger = 1
		return
		
		


;
;  BrightnessSetter class
;		I did not write this
;
	
	
class BrightnessSetter {
	; qwerty12 - 27/05/17
	; https://github.com/qwerty12/AutoHotkeyScripts/tree/master/LaptopBrightnessSetter
	static _WM_POWERBROADCAST := 0x218, _osdHwnd := 0, hPowrprofMod := DllCall("LoadLibrary", "Str", "powrprof.dll", "Ptr") 

	__New() {
		if (BrightnessSetter.IsOnAc(AC))
			this._AC := AC
		if ((this.pwrAcNotifyHandle := DllCall("RegisterPowerSettingNotification", "Ptr", A_ScriptHwnd, "Ptr", BrightnessSetter._GUID_ACDC_POWER_SOURCE(), "UInt", DEVICE_NOTIFY_WINDOW_HANDLE := 0x00000000, "Ptr"))) ; Sadly the callback passed to *PowerSettingRegister*Notification runs on a new threadl
			OnMessage(this._WM_POWERBROADCAST, ((this.pwrBroadcastFunc := ObjBindMethod(this, "_On_WM_POWERBROADCAST"))))
	}

	__Delete() {
		if (this.pwrAcNotifyHandle) {
			OnMessage(BrightnessSetter._WM_POWERBROADCAST, this.pwrBroadcastFunc, 0)
			,DllCall("UnregisterPowerSettingNotification", "Ptr", this.pwrAcNotifyHandle)
			,this.pwrAcNotifyHandle := 0
			,this.pwrBroadcastFunc := ""
		}
	}

	SetBrightness(increment, jump := False, showOSD := True, autoDcOrAc := -1, ptrAnotherScheme := 0)
	{
		static PowerGetActiveScheme := DllCall("GetProcAddress", "Ptr", BrightnessSetter.hPowrprofMod, "AStr", "PowerGetActiveScheme", "Ptr")
			  ,PowerSetActiveScheme := DllCall("GetProcAddress", "Ptr", BrightnessSetter.hPowrprofMod, "AStr", "PowerSetActiveScheme", "Ptr")
			  ,PowerWriteACValueIndex := DllCall("GetProcAddress", "Ptr", BrightnessSetter.hPowrprofMod, "AStr", "PowerWriteACValueIndex", "Ptr")
			  ,PowerWriteDCValueIndex := DllCall("GetProcAddress", "Ptr", BrightnessSetter.hPowrprofMod, "AStr", "PowerWriteDCValueIndex", "Ptr")
			  ,PowerApplySettingChanges := DllCall("GetProcAddress", "Ptr", BrightnessSetter.hPowrprofMod, "AStr", "PowerApplySettingChanges", "Ptr")

		if (increment == 0 && !jump) {
			if (showOSD)
				BrightnessSetter._ShowBrightnessOSD()
			return
		}

		if (!ptrAnotherScheme ? DllCall(PowerGetActiveScheme, "Ptr", 0, "Ptr*", currSchemeGuid, "UInt") == 0 : DllCall("powrprof\PowerDuplicateScheme", "Ptr", 0, "Ptr", ptrAnotherScheme, "Ptr*", currSchemeGuid, "UInt") == 0) {
			if (autoDcOrAc == -1) {
				if (this != BrightnessSetter) {
					AC := this._AC
				} else {
					if (!BrightnessSetter.IsOnAc(AC)) {
						DllCall("LocalFree", "Ptr", currSchemeGuid, "Ptr")
						return
					}
				}
			} else {
				AC := !!autoDcOrAc
			}

			currBrightness := 0
			if (jump || BrightnessSetter._GetCurrentBrightness(currSchemeGuid, AC, currBrightness)) {
				 maxBrightness := BrightnessSetter.GetMaxBrightness()
				,minBrightness := BrightnessSetter.GetMinBrightness()

				if (jump || !((currBrightness == maxBrightness && increment > 0) || (currBrightness == minBrightness && increment < minBrightness))) {
					if (currBrightness + increment > maxBrightness)
						increment := maxBrightness
					else if (currBrightness + increment < minBrightness)
						increment := minBrightness
					else
						increment += currBrightness

					if (DllCall(AC ? PowerWriteACValueIndex : PowerWriteDCValueIndex, "Ptr", 0, "Ptr", currSchemeGuid, "Ptr", BrightnessSetter._GUID_VIDEO_SUBGROUP(), "Ptr", BrightnessSetter._GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS(), "UInt", increment, "UInt") == 0) {
						; PowerApplySettingChanges is undocumented and exists only in Windows 8+. Since both the Power control panel and the brightness slider use this, we'll do the same, but fallback to PowerSetActiveScheme if on Windows 7 or something
						if (!PowerApplySettingChanges || DllCall(PowerApplySettingChanges, "Ptr", BrightnessSetter._GUID_VIDEO_SUBGROUP(), "Ptr", BrightnessSetter._GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS(), "UInt") != 0)
							DllCall(PowerSetActiveScheme, "Ptr", 0, "Ptr", currSchemeGuid, "UInt")
					}
				}

				if (showOSD)
					BrightnessSetter._ShowBrightnessOSD()
			}
			DllCall("LocalFree", "Ptr", currSchemeGuid, "Ptr")
		}
	}

	IsOnAc(ByRef acStatus)
	{
		static SystemPowerStatus
		if (!VarSetCapacity(SystemPowerStatus))
			VarSetCapacity(SystemPowerStatus, 12)

		if (DllCall("GetSystemPowerStatus", "Ptr", &SystemPowerStatus)) {
			acStatus := NumGet(SystemPowerStatus, 0, "UChar") == 1
			return True
		}

		return False
	}
	
	GetDefaultBrightnessIncrement()
	{
		static ret := 10
		DllCall("powrprof\PowerReadValueIncrement", "Ptr", BrightnessSetter._GUID_VIDEO_SUBGROUP(), "Ptr", BrightnessSetter._GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS(), "UInt*", ret, "UInt")
		return ret
	}

	GetMinBrightness()
	{
		static ret := -1
		if (ret == -1)
			if (DllCall("powrprof\PowerReadValueMin", "Ptr", BrightnessSetter._GUID_VIDEO_SUBGROUP(), "Ptr", BrightnessSetter._GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS(), "UInt*", ret, "UInt"))
				ret := 0
		return ret
	}

	GetMaxBrightness()
	{
		static ret := -1
		if (ret == -1)
			if (DllCall("powrprof\PowerReadValueMax", "Ptr", BrightnessSetter._GUID_VIDEO_SUBGROUP(), "Ptr", BrightnessSetter._GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS(), "UInt*", ret, "UInt"))
				ret := 100
		return ret
	}

	_GetCurrentBrightness(schemeGuid, AC, ByRef currBrightness)
	{
		static PowerReadACValueIndex := DllCall("GetProcAddress", "Ptr", BrightnessSetter.hPowrprofMod, "AStr", "PowerReadACValueIndex", "Ptr")
			  ,PowerReadDCValueIndex := DllCall("GetProcAddress", "Ptr", BrightnessSetter.hPowrprofMod, "AStr", "PowerReadDCValueIndex", "Ptr")
		return DllCall(AC ? PowerReadACValueIndex : PowerReadDCValueIndex, "Ptr", 0, "Ptr", schemeGuid, "Ptr", BrightnessSetter._GUID_VIDEO_SUBGROUP(), "Ptr", BrightnessSetter._GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS(), "UInt*", currBrightness, "UInt") == 0
	}
	
	_ShowBrightnessOSD()
	{
		static PostMessagePtr := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "PostMessageW" : "PostMessageA", "Ptr")
			  ,WM_SHELLHOOK := DllCall("RegisterWindowMessage", "Str", "SHELLHOOK", "UInt")
		if A_OSVersion in WIN_VISTA,WIN_7
			return
		BrightnessSetter._RealiseOSDWindowIfNeeded()
		; Thanks to YashMaster @ https://github.com/YashMaster/Tweaky/blob/master/Tweaky/BrightnessHandler.h for realising this could be done:
		if (BrightnessSetter._osdHwnd)
			DllCall(PostMessagePtr, "Ptr", BrightnessSetter._osdHwnd, "UInt", WM_SHELLHOOK, "Ptr", 0x37, "Ptr", 0)
	}

	_RealiseOSDWindowIfNeeded()
	{
		static IsWindow := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", "IsWindow", "Ptr")
		if (!DllCall(IsWindow, "Ptr", BrightnessSetter._osdHwnd) && !BrightnessSetter._FindAndSetOSDWindow()) {
			BrightnessSetter._osdHwnd := 0
			try if ((shellProvider := ComObjCreate("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}"))) {
				try if ((flyoutDisp := ComObjQuery(shellProvider, "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}", "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}"))) {
					 DllCall(NumGet(NumGet(flyoutDisp+0)+3*A_PtrSize), "Ptr", flyoutDisp, "Int", 0, "UInt", 0)
					,ObjRelease(flyoutDisp)
				}
				ObjRelease(shellProvider)
				if (BrightnessSetter._FindAndSetOSDWindow())
					return
			}
			; who knows if the SID & IID above will work for future versions of Windows 10 (or Windows 8). Fall back to this if needs must
			Loop 2 {
				SendEvent {Volume_Mute 2}
				if (BrightnessSetter._FindAndSetOSDWindow())
					return
				Sleep 100
			}
		}
	}
	
	_FindAndSetOSDWindow()
	{
		static FindWindow := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "FindWindowW" : "FindWindowA", "Ptr")
		return !!((BrightnessSetter._osdHwnd := DllCall(FindWindow, "Str", "NativeHWNDHost", "Str", "", "Ptr")))
	}

	_On_WM_POWERBROADCAST(wParam, lParam)
	{
		;OutputDebug % &this
		if (wParam == 0x8013 && lParam && NumGet(lParam+0, 0, "UInt") == NumGet(BrightnessSetter._GUID_ACDC_POWER_SOURCE()+0, 0, "UInt")) { ; PBT_POWERSETTINGCHANGE and a lazy comparison
			this._AC := NumGet(lParam+0, 20, "UChar") == 0
			return True
		}
	}

	_GUID_VIDEO_SUBGROUP()
	{
		static GUID_VIDEO_SUBGROUP__
		if (!VarSetCapacity(GUID_VIDEO_SUBGROUP__)) {
			 VarSetCapacity(GUID_VIDEO_SUBGROUP__, 16)
			,NumPut(0x7516B95F, GUID_VIDEO_SUBGROUP__, 0, "UInt"), NumPut(0x4464F776, GUID_VIDEO_SUBGROUP__, 4, "UInt")
			,NumPut(0x1606538C, GUID_VIDEO_SUBGROUP__, 8, "UInt"), NumPut(0x99CC407F, GUID_VIDEO_SUBGROUP__, 12, "UInt")
		}
		return &GUID_VIDEO_SUBGROUP__
	}

	_GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS()
	{
		static GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__
		if (!VarSetCapacity(GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__)) {
			 VarSetCapacity(GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__, 16)
			,NumPut(0xADED5E82, GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__, 0, "UInt"), NumPut(0x4619B909, GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__, 4, "UInt")
			,NumPut(0xD7F54999, GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__, 8, "UInt"), NumPut(0xCB0BAC1D, GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__, 12, "UInt")
		}
		return &GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS__
	}

	_GUID_ACDC_POWER_SOURCE()
	{
		static GUID_ACDC_POWER_SOURCE_
		if (!VarSetCapacity(GUID_ACDC_POWER_SOURCE_)) {
			 VarSetCapacity(GUID_ACDC_POWER_SOURCE_, 16)
			,NumPut(0x5D3E9A59, GUID_ACDC_POWER_SOURCE_, 0, "UInt"), NumPut(0x4B00E9D5, GUID_ACDC_POWER_SOURCE_, 4, "UInt")
			,NumPut(0x34FFBDA6, GUID_ACDC_POWER_SOURCE_, 8, "UInt"), NumPut(0x486551FF, GUID_ACDC_POWER_SOURCE_, 12, "UInt")
		}
		return &GUID_ACDC_POWER_SOURCE_
	}

}

BrightnessSetter_new() {
	return new BrightnessSetter()
}