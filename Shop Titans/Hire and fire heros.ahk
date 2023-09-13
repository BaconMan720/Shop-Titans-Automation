#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#IfWinActive Shop Titans
DefaultWait := 1000

z::
    if WinActive(Shop Titans)
    {       
        ClickAtCord(94, 808)       ;Click New Hero
        Sleep DefaultWait
        ClickAtCord(1612, 420)     ;Click the Rogue tab
        Sleep 200
        ClickAtCord(1578, 476)     ;Click on the wonderer
        Sleep 200
        ClickAtCord(1769, 755)     ;Click Recruit
        Sleep 200
        ClickAtCord(816, 628)      ;Click Recruit with gold
        Sleep 1500
        ClickAtCord(513, 819)     ;Click on the new hero
    }
return

x::
    if WinActive(Shop Titans)
    {
        ClickAtCord(1043, 339)     ;Click on the gear
        Sleep 200
        ClickAtCord(785, 713)      ;Click Retire
        Sleep 300
        MoveMousetoCord(1105, 640)     ;hover Yes
    }
return

c::
    If WinActive(Shop Titans)
    {
        ClickAtCord(1043, 339)     ;Click on the gear
        Sleep 200
        ClickAtCord(785, 713)      ;Click Retire
        Sleep 600
        ClickAtCord(1105, 640)     ;Click Yes
        Sleep 1000
        ClickAtCord(94, 808)       ;Click New Hero
        Sleep 1000
        ;ClickAtCord(1612, 420)     ;Click the Rogue tab
        Sleep 200
        ;ClickAtCord(1578, 476)     ;Click on the wonderer
        ClickAtCord(1512, 484)      ;click on the third hero class
        Sleep 300
        ClickAtCord(1769, 755)     ;Click Recruit
        Sleep 600
        ClickAtCord(816, 628)      ;Click Recruit with gold
        Sleep 1500
        ClickAtCord(513, 819)     ;Click on the new hero
    }
Return

v::
    a := 1
    while a = 1
    {
        sleep 1000
        skillOneColor := GetPixelColor(624, 749)
        skillTwoColor := GetPixelColor(661, 750)
        if(skillTwoColor = 0x212434 or skillOneColor = 0x858B94)
        {
            a := 0
        }
        else
        {
            perfectSkillFirstSlotA := GetPixelColor(652, 763)
            perfectSkillFirstSlotB := GetPixelColor(654, 785)
            perfectSkillFirstSlotC := GetPixelColor(668, 776)
            perfectSkillFirstSlotD := GetPixelColor(640, 775)
            if(perfectSkillFirstSlotA = 0xA3EAFF and perfectSkillFirstSlotB = 0xACD5EB and perfectSkillFirstSlotC = 0xBEF0FF and perfectSkillFirstSlotD = 0x3589C6)
            {
                return
            }
            sleep 2000
            ClickAtCord(1043, 339)     ;Click on the gear
            Sleep 200
            ClickAtCord(785, 713)      ;Click Retire
            Sleep 600
            ClickAtCord(1105, 640)     ;Click Yes
            Sleep 1000
            ClickAtCord(94, 808)       ;Click New Hero
            Sleep 1000
            ;ClickAtCord(1612, 420)     ;Click the Rogue tab
            Sleep 200
            ;ClickAtCord(1578, 476)     ;Click on the wonderer
            ClickAtCord(1512, 484)      ;click on the third hero class
            Sleep 200
            ClickAtCord(1769, 755)     ;Click Recruit
            Sleep 600
            ClickAtCord(816, 628)      ;Click Recruit with gold
            Sleep 1500
            ClickAtCord(513, 819)     ;Click on the new hero
        }
    }
return

ClickAtCord(x, y)
{
    Send {Click, %x%, %y%, left}
    return
}
MoveMousetoCord(x, y)
{
    MouseMove, %x%, %y%, 5
    return
}
GetPixelColor(x, y)
{
    PixelGetColor, ColorOfPixel, x, y, Slow
    return ColorOfPixel
}
