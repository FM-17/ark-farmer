#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;; COPYRIGHT FM-17 Industries Incorperated LLC 


#MaxThreadsPerHotkey 2

;; TIME CONVERSION FUNCTIONS
MinToMs(min){
	milliseconds := Round(min * 60000)
	return milliseconds
}

SecToMs(sec){
	milliseconds := Round(sec * 1000)
	return milliseconds
}


;; TOOLTIP FUNCTION
ShowToolTip(content, duration:=-2000, xPos:=1750, yPos:=30){
    ToolTip % content, xPos, yPos
    SetTimer, RemoveToolTip, %duration%
    return
}

RemoveToolTip:
ToolTip

iniFilePath := A_Desktop . "\" . "settings.ini"

;; SETTINGS [DO NOT EDIT HERE - EDIT IN settings.ini]
IniRead, short, %iniFilePath%, Section1, short_delay, 100
IniRead, long, %iniFilePath%, Section1, long_delay, 250
IniRead, foodButton, %iniFilePath%, Section1, food_button, 8
IniRead, drinkButton, %iniFilePath%, Section1, drink_button, 9
IniRead, consumeIntervalMins, %iniFilePath%, Section1, consume_interval, 15
IniRead, dropIntervalMins, %iniFilePath%, Section1, drop_interval, 2
IniRead, restTimeSec, %iniFilePath%, Section1, rest_time, 8

;; UI COORDINATES
remote_search_x := 1245
remote_search_y := 195
remote_drop_x := 1425
remote_drop_y := 195
remote_transfer_x := 1380
remote_transfer_y := 195
remote_first_slot_x := 1250
remote_first_slot_y := 280

player_search_x := 225
player_search_y := 195
player_drop_x := 400
player_drop_y := 195
player_transfer_x := 355
player_transfer_y := 195
player_first_slot_x := 225
player_first_slot_y := 280

;; CONVERSIONS
consumeInterval:=MinToMs(consumeIntervalMins)
dropInterval:=MinToMs(dropIntervalMins)
restTime:=SecToMs(restTimeSec)

F5::
;; DROPDOWN RESOURCE SELECTOR UI
Gui, Add, Text, , Select a resource to farm:
Gui, Add, DropDownList, vSelectedResource, Metal|Stone|Wood
Gui, Add, Button, Default, OK
Gui, Show
Return

ButtonOK:
Gui, Submit
Gui, Destroy

Toggle := !Toggle
	StartTime := A_TickCount ; Set current tick time (uptime of PC) to compare against.

;; FARMING LOOP
loop
{
    If not Toggle
        break
   	Click
	Sleep, 100
	;;; EDIT PATH IN LINE BELOW

	ElapsedTime := A_TickCount - StartTime
	if ( ElapsedTime >= dropInterval ) ; 5 sec.
		{
			gosub, %SelectedResource%
		}
}
return

;;;;;;;;;;;;;;;;;;;;;;;;; Metal Script: Drops berries, stone, crystal;;;;;;;;;;;;;;;;;;;;;;
Metal:
toggle := false

Sleep, long
Send, {f}
Sleep, long
Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, st
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long

Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, wood
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long

Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, obs
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long

Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, rr
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long
Send, {f}
Sleep, restTime ; Rest for stamina

toggle := true
StartTime := A_TickCount ; Reset StartTime variable.
return

;;;;;;;;;;;;;;;;;;;;;;;;; Wood Script: Drops berries, fiber ;;;;;;;;;;;;;;;;;;;;;;
Wood:
toggle := false

Sleep, long
Send, {f}
Sleep, long
Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, er
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long
Send, {f}
Sleep, restTime ; Rest for stamina

toggle := true
StartTime := A_TickCount ; Reset StartTime variable.
return


;;;;;;;;;;;;;;;;;;;;;;;;; Stone Script: Drops wood, thatch, crystal ;;;;;;;;;;;;;;;;;;;;;;
Stone:
toggle := false

Sleep, long
Send, {f}
Sleep, long
Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, wood 
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long

Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, thatch
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long

Click, %remote_search_x%, %remote_search_y% ; dino search box
Sleep, short
Send, crystal
Sleep, long
Click, %remote_drop_x%, %remote_drop_y% ; dino drop all
Sleep, long
Send, {f}

Sleep, restTime ; Rest for stamina
toggle := true
StartTime := A_TickCount ; Reset StartTime variable.
return

;; FOOD SCRIPT
$F2::
ShowToolTip("Consumption Script Enabled", -3000)
#Persistent
SetTimer, Food, %consumeInterval% ; 
return

Food:
Sleep, 25
ShowToolTip("Eating & Drinking", -2000)
Send % foodButton 
Sleep, 200
Send % drinkButton
return

F6:: Reload
F8:: ExitApp


