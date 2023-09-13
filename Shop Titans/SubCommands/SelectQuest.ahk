#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

::
    goalsIcon := GetPixelColor(302, 976)    ;Check if the goals tab is there
    if(goalsIcon = 0x40E2BE)
    {
        ClickAtCord(289, 975)   ;Click Goals
        bountyTabStatus := GetPixelColor(1110, 394)     ;Check if the Bounty tab is selected
        if(bountyTabStatus =  0x00CCFF)
        {
            ClickAtCord(1114, 389)  ;Click the Bounty tab
        }
        claimRewardA := GetPixelColor(1151, 646) 
        sleep 500
        claimRewardB := GetPixelColor(1151, 646) 
        if(claimRewardA = 0x4FE72A or claimRewardB = 0x4FE72A)  ;Check if the bounty is ready to collect
        {
            ClickAtCord(1151, 646)  ;Collect the bounty reward
            sleep 7000
            ClickAtCord(1115, 978)  ;Click ok
        }
        
        goToBountyBoard := GetPixelColor(927, 776)
        if(goToBountyBoard = 0x442C52)
        {
            ClickAtCord(960, 794)   ;Click go to bounty board
            ClickAtCord(959, 502)   ;Select the first bounty
            foundQuest := false
            loop 25
            {
                questType := GetPixelColor(880, 566) 
                if(questType = 0x20E366)    ;Check if there is a green arrow from a surcharge quest
                {
                    foundQuest := True
                    ClickAtCord(1117, 727)  ;Click accept
                    ClickAtCord(1261, 314)  ;on the x button
                    return
                }
                else
                {
                    ClickAtCord(1272, 546)  ;Click next
                }
            }
        }
        ClickAtCord(1261, 314)  ;on the x button
        if(foundQuest = false)
        {
            ClickAtCord(1261, 314)  ;on the x button
            ClickAtCord(1261, 314)  ;on the x button
        }
    }
return

ClickAtCord(x, y)
{
    Send {Click, %x%, %y%, left}
    sleep 1000
}
GetPixelColor(x, y)
{
    PixelGetColor, ColorOfPixel, x, y, Slow
    return ColorOfPixel
}