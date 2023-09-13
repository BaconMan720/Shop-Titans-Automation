#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#IfWinActive Shop Titans

;GreenReconnectButton := 0x5DF621
::
loop 100000
{ 
    ReconnectButton := GetPixelColor(1046, 727)
    OkButton := GetPixelColor(903, 973)
    if(ReconnectButton = 0x5DF621)
    {
        sleep 6000
        ClickAtCordXY(1046, 727)
        sleep 2000
    }
    if (OkButton = 0x5DF621 or OkButton = 0x54F217 or OkButton = 0x5DF622)
    {
        ClickAtCordXY(903, 973)
        sleep 300
    }

    OutputVarA := OLDGetPixelColor(0.775, 0.07223)
    OutputVarB := OLDGetPixelColor(0.55, 0.9)
    EnergyBar := GetPixelColor(1495, 77)
    ;   if (OutputVarA = 0x969399 or OutputVarA = 0x365DFE)
    if (EnergyBar = 0x365DFE)
    {
        SysGet, Mon2, Monitor, 1
        ClickAtCord(0.5, 0.5)       ;Click NPC
        sleep 1000
        ClickAtCord(0.7, 0.5)       ;Surcharge
        sleep 1000
        ClickAtCord(0.3, 0.5)       ;SmallTalk
        sleep 1000
        ClickAtCord(0.7, 0.6)       ;Sell
        sleep 1000
        ClickAtCord(0.3, 0.6)       ;Refuse
        sleep 1000
        ClickAtCord(0.3, 0.6)       ;Refuse
        sleep 500
        ClickAtCord(0.1, 0.6)       ;Clear select
        sleep 1000
    }
    ;else
    ;{
    ;    if (OLDGetPixelColor(0.76, 0.07223) = 0x365DFE)
     ;   {
     ;       ClickAtCord(0.5, 0.5)       ;Click NPC
     ;       sleep 1000        
     ;       if (OLDGetPixelColor(0.7, 0.5) = 0x442C52)
    ;        {
    ;            ClickAtCord(0.7, 0.5)       ;Surcharge
    ;            sleep 1000
    ;            ClickAtCord(0.3, 0.5)       ;SmallTalk
    ;            sleep 1000
    ;            ClickAtCord(0.7, 0.6)       ;Sell
     ;           sleep 1000
    ;            ClickAtCord(0.3, 0.6)       ;Refuse
    ;            sleep 1000
     ;           ClickAtCord(0.3, 0.6)       ;Refuse
    ;            sleep 500
    ;            ClickAtCord(0.1, 0.6)       ;Clear select
    ;            sleep 1000
     ;       }
    ;        else
    ;        {
    ;            ClickAtCord(0.3, 0.6)       ;Refuse
    ;        }
    ;    }
    ;}
    If (OutputVarB = 0x5DF721)
    {
        ClickAtCord(0.55, 0.9)      
    }
    SysGet, Mon1, Monitor, 1
    pixelgetcolor, OutputVarC, (0.627 * Mon1Right), (0.6 * Mon1Bottom), [slow]
    If (OutputVarC = 0x5DF721 or OutputVarC = 0x5DF722 or OutputVarC = 0x5DF723)
    {
        sleep 60000
        ClickAtCord(0.627, 0.6)
    }
    else
    {
        OutputVarC2 := OLDGetPixelColor(0.627, 0.6)
        If (OutputVarC2 = 0x5DF721 or OutputVarC2 = 0x5DF722 or OutputVarC2 = 0x5DF723)
        {
            sleep 60000
            ClickAtCord(0.627, 0.6)
        }
    }
    sleep 15000
}
return

!o::
msgBox Status: Auto surcharge sell offline
ExitApp
return

+o::
SysGet, Mon1, Monitor, 1
;RightArrowX := (0.66 * Mon1Right)
;RightArrowY := (0.51 * Mon1Bottom)
c := OLDGetPixelColor(0.627, 0.6)
MoveMousetoCord(0.5, 0.58)
;msgBox %c%
X := 0.5
Y := 0.5

A := OLDGetPixelColor(0.5, 0.5)
;msgBox %A%
;sleep 250
;MoveMousetoCord(X, Y)
/*
sleep 1000
If(OutputVar = 0x5DF721)
{
    msgBox %OutputVar%
}
*/
;send {Click, %RightArrowX%, %RightArrowY%, left}      ;Click next bounty button
;sleep 750
;send {Click, %X%, %Y%, left}    ;Click test
return

v::
ClickAtCord(0.15, 0.9)      ;Click goals
sleep 750
ClickAtCord(0.58, 0.35)    ;Click bounty tab
return

ClickAtCord(x, y)
{
    SysGet Mon, Monitor, 1
    ClickX := x * MonRight
    ClickY := y * MonBottom
    Send {Click, %ClickX%, %ClickY%, left}
    return
}

MoveMousetoCord(x, y)
{
    SysGet Mon, Monitor, 1
    MoveX := x * MonRight
    MoveY:= y * MonBottom
    MouseMove, %MoveX%, %MoveY%, 5
    return
}

OLDGetPixelColor(x, y)
{
    SysGet Mon, Monitor, 1
    ColorX := x * MonRight
    ColorY := y * MonBottom
    PixelGetColor, ColorOfPixel, ColorX, ColorY, Slow
    return ColorOfPixel
}

GetPixelColor(x, y)
{
    PixelGetColor, ColorOfPixel, x, y, Slow
    return ColorOfPixel
}

ClickAtCordXY(x, y)
{
    Send {Click, %x%, %y%, left}
    return
}