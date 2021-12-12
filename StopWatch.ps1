# https://www.pluralsight.com/blog/tutorials/measure-powershell-scripts-speed 

$StopWatch = [System.Diagnostics.Stopwatch]::StartNew()
$StopWatch = [System.Diagnostics.Stopwatch]::new()
$StopWatch.Elapsed

$StopWatch.Start()
$StopWatch.Stop()

$StopWatch.Elapsed.TotalHours
$StopWatch.Elapsed.TotalSeconds
