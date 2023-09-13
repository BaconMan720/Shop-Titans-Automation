#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
a := 1
NormalRun := true

::
    if(NormalRun = true)
    {
        While a = 1
        {
            RunWait "SubCommands\SelectQuest.ahk"
            sleep 1000
            loop 2
            {
                RunWait "SubCommands\DealWithCustomer.ahk"
                sleep 10000
            }
            RunWait "SubCommands\Craft.ahk"
            sleep 1000
        }
    }
    else
    {
        RunWait "SubCommands\Craft.ahk"
    }
return