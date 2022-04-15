#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive Shop Titans
o::
msgBox [auto sell online]
loop 10000
{
    pixelgetcolor, OutputVar, 1488, 78, [slow]
    if (OutputVar = 0x969399 or OutputVar = 0x365DFE)
    {
        SysGet, Mon2, Monitor, 1
        NPCX := 50/100 * Mon2Right
        NPCY := 50/100 * Mon2Bottom
        Send {Click %NPCX% %NPCY% left}
        sleep 1000
        SurchargeX := 70/100 * Mon2Right
        SurchargeY := 50/100 * Mon2Bottom
        Send {Click %SurchargeX% %SurchargeY% left}
        sleep 1000
        SmallTalkX := 30/100 * Mon2Right
        SmallTalkY := 50/100 * Mon2Bottom
        Send {Click %SmallTalkX% %SmallTalkY% left}
        sleep 1000
        SellX := 70/100 * Mon2Right
        SellY := 60/100 * Mon2Bottom
        Send {Click %SellX% %SellY% left}
        sleep 1000
        RefuseX := 30/100 * Mon2Right
        RefuseY:= 60/100 * Mon2Bottom
        Send {Click %RefuseX% %RefuseY% left}
        sleep 1000
        Send {Click %RefuseX% %RefuseY% left}
        sleep 500
        send {click, %ClearSelectX%, %ClearselectY%, left}
        sleep 1000
        pixelgetcolor, OutputVar, (0.55 * Mon1Right), (0.9 * Mon1Bottom), [slow]
	}
    elseIf(OutputVar = 0x5DF721)
    {
        send {click, (0.55 * Mon1Right), (0.9 * Mon1Bottom), left}
    }
    sleep 15000
}
return

!o::
msgBox Status: Auto surcharge sell offline
ExitApp
return