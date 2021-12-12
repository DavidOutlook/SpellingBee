# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-host?view=powershell-7.2#parameters 
Write-Host "Hello" -ForegroundColor Black
Write-Host "Hello" -ForegroundColor DarkBlue
Write-Host "Hello" -ForegroundColor DarkGreen
Write-Host "Hello" -ForegroundColor DarkCyan
Write-Host "Hello" -ForegroundColor DarkRed
Write-Host "Hello" -ForegroundColor DarkMagenta # Obfuscates text on typical background
Write-Host "Hello" -ForegroundColor DarkYellow
Write-Host "Hello" -ForegroundColor Gray
Write-Host "Hello" -ForegroundColor DarkGray
Write-Host "Hello" -ForegroundColor Blue
Write-Host "Hello" -ForegroundColor Green
Write-Host "Hello" -ForegroundColor Cyan
Write-Host "Hello" -ForegroundColor Red
Write-Host "Hello" -ForegroundColor Magenta
Write-Host "Hello" -ForegroundColor Yellow
Write-Host "Hello" -ForegroundColor White

Write-Output "Write-Output doesn't work, displays color info" -ForegroundColor Yellow
Write-Output "Write-Output doesn't work, displays color info" -ForegroundColor Red

Read-Host "Read-Host does NOT accept color parameter"
Read-Host "Read-Host, Hello" -ForegroundColor Red 
