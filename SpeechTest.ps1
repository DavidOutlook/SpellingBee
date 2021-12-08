
new-speech 'Enter the logname you wish to query'
$logname = (Read-Host)
new-speech 'Enter the number of events you like to review'
$newest = (Read-Host)
Get-EventLog -logname $logname -newest $newest

new-speech 'I love to spell'
$spell = (read-host)
new-speech 'What would you like to spell'
$newest = (Read-Host)