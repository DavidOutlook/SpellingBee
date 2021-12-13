# Kanban Board created in GitKraken
# Load function "new-speech" for audible
Import-Module -Name .\SpeechSynthModule.psm1

# Ask user for name
new-speech "Hello, what is your name?" 
$name = Read-Host "Hello, what is your name?" 
new-speech "Nice to meet you $name, let's spell some words together!"

# Loop is running the bottom line, not both.  Interesting to read the bottom and not top?
$list = Get-Content -Path .\WordList1.txt -Tail 35
$list = Get-Content -Path .\WordList1.txt -TotalCount 70

Start-sleep -Milliseconds 200

Measure-Command -Expression {
# just show Minutes and Seconds?

foreach ($word in $list) 
{
    # new-speech $word 
    1..2 | ForEach-Object { new-speech $word }
    # how to run repeat the word.  If user presses a key (ex. up arrow) then new-speech $word

    # Keeps on looping this until BREAK is called
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
        }      # Measure-Command Line 24

new-speech "All done $name, thanks, I had fun spelling with you!"
Start-Sleep -Seconds 1
new-speech "Goodbye $name!"
Read-Host
# Start-Sleep -Seconds 60

# PowerShell won't close with the typical "Enter" key, but clicking X window still closes immediately
# Add Duration or Time

# Lesson learned:  if getting error on $word 
# "Cannot bind argument to parameter 'text' because it is an empty string"
# Due to an empty line at the end of the .txt file (remember, it's an array w an empty value!)