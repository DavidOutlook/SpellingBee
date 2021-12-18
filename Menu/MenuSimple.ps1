# Kanban Board created in GitKraken

# Load function "new-speech" for audible
Import-Module -Name .\SpeechSynthModule.psm1

# Ask user for input
new-speech 'Hello, what is your name?' 
$name = Read-Host 'Hello, what is your name?' 
new-speech "Nice to meet you $name, let's spell some words together!"

# Add MENU
# https://www.business.com/articles/powershell-interactive-menu/

Show-Menu
$Menu = Read-Host 'Please make a selection'
switch ($input) {
     '1' {
          Clear-Host
          'You chose option #1'
          $list = Get-Content -Path .\WordSample.txt
     } '2' {
          Clear-Host
          'You chose option #2'
          $list9 = Get-Content -Path .\WordList9.txt
     } '3' {
          Clear-Host
          'You chose option #3'
     } 'q' {
          return
     }
}
Pause

$Menu = @(
     "$list",  
     "$list9"
)

$list = Get-Content -Path .\WordSample.txt
#$list1 = Get-Content -Path .\WordList1.txt
#$list2 = Get-Content -Path .\WordList2.txt
#$list3 = Get-Content -Path .\WordList3.txt
$list9 = Get-Content -Path .\wordlist9.txt

# Get-Content retrieves content from a text file, and then stored in an array; each line in the text file is an item in the arrary
# Limit the data retrieved by using parameters
# -TotalCount   how many lines from the beginning of a file
# -Tail         how many lines from the END of a file
# ex Get-Content C:\Scripts\computers.txt -TotalCount 10

#For Each loop
#Lessons Learned; had to add new VARIABLE $userinput to be able to compare if -eq

foreach ($word in $Menu) {
     new-speech $word 

     # Keeps on looping this until BREAK is called
     # Technically could also do a DO WHILE or DO UNTIL loop but prefer the explicit BREAK
     # Personal preference
     while ($true) {
    
          # Prompt user for input
          $userinput = Read-Host -Prompt 'Type the spelling of the word here'  # added variable $userinput

          if ($userinput -eq $word) {
               # If correct, call break to exit the WHILE loop and continud on the ForEach $word list
               Write-Host 'Correct!'
               BREAK
          } else {
               # If incorrect, display Try Again and then restarts the loop with the prompt
               Write-Host "Try Again!  Practice makes us better.  You CAN do it $name!" -ForegroundColor Black -BackgroundColor Yellow
          }
     }
}

new-speech "All done $name, thanks, I had fun spelling with you!"
Read-Host 'Press Enter to Close'
Start-Sleep -Seconds 1
new-speech "Goodbye $name!"

# Lesson learned:  if getting error on $word 
# "Cannot bind argument to parameter 'text' because it is an empty string"
# Due to an empty line at the end of the .txt file (remember, it's an array w an empty value!)