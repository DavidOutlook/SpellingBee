# https://www.interfacett.com/videos/use-powershell-script-analyzer-clean-code/
# ISE example on video
# Visual Studio Code, has ScriptAnalyzer built into Ps Extension?

Get-Module -ListAvailable

Install-PackageProvider -name Nuget -force

Find-Module -Name "PSScriptAnalyzer"

Install-Module -Name "PSScriptAnalyzer"

Get-Command -Module PsScriptAnalyzer