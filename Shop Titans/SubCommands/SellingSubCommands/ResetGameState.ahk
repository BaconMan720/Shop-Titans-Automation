#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

::
    ReconnectButton := GetPixelColor(1046, 727)
    if(ReconnectButton = 0x5DF621)
    {
        sleep 60000
        ClickAtCord(1046, 727)    ;Click the reconnect button
        sleep 2000
    }
    TextBox := GetPixelColor(811, 873)
    if(TextBox = 0xD2E7EF)
    {
        TextBoxLoop := 1
        while TextBoxLoop = 1
        {
            ClickAtCord(811, 873)   ;Click through all the text
            sleep 1300
            TextBox := GetPixelColor(811, 873)
            if(TextBox != 0xD2E7EF)
            {
                TextBoxLoop = 0
            }
        }
        sleep 2000
    }
    OkButton := GetPixelColor(903, 973)
    if (OkButton = 0x5DF621 or OkButton = 0x54F217 or OkButton = 0x5DF622)
    {
        ClickAtCord(903, 973)     ;Click on the ok button
        sleep 300
    }
    MToffer := GetPixelColor(1239, 340)
    if (MToffer = 0x1F47FF)
    {
        ClickAtCord(1239, 340)     ;Click on the ex to get out of the micro transaction offer
        sleep 300
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