# https://www.youtube.com/watch?v=Jqgv5G-cAz0
# 9:45 Simulate KEYBOARD, not Mouse Click, hence Send KEYs

# Example #1
add-type -AssemblyName microsoft.VisualBasic
add-type -AssemblyName System.Windows.Forms

Start-Process -FilePath "notepad.exe"
Start-Sleep -Milliseconds 2500

[Microsoft.VisualBasic.Interaction]::AppActivate("Notepad") # Title name of ANY application
Start-Sleep -Milliseconds 100
[System.Windows.Forms.SendKeys]::SendWait("+{h}")
Start-Sleep -Milliseconds 100
[System.Windows.Forms.SendKeys]::SendWait("{e}")
Start-Sleep -Milliseconds 100
[System.Windows.Forms.SendKeys]::SendWait("{l}")
Start-Sleep -Milliseconds 100
[System.Windows.Forms.SendKeys]::SendWait("{l}")
Start-Sleep -Milliseconds 100
[System.Windows.Forms.SendKeys]::SendWait("{o}")
Start-Sleep -Milliseconds 100

# Example #2
Start-Process -FilePath "notepad.exe"
Start-Sleep -Milliseconds 2500

$line = "some line to write to notepad" # this can also come from a file or database

foreach ($character in $line.GetEnumerator()) {
    [System.Windows.Forms.SendKeys]::SendWait("{$character}")
    Start-Sleep -Milliseconds 10
}

# Example #3 - Navigate w keyboard to User Groups

Start-Process -FilePath "mmc.exe" -ArgumentList "compmgmt.msc"
Start-Sleep -Milliseconds 2500
[Microsoft.VisualBasic.Interaction]::AppActivate("Computer Management")
Start-Sleep -Milliseconds 1000
[System.Windows.Forms.SendKeys]::SendWait("{DOWN 5}")
Start-Sleep -Milliseconds 1000
[System.Windows.Forms.SendKeys]::SendWait("{RIGHT 1}")
Start-Sleep -Milliseconds 1000
[System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
Start-Sleep -Milliseconds 1000

# Example #3 - Install Software, w Prompts for Input 10:30
#                                                    11:20   
Start-Process powershell.exe -ArgumentList  "C:\# demo" -WindowStyle Hidden
Start-Sleep -Milliseconds 2500

[Microsoft.VisualBasic.Interaction]::AppActivate("Yes or no")
Start-Sleep -Milliseconds 1000

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
