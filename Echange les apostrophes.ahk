#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
Process, Priority, , High
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Échanger les apostrophes
Hotkey SC031,AposTypo,On
Hotkey RAlt & SC022,AposDroit,On
Hotkey RAlt & j,Echange

Return
  
Echange:
Hotkey SC031, Toggle
Hotkey RAlt & SC022, Toggle
ToolTip % "Apostrophes échangées", % A_CaretX + 15, % A_CaretY + 15
SetTimer, RemoveToolTip, -1000
Return

AposDroit:
Send, {SC031}
Return

AposTypo:
Send, '
Return

RemoveToolTip:
ToolTip