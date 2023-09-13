#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

::
    loop 60
    {
        craftedItem := GetPixelColor(1693, 1023)
        if(craftedItem = 0x1C526B or craftedItem = 0x1D3E52 or craftedItem = 0x1D2837 or craftedItem = 0x1E212E or craftedItem = 0x1D1C28 or craftedItem = 0x1E1A25 or craftedItem = 0x1E1F2D)
        {
            ClickAtCord(1693, 1023)
            sleep 500
            masterpiece := GetPixelColor(871, 786)
            doubleMasterpiece := GetPixelColor(880, 790)
            if(masterpiece = 0x442C52 or doubleMasterpiece = 0x442D52)
            {
                ClickAtCord(871, 786)   ;Click the collect masterpiece button
            }
            sleep 300
            CaseB := GetPixelColor(1075, 976)
            if(caseB = 0x5DF621)
            {
                ClickAtCord(1075, 976)
            }
        }
        sleep 40
    }
    craftingSlotAvailable := GetPixelColor(1867, 928)
    if(craftingSlotAvailable = 0x2EA1FF)
    {
        ClickAtCord(1812, 965)  ;Click the craft button
        sleep 500
        craftingStrategy := kingsCaprice
        if(craftingStrategy = kingsCaprice)
        {
            miscTab := GetPixelColor(1529, 1008)
            if(miscTab = 0x00CFFF)
            {
                ClickAtCord(1529, 1008)
            }
            sleep 500
            capricesTab := GetPixelColor(552, 1004)
            if(capricesTab = 0x583D67)
            {
                ClickAtCord(552, 1004)
            }
            tookToLong := 0
            moreCraftingSlots := True
            while moreCraftingSlots = True
            {
                ClickAtCord(82, 770)
                notEnoughRecources := GetPixelColor(1242, 375)
                lockedRecipe := GetPixelColor(1246, 280)
                workerlvlLow := GetPixelColor(895, 202)
                if(notEnoughRecources = 0x1F48FF)
                {
                    ClickAtCord(1242, 375)
                    ShiftRecipes(1)
                }
                else if(lockedRecipe = 0x1E47FF)
                {
                    ClickAtCord(1246, 280)
                    ShiftRecipes(1)
                }
                else if(workerlvlLow = 0x002DFF)
                {
                    ShiftRecipes(1)
                }
                noMoreCraftingSlots := GetPixelColor(1858, 920)
                if(noMoreCraftingSlots = 0x4AEE21)
                {
                    moreCraftingSlots := False
                }
                if(tookToLong >= 30)
                {
                    moreCraftingSlots := False
                    ClickAtCord(1875, 147)
                }
                tookToLong += 1
            }
        }
    }
return

ClickAtCord(x, y)
{
    Send {Click, %x%, %y%, left}
    sleep 500
}
GetPixelColor(x, y)
{
    PixelGetColor, ColorOfPixel, x, y, Slow
    return ColorOfPixel
}
ShiftRecipes(quantity)
{
    loop %quantity%
    {
        send {Click, 317, 770, down, left}
        sleep 200
        MoveMouseRelativeDistance(-230, 0)
        sleep 100
        send {Click, up, left}
        sleep 700
    }
}
MoveMouseRelativeDistance(x, y)
{
    sendMode Event
    MouseMove, %x%, %y%, 15, R
    sendMode Input
}