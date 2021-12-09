# Kanban Board created in GitKraken

# Load function "new-speech" for audible
Import-Module -Name .\SpeechSynth.psm1

# Ask user for input
new-speech "Hello, what is your name?" 
$name = Read-Host "Hello, what is your name?" 
new-speech "Nice to meet you $name, let's spell some words together!"

$list = Get-Content -Path .\SampleWords.txt

#For Each loop
#Lessons Learned; had to add new VARIABLE $userinput to be able to compare if -match

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

        # Check whether it matches; unsure if to use -match or -eq
        if ($userinput -match $word) 
        {
            # If correct, call break to exit the WHILE loop and continud on the ForEach $word list
            Write-Host "Correct!"
            BREAK
        }
        else 
            {
            # If incorrect, display Try Again and then restarts the loop with the prompt
            Write-Host "Try Again!"
    }
}
    
                        }
