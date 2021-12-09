# Kanban Board created in GitKraken

# Load function "new-speech" for audible
Import-Module -Name .\SpeechSynth.psm1

# Ask user for input
new-speech "Hello, what is your name?" 
$name = Read-Host "Hello, what is your name?" 
new-speech "Nice to meet you $name, let's spell some words together!"
#to test, delete Start-Sleep later
Start-Sleep -Seconds 3


$list = Get-Content -Path .\SampleWords.txt

#For Each loop
#Lessons Learned; had to add new VARIABLE $userinput to be able to compare if -match

foreach ($word in $list) {
    new-speech $word
    
    # Keeps on looping this until break is called
    # Technically you could also do a do while or do until loop but I prefer the explicit break
    # Really just personal preference
    while ($true) {
        # Prompt the user for the input
        $userinput = Read-host -Prompt "Type the spelling of the word here"  # added variable $userinput
        
        # Check whether it matches - not sure if you want -eq here though
        if ($userinput -match $word) {
            # Was correct, call break to exit the while loop and continue on the foreach $word list
            Write-Host "Correct"
            break
        }
        else {
            # Was incorrect, display Try Again and then restarts the loop with the prompt
            Write-Host "Try Again!"
        }
    }
    
    

        do 
        {
            ( $userinput -match $word ) 
                Write-Host "Correct"
            
        } until (condition)( $word -match $userinput )
                else { Write-Host "Try Again!" }
    }

# do...until Loops until the condition is TRUE

# Module 8/ Lesson 2 - other loops

#FOR loop after 3 incorrect attempts instead of Break or CONTINUE
# Break loop w CONTINUE, so if they give up