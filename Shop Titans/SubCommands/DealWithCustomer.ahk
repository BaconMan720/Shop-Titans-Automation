#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
::  
    EnergyBarEmpty := GetPixelColor(1415, 78)    ;Check if the energy bar is basically empty
    EnergyBarPartlyFull := GetPixelColor(1415, 78)    ;Check if the energy bar is partially full
    EnergyBarFull := GetPixelColor(1514, 76)    ;Completly full energy bar
    if(EnergyBarPartlyFull = 0x365DFE or EnergyBarEmpty = 0x4C8BFF)
    {
        ClickAtCord(960, 540)   ;Click The npc
        sleep 500
        talkingToCustomer := true
        itemTier := GetItemTier()
        SurchargeButton := GetPixelColor(1246, 557)     ;Check if i can sercharge
        YellowBox := GetPixelColor(909, 249)            ;Check if there is a buy request, which are yellow.   
        dontHaveItem := GetPixelColor(1210, 673)
        TextBox := GetPixelColor(811, 873)
        if(itemTier = "low" and EnergyBarFull != 0x365CFC)
        {
            ClickAtCord(636, 559)   ;Click SmallTalk
            ClickAtCord(1251, 454)  ;Discount
            ClickAtCord(1280, 671)  ;Click Sell
            talkingToCustomer := false
        }
        else if(itemTier = "High" or itemTier = "unknown")
        {
            if(SurchargeButton = 0x442C52)
            {
                ClickAtCord(1314, 560)  ;Click Surcharge
                ClickAtCord(636, 559)   ;Click SmallTalk
                ClickAtCord(1280, 671)  ;Click Sell
                talkingToCustomer := false
            }
            Else if(EnergyBarFull = 0x365CFC)
            {
                ClickAtCord(689, 675)   ;Click Refuse
                ClickAtCord(689, 675)   ;Click Refuse again to be safe
                talkingToCustomer := false
            }
            else if(YellowBox = 0x6AE4EF)
            {
                ClickAtCord(1280, 671)  ;Click Buy
                talkingToCustomer := false
            }
            else if(dontHaveItem = 0x2BB5FF)
            {
                ClickAtCord(689, 675)   ;Click Refuse
                talkingToCustomer := false
            }
            if(talkingToCustomer = true)
            {
                ClickAtCord(980, 798)   ;Click wait
                talkingToCustomer := false
            }
        }
        if(talkingToCustomer = true)
        {
            ClickAtCord(689, 675)   ;Click Refuse
        }
    }
    runwait "C:\Users\isaac\Desktop\AutoHotKey Scripts\Shop Titans\SubCommands\SellingSubCommands\ResetGameState.ahk"  ;Reset The Game State
return

ClickAtCord(x, y)
{
    Send {Click, %x%, %y%, left}
    sleep 700
}
GetPixelColor(x, y)
{
    PixelGetColor, ColorOfPixel, x, y, Slow
    return ColorOfPixel
}



GetItemTier()
{
    low := "low"
    high := "high"
    unknown := "unknown"
    ImageSearch, TierOneX, TierOneY, 781, 211, 825, 250, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierOne.png
    if(TierOneX > 1)
    {
        return low
    }
    ImageSearch, TierThreeX, TierThreeY, 786, 210, 813, 238, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierThree.png
    if(TierThreeX > 1)
    {
        msgBox "you can detect tier three"
        return low
    }
    ImageSearch, TierFourX, TierFourY, 781, 211, 825, 250, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierFour.png
    if(TierFourX > 1)
    {
        return low
    }
    ImageSearch, TierFiveX, TierFiveY, 781, 211, 825, 250, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierFive.png
    if(TierFiveX > 1)
    {
        return low
    }
    ImageSearch, TierSixX, TierSixY, 767, 211, 809, 253, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierSix.png
    if(TierSixX > 1)
    {
        return low
    }
    ImageSearch, TierSevenX, TierSevenY, 767, 211, 809, 253, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierSeven.png
    if(TierSevenX > 1)
    {
        return low
    }
    ImageSearch, TierEightX, TierEightY, 767, 211, 809, 253, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierEight.png
    if(TierEightX > 1)
    {
        return high
    }
    ImageSearch, TierNineX, TierNineY, 767, 211, 809, 253, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierNine.png
    if(TierNineX > 1)
    {
        return high
    }
    ImageSearch, TierTenX, TierTenY, 768, 220, 786, 244, *100 C:\Users\isaac\Pictures\Shop titans pictures\TierTen.png
    if(TierTenX > 1)
    {
       ; return high
    }
    return unknown
}