# Deply, manage, and use digital certificates
# Server 2019/ Lab 2

add-type -AssemblyName microsoft.VisualBasic
add-type -AssemblyName System.Windows.Forms

Start-Process -FilePath "ServerManager.exe" -ArgumentList "Server Manager.msc"
Start-Sleep -Milliseconds 2500
[Microsoft.VisualBasic.Interaction]::AppActivate("Server Manager")

# Start-Process -FilePath "CertificationAuthority.exe" -ArgumentList "Local.msc"
Start-Sleep -Seconds 10

# Line below works
[Microsoft.VisualBasic.Interaction]::AppActivate("certsrv")

Start-Sleep -Milliseconds 1000
[System.Windows.Forms.SendKeys]::SendWait("{DOWN 5}")
Start-Sleep -Milliseconds 1000
[System.Windows.Forms.SendKeys]::SendWait("{RIGHT 1}")
Start-Sleep -Milliseconds 1000
[System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
Start-Sleep -Milliseconds 1000