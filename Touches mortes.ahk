;; Chaînage de lettres mortes pour le pilote Windows tronqué
;;
;; pour ᵉ (exposant) ᵢ, Þ pour les indices problème avec espace (sans shift) dans les indices fait une espace au lieu de «²»
;; pour ∞ (scientifique) ∞b, ∞/, ∞I, ∞i, ∞𝓬, ∞𝐆, ∞𝔉, ∞𝕱
;; pour / (barre oblique) uniquement /∞
;; pour ß (latin) uniquement Þ

;; Entête
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
Process, Priority, , High
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;; Déclaration des touches mortes comme Hotkeys
Hotkey <^>!d, Scientifique
Hotkey <^>!l, BarreOblique
Hotkey <^>!s, Latin
Hotkey <^>!t, Exposants

;; Attente d’une touche après une touche morte
;; n’importe quelle touche alpha numérique listée avec l’option E
;; Aprés IH.Wait la variable mod contient les modificatrices :
;; 0 pour aucune, 1 pour Shift, 2 pour AltGr et 3 pour Shift et AltGr
;; et la variable key contient la touche pressée
IH := InputHook()
IH.KeyOpt("{All}", "-E")
IH.KeyOpt("aàbcçdeéèêfghijklmnopqrstuvwxyz,.^$""«»()@{SC015}+-/*=`% {Enter}", "E")
IH.OnEnd := Func("Touche")

Return

Touche()
{
	global
	mod := (InStr(IH.EndMods,"<^") && InStr(IH.EndMods,">!"))?((InStr(IH.EndMods,"+"))?3:2):((InStr(IH.EndMods,"+"))?1:0)
	key := IH.EndKey
	Switch key
	{
	Case "Space":
		key := " "
	Case "Enter":
		key := "`n"
	}
}

Exposants:
Hotkey <^>!t,, Off
Hotkey <^>!s,, Off
IH.Start()
IH.Wait()
If (mod = 2 && key = "t")
	Goto, Indices
Else If (mod = 2 && key = "s")
	Goto, ExposantLatin
Switch mod
{
Case 1:
	Send, {Ralt down}t{Ralt up}{LShift down}%key%{LShift up}
Case 2:
	Send, {Ralt down}t%key%{Ralt up}
Case 3:
	Send, {Ralt down}t{LShift down}%key%{LShift up}{Ralt up}
Default:
	If (GetKeySC(key) = 0x015)
		Send, %key%{Backspace}{Ralt down}t{Ralt up}%key%
	Else
		Send, {Ralt down}t{Ralt up}%key%
}
Hotkey <^>!t,, On
Hotkey <^>!s,, On
Return

Indices:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"ᴀ":"ₐ"
Else If (mod = 3 && key = "a")
	Send, ᴁ
Else if (mod = 1 && key = "b")
	Send, ʙ
Else if (mod = 1 && key = "c")
	Send, ᴄ
Else if (mod = 1 && key = "d")
	Send, ᴅ
Else if (mod < 2 && key = "e")
	Send, % mod?"ᴇ":"ₑ"
Else if (mod = 1 && key = "f")
	Send, ꜰ
Else if (mod = 1 && key = "g")
	Send, ɢ
Else if (mod < 2 && key = "h")
	Send, % mod?"ʜ":"ₕ"
Else if (mod < 2 && key = "i")
	Send, % mod?"ɪ":"ᵢ"
Else if (mod < 2 && key = "j")
	Send, % mod?"ᴊ":"ⱼ"
Else if (mod < 2 && key = "k")
	Send, % mod?"ᴋ":"ₖ"
Else if (mod < 2 && key = "l")
	Send, % mod?"ʟ":"ₗ"
Else if (mod < 2 && key = "m")
	Send, % mod?"ᴍ":"ₘ"
Else if (mod < 2 && key = "n")
	Send, % mod?"ɴ":"ₙ"
Else if (mod < 2 && key = "o")
	Send, % mod?"ᴏ":"ₒ"
Else If (mod = 3 && key = "o")
	Send, ɶ
Else if (mod < 2 && key = "p")
	Send, % mod?"ᴘ":"ₚ"
Else if (mod < 2 && key = "r")
	Send, % mod?"ʀ":"ᵣ"
Else if (mod < 2 && key = "s")
	Send, % mod?"ꜱ":"ₛ"
Else if (mod < 2 && key = "t")
	Send, % mod?"ᴛ":"ₜ"
Else if (mod < 2 && key = "u")
	Send, % mod?"ᴜ":"ᵤ"
Else if (mod < 2 && key = "v")
	Send, % mod?"ᴠ":"ᵥ"
Else if (mod = 1 && key = "w")
	Send, ᴡ
Else if (mod = 0 && key = "x")
	Send, ₓ
Else if (mod = 1 && key = "y")
	Send, ʏ
Else if (mod = 1 && key = "z")
	Send, ᴢ
Else if (mod = 1 && key = """")
	Send, ₁
Else if (mod = 1 && key = "«")
	Send, ₂
Else if (mod = 1 && key = "»")
	Send, ₃
Else if (mod < 2 && key = "(")
     Send, % mod?"₄":"₍"
Else if (mod < 2 && key = ")")
     Send, % mod?"₅":"₎"
Else if (mod = 1 && key = "@")
	Send, ₆
Else if (mod < 2 && key = "+")
     Send, % mod?"₇":"₊"
Else if (mod < 2 && key = "-")
     Send, % mod?"₈":"₋"
Else if (mod = 1 && key = "/")
	Send, ₉
Else if (mod = 1 && key = "*")
	Send, ₀
Else if (mod = 0 && key = "=")
	Send, ₌
Else if (mod < 2 && key = " ")
	Send, % mod?"³":"²"
Else
{
	Send, ᵢ
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!t,, On
Hotkey <^>!s,, On
Return

Scientifique:
Hotkey <^>!d,, Off
Hotkey <^>!l,, Off
IH.Start()
IH.Wait()
If (mod = 2 && key = "l")
	Goto, ScientifiqueBarreOblique
If (key = "+")
{
	Switch mod
	{
	Case 1:
		Send, ⊞
	Case 2:
		Send, ⊎
	Case 3:
		Send, ¬
	Default:
		Send, ⊕
	}
}
Switch mod
{
Case 1:
	{
	If (key = "i")
		Goto, GrasItalique
	Else If (key = "f")
		Goto, GothiqueGras
	Else
		Send, {Ralt down}d{Ralt up}{LShift down}%key%{LShift up}
	}
Case 2:
	Send, {Ralt down}d%key%{Ralt up}
Case 3:
	Send, {Ralt down}d{LShift down}%key%{LShift up}{Ralt up}
Default:
	{
	If (key = "b")
		Goto, TraitDouble
	Else If (key = "i")
		Goto, Italique
	Else If (key = "c")
		Goto, Calligraphique
	Else If (key = "r")
		Goto, Script
	Else If (key = "g")
		Goto, Gras
	Else If (key = "f")
		Goto, Gothique
	Else If (GetKeySC(key) = 0x015)
		Send, %key%{Backspace}{Ralt down}d{Ralt up}%key%
	Else
		Send, {Ralt down}d{Ralt up}%key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

TraitDouble:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝔸":"𝕒"
Else If (mod < 2 && key = "b")
	Send, % mod?"𝔹":"𝕓"
Else If (mod < 2 && key = "c")
	Send, % mod?"ℂ":"𝕔"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝔻":"𝕕"
Else If (mod < 2 && key = "e")
	Send, % mod?"𝔼":"𝕖"
Else If (mod < 2 && key = "f")
	Send, % mod?"𝔽":"𝕗"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝔹":"𝕓"
Else If (mod < 2 && key = "h")
	Send, % mod?"ℍ":"𝕙"
Else If (mod < 2 && key = "i")
	Send, % mod?"𝕀":"𝕚"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝕁":"𝕛"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝕂":"𝕜"
Else If (mod < 2 && key = "l")
	Send, % mod?"𝕃":"𝕝"
Else If (mod < 2 && key = "m")
	Send, % mod?"𝕄":"𝕞"
Else If (mod < 2 && key = "n")
	Send, % mod?"ℕ":"𝕟"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝕆":"𝕠"
Else If (mod < 2 && key = "p")
	Send, % mod?"ℙ":"𝕡"
Else If (mod < 2 && key = "q")
	Send, % mod?"ℚ":"𝕢"
Else If (mod < 2 && key = "r")
	Send, % mod?"ℝ":"𝕣"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝕊":"𝕤"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝕋":"𝕥"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝕌":"𝕦"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝕍":"𝕧"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝕎":"𝕨"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝕏":"𝕩"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝕐":"𝕪"
Else If (mod < 2 && key = "z")
	Send, % mod?"ℤ":"𝕫"
Else If (mod = 1 && key = "*")
	Send, 𝟘
Else If (mod = 1 && key = """")
	Send, 𝟙
Else If (mod = 1 && key = "«")
	Send, 𝟚
Else If (mod = 1 && key = "»")
	Send, 𝟛
Else If (mod = 1 && key = "(")
	Send, 𝟜
Else If (mod = 1 && key = ")")
	Send, 𝟝
Else If (mod = 1 && key = "@")
	Send, 𝟞
Else If (mod = 1 && key = "+")
	Send, 𝟟
Else If (mod = 1 && key = "-")
	Send, 𝟠
Else If (mod = 1 && key = "/")
	Send, 𝟡
Else If (mod = 2 && key = "(")
	Send, ⟦
Else If (mod = 2 && key = ")")
	Send, ⟧
Else
{
	Send, 𝕓
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

GrasItalique:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝑨":"𝒂"
Else If (mod < 2 && key = "b")
	Send, % mod?"𝑩":"𝒃"
Else If (mod < 2 && key = "c")
	Send, % mod?"𝑪":"𝒄"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝑫":"𝒅"
Else If (mod = 2 && key = "d")
	Send, 𝜵
Else If (mod < 2 && key = "e")
	Send, % mod?"𝑬":"𝒆"
Else If (mod < 2 && key = "f")
	Send, % mod?"𝑭":"𝒇"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝑮":"𝒈"
Else If (mod < 2 && key = "h")
	Send, % mod?"𝑯":"𝒉"
Else If (mod < 2 && key = "i")
	Send, % mod?"𝑰":"𝒊"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝑱":"𝒋"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝑲":"𝒌"
Else If (mod < 2 && key = "l")
	Send, % mod?"𝑳":"𝒍"
Else If (mod < 2 && key = "m")
	Send, % mod?"𝑴":"𝒎"
Else If (mod < 2 && key = "n")
	Send, % mod?"𝑵":"𝒏"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝑶":"𝒐"
Else If (mod < 2 && key = "p")
	Send, % mod?"𝑷":"𝒑"
Else If (mod < 2 && key = "q")
	Send, % mod?"𝑸":"𝒒"
Else If (mod < 2 && key = "r")
	Send, % mod?"𝑹":"𝒓"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝑺":"𝒔"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝑻":"𝒕"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝑼":"𝒖"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝑽":"𝒗"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝑾":"𝒘"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝑿":"𝒙"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝒀":"𝒚"
Else If (mod < 2 && key = "z")
	Send, % mod?"𝒁":"𝒛"
Else
{
	Send, 𝑰
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

Italique:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝐴":"𝑎"
Else If (mod < 2 && key = "b")
	Send, % mod?"𝐵":"𝑏"
Else If (mod < 2 && key = "c")
	Send, % mod?"𝐶":"𝑐"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝐷":"𝑑"
Else If (mod = 2 && key = "d")
	Send, 𝛻
Else If (mod < 2 && key = "e")
	Send, % mod?"𝐸":"𝑒"
Else If (mod < 2 && key = "f")
	Send, % mod?"𝐹":"𝑓"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝐺":"𝑔"
Else If (mod < 2 && key = "h")
	Send, % mod?"𝐻":"ℎ"
Else If (mod < 2 && key = "i")
	Send, % mod?"𝐼":"𝑖"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝐽":"𝑗"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝐾":"𝑘"
Else If (mod < 2 && key = "l")
	Send, % mod?"𝐿":"𝑙"
Else If (mod < 2 && key = "m")
	Send, % mod?"𝑀":"𝑚"
Else If (mod < 2 && key = "n")
	Send, % mod?"𝑁":"𝑛"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝑂":"𝑜"
Else If (mod < 2 && key = "p")
	Send, % mod?"𝑃":"𝑝"
Else If (mod < 2 && key = "q")
	Send, % mod?"𝑄":"𝑞"
Else If (mod < 2 && key = "r")
	Send, % mod?"𝑅":"𝑟"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝑆":"𝑠"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝑇":"𝑡"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝑈":"𝑢"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝑉":"𝑣"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝑊":"𝑤"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝑋":"𝑥"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝑌":"𝑦"
Else If (mod < 2 && key = "z")
	Send, % mod?"𝑍":"𝑧"
Else
{
	Send, 𝑖
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

Calligraphique:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝓐":"𝓪"
Else If (mod < 2 && key = "b")
	Send, % mod?"𝓑":"𝓫"
Else If (mod < 2 && key = "c")
	Send, % mod?"𝓒":"𝓬"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝓓":"𝓭"
Else If (mod < 2 && key = "e")
	Send, % mod?"𝓔":"𝓮"
Else If (mod < 2 && key = "f")
	Send, % mod?"𝓕":"𝓯"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝓖":"𝓰"
Else If (mod < 2 && key = "h")
	Send, % mod?"𝓗":"𝓱"
Else If (mod < 2 && key = "i")
	Send, % mod?"𝓘":"𝓲"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝓙":"𝓳"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝓚":"𝓴"
Else If (mod < 2 && key = "l")
	Send, % mod?"𝓛":"𝓵"
Else If (mod < 2 && key = "m")
	Send, % mod?"𝓜":"𝓶"
Else If (mod < 2 && key = "n")
	Send, % mod?"𝓝":"𝓷"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝓞":"𝓸"
Else If (mod < 2 && key = "p")
	Send, % mod?"𝓟":"𝓹"
Else If (mod < 2 && key = "q")
	Send, % mod?"𝓠":"𝓺"
Else If (mod < 2 && key = "r")
	Send, % mod?"𝓡":"𝓻"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝓢":"𝓼"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝓣":"𝓽"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝓤":"𝓾"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝓥":"𝓿"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝓦":"𝔀"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝓧":"𝔁"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝓨":"𝔂"
Else If (mod < 2 && key = "z")
	Send, % mod?"𝓩":"𝔃"
Else
{
	Send, 𝓬
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

Script:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝒜":"𝒶"
Else If (mod < 2 && key = "b")
	Send, % mod?"ℬ":"𝒷"
Else If (mod < 2 && key = "c")
	Send, % mod?"𝒞":"𝒸"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝒟":"𝒹"
Else If (mod < 2 && key = "e")
	Send, % mod?"ℰ":"ℯ"
Else If (mod < 2 && key = "f")
	Send, % mod?"ℱ":"𝒻"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝒢":"ℊ"
Else If (mod < 2 && key = "h")
	Send, % mod?"ℋ":"𝒽"
Else If (mod < 2 && key = "i")
	Send, % mod?"ℐ":"𝒾"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝒥":"𝒿"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝒦":"𝓀"
Else If (mod < 2 && key = "l")
	Send, % mod?"ℒ":"𝓁"
Else If (mod < 2 && key = "m")
	Send, % mod?"ℳ":"𝓂"
Else If (mod < 2 && key = "n")
	Send, % mod?"𝒩":"𝓃"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝒪":"ℴ"
Else If (mod < 2 && key = "p")
	Send, % mod?"𝒫":"𝓅"
Else If (mod < 2 && key = "q")
	Send, % mod?"𝒬":"𝓆"
Else If (mod < 2 && key = "r")
	Send, % mod?"ℛ":"𝓇"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝒮":"𝓈"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝒯":"𝓉"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝒰":"𝓊"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝒱":"𝓋"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝒲":"𝓌"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝒳":"𝓍"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝒴":"𝓎"
Else If (mod < 2 && key = "z")
	Send, % mod?"𝒵":"𝓏"
Else
{
	Send, 𝓇
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

Gras:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝐀":"𝐚"
Else If (mod < 2 && key = "b")
	Send, % mod?"𝐁":"𝐛"
Else If (mod < 2 && key = "c")
	Send, % mod?"𝐂":"𝐜"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝐃":"𝐝"
Else If (mod = 2 && key = "d")
	Send, 𝛁
Else If (mod < 2 && key = "e")
	Send, % mod?"𝐄":"𝐞"
Else If (mod < 2 && key = "f")
	Send, % mod?"𝐅":"𝐟"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝐆":"𝐠"
Else If (mod < 2 && key = "h")
	Send, % mod?"𝐇":"𝐡"
Else If (mod < 2 && key = "i")
	Send, % mod?"𝐈":"𝐢"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝐉":"𝐣"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝐊":"𝐤"
Else If (mod < 2 && key = "l")
	Send, % mod?"𝐋":"𝐥"
Else If (mod < 2 && key = "m")
	Send, % mod?"𝐌":"𝐦"
Else If (mod < 2 && key = "n")
	Send, % mod?"𝐍":"𝐧"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝐎":"𝐨"
Else If (mod < 2 && key = "p")
	Send, % mod?"𝐏":"𝐩"
Else If (mod < 2 && key = "q")
	Send, % mod?"𝐐":"𝐪"
Else If (mod < 2 && key = "r")
	Send, % mod?"𝐑":"𝐫"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝐒":"𝐬"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝐓":"𝐭"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝐔":"𝐮"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝐕":"𝐯"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝐖":"𝐰"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝐗":"𝐱"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝐘":"𝐲"
Else If (mod < 2 && key = "z")
	Send, % mod?"𝐙":"𝐳"
Else If (mod = 2 && key = "(")
	Send, ［
Else If (mod = 2 && key = ")")
	Send, ］
Else
{
	Send, 𝐆
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

Gothique:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝔄":"𝔞"
Else If (mod < 2 && key = "b")
	Send, % mod?"𝔅":"𝔟"
Else If (mod < 2 && key = "c")
	Send, % mod?"ℭ":"𝔠"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝔇":"𝔡"
Else If (mod < 2 && key = "e")
	Send, % mod?"𝔈":"𝔢"
Else If (mod < 2 && key = "f")
	Send, % mod?"𝔉":"𝔣"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝔊":"𝔤"
Else If (mod < 2 && key = "h")
	Send, % mod?"ℌ":"𝔥"
Else If (mod < 2 && key = "i")
	Send, % mod?"ℑ":"𝔦"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝔍":"𝔧"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝔎":"𝔨"
Else If (mod < 2 && key = "l")
	Send, % mod?"𝔏":"𝔩"
Else If (mod < 2 && key = "m")
	Send, % mod?"𝔐":"𝔪"
Else If (mod < 2 && key = "n")
	Send, % mod?"𝔑":"𝔫"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝔒":"𝔬"
Else If (mod < 2 && key = "p")
	Send, % mod?"𝔓":"𝔭"
Else If (mod < 2 && key = "q")
	Send, % mod?"𝔔":"𝔮"
Else If (mod < 2 && key = "r")
	Send, % mod?"ℜ":"𝔯"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝔖":"𝔰"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝔗":"𝔱"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝔘":"𝔲"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝔙":"𝔳"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝔚":"𝔴"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝔛":"𝔵"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝔜":"𝔶"
Else If (mod < 2 && key = "z")
	Send, % mod?"ℨ":"𝔷"
Else
{
	Send, 𝔉
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

GothiqueGras:
IH.Start()
IH.Wait()
If (mod < 2 && key = "a")
	Send, % mod?"𝕬":"𝖆"
Else If (mod < 2 && key = "b")
	Send, % mod?"𝕭":"𝖇"
Else If (mod < 2 && key = "c")
	Send, % mod?"𝕮":"𝖈"
Else If (mod < 2 && key = "d")
	Send, % mod?"𝕯":"𝖉"
Else If (mod < 2 && key = "e")
	Send, % mod?"𝕰":"𝖊"
Else If (mod < 2 && key = "f")
	Send, % mod?"𝕱":"𝖋"
Else If (mod < 2 && key = "g")
	Send, % mod?"𝕲":"𝖌"
Else If (mod < 2 && key = "h")
	Send, % mod?"𝕳":"𝖍"
Else If (mod < 2 && key = "i")
	Send, % mod?"𝕴":"𝖎"
Else If (mod < 2 && key = "j")
	Send, % mod?"𝕵":"𝖏"
Else If (mod < 2 && key = "k")
	Send, % mod?"𝕶":"𝖐"
Else If (mod < 2 && key = "l")
	Send, % mod?"𝕷":"𝖑"
Else If (mod < 2 && key = "m")
	Send, % mod?"𝕸":"𝖒"
Else If (mod < 2 && key = "n")
	Send, % mod?"𝕹":"𝖓"
Else If (mod < 2 && key = "o")
	Send, % mod?"𝕺":"𝖔"
Else If (mod < 2 && key = "p")
	Send, % mod?"𝕻":"𝖕"
Else If (mod < 2 && key = "q")
	Send, % mod?"𝕼":"𝖖"
Else If (mod < 2 && key = "r")
	Send, % mod?"𝕽":"𝖗"
Else If (mod < 2 && key = "s")
	Send, % mod?"𝕾":"𝖘"
Else If (mod < 2 && key = "t")
	Send, % mod?"𝕿":"𝖙"
Else If (mod < 2 && key = "u")
	Send, % mod?"𝖀":"𝖚"
Else If (mod < 2 && key = "v")
	Send, % mod?"𝖁":"𝖛"
Else If (mod < 2 && key = "w")
	Send, % mod?"𝖂":"𝖜"
Else If (mod < 2 && key = "x")
	Send, % mod?"𝖃":"𝖝"
Else If (mod < 2 && key = "y")
	Send, % mod?"𝖄":"𝖞"
Else If (mod < 2 && key = "z")
	Send, % mod?"𝖅":"𝖟"
Else
{
	Send, 𝕱
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

BarreOblique:
Hotkey <^>!l,, Off
Hotkey <^>!d,, Off
IH.Start()
IH.Wait()
If (mod = 2 && key = "d")
	Goto, ScientifiqueBarreOblique
Switch mod
{
Case 1:
	Send, {Ralt down}l{Ralt up}{LShift down}%key%{LShift up}
Case 2:
	Send, {Ralt down}l%key%{Ralt up}
Case 3:
	Send, {Ralt down}l{LShift down}%key%{LShift up}{Ralt up}
Default:
	Send, {Ralt down}l{Ralt up}%key%
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

ScientifiqueBarreOblique:
IH.Start()
IH.Wait()
If (mod = 2 && key = "=")
	Send, ≢
Else If (mod = 2 && key = "b")
	Send, ∤
Else If (mod = 0 && key = "v")
	Send, ⊽
Else If (mod = 0 && key = "u")
	Send, ⊼
Else If (mod = 3 && key = "d")
	Send, ⋪
Else If (key = "e")
{
	Switch mod
	{
	Case 1:
		Send, ∄
	Case 2:
		Send, ⊄
	Case 3:
		Send, ⊊
	Default:
		Send, ∉
	}
}
Else If (mod = 0 && key = "`,")
	Send, ∌
Else If (mod = 2 && key = "`,")
	Send, ⊅
Else If (mod = 3 && key = "`,")
	Send, ⊋
Else If (mod = 0 && key = "n")
	Send, ∦
Else If (mod = 2 && key = "t")
	Send, ⊬
Else If (mod = 3 && key = "t")
	Send, ⊭
Else If (mod = 0 && key = "k")
	Send, ≁
Else If (mod = 3 && key = "o")
	Send, ≰
Else If (mod = 2 && key = "«")
	Send, ⊀
Else If (mod = 2 && key = "»")
	Send, ⊁
Else
{
	Send % (A_ThisHotkey="<^>!d")?"ǁ {Backspace}/":"/ǁ {Backspace}"
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!d,, On
Hotkey <^>!l,, On
Return

Latin:
Hotkey <^>!s,, Off
Hotkey <^>!t,, Off
IH.Start()
IH.Wait()
If (mod = 2 && key = "t")
	Goto, ExposantLatin
Switch mod
{
Case 1:
	Send, {Ralt down}s{Ralt up}{LShift down}%key%{LShift up}
Case 2:
	Send, {Ralt down}s%key%{Ralt up}
Case 3:
	Send, {Ralt down}s{LShift down}%key%{LShift up}{Ralt up}
Default:
	Send, {Ralt down}s{Ralt up}%key%
}
Hotkey <^>!t,, On
Hotkey <^>!s,, On
Return

ExposantLatin:
IH.Start()
IH.Wait()
If (mod = 2 && key = "u")
	Send, ᶣ
Else If (mod = 2 && key = "h")
	Send, ˤ
Else If (mod = 0 && key = "n")
	Send, ᵑ
Else If (mod = 0 && key = "g")
	Send, ˠ
Else If (mod = 1 && key = "h")
	Send, ˀ
Else If (mod = 3 && key = "h")
	Send, ˁ
Else If (mod = 1 && key = "è")
	Send, ᴲ
Else If (mod = 0 && key = "a")
	Send, ᵅ
Else If (mod = 0 && key = "e")
	Send, ᵊ
Else If (mod = 0 && key = "é")
	Send, ᵋ
Else If (mod = 0 && key = "o")
	Send, ᵓ
Else If (mod = 0 && key = "d")
	Send, ᶞ
Else If (mod = 0 && key = "i")
	Send, ᶥ
Else If (mod = 0 && key = "ç")
	Send, ᶴ
Else If (mod = 0 && key = "u")
	Send, ᶷ
Else If (mod = 0 && key = "v")
	Send, ᶺ
Else If (mod = 0 && key = "z")
	Send, ᶾ
Else If (mod = 0 && key = "c")
	Send, ᶿ
Else
{
	Send, Þ
	Switch mod
	{
	Case 1:
		Send, {LShift down}%key%{LShift up}
	Case 2:
		Send, {Ralt down}%key%{Ralt up}
	Case 3:
		Send, {Ralt down}{LShift down}%key%{LShift up}{Ralt up}
	Default:
		Send, %key%
	}
}
Hotkey <^>!s,, On
Hotkey <^>!t,, On
Return