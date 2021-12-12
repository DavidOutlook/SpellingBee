# https://www.pluralsight.com/blog/tutorials/measure-powershell-scripts-speed 

$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()
$StopWatch = [System.Diagnostics.Stopwatch]::new()
$StopWatch.Elapsed

$StopWatch.Start()
$StopWatch.Stop()

$StopWatch.Elapsed.TotalHours
$StopWatch.Elapsed.TotalSeconds

# https://gist.github.com/pcgeek86/336e08d1a09e3dd1a8f0a30a9fe61c8a 
#### Perform a task on a timer (ie. every 5000 milliseconds)
$Timer = [System.Timers.Timer]::new(5000)
Register-ObjectEvent -InputObject $Timer -EventName Elapsed -Action {
  Write-Host -ForegroundColor Blue -Object 'Timer elapsed! Doing some work.'
}
$Timer.Start()   