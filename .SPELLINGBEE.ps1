# Kanban Board created in GitKraken
# Load function "new-speech" for audible
Import-Module -Name .\SpeechSynthModule.psm1

# Ask user for name
new-speech "Hello, what is your name?" 
$name = Read-Host "Hello, what is your name?" 
new-speech "Nice to meet you $name, let's spell some words together!"

$list = Get-Content -Path .\WordSample.txt


foreach ($word in $list) 
{

    new-speech $word 

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

new-speech "All done $name, thanks, I had fun spelling with you!"
Read-Host "Press Enter to Close"
Start-Sleep -Seconds 1
new-speech "Goodbye $name!"

# Lesson learned:  if getting error on $word 
# "Cannot bind argument to parameter 'text' because it is an empty string"
# Due to an empty line at the end of the .txt file (remember, it's an array w an empty value!)