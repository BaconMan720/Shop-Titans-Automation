#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
::
    a := 1
    while a = 1
    {
        Impervious := false
        WirlwindAttack := false
        DeathDealer := false
        BlurredMovement := false
        Warlord := false
        ExtendedWarenty := false
        Survivor := false
        BatteringBlows := false
        PerfectForm := false
        SuperGenius := false
        ExtraPlating := false
        ImageSearch, ImperviousX, ImperviousY, 532, 727, 766, 820, *100 C:\Users\isaac\Pictures\Shop titans pictures\Impervious.png
        if(ImperviousX > 1)
        {
            Impervious := true
        }
        sleep 50
        ImageSearch, WirlwindAttackX, WirlwindAttackY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\WirlwindAttack.png
        if(WirlwindAttackX > 1)
        {
            WirlwindAttack := true
        }
        sleep 50
        ImageSearch, DeathDealerX, DeathDealerY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\DeathDealer.png
        if(DeathDealerX > 1)
        {
            DeathDealer := true
        }
        sleep 50
        ImageSearch, BlurredMovementX, BlurredMovementY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\BlurredMovement.png
        if(BlurredMovementX > 1)
        {
            BlurredMovement := true
        }
        sleep 50
        ImageSearch, WarlordX, WarlordY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\Warlord.png
        if(WarlordX > 1)
        {
            Warlord := true
        }
        sleep 50
        ImageSearch, ExtendedWarentyX, ExtendedWarentyY, 532, 727, 766, 820, *155 C:\Users\isaac\Pictures\Shop titans pictures\ExtendedWarenty.png
        if(ExtendedWarentyX > 1)
        {
            ExtendedWarenty := true
        }
        sleep 50
        ImageSearch, SurvivorX, SurvivorY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\Survivor.png
        if(SurvivorX > 1)
        {
            Survivor := true
        }
        sleep 50
        ImageSearch, BatteringBlowsX, BatteringBlowsY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\BatteringBlows.png
        if(BatteringBlowsX > 1)
        {
            BatteringBlows := true
        }
        sleep 50
        ImageSearch, PerfectFormX, PerfectFormY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\PerfectForm.png
        if(PerfectFormX > 1)
        {
            PerfectForm := true
        }
        sleep 50
        ImageSearch, SuperGeniusX, SuperGeniusY, 532, 727, 766, 820, *50 C:\Users\isaac\Pictures\Shop titans pictures\SuperGenius.png
        if(SuperGeniusX > 1)
        {
            SuperGenius := true
        }
        ImageSearch, ExtraPlatingX, ExtraPlatingY, 532, 727, 766, 820, *120 C:\Users\isaac\Pictures\Shop titans pictures\ExtraPlating.png
        if(ExtraPlatingX > 1)
        {
            ExtraPlating := true
        }
        sleep 500
        firstSkillGold := GetPixelColor(624, 747)
        secondSkillGold := GetPixelColor(697, 750)
        if(firstSkillGold = 0x56FCFF or secondSkillGold = 0xEBFCFF)
        {
        }
        if(ExtraPlating = true and Impervious = true)
        {
            msgBox "By george i think we've got it!"
            return
        }
        itemSlot := GetPixelColor(1224, 529)
        if(itemSlot = 0x422D51)
        {
            ClickAtCord(1043, 339)   ;click the gear
            ClickAtCord(782, 705)   ;click retire
            ClickAtCord(1114, 650)   ;click yes
            ClickAtCord(112, 767)   ;click new hero
            sleep 1000
            ClickAtCord(1511, 487)   ;click the third class
            recruitButton := GetPixelColor(1710, 766)
            if(recruitButton != 0x5CF621)
                sleep 5000
            ClickAtCord(1771, 765)   ;click Recruit
            ClickAtCord(827, 637)   ;click the gold option
            goldOption := GetPixelColor(828, 632)
            if(goldOption = 0x2AB7FF)
            {
                ClickAtCord(827, 637)   ;click the gold option
            }
            sleep 1200
            ClickAtCord(531, 826)   ;click on the new hero
        }
    }
return

ClickAtCord(x, y)
{
    Send {Click, %x%, %y%, left}
    sleep 700
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
