# Kanban Board created in GitKraken
# Load function "new-speech" for audible
Import-Module -Name .\SpeechSynthModule.psm1

# Ask user for input
new-speech "Hello, what is your name?" 
$name = Read-Host "Hello, what is your name?" 
new-speech "Nice to meet you $name, let's spell some words together!"

# Loop is running the bottom line, not both.  Interesting to read the bottom and not top?
$list = Get-Content -Path .\WordList1.txt -Tail 35
$list = Get-Content -Path .\WordList1.txt -TotalCount 1

# Get-Content retrieves content from a text file, and then stored in an array; each line in the text file is an item in the arrary
# Limit the data retrieved by using parameters
# -TotalCount   how many lines from the beginning of a file
# -Tail         how many lines from the END of a file
# ex Get-Content C:\Scripts\computers.txt -TotalCount 10

#For Each loop
#Lessons Learned; had to add new VARIABLE $userinput to be able to compare if -eq
Start-sleep -Milliseconds 200

Measure-Command -Expression {

# Get-Process | Where-Object {$_.mainWindowTitle} | Format-Table Id, Name, mainWindowtitle -AutoSize
# {copy-item $var0, $var1, $var2 Folders -force -recurse -verbose -Exclude name} | Select-Object @{n="time";e={$_.Minutes,"Minutes",$_.Seconds,"Seconds",$_.Milliseconds,"Milliseconds" -join " "}}
# Measure-Command -Expression | out-default {
# Measure-Command -Expression | Format-List -Seconds {
# just show Minutes and Seconds

foreach ($word in $list) 
{
    # new-speech $word 
    1..2 | ForEach-Object { new-speech $word }
    #new-speech $word 

    # how to run repeat the word.  If user presses a key (ex. up arrow) then new-speech $word

 
    # Keeps on looping this until BREAK is called
    # Technically could also do a DO WHILE or DO UNTIL loop but prefer the explicit BREAK
    # Personal preference
    while ($true) 
    {
    
        # Prompt user for input
        $userinput = Read-host -Prompt "Type the spelling of the word here"  # added variable $userinput

        if ($userinput -eq $word) 
        {
            # If correct, call break to exit the WHILE loop and continud on the ForEach $word list
            Write-Host "Correct!"
            BREAK
        }
        else 
            {
            # If incorrect, display Try Again and then restarts the loop with the prompt
            Write-Host "Try Again!  Practice makes us better.  You CAN do it $name!" -ForegroundColor Black -BackgroundColor Yellow
    }
}
            }  

# Measure-Command Line 24
        }

new-speech "All done $name, thanks, I had fun spelling with you!"
#Read-Host  "Press Enter to Close" -foregroundColor DarkMagenta
Start-Sleep -Seconds 1
new-speech "Goodbye $name!"
Read-Host
# Start-Sleep -Seconds 60

# PowerShell won't close with the typical "Enter" key, but clicking X window still closes immediately
# Add Duration or Time

# Lesson learned:  if getting error on $word 
# "Cannot bind argument to parameter 'text' because it is an empty string"
# Due to an empty line at the end of the .txt file (remember, it's an array w an empty value!)