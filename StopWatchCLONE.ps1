$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()
$StopWatch.Elapsed 
$StopWatch.Elapsed.TotalMilliSeconds 
Read-Host "press Enter"

$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()
$StopWatch.Elapsed
# $StopWatch.Elapsed.TotalMilliSeconds
Write-Output "Total MilliSeconds"
Read-Host "press Enter"

$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()
#$StopWatch.Elapsed
$StopWatch.Elapsed.TotalMilliSeconds
Write-Output "Total MilliSeconds"
Read-Host "press Enter"

# Line 24, 65  Measure-Command