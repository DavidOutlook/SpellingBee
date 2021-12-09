
new-speech 'Enter the logname you wish to query'
$logname = (Read-Host)
new-speech 'Enter the number of events you like to review'
$newest = (Read-Host)
Get-EventLog -logname $logname -newest $newest

