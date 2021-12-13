# https://www.pluralsight.com/blog/tutorials/measure-powershell-scripts-speed 

$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()
$StopWatch.Elapsed
$StopWatch.Elapsed.TotalMilliSeconds


$StopWatch.Start()
Read-Host "press Enter"
$StopWatch.Stop()

$StopWatch.Elapsed.TotalHours
$StopWatch.Elapsed.TotalSeconds
$StopWatch.Elapsed.TotalMilliSeconds

$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()
# $StopWatch = [System.Diagnostics.Stopwatch]::new()
Read-Host "press Enter"
Start-Sleep -Seconds 1
$StopWatch.Elapsed # showed 0 values


# https://gist.github.com/pcgeek86/336e08d1a09e3dd1a8f0a30a9fe61c8a 
# Line 203

#### Perform a task on a timer (ie. every 5000 milliseconds)
$Timer = [System.Timers.Timer]::new(5000)
Register-ObjectEvent -InputObject $Timer -EventName Elapsed -Action {
  Write-Host -ForegroundColor Blue -Object 'Timer elapsed! Doing some work.'
}
$Timer.Start()   



# Line 24, 65  Measure-Command