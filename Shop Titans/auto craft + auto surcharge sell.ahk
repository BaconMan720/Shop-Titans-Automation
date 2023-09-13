#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive, Shop Titans
l::
MsgBox [auto craft DISABLED + auto surcharge sell active]
T := 1000*(2*60+47)	
loop 1000
{
    loop 4860
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
        }
        sleep 15000
    }
    SysGet, mon1, Monitor, 1
    loop 10
    {
        HarvestX := (0.884 * mon1Right)
        HarvestY := (0.9 * mon1Bottom)
        send {click, %harvestX%, %HarvestY%, left}
        sleep 300 
        send {click, %harvestX%, %HarvestY%, left}
	    sleep 300
        CollectX := (0.47 * mon1Right)
        CollectY := (0.72 * mon1Bottom)
        send {click, %CollectX%, %CollectY%, left}
        sleep 500
        ClearSelectX := (0.2 * mon1Right)
        ClearselectY := (0.5 * mon1Bottom)
        send {click, %ClearSelectX%, %ClearselectY%, left}
        sleep 500
    }
    CraftX := (mon1Right * 0.94)
    CraftY := (mon1Bottom * 0.85)
    send {click, %CraftX%, %CraftY%, left}
    loop 1
    {
        loop 10
        {
            sleep 500
            QueUpX := (0.08 * mon1Right)
            QueUpY := (0.8 * mon1Bottom)
            send {click, %QueUpX%, %QueUpY%, left}
        }
        loop 10
        {
            sleep 500
            QueUpX := (0.18 * mon1Right)
            QueUpY := (0.8 * mon1Bottom)
            send {click, %QueUpX%, %QueUpY%, left}
        }
    }
    sleep 500
    send {click, %ClearSelectX%, %ClearselectY%, left}
    sleep 500
    send {click, %ClearSelectX%, %ClearselectY%, left}
}
Return

!l::
msgBox Status: auto craft + auto surcharge sell offline
ExitApp
Return

*l::
SysGet, Mon, Monitor, 1
TestX := %MonRight%
TestY := %MonBottom%
SendEvent {Click 600 100 Down}{Click 600 110 Up}
MouseClickDrag, left, (0.5 * %TestX%), (0.5 * %TestY%), (0.5 * %TestX% + 1), (0.5 * %TestY% + 1), 5
Return