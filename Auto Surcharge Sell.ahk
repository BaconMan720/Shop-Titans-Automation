#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive Shop Titans
o::		; push o to activate
msgBox [auto sell online]
loop 10000
{
    pixelgetcolor, OutputVarA, 1488, 78, [slow]
    OutputB := GetPixelColor(0.55, 0.9)
    if (OutputVarA = 0x969399 or OutputVarA = 0x365DFE)
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
    If (OutputVarB = 0x5DF721)
    {
        ClickAtCord(0.55, 0.9)      
    }
    pixelgetcolor, OutputVarC, (0.627 * Mon1Right), (0.6 * Mon1Bottom), [slow]
    If(OutputVarC = 0x5DF721 or OutputVarC = 0x5DF722)
    {
        loop 20
        {
            sleep 15
            pixelgetcolor, OutputVarD, (0.627 * Mon1Right), (0.6 * Mon1Bottom), [slow]
            if(OutputVarD = 0x5DF721 or OutputVarD = 0x5DF722)
            {
            }
            else
            {
                Break
            }
        }
        SysGet, Mon3, Monitor, 1
        send {Click, (0.627 * Mon3Right), (0.6 * Mon3Bottom), left}
    }
    sleep 15000
}
return

!o::		;alt o to activate
msgBox Status: Auto surcharge sell offline
ExitApp
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

GetPixelColor(x, y)
{
    SysGet Mon, Monitor, 1
    ColorX := x * MonRight
    ColorY := y * MonBottom
    PixelGetColor, ColorOfPixel, ColorX, ColorY, Slow
    return ColorOfPixel
}
