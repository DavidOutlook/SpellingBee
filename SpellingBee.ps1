# Kanban Board created in GitKraken
# Load function "new-speech" for audible
Import-Module -Name .\Speech\SpeechSynthModule.psm1

# Ask user for name
new-speech 'Hello, what is your name?' 
# $name = Read-Host "Hello, what is your name?" # read-host can be replaced by nicer GUI box, but doesn't test in VSC

# create the graphical input box
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$name = [Microsoft.VisualBasic.Interaction]::InputBox('Enter your name', 'Your Name', 'Luke')

new-speech "Nice to meet you $name, let's spell some words together!"

# Loop is running the bottom line ONLY.  Interesting to read the bottom and not top?
#$list = Get-Content -Path .\WordList1.txt -TotalCount 70
#$list = Get-Content -Path .\WordList1.txt -Tail 70
#$list = Get-Content -Path .\WordList2.txt -TotalCount 87    #16 minutes
#$list = Get-Content -Path .\WordList2.txt -Tail 90          #17 minutes
#$list = Get-Content -Path .\WordList3.txt -TotalCount 90
# $list = Get-Content -Path .\WordList3.txt -Tail 65

# District Lists, District1-5 are Difficulty ONE Bee
$list = Get-Content -Path .\WordLists\District1.txt -TotalCount 75  #11 minutes
$list = Get-Content -Path .\WordLists\District1.txt -Tail 75        #12 minutes
$list = Get-Content -Path .\WordLists\District2.txt -TotalCount 101 #18 minutes, last word gimmick
$list = Get-Content -Path .\WordLists\District2.txt -Tail 101       #18 minutes
$list = Get-Content -Path .\WordLists\District3.txt -TotalCount 101  #19 minutes
$list = Get-Content -Path .\WordLists\District3.txt -Tail 101        #19 minutes
$list = Get-Content -Path .\WordLists\District4.txt -TotalCount 102  #24 minutes, 
$list = Get-Content -Path .\WordLists\District4.txt -Tail 102        #21 minutes
$list = Get-Content -Path .\WordLists\District5.txt                  # minutes only 67 words

# District TWO Bee; file names correspond with PDF page #
$list = Get-Content -Path .\WordLists\DistrictTwoBee8.txt -TotalCount 75  #17, 21 w/o list
$list = Get-Content -Path .\WordLists\DistrictTwoBee8.txt -Tail 75   #15
#below .txt was formatted oddly.  1st and last columns normal. Columns 2-5 are horizontal
#$list = Get-Content -Path .\WordLists\DistrictTwoBee9.txt -TotalCount 100 #40 w breaks 
#$list = Get-Content -Path .\WordLists\DistrictTwoBee9.txt -Tail 100   
#$list = Get-Content -Path .\WordLists\DistrictTwoBee10.txt -TotalCount 102 #32 minutes, getting tough
#$list = Get-Content -Path .\WordLists\DistrictTwoBee10.txt -Tail 102   #20
#try again, without the word list

# TODO Import GUI Menu for user to choose list; sample menu in file MenuFunction.ps1
# TODO Menu GUI is in MSSA repo; move over and tinker with using sample menu
# TODO is this a SWITCH or HASH TABLE to map user selection to file???#$list = Get-Content -Path .\WordList1.txt -TotalCount 70

Start-Process https://www.merriam-webster.com/ 

Start-Sleep -Milliseconds 200

# just show Minutes and Seconds?
# Measure-Command -Expression {    # can't use | Select-Object Seconds
Measure-Command {
    # FIXME only display time output in MINUTES and SECONDS... Use .NET Stopwatch.ps1 insted of Measure-Command???

    foreach ($word in $list) {
        # new-speech $word 
        1..2 | ForEach-Object { new-speech $word }
        # how to run repeat the word.  If user presses a key (ex. up arrow) then new-speech $word

        # Keeps on looping this until BREAK is called
        while ($true) {
            # Prompt user for input

            $userinput = Read-Host -Prompt 'Spell here'  # added variable $userinput

            if ($userinput -eq $word) {
                # If correct, call break to exit the WHILE loop and continud on the ForEach $word list
                Write-Host 'Correct!'
                BREAK
            } else {
                # If incorrect, display Try Again and then restarts the loop with the prompt
                Write-Host "Try Again!  Practice makes us better.  You CAN do it $name!" -ForegroundColor Black -BackgroundColor Yellow
                1..2 | ForEach-Object { new-speech $word }
            }
        }
    }  
}      # Measure-Command Bracket

new-speech "All done $name, thanks, I had fun spelling with you!"
Start-Sleep -Seconds 1
new-speech "Goodbye $name!"

$list | Out-GridView -Title "Spelling Words - Great Job $name!"

Read-Host
# Start-Sleep -Seconds 60

# PowerShell won't close with the typical "Enter" key, but clicking X window still closes immediately
# Add Duration or Time

# Lesson learned:  if getting error on $word 
# "Cannot bind argument to parameter 'text' because it is an empty string"
# Due to an empty line at the end of the .txt file (remember, it's an array w an empty value!)